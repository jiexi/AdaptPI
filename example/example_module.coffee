#Module Version 1.0

class Example

  constructor: (callback) ->
    console.log "object constructed"


  unchanging_method: ->
    console.log 'stays the same'


  changing_method: (param1) ->
    console.log 'going to be changed'


  param_reorder_method: (x, y, z) ->
    console.log 'params swap'
    console.log "1st param is: #{x}"
    console.log "2nd param is: #{y}"
    console.log "3nd param is: #{z}"


  to_be_removed_method: ->
    console.log 'method will be removed, this message will not be seen again'


  to_be_renamed_method: (hi) ->
    console.log 'method will be renamed, but this message must remain the same after for it to work automatically'


  #to_be_added_method


module.exports = Example