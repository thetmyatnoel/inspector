package com.lab5.inspector;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class InspectorApplication {


    public static void main(String[] args) {

        SpringApplication.run(InspectorApplication.class, args);
    }
    @Bean
    CommandLineRunner run() {
        return args -> {
            // to run the encoding process at startup
             //loginDbService.encodeAndSavePhoneNumbersAsPasswords();
        };
    }

}
