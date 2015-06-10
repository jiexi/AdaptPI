ExampleModule = require './example_module.coffee'
console.log "Example usage with v2.0, example_module.coffee"


example_module = new ExampleModule()

console.log "Calling unchanging_method()"
example_module.unchanging_method()

console.log "Calling changing_method('foo')"
example_module.changing_method('foo')

console.log "Calling param_reorder_method('a', 'b', 'c')"
example_module.param_reorder_method('a', 'b', 'c')

console.log "Calling to_be_renamed_method() if exists"
if example_module.to_be_renamed_method?
  example_module.to_be_renamed_method()
else
  console.log "to_be_renamed_method() does not exist"

console.log "Calling to_be_removed_method() if exists"
if example_module.to_be_removed_method?
  example_module.to_be_removed_method()
else
  console.log "to_be_removed_method() does not exist"

console.log "Calling to_be_added_method() if exists"
if example_module.to_be_added_method?
  example_module.to_be_added_method()
else
  console.log "to_be_added_method() does not exist"