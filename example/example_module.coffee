#Module Version 2.0

class Example

  constructor: (callback) ->
    console.log "object constructed"


  unchanging_method: ->
    console.log 'stays the same'


  # added param2, and param3
  changing_method: (param1, param2, param3) ->
    console.log 'has been changed, two parameters added'
    console.log arguments


  # params have been reordered from x,y,z
  param_reorder_method: (y, z, x) ->
    console.log 'params swap'
    console.log "1st param is: #{x}"
    console.log "2nd param is: #{y}"
    console.log "3nd param is: #{z}"


  #to_be_removed_method


  newly_renamed_method: (hi) ->
    console.log 'method will be renamed, but this message must remain the same after for it to work automatically'


  to_be_added_method: ->
    console.log 'this method didnt exist before'



module.exports = Example