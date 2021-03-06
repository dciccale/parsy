// Generated by CoffeeScript 1.4.0
(function() {

  module.exports = (function() {
    var opt, options, processArgv;
    options = {};
    opt = null;
    processArgv = process.argv;
    processArgv.forEach(function(arg) {
      if (/^(-|--)/.test(arg) || !opt) {
        if (!/\w/.test(arg)) {
          return;
        }
        opt = arg;
        return options[opt] = true;
      } else {
        if (arg === 'false') {
          arg = false;
        } else if (arg === 'true') {
          arg = true;
        } else {
          if (!isNaN(arg)) {
            arg = Number(arg);
          }
        }
        if (typeof options[opt] === 'boolean') {
          return options[opt] = arg;
        } else if (Array.isArray(options[opt])) {
          return options[opt].push(arg);
        } else {
          return options[opt] = [options[opt], arg];
        }
      }
    });
    return {
      options: options,
      on: function(opt, callback) {
        if ((options[opt] != null) || opt === '' && processArgv.length === 2) {
          callback(opt, options[opt]);
        }
        return this;
      }
    };
  })();

}).call(this);
