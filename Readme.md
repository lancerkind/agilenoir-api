This application is a simple starting point for an API class/training for working with Spring Boot.

# Dependencies
- gradle 9.3.0
- Java 25

# Tips
## Port collisions when running on your local machine
Use the PORT environment variable to specify the port for the application. This is likely better than changing the 
application.properties file which could get deployed with the jar and inadvertently ruin your deployment.

# Troubleshooting
## problem: health checks failing on AWS
### Solution: Ensure the app is running on the correct port
- Verify that the application is listening on the expected port (beanstalk default is 8080).
- Check if there are any firewall rules blocking the port.
- Confirm that the application is not configured to listen on a different port.
- Checked the port configured in application.properties as that will be deployed into the beanstalk environment.
