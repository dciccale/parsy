exports.parsy = ->
  options = {}
  opt = null
  process.argv.forEach (arg) ->

    # get option
    if /^(-|--)/.test(arg) or not opt
      # must have at least one char
      return if not /\w/.test(arg)
      opt = arg
      options[opt] = true

    # set option data
    else
      if arg is 'false'
        arg = false
      else if arg is 'true'
        arg = true
      else arg = Number arg unless isNaN arg

      # generate options object
      if typeof options[opt] is 'boolean'
        options[opt] = arg
      else if Array.isArray options[opt]
        options[opt].push arg
      else
        options[opt] = [options[opt], arg]


  # return on method for subscribing to options
  {
    options: options
    on: (opt, callback) ->
      if options[opt]?
        callback opt, options[opt]
  }
