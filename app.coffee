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
    ###
    console.log method.length
    console.log "-----------"
    console.log method[0]
    console.log "-----------"
    console.log method[1]
    console.log "-----------"
    console.log method[2]
    console.log "-----------"
    console.log method[3]
    console.log "-----------"
    console.log method[4]
    console.log "-----------"
    console.log method[5]
    console.log "-----------"
    console.log method[6]
    console.log "-----------"
    console.log method[7]
    console.log "-----------"
    ###

    entire_method = method[0]
    method_name = method[1]
    method_param = method[2]
    method_body = method[3]

    methods[method_name] = {param: method_param, body: method_body}

    content = content.replace entire_method, ""
    method = method_regex.exec content

  console.log methods


main = ->
  # Make sure correct arguments have been provided
  if (!argv.old or !argv.new or !argv.repo or !argv.target)
    console.log "Usage: --repo=[../repo/base/dir/] --target=[relative/to/repo] --old=[OldApiSHA] --new=[NewApiSHA]"
    return
  #console.log argv

  # Grab old content of target
  get_target_content argv.old, argv.repo, argv.target, (err, content) ->
    if err
      console.log err
      return
    old_target = content

    # Grab new content of target
    get_target_content argv.new, argv.repo, argv.target, (err, content) ->
      if err
        console.log err
        return
      new_target = content
      console.log new_target
      parse_target_content new_target

main()