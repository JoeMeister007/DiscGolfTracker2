import Toybox.Test;
import Toybox.Lang;

(:test)
function CanConstructSM(logger as Logger) as Boolean {
    var sm = new SettingsManager();
    return sm != null;
}