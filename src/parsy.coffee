exports.parsy = ->
  options = {}
  opt = null
  process.argv.forEach (arg) ->

    # switch
    if /^(-|--)/.test(arg) or not opt
      return if not /\w/.test(arg)
      opt = arg
      options[opt] = true

    # data
    else
      if arg is 'false'
        arg = false
      else if arg is 'true'
        arg = true
      else arg = Number arg unless isNaN arg

      # normalize options
      if typeof options[opt] is 'boolean'
        options[opt] = arg
      else if Array.isArray options[opt]
        options[opt].push arg
      else
        options[opt] = [options[opt], arg]


  {
    options: options
    on: (opt, callback) ->
      if options[opt]?
        callback opt, options[opt]
  }