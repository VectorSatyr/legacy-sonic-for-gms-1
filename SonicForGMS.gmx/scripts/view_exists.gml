/// view_exists(vind)
// ---------------------------------------------------------------
/*
**  Checks if the given view index is valid
**
**  Arguments:
**      vind        real; view port
**
**  Returns:
**      Boolean
*/
// ---------------------------------------------------------------
var vind = argument0;
// ---------------------------------------------------------------
return in_range(vind, -1, max_view_count);
