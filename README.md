## This is a demo for using MobX as a state management in flutter app (combine with Provider as a package for performing Dependency injection)

### There are 2 sections in this demo:
- 1. Simple MobX(/counter): Whenever you clicking "+" button, counter in the middle of the page will increase to 1
- 2. MobX with asynchrous state (/favorites): By default, I will show you a list of tutor with basic information and a favourite button. When clicking on this button, send update favorites list to backend and get this list again. (When run this, maybe the token is expired, you will need to enter https://sandbox.app.lettutor.com/ to get the new token and pass to Dio in TutorsRepository)
