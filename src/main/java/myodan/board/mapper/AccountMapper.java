package myodan.board.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import myodan.board.vo.AccountVO;

@Mapper("accountMapper")
public interface AccountMapper {

	void insertAccount(AccountVO accountVO);

	void updateAccount(AccountVO accountVO);

	void deleteAccount(AccountVO accountVO);

	AccountVO selectAccount(AccountVO accountVO);

	boolean selectAccountSignInCheck(AccountVO accountVO);

}
