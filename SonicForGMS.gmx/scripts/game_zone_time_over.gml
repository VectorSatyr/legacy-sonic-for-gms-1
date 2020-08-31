/// game_zone_time_over()
// ---------------------------------------------------------------
/*
**  Returns whether the current zone's timer has run out,
**  resulting in a "Time Over"
**
**  Returns:
**      Boolean
*/
// ---------------------------------------------------------------

var result = false;

with (ZoneTimeLimit) {
    	result = expired;
}

return result;
