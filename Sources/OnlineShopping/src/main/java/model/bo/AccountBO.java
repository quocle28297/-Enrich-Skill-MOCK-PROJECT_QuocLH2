package model.bo;

import model.bean.Account;
import model.dao.AccountDAO;

public class AccountBO {
	public Account checkLogin(String userName, String passWord) {
		return new AccountDAO().checkLogin(userName, passWord);
	}

	public boolean insertAccountBO(Account acc) {
		// TODO Auto-generated method stub
		return new AccountDAO().insertAccountDAO(acc);
	}
}
