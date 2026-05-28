package com.agilenoir.helloworld.controllers.helloworld;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.BeforeEach;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class HelloWorldTestRunner {

    @LocalServerPort
    int microservicePort;

    @BeforeEach
    void tellKarateAboutPort() {
        System.setProperty(
                "karate.baseUrl",
                System.getProperty("karate.baseUrl", "http://localhost:" + microservicePort)
        );
    }

    @Karate.Test
    Karate testAll() {
        return Karate.run("hello-world.feature")
                .relativeTo(getClass())
                .reportDir("build/karate-reports/" + this.getClass().getSimpleName())
                .outputCucumberJson(true);
    }
}
