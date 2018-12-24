/// string_format_zero(val, total, dec)

var val = argument0;
var total = argument1;
var dec = argument2;

return string_replace(string_format(val, total, dec), " ", "0");
