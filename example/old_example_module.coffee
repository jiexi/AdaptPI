#Module Version 1.0
#Normally you would have to checkout the older commit of when example_module.coffee was v1.0
#This file is here so you can easily compare changes between the v1.0, this file  AND  v2.0, example_module.coffee
#  without having to do the commit checkouts in git. Purely for convenience, in normal cases, this file would not be here.

class Example

  constructor: (callback) ->
    console.log "object constructed"


  unchanging_method: ->
    console.log 'stays the same'


  changing_method: (param1) ->
    console.log 'going to be changed'
    console.log arguments


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