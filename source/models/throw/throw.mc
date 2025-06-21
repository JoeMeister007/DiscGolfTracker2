class Throw extends AbstractModel {
    private var m_startLocationLat as Toybox.Lang.Double;
    private var m_startLocationLong as Toybox.Lang.Double;
    private var m_endLocationLat as Toybox.Lang.Double;
    private var m_endLocationLong as Toybox.Lang.Double;

    private var m_penalty as Penalty;
    /// invalid sentinal value, there is no instance where -720 degrees 
    /// is a valid lat or long value
    private static const kInvalidLocation = -720.0 as Toybox.Lang.Double;

    enum Penalty {
        NO_PENALTY,
        ONE_PENALTY_THROW,
        TWO_PENALTY_THROW
    }

    /**
     * Constructs a Throw object, with the start and end points as invalid.
     * @param sm Reference to the global settings manager
     */
    public function initialize(sm as SettingsManager) {
        AbstractModel.initialize(sm);
        m_startLocationLat = kInvalidLocation;
        m_startLocationLong = kInvalidLocation;
        m_endLocationLat = kInvalidLocation;
        m_endLocationLong = kInvalidLocation;
        m_penalty = NO_PENALTY;
    }

    /**
     * Sets the start location to the provided location. Overrides any previously
     * set start locations.
     * @param loc location for the start
     */
    public function setStartLocation(loc as Toybox.Position.Location) as Void{
        m_startLocationLat = loc.toDegrees()[0];
        m_startLocationLong = loc.toDegrees()[1];
    }

    /**
     * Gets the start locaiton
     * @note may return null if the start location has not been previously set
     * @return Toybox.Position.Location object for the start location, if the start is valid
     *         null object, if the start is invalid
     */
    public function getStartLocation() as Toybox.Position.Location or Null {
        // only return a value if the start is actually valid
        if (m_startLocationLat != kInvalidLocation && m_startLocationLong != kInvalidLocation) {
            return new Toybox.Position.Location(
                {
                    :latitude => m_startLocationLat,
                    :longitude => m_startLocationLong,
                    :format => :degrees
                });
        }
        return null;
    }

    /**
     * Sets the end location to the provided location. Overrides any previously
     * set end locations.
     * @param loc location for the end
     */
    public function setEndLocation(loc as Toybox.Position.Location) as Void{
        m_endLocationLat = loc.toDegrees()[0];
        m_endLocationLong = loc.toDegrees()[1];
    }

    /**
     * Gets the end locaiton
     * @note may return null if the end location has not been previously set
     * @return Toybox.Position.Location object for the end location, if the end is valid
     *         null object, if the end is invalid
     */
    public function getEndLocation() as Toybox.Position.Location or Null {
        // only return a value if the end is actually valid
        if (m_endLocationLat != kInvalidLocation && m_endLocationLong != kInvalidLocation) {
            return new Toybox.Position.Location(
                {
                    :latitude => m_endLocationLat,
                    :longitude => m_endLocationLong,
                    :format => :degrees
                });
        }
        return null;
    }

    /**
     * Sets the penatly attached to the given thwo
     * @note to remove a penalty set the reason to NO_PENALTY
     * @param penalty penalty to be applied
     */
    public function setPenalty(penalty as Penalty) as Void {
        m_penalty = penalty;
    }

    /**
     * Gets the penalty associated with the throw
     * @returns associated penalty
     */
    public function getPenalty() as Penalty {
        return m_penalty;
    }
}