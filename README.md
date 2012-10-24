# parsy

Tiny command line options parser for node.js in CoffeeScript.

## Usage

It automatically parse `process.argv` so you just have to "subscribe" for the options you want.

### Example

```javascript
var parsy = require('parsy');

parsy.on('-h', function (option, value) {
  console.log('Hey give me some help here');
});

parsy.on('--file', function (option, value) {
  // simple check if the value passed to --file are js files
  if (!/\.js$/.value) {
    console.log('Only .js files can be passed using the --file option!');
  }
});
```

## License
See [LICENSE.txt](https://raw.github.com/dciccale/parsy/master/LICENSE.txt)