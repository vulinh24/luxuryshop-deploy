package com.luxuryshop.configurations;

import java.util.Properties;
import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@EnableTransactionManagement
public class MySQLConfig {
	@Bean(destroyMethod = "close")
	protected DataSource dataSource() {
		HikariConfig dataSourceConfig = new HikariConfig();
		dataSourceConfig.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSourceConfig.setJdbcUrl("jdbc:mysql://aaz1k4sls9w1bk.cobiaeuzm7py.ap-southeast-1.rds.amazonaws.com:3306/luxuryshop?useUnicode=yes&characterEncoding=UTF-8");
		dataSourceConfig.setUsername("root");
		dataSourceConfig.setPassword("12345678");
		return new HikariDataSource(dataSourceConfig);
	}

	@Bean
	protected LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		Properties jpaProperties = new Properties();
		// Configures the used database dialect. This allows Hibernate to create SQL
		// that is optimized for the used database.
		jpaProperties.put("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
		// Specifies the action that is invoked to the database when the Hibernate
		// SessionFactory is created or closed.
		jpaProperties.put("hibernate.hbm2ddl.auto", "validate");// validate
		// Configures the naming strategy that is used when Hibernate creates new
		// database objects and schema elements
		jpaProperties.put("hibernate.ejb.naming_strategy", "org.hibernate.cfg.ImprovedNamingStrategy");
		// If the value of this property is true, Hibernate writes all SQL statements to
		// the console.
		jpaProperties.put("hibernate.show_sql", "false");
		// If the value of this property is true, Hibernate will format the SQL that is
		// written to the console.
		jpaProperties.put("hibernate.format_sql", "true");

		LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
		entityManagerFactoryBean.setDataSource(dataSource());
		entityManagerFactoryBean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
		// package chứa các entities.
		entityManagerFactoryBean.setPackagesToScan("com.luxuryshop.entities"); // root
		entityManagerFactoryBean.setJpaProperties(jpaProperties);
		return entityManagerFactoryBean;
	}

	@Bean
	protected JpaTransactionManager transactionManager(final EntityManagerFactory entityManagerFactory) {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(entityManagerFactory);
		return transactionManager;
	}
}