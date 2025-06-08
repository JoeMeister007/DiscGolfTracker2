import Toybox.Test;
import Toybox.Lang;
/**
 * Subclassing the Abstract model so we can access the 
 * protected member GetSettingsManager()
 *
 */
class AMTester extends AbstractModel {
    function initialize(sm as SettingsManager) {
        AbstractModel.initialize(sm);
    }

    function getSettingsManager() as SettingsManager{
        return AbstractModel.getSettingsManager();
    }
}
module AbstractModelTests {
    (:test)
    function CanConstructAbstractModel(logger as Logger) as Boolean {
        // Being able ton construct an abstract model is a very silly idea
        // but that's monkey C For you
        var sm = new SettingsManager() as SettingsManager;
        var am = new AbstractModel(sm) as AbstractModel;
        Test.assertNotEqualMessage(am , null, "Abstract Model is null");
        return true;
    }

(:test)
function CanRetreiveSettingsManager(logger as Logger) as Boolean {
    var sm = new SettingsManager() as SettingsManager;
    var tester = new AMTester(sm) as AMTester;
    Test.assertNotEqualMessage(tester.getSettingsManager(), null, "SettingsManager is null");
    return true;
}

}

