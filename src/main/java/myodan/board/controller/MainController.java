package myodan.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/index.do")
	public String getIndex() {
		return "redirect:/board/list.do";
	}

}