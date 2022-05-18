package com.company.idev.controller;


import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
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
import com.company.idev.dto.Performance;
import com.company.idev.dto.Schedules;
import com.company.idev.dto.Seat;
import com.company.idev.dto.Temp;
import com.company.idev.dto.Ticket;
import com.company.idev.mapper.MembersMapper;
import com.company.idev.mapper.PerformanceMapper;
import com.company.idev.mapper.SchedulesMapper;
import com.company.idev.mapper.SeatMapper;
import com.company.idev.mapper.TicketMapper;

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
	
	@Autowired
	PerformanceMapper perform_mapper;
	
	@Autowired
	SchedulesMapper schedules_mapper;
	
	@Autowired
	SeatMapper seat_mapper;
	
	@Autowired
	TicketMapper ticket_mapper;
	
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
	public String page(Members member,HttpSession session,RedirectAttributes rda) {
		Members id = (Members)session.getAttribute("member"); 
		String id2 = id.getId();
		
		logger.info("들어오는 값"+id);
		id.setId(member.getId());
		logger.info("들어오는 값"+id2);
		List<Ticket> ticketnos = ticket_mapper.getIdTicket(id2);
		int number = ticketnos.size();
		//회원 예매번호 목록
		List<Integer> ticketnos2 = new ArrayList<>();
		for(int i=0;i<number;i++) {
			ticketnos2.add(ticketnos.get(i).getTicket_no());
		}
		//행 열 번호 좌석 리스트
		int schedulelist[] = new int[number];
		String seatlist[] = new String[number];
		int numlist[] = new int[number];
		Timestamp ticketdatelist[] = new Timestamp[number];
		List<Schedules> scheduleinfo = new ArrayList<>();
		List<Performance> performinfo = new ArrayList<>();
		for(int i=0;i<number;i++) {
			//예매 번호로 조회한 정보
			List<Ticket> a = ticket_mapper.getTicket(ticketnos2.get(i));
			schedulelist[i]=a.get(i).getSchedule_idx();
			ticketdatelist[i] = a.get(i).getTicket_date();
			int[] seats = new int[a.size()];
			numlist[i]=a.size();
			for(int j=0;j<a.size();j++) {
				seats[i]= a.get(i).getSeat_idx();
			}
			Seat seat1;
			String seat2="";
			for(int j=0;i<number;i++) {
				seat1 = seat_mapper.getOne(seats[i]);
				seat2 += seat1.getSeat_row()+"-"+seat1.getNum()+", ";
			}
			String choicedseat=seat2.substring(0, seat2.length()-2);
			seatlist[i]=choicedseat;
		}
		for(int i=0;i<number;i++) {
			scheduleinfo.add(schedules_mapper.getInfo(schedulelist[i]));
			performinfo.add(perform_mapper.getOne(scheduleinfo.get(i).getPerform_idx()));
		}
		List<Temp> list = new ArrayList<>();
		for (int i=0;i<number;i++) {
			Temp temp = new Temp();
			temp.setTicket_no(ticketnos2.get(i));
			temp.setPerform(performinfo.get(i).getPerform_title());
			temp.setTheater(performinfo.get(i).getTheater_name());
			temp.setPerform_date(scheduleinfo.get(i).getPerform_date());
			temp.setStart_time(scheduleinfo.get(i).getStart_time());
			temp.setSeat(seatlist[i]);
			temp.setNum(numlist[i]);
			list.add(temp);
		}
		rda.addAttribute("list", list);
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
	
	@PostMapping("mypage.do")
	public String getTicket(Members member,Model model,HttpSession session) {
		Members id = (Members)session.getAttribute("member"); 
		logger.info("들어오는 값"+id);

		List<Ticket> ticketnos = ticket_mapper.getIdTicket(id.getId());
		int number = ticketnos.size();
		//회원 예매번호 목록
		List<Integer> ticketnos2 = new ArrayList<>();
		for(int i=0;i<number;i++) {
			ticketnos2.add(ticketnos.get(i).getTicket_no());
		}
		//행 열 번호 좌석 리스트
		int schedulelist[] = new int[number];
		String seatlist[] = new String[number];
		int numlist[] = new int[number];
		Timestamp ticketdatelist[] = new Timestamp[number];
		List<Schedules> scheduleinfo = new ArrayList<>();
		List<Performance> performinfo = new ArrayList<>();
		for(int i=0;i<number;i++) {
			//예매 번호로 조회한 정보
			List<Ticket> a = ticket_mapper.getTicket(ticketnos2.get(i));
			schedulelist[i]=a.get(i).getSchedule_idx();
			ticketdatelist[i] = a.get(i).getTicket_date();
			int[] seats = new int[a.size()];
			numlist[i]=a.size();
			for(int j=0;j<a.size();j++) {
				seats[i]= a.get(i).getSeat_idx();
			}
			Seat seat1;
			String seat2="";
			for(int j=0;i<number;i++) {
				seat1 = seat_mapper.getOne(seats[i]);
				seat2 += seat1.getSeat_row()+"-"+seat1.getNum()+", ";
			}
			String choicedseat=seat2.substring(0, seat2.length()-2);
			seatlist[i]=choicedseat;
		}
		for(int i=0;i<number;i++) {
			scheduleinfo.add(schedules_mapper.getInfo(schedulelist[i]));
			performinfo.add(perform_mapper.getOne(scheduleinfo.get(i).getPerform_idx()));
		}
		List<Temp> list = new ArrayList<>();
		for (int i=0;i<number;i++) {
			Temp temp = new Temp();
			temp.setTicket_no(ticketnos2.get(i));
			temp.setPerform(performinfo.get(i).getPerform_title());
			temp.setTheater(performinfo.get(i).getTheater_name());
			temp.setPerform_date(scheduleinfo.get(i).getPerform_date());
			temp.setStart_time(scheduleinfo.get(i).getStart_time());
			temp.setSeat(seatlist[i]);
			temp.setNum(numlist[i]);
			list.add(temp);
		}
		model.addAttribute("list", list);
		return "member/MyPage";
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