## Issue Types

* **Epic** - A general use case that is a collection of features (user stories). (Use Fibonacci numbers to estimate.)
* **User Story** - Represents a user feature. (Use Fibonacci numbers to estimate.)
* **Sub-Task** - Represents development tasks to accomplish the user story. (No story point estimates.) Generally no more than 1-day tasks. You can either count the number of sub-tasks or time estimate in days in your retrospective to evaluate if your story point estimate for the User Story was accurate and adjust accordingly - assuming you have some velocity history to compare to.
* **(Engineering) Task** - We used to call these "Dev Stories" (in a pre-Jira project) - represents a set of engineering work that is not directly related to a user story. The team should try to anticipate "Dev Stories" and add them to the backlog sooner than later with estimates (Use Fibonacci numbers to estimate) so the PO can plan milestones.

### Example

* Epic: User Authentication.
* User Stories:
  * User Login screen.
  * Forgot Password workflow.
  * Lock account after too many failed attempts.
  * Google login support.
  * Facebook login support.
* Sub-Tasks:
  * User Login screen:
    * Design login page.
    * Cut SVG icons and images.
    * Implement login page HTML/CSS/JS.
    * Create SQL scripts to create tables.
    * Create SQL scripts for stored procedures.
    * Create web service REST API for user resource.
    * Hook up login page to web service REST API.
  * Forgot Password workflow:
    * ...
* (Engineering) Tasks:
  * Setup GitHub project repo.
  * Setup GCP (or AWS) account, containers, and services.
    * (There might be Sub-Tasks for these too)
    * ...
  * Setup Jenkins CI pipeline.
  * Design overall (high-level) system architecture.
  * Research and decide on unit test and mocking framework.
