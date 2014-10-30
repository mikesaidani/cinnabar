citrine = require('citrine');

module.exports = function(opts) {
  return function(style) {
    style.include(__dirname).use(citrine());
  }
}
