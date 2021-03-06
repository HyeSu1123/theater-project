package com.company.idev.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.idev.dto.Answer;
import com.company.idev.dto.Members;
import com.company.idev.dto.Notice;
import com.company.idev.dto.PageDto;
import com.company.idev.dto.Performance;
import com.company.idev.dto.Question;
import com.company.idev.dto.Schedules;
import com.company.idev.dto.Theater;
import com.company.idev.mapper.AnswerMapper;
import com.company.idev.mapper.MembersMapper;
import com.company.idev.mapper.NoticeMapper;
import com.company.idev.mapper.PerformanceMapper;
import com.company.idev.mapper.QuestionMapper;
import com.company.idev.mapper.SchedulesMapper;
import com.company.idev.mapper.TheaterMapper;
import com.company.idev.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	MembersMapper mapper;
	
	@Autowired
	NoticeMapper notice_mapper;
	
	@Autowired
	QuestionMapper question_mapper;
	
	@Autowired
	AnswerMapper answer_mapper;
	
	@Autowired
	PerformanceMapper perform_mapper;
	
	@Autowired
	SchedulesMapper schedule_mapper;
	
	@Autowired
	TheaterMapper theater_mapper;
	
	@Autowired
	public BCryptPasswordEncoder pwEncoder;
	
	private final AdminService service;
	
	public AdminController(AdminService service) {
		this.service = service;
	}
	

	
	
	//????????? ????????????
	@GetMapping("/adminjoin.do")
	public String join() {
		return "admin/AdminJoin";
	}
	
	@PostMapping("/adminjoin.do")
	public String appForm(Members admin,RedirectAttributes rda) {
		String rawPw = "";
		String encodePw="";
		
		rawPw = admin.getPassword();
		encodePw = pwEncoder.encode(rawPw);
		admin.setPassword(encodePw);
		
		rda.addFlashAttribute("message","?????? ?????????????????????. ?????? ?????? ??? ?????? ???????????????");
		mapper.insertAdmin(admin);
		return "redirect:/admin.do";
	}

	//????????? ??????
	@GetMapping("/idCheck.do")
	public String idCheck(String id,Model model) {
		String msg;
		Pattern p = Pattern.compile("[\\s]");
		Matcher m = p.matcher(id);
		Pattern reg =Pattern.compile("[^a-z0-9]");
		Matcher mreg = reg.matcher(id);
		
		if(mapper.checkid(id) != 0)
			msg="????????? ??? ?????? ??????????????????.";
		else if(id=="") {
			msg="????????? ??? ?????? ??????????????????.";
		}else if(id.length() < 5 || id.length() > 10) {
			msg="????????? ??? ?????? ??????????????????.";
		}else if(m.find()) {
			msg="????????? ??? ?????? ??????????????????.";
		}else if(mreg.find()) {
			msg="????????? ??? ?????? ??????????????????.";
		}
		else msg="??????????????? ??????????????????.";
		model.addAttribute("id", id);
		model.addAttribute("msg", msg);
		return "member/idCheck";
	}
	
	
	
	
	@RequestMapping("/main.do")
	public String main() {
		return "admin/main";
	}
//?????? ??????	
	@RequestMapping("memberlist.do")
	public String list(@RequestParam(required=false, defaultValue = "1")
	int pageNo,Model model) {
		PageDto page = new PageDto(pageNo,10,mapper.getCount());
		
		Map<String,Integer> map = new HashMap<>();
		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		List<Members> list = mapper.getPageList(map);
		
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		
		return "admin/memberList";
	}
	
	
//???????????? ??????
	@RequestMapping("membersearch.do")
	public String search(@RequestParam(required=false, defaultValue = "1")
			int pageNo,@RequestParam String columns,
			@RequestParam(value = "find") String[] finds,Model model) {
		String find = finds[0];
		if(columns.equals("authority")) find=finds[1];
		logger.info("[My]"+columns);
		Map<String,String> map = new HashMap<>();
		map.put("columns",columns);
		map.put("find",find);
		
		PageDto page = new PageDto(pageNo,10,mapper.getSearchCount(map));
		
		int startNo = page.getStartNo();
		int endNo = page.getEndNo();
		List<Members> list = mapper.searchPageList(columns,find,startNo,endNo);
		logger.info("[My]"+list);
		
		model.addAttribute("columns",columns);
		model.addAttribute("find",find);
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		
		return "admin/memberList";
	}
//???????????? ??????	
	@PostMapping("adminupdate.do")
	public String adminUpdate(String id, Model model) {
		Members vo = mapper.getOne(id);
		model.addAttribute("vo",vo);
		return "admin/memberUpdate";
	}
	@PostMapping("adminupdatesave.do")
	public String adminUpdateSave(String id, RedirectAttributes rda) {
		mapper.updateAdmin(id);
		rda.addFlashAttribute("message",id+"?????? ???????????? ?????????????????????.");
		return "redirect:memberlist.do";
	}
//?????? ??????	
	@PostMapping("memberdelete.do")
	public String memberDelete(String id, Model model) {
		Members vo = mapper.getOne(id);
		model.addAttribute("vo",vo);
		return "admin/memberDelete";
	}
	@PostMapping("memberdeletesave.do")
	public String memberDeleteSave(String id, RedirectAttributes rda) {
		mapper.deleteMember(id);
		rda.addFlashAttribute("message",id+"?????? ?????? ????????? ?????????????????????.");
		return "redirect:memberlist.do";
	}	
	
	
//????????????-----------------------------------------
	@RequestMapping("noticelist.do")
	public String noticeList(@RequestParam(required=false, defaultValue = "1")
	int pageNo,Model model) {
		PageDto page = new PageDto(pageNo,10,notice_mapper.getCount());
		
		Map<String,Integer> map = new HashMap<>();
		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		List<Notice> list = notice_mapper.getPageList(map);
		
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		return "admin/noticeList";
	}
	
	@RequestMapping("noticesearch.do")
	public String noticeSearch(@RequestParam(required=false, defaultValue = "1")
				int pageNo, String columns, String find, Model model) {
		//logger.info("[My]"+columns);
		Map<String,String> map = new HashMap<>();
		map.put("columns",columns);
		map.put("find",find);
		
		PageDto page = new PageDto(pageNo,10,notice_mapper.getSearchCount(map));
		
		int startNo = page.getStartNo();
		int endNo = page.getEndNo();
		List<Notice> list = notice_mapper.searchPageList(columns,find,startNo,endNo);
		//logger.info("[My]"+list);
		
		model.addAttribute("columns",columns);
		model.addAttribute("find",find);
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		
		return "admin/noticeList";
	}
	
	@RequestMapping("noticedetail.do")
	public String noticeDetail(int idx,@RequestParam(required=false, defaultValue = "1") int pageNo, Model model) {
		//????????? ?????????????????? ????????? ?????? x
		Notice detail = notice_mapper.selectOne(idx);
		
		model.addAttribute("detail", detail);
		model.addAttribute("pageNo", pageNo);
		
		
		return "admin/noticeDetail";
	}
	@PostMapping("noticeupdate.do")
	public String noticeUpdate(int idx,int pageNo,Model model) {
		Notice detail = notice_mapper.selectOne(idx);
		model.addAttribute("detail", detail);
		model.addAttribute("pageNo", pageNo);
		
		return "admin/noticeUpdate";
	}
	@PostMapping("noticeupdatesave.do")
	public String noticeUpdateSave(@RequestParam(required=false, defaultValue = "1") int pageNo,
//		Notice notice, RedirectAttributes rda){
		int idx, String title,String content, RedirectAttributes rda) {
//		notice_mapper.updateNotice(notice);
//		rda.addAttribute("idx", notice.getNotice_idx());
		notice_mapper.updateNotice(title,content,idx);
		rda.addAttribute("idx", idx);
		rda.addAttribute("pageNo", pageNo);
		rda.addFlashAttribute("message","?????? ?????????????????????.");
		return "redirect:noticedetail.do";
	}
	@GetMapping("noticeinsert.do")
	public String noticeInsert() {
		
		return "admin/noticeInsert";
	}
	
	@PostMapping("noticeinsert.do")
	public String noticeInsertSave(Notice vo, RedirectAttributes rda) {
		notice_mapper.insertNotice(vo);
		rda.addFlashAttribute("message", "??????????????? ?????????????????????.");
		
		return "redirect:noticelist.do";
	}
	
	
	@PostMapping("noticedelete.do")
	public String noticeDelete(int idx, int pageNo, RedirectAttributes rda) {
		notice_mapper.deleteNotice(idx);
		rda.addAttribute("pageNo", pageNo);
		rda.addFlashAttribute("message","?????? ?????????????????????.");
		return "redirect:noticelist.do";
	}
	

//?????? ??????
	@GetMapping("performinsert.do")
	public String performInsert(Model model) {
		List<Theater> list = theater_mapper.selectAll();
		model.addAttribute("list", list);
		return "admin/performInsert";
	}
	
	
	@PostMapping("performinsert.do")
	public String performInsertSave(Performance vo,RedirectAttributes rda){
		logger.info("[My]"+vo);
		try {
			service.fileSave(vo);
			rda.addFlashAttribute("message","????????? ?????????????????????.");
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} 
		return "redirect:performinsert.do";
	}

//1:1 ?????? ??????
	@RequestMapping("questionlist.do")
	public String questionList(@RequestParam(required=false, defaultValue = "1")
	int pageNo,Model model) {
		PageDto page = new PageDto(pageNo,10,question_mapper.getCount());
		
		Map<String,Integer> map = new HashMap<>();
		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		List<Question> list = question_mapper.getPageList(map);
		
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		
		return "admin/questionList";
	}
//???????????? ??????
	@RequestMapping("questionsearch.do")
	public String questionSearch(@RequestParam(required=false, defaultValue = "1")
			int pageNo,@RequestParam String columns,
			@RequestParam(value = "find") String[] finds,Model model) {
		String find = finds[0];
		if(columns.equals("status")) find=finds[1];
		logger.info("[My]"+columns);
		Map<String,String> map = new HashMap<>();
		map.put("columns",columns);
		map.put("find",find);
		
		PageDto page = new PageDto(pageNo,10,question_mapper.getSearchCount(map));
		
		int startNo = page.getStartNo();
		int endNo = page.getEndNo();
		List<Question> list = question_mapper.searchPageList(columns,find,startNo,endNo);
		logger.info("[My]"+list);
		
		model.addAttribute("columns",columns);
		model.addAttribute("find",find);
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		
		return "admin/questionList";
	}
//1:1 ?????? ??????	
	@GetMapping("questiondetail.do")
	public String questionDetail(int idx,@RequestParam(required=false, defaultValue = "1") int pageNo, Model model) {
		Question detail = question_mapper.selectOne(idx);
		List<Answer> answer = answer_mapper.selectAnswer(idx);
		model.addAttribute("detail", detail);
		model.addAttribute("answer", answer);
		model.addAttribute("pageNo", pageNo);
		return "admin/questionDetail";
	}
//1:1 ?????? ?????? ??????	
	@PostMapping("questiondetail.do")
	public String answerInsert(Answer vo,@RequestParam(required=false, defaultValue = "1") int pageNo, RedirectAttributes rda) {
		service.insertAnswer(vo);
		
		rda.addAttribute("idx", vo.getQuestion_idx());
		rda.addAttribute("pageNo", pageNo);
		rda.addFlashAttribute("message", "????????? ?????????????????????.");
		return "redirect:questiondetail.do";
	}
//?????? ????????? ??????
	@GetMapping("scheduleinsert.do")
	public String scheduleInsert(Model model) {
		List<Performance> perform = perform_mapper.selectScheduledPerform();
		model.addAttribute("perform", perform);
		return "admin/scheduleInsert";
	}
	@PostMapping("scheduleinsert.do")
	public String scheduleInsertSave(Schedules vo,RedirectAttributes rda) {
		schedule_mapper.insertSchedule(vo);
		rda.addFlashAttribute("message","?????? ???????????? ?????????????????????.");
		return "redirect:scheduleinsert.do";
	}
	
}