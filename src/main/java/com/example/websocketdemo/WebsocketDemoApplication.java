package com.example.websocketdemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan(basePackages = {"com.example.websocketdemo.*"})
@EntityScan(basePackages = {"com.example.websocketdemo.entity"})
@EnableJpaRepositories(basePackages = {"com.example.websocketdemo.repository"})
public class WebsocketDemoApplication  extends SpringBootServletInitializer {
 
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(WebsocketDemoApplication.class);
    }
    
	public static void main(String[] args) {
		SpringApplication.run(WebsocketDemoApplication.class, args);
	}
}
