I have the  webapi for hello-world.feture deployed behind on AWS and the API is secured at https://api.podluminary.com.  I've got a keycloak location that serves api tokens at: https://auth.podluminary.com/realms/agilenoir/protocol/openid-connect/token
Other details you'll need:
client_id=agilenoir-api
username=testuser
password=testpassword

Add a new feature file to collect the bearer token and put it in a variable for reuse.
Change the hello-world.feature to use the bearer token to access the api.
Do not change the baseUrl in the feature file as that already does the right thing for finding the api.

Test completeness with the following command:
./gradlew testApis -Dkarate.baseUrl=https://api.podluminary.com