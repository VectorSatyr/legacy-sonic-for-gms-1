/// game_is_running()
// ---------------------------------------------------------------
/*
**  Checks if there are any qualifying activities during which
**  other room objects should cease functioning.
**
**  Returns:
**      Boolean
*/
// ---------------------------------------------------------------

var result = true;
if (instance_exists(GameSuspension)) {
    result = false;
}

return result;
