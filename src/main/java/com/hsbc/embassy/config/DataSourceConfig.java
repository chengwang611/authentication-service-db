package com.hsbc.embassy.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DataSourceConfig {
	
	@Bean(name="h2DataSource")
	public DataSource getDerbyDataSource() {
		
		BasicDataSource dataSource =new BasicDataSource();
		dataSource.setUrl("jdbc:h2:mem:testdb");
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUsername("sa");
		dataSource.setPassword("");
		return dataSource;
	}

}
