package myweb.site.springwebmvc.dao;

import myweb.site.springwebmvc.entity.Account;
import myweb.site.springwebmvc.model.AccountInfo;
import myweb.site.springwebmvc.model.ProductInfo;

public interface AccountDAO {
	public Account findAccount(String userName);
	//public void add(Account newAccount);
	public void save(AccountInfo accountInfo) throws Exception;
}
