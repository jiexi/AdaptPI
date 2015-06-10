#Module Version 1.0

class Example

  constructor: (callback) ->
    console.log "object constructed"


  unchanging_method: ->
    console.log 'stays the same'


  changing_method: (param1) ->
    console.log 'going to be changed'

  param_reorder_method: (x, y) ->
    console.log 'params swap'

  to_be_removed_method: ->
    console.log 'i will be removed'


  to_be_renamed_method: (hi) ->
    console.log 'going to be renamed'


  #to_be_added_method


module.exports = Example