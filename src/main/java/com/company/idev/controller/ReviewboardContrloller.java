package com.company.idev.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.idev.dto.PageDto;
import com.company.idev.dto.Review_comment;
import com.company.idev.dto.Reviewboard;
import com.company.idev.mapper.ReviewBoardMapper;
import com.company.idev.mapper.Review_commentMapper;


@Controller
@RequestMapping("/community")
public class ReviewboardContrloller {
	private static final Logger logger =
			LoggerFactory.getLogger(ReviewboardContrloller.class);
	
	@Autowired
	ReviewBoardMapper mapper;
	
	@Autowired
	Review_commentMapper cmt_mapper;
	
	@RequestMapping("/list")
	public String list(@RequestParam(required = false , defaultValue = "1")int pageNo,
						Model model) {
		PageDto page = new PageDto(pageNo, 10, mapper.getCount());
		
		Map<String,Integer> map = new HashMap<>();
		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		List<Reviewboard> list  = mapper.getPageList(map);
		
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		
		return "community/list";
	}
	
	@GetMapping("/insert")
	public String insert(int pageNo,Model model) {
		model.addAttribute("page", pageNo);
		return "community/insert";
	}
	
	@PostMapping("/insert")
	public String save(Reviewboard dto){
		mapper.insert(dto);
		return "redirect:list";   //1페이지로 이동
	}
	
	@GetMapping("/detail")
	public String detail(int idx,int pageNo,Model model) {
		//조회수증가 먼저
		mapper.readCount(idx);
		Reviewboard bean = mapper.getOne(idx);		//sql실행
		model.addAttribute("bean", bean);
		model.addAttribute("page", pageNo);
		
		
		//댓글목록을 detail.jsp 에 출력해야 합니다.
		List<Review_comment> cmtlist = cmt_mapper.list(idx);
		model.addAttribute("cmtlist", cmtlist);
		return "community/detail";
	}
	
	@PostMapping("update")
	public String update(Reviewboard vo, int pageNo,Model model) {
		
		mapper.update(vo);
		
		model.addAttribute("idx", vo.getIdx());
		model.addAttribute("pageNo", pageNo);
		return "redirect:detail";
	}

	@GetMapping("delete")
	public String deleteFreeboard(int idx, int pageNo,Model model) {
		
		mapper.delete(idx);
		model.addAttribute("pageNo", pageNo);
		return "redirect:list";
	}
	
	// 여기서부터는 댓글 처리
	
	@Transactional
	@PostMapping("comment")
	public String comment_save(Review_comment dto,int pageNo,Model model) {
		//댓글 입력요소 값들 db에 저장 -> detail (글 상세보기)
		cmt_mapper.insert(dto);
		
		//mref값이 freeboard테이블의 idx입니다.
		cmt_mapper.commentCountUp(dto.getBd_idx());
		
		//idx 는 commenets 테이블의 시퀀스 값으로 지금 없는 상태입니다.
		model.addAttribute("idx", dto.getBd_idx());  //메인글의 idx값 전달
		model.addAttribute("pageNo", pageNo);
		return "redirect:detail";
	}
	@Transactional
	@GetMapping("comment")  //idx: 댓글 idx , mref:메인글 idx
	public String delete(int idx,int pageNo,int mref,Model model) {
		cmt_mapper.delete(idx);
		cmt_mapper.commentCountDown(mref);
		model.addAttribute("idx",mref );  //메인글의 idx값 전달
		model.addAttribute("pageNo", pageNo);
		return "redirect:detail";
}
}
