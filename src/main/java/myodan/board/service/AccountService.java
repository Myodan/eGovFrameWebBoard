package myodan.board.service;

import myodan.board.vo.AccountVO;

public interface AccountService {

	void insertAccount(AccountVO accountVO);

	void updateAccount(AccountVO accountVO);

	void deleteAccount(AccountVO accountVO);

	AccountVO selectAccount(AccountVO accountVO);

	boolean selectAccountSignInCheck(AccountVO accountVO);

}
