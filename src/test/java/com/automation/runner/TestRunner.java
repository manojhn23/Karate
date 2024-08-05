package com.automation.runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    public Karate runner() {
        return Karate.run("classpath://features").reportDir("Karate-Reports")
                .outputCucumberJson(true);
    }
}
