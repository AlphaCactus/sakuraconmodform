# Sakura-con Panel Mod Volunteer Work Preferences Form
Provide a form that Sakura-con Panel Mods can use to provide their scheduling preferences.

## Terms
- Panel Moderator (PM) / Volunteer / User
   - These terms are used interchangeably.
   - The terms "work" and "volunteer" are also used interchangeably.
- Panel Mod Coordinator (PMC)
   - Provincially refers to someone making scheduling decisions
- Prefer Not to Work (PNTW)
   - Times at which a user prefers not to work.
- Not Available (NA)
   - Times at which the user is not available to work.

## Available Hours Input Methods
### The 2023 Method: Start/End Spans - Three options per pref per day
Provide user with three start/end spans for each schedule preference. That is, they can select three time spans
for available, three time spans for PNTW, and three time spans for NA.

- User is provided with a dropdown for the start time of a span
- User is provided with a dropdown for the end time of a span
- These dropdowns are repeated three times for each work preference.

- Advantages
   - Mobile friendly
   - Users are prevented from selecting many very short spans.
   - User selected end time is the END of the range, rather than a half-hour before the end of the range which is less confusing and can result in less mis-communicated end times. 
- Disadvantages
   - Form layout is large and fields which the user may not need to fill are provided.
   - It is difficult for the user to visualize when their spans overlap leading to the possibility that it is easy to input contradicting preferences.
   - User is not assisted with visualization of their selected spans, resulting in potentially high cognitive memory load. 

### Start/End Spans - User adds more as needed
Similar to **Start/End Spans - Three options** except instead of providing three options, zero or one option is provided
but the user can add as many additional spans as they like.

- Advantages
   - Less clutter due to fields the user does need to fill.
- Disadvantages 
   - More difficult to implement.
   - Possibly more complicated for user to understand?

### Multi-Select
Provide a multi-select field which displays all of the half-hour options and allows the user to use CTRL+CLICK and SHIFT+CLICK to easily select single times or ranges.

- Advantages
   - Allows quick selection of ranges.
   - Select fields can be aligned so that user can easily see if their ranges overlap.
   - Selected values can be disabled in other input boxes so the user cannot make contradictory choices.
- Disadvantages
   - Not mobile friendly - would need to find a mobile friendly option, or use Checkbox lists which require the user to click every option (no SHIFT+CLICK range selection)
   - Once the user has clicked on something, they must use CTRL+CLICK to unselect a single selection. Some users may not know this. A clear button could be provided.
   - User can easily wipe their selection by accidentally left clicking another item in the range leading to user frustration at having to re-enter their selection.
   - The list of half-hour option is quite long.
   - There is no inherent way to encourage long available time spans. See **Encouraging long available time spans** in notes.

### Three-Option sliders
Every half-hour increment for a day is displayed with a slider that has three options: Available, PNTW, NA.
All sliders would default to Available, however the nighttime hours could be set to PNTW by default 
during times when staffing requirements are low if we wish to encourage volunteers not to have that time as available.
The sliders could be colored Green for available, Orange for PNTW, or Red for NA to make it very obvious which option is selected.

- Advantages
  - Mobile friendly
  - Impossible for users to select incompatible time ranges.
  - Availability is easily visualized by the input selection.
- Disadvantages
  - User must click/tap once or twice for every half hour interval they do not wish to be available.
     - An argument could be made that this is still easier and maybe even faster for user comprehension than multiple independent ranges.
     - Providing only hour spans instead of half-hour spans could reduce clicks and scroll.
  - Users can select time spans which are only 1/2 hour long
     - Without some additional conditions, such as a limit on the number of spans (as with the 2023 method) or minimum span length, the user could select spans which are difficult to schedule.
  - Friday/Sunday have 34 options, Saturday has 48 options, resulting in quite a lot of scroll. An effort could be made to make it as vertically compact as possible while still being usable on mobile.
  - It may not be clear to the user if the time specified at the END of a span includes the following half-hour or not.
     - As with all con schedules, typically an indicated time in a grid schedule includes the time span until the next indicated time.  
     - This will need to be clearly communicated.
     - The resulting spans can be shown in the availability summary where the actual end times can be clearly indicated.
- Suggestions
  - Half-hour sliders could be slaved to hour sliders
     - If a user taps an hour slider, the half hour after it matches the hour value.
     - The user could then tap the half hour slider to change it independently from the hour.
     - Could reduce overall time to make changes, but also could increase confusion and user cognitive load.
     - This may be over optimising something that isn't that big of a deal.    

## Requirements
- Information to collect
   - Name
      - Should first and last be separated? 
   - Email
      - Can be optional, but required if we wish to track history.
      - Could be updated manually by admins, or could allow it to be updated by users with additional work.
   - Password (optional, could be added later if user doesn't care about history immediately.)
   - Availability time spans, by day of week limited to Sakura-con hours.
      - This could be optional as we could assume 100% availability and only require the user to specify PNTW and NA.
  - PNTW time spans, by day of week limited to Sakura-con hours.
  - NA time spans, by day of week limited to Sakura-con hours.
  - User comments describing their availability, one field day of week or for entire event? 
- Email results to admins and retain them in a database. 

## Optional Extras
- Provide a grade on the availability of the user
   - Outstanding - volunteer is 100% available
   - Excellent - volunteer is available > 30 hours.
   - Good - volunteer is available > 22 hours
   - Poor - Volunteer is available < 22 hours
- Provide a grade on the spans of the user
   - Are the spans few enough, long enough, and far enough apart? 
- Timeline preview
   - Display a timeline of hours for the entire weekend which is shaded according to the users preferences and also night time off hours.
- Availability summary
   - The users selected ranges could be output in a simple concise list for review.
   - This could be similar format to the very concise work schedule provided to the mods at con.
- Retention
   - Allow the user to enter an email address/password in order to save their preferences.
   - User could log in and update their preferences.
   - Updates could be versioned so a submission history is available in case that is useful to the PMC.
   - User could sign in and pull in preferences from previous year as a starting point.

## Notes
- Friday: 17 hours. Saturday: 24 hours. Sunday: 17 hours. Total: 54 hours
- If nighttime hours are from 1 to 7, ~12 hours are at low staffing times. Maybe none if we are not in charge of theatres?
- If each volunteer is given two 10 hour spans for rest, this leaves 34 hours within which to fulfill their 16 hour requirement.
- Encouraging long available time spans.
  - Some form entry methods may encourage the volunteer to select longer continuous time spans (such as the 2023 method).
  - Longer time spans probably make the scheduling resolution easier for the Panel Mod Coordinator.
  - Long spans could be enforced, but also could lead to user frustration if they are not allowed to submit the form due to invalid spans.  
  - User could be warned they have invalid spans, but still allowed to submit after the warning is accepted.
  - User could be graded on their spans in to gently encourage longer spans.

## Questions
- [ ] Which form entry option will we use?
- [ ] Should we remove the concept of "available" hours (if it exists) and require the user to only put in times when they prefer not to work or are unavailable?
- [ ] Do we really need half-hour increments or would full hour work? Full hour increments would reduce clutter and options by half.
- [ ] Are there any span length minimums or number of spans?
   - Some of the proposed input methods have no inherent limit on the number of spans.
   - A user could select spans as short as 30 minutes which makes for impossible scheduling options.
   - With some input methods Without some grading or restrictions, a user could select every other half-hour interval resulting in an impossible scheduling situation.
   - The 2023 method imposed a limit of 3 spans of each type per day.
- [ ] Any other requirements or guidelines for continuous availability? 
- [ ] Where should results be emailed?
- [ ] What sort or single user or all user reports or exports would be useful?
- [ ] Should user be given option to comment on their availability by day of week or once for the entire event?
- [ ] Should we ask for pronoun?
- [ ] Is there any additional information that should be collected that is not mentioned in the **Requirements** section.
- [ ] How many form pages?
   - The 2023 form had 3 pages, but due ot the rather sprawling nature of the inputs this made sense.
   - Once the input method is chosen, also determine how many pages are needed.
- [ ] What copy should be included to explain how to fill the form?
   - [ ] Explain that the half-hour intervals include the full half hour after the specified time.
   - For example, if a user selets 10:00 AM, that actually indicates 10:00 AM - 10:30 AM inclusive.