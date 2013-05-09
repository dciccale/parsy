# parsy [![NPM version](https://badge.fury.io/js/css2stylus.png)](http://badge.fury.io/js/parsy)

Tiny command line options parser for node.js in CoffeeScript.

## Installation

```bash
$ npm install parsy
```

## Usage

It automatically parse `process.argv` so you just have to "subscribe" for the options you want.

### Example

```javascript
var parsy = require('parsy');

// 'listen' if user calls your script without options
parsy.on('', function () {
  console.log('You must pass some options (or not)');
});

// script -h
parsy.on('-h', function (option, value) {
  console.log('Hey give me some help here');
});

// script --file file1.js
parsy.on('--file', function (option, value) {
  // if no files passed show a message
  if (!value) {
    console.log('Usage: --file <file1.js file2.js>');

  // simple check if the value passed to --file are js files
  } else if (!/\.js$/.test(value)) {
    console.log('Only .js files can be passed using the --file option!');
  }
});
```

See parsy options object with all options passed

```javascript
console.log(parsy.options);
// e.g.
// { node: 'script.js', '-h': true, '--file': 'file1.js' }
```

## License
See [LICENSE.txt](https://raw.github.com/dciccale/parsy/master/LICENSE.txt)
