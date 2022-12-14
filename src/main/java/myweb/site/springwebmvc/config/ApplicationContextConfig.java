package myweb.site.springwebmvc.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import myweb.site.springwebmvc.dao.AccountDAO;
import myweb.site.springwebmvc.dao.OrderDAO;
import myweb.site.springwebmvc.dao.ProductDAO;
import myweb.site.springwebmvc.dao.impl.AccountDAOImpl;
import myweb.site.springwebmvc.dao.impl.OrderDAOImpl;
import myweb.site.springwebmvc.dao.impl.ProductDAOImpl;

@Configuration
@ComponentScan("myweb.site.springwebmvc.*")
@EnableTransactionManagement
@PropertySource("classpath:ds-hibernate-cfg.properties")
public class ApplicationContextConfig {
	@Autowired
	private Environment env;
	@Bean
	public ResourceBundleMessageSource  messageSource() {
		ResourceBundleMessageSource rb = new ResourceBundleMessageSource();
		
		rb.setBasenames(new String[] {"messages/validator"});
		return rb;
	}
	@Bean(name = "viewResolver")
	public InternalResourceViewResolver  getViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/pages/");
	    viewResolver.setSuffix(".jsp");
	    return viewResolver;
	}
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver  multipartResolver() {
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
		return commonsMultipartResolver;
	}
	@Bean(name = "dataSource")
	public DataSource  getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		// Xem: ds-hibernate-cfg.properties
	       dataSource.setDriverClassName(env.getProperty("ds.database-driver"));
	       dataSource.setUrl(env.getProperty("ds.url"));
	       dataSource.setUsername(env.getProperty("ds.username"));
	       dataSource.setPassword(env.getProperty("ds.password"));
	       
	       
	       return dataSource;
	}
	
	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) throws Exception {
	       Properties properties = new Properties();

	 
	       // Xem: ds-hibernate-cfg.properties
	       properties.put("hibernate.dialect", env.getProperty("hibernate.dialect"));
	       properties.put("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
	       properties.put("current_session_context_class", env.getProperty("current_session_context_class"));
	       

	       LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
	 
	       // Package ch???a c??c entity class.
	       factoryBean.setPackagesToScan(new String[] { "myweb.site.springwebmvc.entity" });
	       factoryBean.setDataSource(dataSource);
	       factoryBean.setHibernateProperties(properties);
	       factoryBean.afterPropertiesSet();
	       //
	       SessionFactory sf = factoryBean.getObject();
	       return sf;
	}
	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
	       HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
	       return transactionManager;
	}
	@Bean(name = "accountDAO")
	public AccountDAO getApplicantDAO() {
	       return new AccountDAOImpl();
	   }

	@Bean(name = "productDAO")
	public ProductDAO getProductDAO() {
	       return new ProductDAOImpl();
	   }

	@Bean(name = "orderDAO")
	public OrderDAO getOrderDAO() {
	       return new OrderDAOImpl();
	   }
	   
	@Bean(name = "accountDAO")
	public AccountDAO getAccountDAO()  {
	       return new AccountDAOImpl();
	   }
}
