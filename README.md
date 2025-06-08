# DiscGolfTracker2
This is a much needed revamp of our original [Disc Golf Tracker app](https://apps.garmin.com/en-US/apps/682bf045-6fb0-4c39-9cf0-4723a80c9963) for Garmin watches. It'll target newer devices (CIQ 5.0+) and older devices can still use the original app

## Developer Process
* Devs will be able to add tickets to and pick up tickets from the KanBan
* Tickets will have corresponding feature branches, which will be based off of main for stand alone tickets (e.g. bug fixes, small features) and based off of an epic branch for tickets grouped together in an epic
* PRs require passing code review before merging. Some tickets may indicate the other dev should also QA it to ensure it functions properly. Feel free to use Copilot as an initial reviewer, but the other dev needs to stamp your PR before it can be merged
* No vibe coding! AI can be used to speed up code review and for questions, but the dev should be writing the code and be in control
* All functions should have comprehensive documentation through comments (and tests if possible). Comments should be done using Java-Style Docs.