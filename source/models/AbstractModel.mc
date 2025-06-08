
class AbstractModel {

    // weak reference to global Settings Manager
    // this is a weak reference so if the app shuts down
    // we aren't holding a reference & prologing the application
    // shutdown process.
    private var m_settingsManager as SettingsManager;
    
    /**
     * Initalize the model using a provided SettingsManager
     * @param SettingsManager reference to the settings manager
     */
    public function initialize(sm as SettingsManager) {
        m_settingsManager = sm;
    }

    /**
     * For subclasses of AbstractModel to get a reference to the
     *      global settings manager
     * @note may return null if the global settings manager no longer exists
     * @return reference to Settings Manager if it exists, null otherwise
     */
    protected function getSettingsManager() as SettingsManager{
        return m_settingsManager;
    }
}