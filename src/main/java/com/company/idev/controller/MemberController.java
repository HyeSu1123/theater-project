package com.company.idev.controller;


import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.idev.dto.Members;
import com.company.idev.mapper.MembersMapper;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private static final Logger logger
	= LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MembersMapper mapper;
	
	@Autowired
	public  BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("/join.do")
	public String join() {
		return "member/MemberJoin";
	}
	
	//회원가입
	@PostMapping("/join.do")
	public String appForm(Members member,RedirectAttributes rda) {
		String rawPw = "";
		String encodePw="";
		
		rawPw = member.getPassword();
		encodePw = pwEncoder.encode(rawPw);
		member.setPassword(encodePw);
		
		rda.addFlashAttribute("message","가입이 완료되었습니다");
		mapper.insert(member);
		return "redirect:/login.do";
	}

	//아이디 체크
	@GetMapping("/idCheck.do")
	public String idCheck(String id,Model model) {
		String msg;
		Pattern p = Pattern.compile("[\\s]");
		Matcher m = p.matcher(id);
		Pattern reg =Pattern.compile("[^a-z0-9]");
		Matcher mreg = reg.matcher(id);
		
		if(mapper.checkid(id) != 0)
			msg="사용할 수 없는 아이디입니다.";
		else if(id=="") {
			msg="사용할 수 없는 아이디입니다.";
		}else if(id.length() < 5 || id.length() > 10) {
			msg="사용할 수 없는 아이디입니다.";
		}else if(m.find()) {
			msg="사용할 수 없는 아이디입니다.";
		}else if(mreg.find()) {
			msg="사용할 수 없는 아이디입니다.";
		}
		else msg="사용가능한 아이디입니다.";
		model.addAttribute("id", id);
		model.addAttribute("msg", msg);
		return "member/idCheck";
	}
	//마이페이지
	@GetMapping("/mypage.do")
	public String page() {
		return "member/MyPage";
	}

	
	//마이페이지 수정
	@PostMapping("update.do")
	public String memberUpdate(Members member,HttpSession session,RedirectAttributes rda) {
		mapper.update(member);	
		logger.info("들어오는 값"+member);
		Members m = (Members)session.getAttribute("member");
		m.setEmail(member.getEmail());
		m.setPhone(member.getPhone());
		session.setAttribute("member", m);
		rda.addFlashAttribute("message", "수정되었습니다.");
		return "redirect:mypage.do";
	}
	
	//회원탈퇴
	@PostMapping("delete.do")
	public String delete(Members id,RedirectAttributes rda) {
		mapper.delete(id);
		rda.addFlashAttribute("message", "탈퇴되었습니다.");
		return "redirect:/logout.do";
	}
	

/*	//비밀번호 찾기 페이지로 이동
	@GetMapping("/pw_find.do")
	public String pw_find() {
		return "member/pw_find";
	}
	
	@PostMapping("/pw_find.do")
	public String pw_findAction(Member vo, Model model) {
		Member member = mapper.findPassword(vo);
		if(member == null) {
			model.addAttribute("check",1);
		}else {
			model.addAttribute("check", 0);
			model.addAttribute("updateid",member.getId());
		}
		return "member/pw_find";
	}
	
	@RequestMapping(value = "/pw_auth.do")
	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = (String)request.getParameter("email");
		String id = (String)request.getParameter("id");

		Members vo = mapper.findPassword(email);
			
		if(vo != null) {
		Random r = new Random();
		int num = r.nextInt(999999); // 랜덤난수설정
		
		if (vo.getId().equals(id)) {
			session.setAttribute("email", vo.getEmail());

			String setfrom = "test@gmail.com"; // naver 
			String tomail = email; //받는사람
			String title = "[삼삼하개] 비밀번호변경 인증 이메일 입니다"; 
			String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
					+ "비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title);
				messageHelper.setText(content); 
			
				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/pw_auth");
			mv.addObject("num", num);
			return mv;
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/pw_find");
			return mv;
		}
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/pw_find");
			return mv;
		}
	
	}*/
	//이메일 인증번호 확인
	@RequestMapping(value = "/pw_set.do", method = RequestMethod.POST)	
	public String pw_set(@RequestParam(value="email_injeung") String email_injeung,
				@RequestParam(value = "num") String num) throws IOException{
			
			if(email_injeung.equals(num)) {
				return "member/pw_new";
			}
			else {
				return "member/pw_find";
			}
	} 
	
/*	@PostMapping("/pw_new.do")
	public String pw_new(@RequestParam("member") String id, @RequestParam("oldPw") String oldPw, @RequestParam("newPw") 
		String newPw, HttpSession session, RedirectAttributes redirectAttributes) {

		int result = mapper.updatePassword(id);
		if(result == 1) {
			return "memer/MemberLogin";
		}
		else {
			System.out.println("pw_update"+ result);
			return "member/pw_new";
		}
}*/
	@PostMapping("/pw_new.do")
	public String pw_new(Members pw,HttpSession session,RedirectAttributes rda) {
		mapper.updatePassword(pw);	
		logger.info("들어오는 값"+pw);
		Members m = (Members)session.getAttribute("member");
		m.setPassword(pw.getPassword());
		session.setAttribute("member", m);
		rda.addFlashAttribute("message", "수정되었습니다.");
		return "redirect:mypage.do";
	}
	
	
}