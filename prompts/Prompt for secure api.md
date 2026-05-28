I have the  webapi for hello-world.feture deployed behind on AWS and the API is secured at https://api.podluminary.com.  I've got a keycloak location that serves api tokens at: https://auth.podluminary.com/realms/agilenoir/protocol/openid-connect/token
Other details you'll need:
client_id=agilenoir-api
username=testuser
password=testpassword


Change the hello-world.feature to get a bearer token to access the api.

Test completeness with the following command:
./gradlew testApis -Dkarate.baseUrl=https://api.podluminary.com