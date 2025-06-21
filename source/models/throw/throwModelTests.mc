import Toybox.Test;
import Toybox.Lang;

module ThrowModelTests {
    function GetThrow() as Throw {
        var sm = new SettingsManager() as SettingsManager;
        return new Throw(sm) as Throw;
    }

    (:test)
    function CanConstructThrowModel(logger as Logger) as Boolean {
        var tm = GetThrow();
        Test.assertNotEqualMessage(tm, null, "Throw Model is Null");
        return true;
    }

    (:test)
    function NotSetLocationIsNull(logger as Logger) as Boolean {
        var tm = GetThrow();
        // So because of how typechecking works, 
        // we have to check null-ness through a conditional

        // the start location should be null here
        if (tm.getStartLocation() != null) {
            Test.assertEqual(true, false);
        } 
        
        // the end location should be null here
        if (tm.getEndLocation() != null) {
            Test.assertEqual(true, false);
        }
        return true;
    }

    (:test)
    function SetLocationIsNotNull(logger as Logger) as Boolean {
        var tm = GetThrow();
        var start = new Toybox.Position.Location({
            :latitude => 38.0,
            :longitude => 78.0,
            :format => :degrees
        });
        tm.setStartLocation(start);
        // So because of how typechecking works, 
        // we have to check null-ness through a conditional

        // the start location shouldn't be null here
        if (tm.getStartLocation() == null) {
            Test.assertEqual(true, false);
        } 
        
        // the end location should be null here
        if (tm.getEndLocation() != null) {
            Test.assertEqual(true, false);
        }

        var end = new Toybox.Position.Location({
            :latitude => 39.0,
            :longitude => 78.0,
            :format => :degrees
        });
        tm.setEndLocation(end);

         // the start location shouldn't be null here
        if (tm.getStartLocation() == null) {
            Test.assertEqual(true, false);
        } 
        
        // the end location shouldn't be null here
        if (tm.getEndLocation() == null) {
            Test.assertEqual(true, false);
        }

        return true;
    }

    (:test)
    function LocationRoundTripConsistent(logger as Logger) as Boolean {
        var tm = GetThrow();
        var start = new Toybox.Position.Location({
            :latitude => 38.0,
            :longitude => 78.0,
            :format => :degrees
        });

        var end = new Toybox.Position.Location({
            :latitude => 39.0,
            :longitude => 78.0,
            :format => :degrees
        });

        tm.setStartLocation(start);
        tm.setEndLocation(end);
        
        Test.assertEqualMessage(start, tm.getStartLocation(), "Start not RT Consistent");
        Test.assertEqualMessage(end, tm.getEndLocation(), "End not RT Consistent");
        return true;
    }

    (:test)
    function PenaltyIsRoundTripConsistent(logger as Logger) as Boolean {
        var tm = GetThrow();

        Test.assertEqualMessage(tm.getPenalty(), Throw.NO_PENALTY, "Penalty doesn't begin at no_penalty");
        
        tm.setPenalty(Throw.ONE_PENALTY_THROW);
        Test.assertEqualMessage(tm.getPenalty(), Throw.ONE_PENALTY_THROW, "Penalty isn't RT Consistent");

        tm.setPenalty(Throw.TWO_PENALTY_THROW);
        Test.assertEqualMessage(tm.getPenalty(), Throw.TWO_PENALTY_THROW, "Penalty isn't RT Consistent");

        return true;
    }

}