package myodan.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import myodan.board.service.AccountService;
import myodan.board.vo.AccountVO;

@Controller
@RequestMapping("/account")
public class AccountController {

	final AccountService accountService;

	public AccountController(AccountService accountService) {
		this.accountService = accountService;
	}

	@GetMapping("/signin.do")
	public String getSignIn() {
		return "/account/signin";
	}

	@PostMapping("/signin.do")
	public String postSignIn(AccountVO accountVO, HttpServletRequest request, Model model) {
		if (accountService.selectAccountSignInCheck(accountVO)) {
			HttpSession session = request.getSession();
			session.setAttribute("username", accountVO.getUsername());
			return "redirect:/";
		} else {
			model.addAttribute("signin.error", "알 수 없는 사용자입니다! 사용자 이름 또는 암호를 다시한번 확인해주세요!");
			return "/account/signin";
		}
	}

	@GetMapping("/signup.do")
	public String getSignUp() {
		return "/account/signup";
	}

	@GetMapping("/signout.do")
	public String getSignOut(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}

}