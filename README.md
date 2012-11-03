# parsy

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

parsy.on('-h', function (option, value) {
  console.log('Hey give me some help here');
});

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
parsy.options;
// e.g. 
// { node: 'script.js', '-h': true, '--file': 'file1.js' }
```

## License
See [LICENSE.txt](https://raw.github.com/dciccale/parsy/master/LICENSE.txt)
