package com.mj.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

//import mobile.factory.db.dao.EntityDao;
//import mobile.factory.db.dao.JdbcEntityTable;

@Configuration
@EnableTransactionManagement
@MapperScan(value="com.mj.dao", sqlSessionFactoryRef = "mariaSqlSessionFactory")
public class DataSourceConfigMaria {

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.hikari")
    public HikariConfig hikariConfigMaria() {return new HikariConfig(); }

    @Bean(name = "mariaDataSource")
    public DataSource dataSource() {
        return new HikariDataSource(hikariConfigMaria());
    }

    @Bean
    public PlatformTransactionManager transactionManager(@Qualifier("mariaDataSource") DataSource dataSource){
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean(name = "mariaSqlSessionFactory")
    public SqlSessionFactoryBean mariaSqlSessionFactory(@Qualifier("mariaDataSource") DataSource mariaDataSource, ApplicationContext applicationContext) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();

        org.apache.ibatis.session.Configuration con = new org.apache.ibatis.session.Configuration();
        con.setCallSettersOnNulls(true);
        sqlSessionFactoryBean.setConfiguration(con);

        sqlSessionFactoryBean.setDataSource(mariaDataSource);
        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/maria/*.xml"));
        // 카멜케이스 먹히지 않음...
//        sqlSessionFactoryBean.getObject().getConfiguration().setMapUnderscoreToCamelCase(true);
        return sqlSessionFactoryBean;
    }

    @Bean(name = "mariaSqlSessionTemplate")
    public SqlSessionTemplate mariaSqlSessionTemplate(SqlSessionFactory mariaSqlSessionFactory) {
        return new SqlSessionTemplate(mariaSqlSessionFactory);
    }
    
//	@Bean
//	public EntityDao entityDao() {
//		JdbcEntityTable entityDao = new JdbcEntityTable();
////		entityDao.setDbVendor("");
//		entityDao.setDataSource(dataSource());
////		entityDao.setCodeNameMapper(null);
//		
//		return entityDao;
//	}
}
