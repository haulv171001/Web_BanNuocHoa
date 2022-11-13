package myweb.site.springwebmvc.dao.impl;

import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import myweb.site.springwebmvc.dao.AccountDAO;
import myweb.site.springwebmvc.entity.Account;
import myweb.site.springwebmvc.entity.Product;
import myweb.site.springwebmvc.model.AccountInfo;
import myweb.site.springwebmvc.model.ProductInfo;
@Transactional
public class AccountDAOImpl  implements AccountDAO {
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public Account findAccount(String userName) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Account.class);
		crit.add(Restrictions.eq("userName", userName));
		return (Account) crit.uniqueResult();
	}

	
//	@Override
//	public void add(Account newAccount) {
//	     Session currentSession = sessionFactory.getCurrentSession();
//	        // save/upate the customer ... finally
//	        currentSession.saveOrUpdate(newAccount);
//	}
//	
	@Override
	public void save(AccountInfo accountInfo) throws Exception {
		String userName = accountInfo.getUserName();

	        Account account = null;

	        boolean isNew = false;
	        if (userName != null) {
	            account = this.findAccount(userName);
	     
	        }
	        if (account == null) {
	            isNew = true;
	            account = new Account();
	        }else {
	        	throw new Exception("User " + userName + " exist");
	        }
	        account.setUserName(userName);
	        account.setPassword(accountInfo.getPassword());
	        account.setActive(true);
	        account.setUserRole("EMPLOYEE");

	        if (isNew) {
	            this.sessionFactory.getCurrentSession().persist(account);
	        }
	        // If error in DB, Exceptions will be thrown out immediately
	        // Nếu có lỗi tại DB, ngoại lệ sẽ ném ra ngay lập tức
	        this.sessionFactory.getCurrentSession().flush();
		
	}
}
