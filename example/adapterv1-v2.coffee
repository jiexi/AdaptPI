Adaptee = require "example_module.coffee"

class Adapter extends Adaptee

  # The following methods no longer exist
  to_be_removed_method: () ->
    # Do nothing when called, or pass args to the newer replacement method
    console.log "Deprecated method to_be_removed_method was called"


  # The following methods have changed interfaces
  changing_method: (param1) ->
    # Make changes necessary to old input to match new expected input below
    super(param1, param2, param3)

  param_reorder_method: (x, y, z) ->
    # Make changes necessary to old input to match new expected input below
    super(y, z, x)


  # The following methods have been renamed
  to_be_renamed_method: (hi) ->
    # Automatically mapped to new function name
    @newly_renamed_method(hi)


  # The following methods have not changed interfaces
  # constructor: (callback)
  # unchanging_method: ()


  # The following methods have been added
  # to_be_added_method: ()




module.exports = Adapter
