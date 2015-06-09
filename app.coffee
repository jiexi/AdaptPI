argv = require('minimist')(process.argv.slice(2))
exec = require('child_process').exec


get_target_content = (sha, repo, target, callback) ->
  exec "cd #{repo} && git show #{sha}:#{target} >&1", (error, stdout, stderr) ->
    if error or stderr
      return callback "Failed to fetch #{sha} from #{repo} for #{target}"
    callback null, stdout


parse_target_content = (content) ->
  # make a copy of the content before we modify it while parsing
  orig_content = content

  # first find # of spaces on line of constructor declaration
  spaces = (/([\ \t]+)constructor\s*:/.exec content)[1]

  # get class name
  #class_name = /class (.+)\s/.exec content

  method_regex = ///(?:#{spaces}([^:^\s]+):\s*(?:\(([^\)]*)\))?\s*[-=]>)((?:.|[\r\n])*?)(?:\r\n|\n|\r){3,}///

  methods = {}
  method = method_regex.exec content
  while method
    entire_method = method[0]
    method_name = method[1]

    method_param = method[2]
    method_param ?= ""
    method_param = method_param.split(',')
    for value, key in method_param
      method_param[key] = value.trim()

    method_body = method[3]

    methods[method_name] = {param: method_param, body: method_body}

    content = content.replace entire_method, ""
    method = method_regex.exec content

  return methods


diff_params = (old_params, new_params) ->
  if old_params.length != new_params.length
    return false
  else if old_params.join() != new_params.join()
    return false
  else
    return true


diff_methods = (old_methods, new_methods) ->
  added_methods = {};
  removed_methods = {};
  changed_methods = {};
  unchanged_methods = {};

  for name, impl of old_methods
    unless new_methods[name]? # method with same name no longer exists
      removed_methods[name] = impl
    else if !(diff_params old_methods[name].param, new_methods[name].param) # params have changed
      changed_methods[name] = new_methods[name]
    else
      unchanged_methods[name] = new_methods[name] # params and name have not changed

  for name, impl of new_methods
    unless old_methods[name]? # method with same name did not exist previously
      added_methods[name] = impl

  return {added_methods, removed_methods, changed_methods, unchanged_methods}

main = ->
  # Make sure correct arguments have been provided
  if (!argv.old or !argv.new or !argv.repo or !argv.target)
    console.log "Usage: --repo=[../repo/base/dir/] --target=[relative/to/repo] --old=[OldApiSHA] --new=[NewApiSHA]"
    return

  # Grab old content of target
  get_target_content argv.old, argv.repo, argv.target, (err, content) ->
    if err
      console.log err
      return
    old_target = content
    old_methods = parse_target_content old_target

    # Grab new content of target
    get_target_content argv.new, argv.repo, argv.target, (err, content) ->
      if err
        console.log err
        return
      new_target = content
      new_methods = parse_target_content new_target

      console.log '=================OLD=================='
      console.log old_target
      console.log '=================NEW=================='
      console.log new_target

      console.log '=================---=================='
      # Diff the changes
      console.log diff_methods old_methods, new_methods



main()