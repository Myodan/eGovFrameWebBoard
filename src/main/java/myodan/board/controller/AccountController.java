package myodan.board.controller;

import java.util.regex.Pattern;

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
			model.addAttribute("error", "알 수 없는 사용자입니다! 사용자 이름 또는 암호를 다시한번 확인해주세요!");
			return "/account/signin";
		}
	}

	@GetMapping("/signup.do")
	public String getSignUp() {
		return "/account/signup";
	}

	@PostMapping("/signup.do")
	public String postSignUp(AccountVO accountVO, Model model) {
		if (accountService.selectAccountUsernameCheck(accountVO.getUsername())) {
			model.addAttribute("error", "이미 존재하는 사용자 이름입니다!");
			return "/account/signup";
		}
		if (!accountVO.getPassword().equals(accountVO.getPasswordCheck())) {
			model.addAttribute("error", "암호 재 확인이 틀립니다! 암호를 다시 확인해주세요!");
			return "/account/signup";
		}
		if ((!Pattern.matches("^[a-zA-Z0-9]{5,20}$", accountVO.getUsername())
				&& Pattern.matches("(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,30}", accountVO.getPassword()))) {
			model.addAttribute("error", "사용자 이름 또는 비밀번호의 정규표현식이 일치하지 않습니다! 다시 확인해주세요!");
			return "/account/signup";
		}
		accountService.insertAccount(accountVO);
		return "redirect:/";
	}

	@GetMapping("/signout.do")
	public String getSignOut(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}

}