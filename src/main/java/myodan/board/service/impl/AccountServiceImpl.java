package myodan.board.service.impl;

import org.springframework.stereotype.Service;

import myodan.board.mapper.AccountMapper;
import myodan.board.service.AccountService;
import myodan.board.vo.AccountVO;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

	final AccountMapper accountDAO;

	public AccountServiceImpl(AccountMapper accountDAO) {
		this.accountDAO = accountDAO;
	}

	@Override
	public void insertAccount(AccountVO accountVO) {
		accountDAO.insertAccount(accountVO);
	}

	@Override
	public void updateAccount(AccountVO accountVO) {
		accountDAO.updateAccount(accountVO);
	}

	@Override
	public void deleteAccount(AccountVO accountVO) {
		accountDAO.deleteAccount(accountVO);
	}

	@Override
	public AccountVO selectAccount(AccountVO accountVO) {
		return accountDAO.selectAccount(accountVO);
	}

	@Override
	public boolean selectAccountSignInCheck(AccountVO accountVO) {
		return accountDAO.selectAccountSignInCheck(accountVO);
	}

}
