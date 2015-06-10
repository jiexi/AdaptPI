#Module Version 2.0

class Example

  constructor: (callback) ->
    console.log "object constructed"


  unchanging_method: ->
    console.log 'stays the same'


  # param2, param3 added
  changing_method: (param1, param2, param3) ->
    console.log 'going to be changed'


  # x and y swapped
  param_reorder_method: (y, x) ->
    console.log 'params swap'


  #to_be_removed_method removed


  #renamed, but param and body must remain same
  renamed_method: (hi) ->
    console.log 'going to be renamed'


  to_be_added_method: (foo) ->
    console.log 'new v2.0 method'



module.exports = Example