import Toybox.Lang;
import Toybox.Test;

// Unit test to check if 2 + 2 == 4
// This test is silly, but we need at least one test to pass
// So the CI Pipeline will exit with status 0
// TODO SDG remove this file & tests module when we have real tests
(:test)
function SimpleUnitTest(logger as Logger) as Boolean {
  var x = 2 + 2; logger.debug("x = " + x);
  return (x == 4);
}