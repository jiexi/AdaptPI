argv = require('minimist')(process.argv.slice(2))
unless(argv._?[0]?)
  console.log "Usage: [module file to use, ex: old_example_module.coffee, example_module.coffee, or adapterv1-v2.coffee]"
  process.exit 1
console.log "Example usage with: ./#{argv._[0]}"

ExampleModule = require "./#{argv._[0]}"


example_module = new ExampleModule()

console.log "\n\nCalling unchanging_method()"
example_module.unchanging_method()

console.log "\n\nCalling changing_method('foo')"
example_module.changing_method('foo')

console.log "\n\nCalling param_reorder_method('a', 'b', 'c')"
example_module.param_reorder_method('a', 'b', 'c')

console.log "\n\nCalling to_be_renamed_method() if exists"
if example_module.to_be_renamed_method?
  example_module.to_be_renamed_method()
else
  console.log "to_be_renamed_method() does not exist"

console.log "\n\nCalling to_be_removed_method() if exists"
if example_module.to_be_removed_method?
  example_module.to_be_removed_method()
else
  console.log "to_be_removed_method() does not exist"

console.log "\n\nCalling to_be_added_method() if exists"
if example_module.to_be_added_method?
  example_module.to_be_added_method()
else
  console.log "to_be_added_method() does not exist"