package com.ch.daitso.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.daitso.model.NoticeBoard;
import com.ch.daitso.model.Reply;
import com.ch.daitso.service.NoticeService;
import com.ch.daitso.service.ReplyService;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService rs;
	
	@Autowired
	private NoticeService ns;
	
	@RequestMapping("replyWriteForm")
	public String replyWriteForm(int rno,int num,String pageNum,Model model) {
		   model.addAttribute("num",num);
		   model.addAttribute("rno",rno);
		   model.addAttribute("pageNum",pageNum);
		return "admin/review/replyWriteForm";
	}
	@RequestMapping("replyWrite")
	public String replyWrite(Reply board, Model model, HttpSession session
			,String pageNum,int rno,int num) throws IOException {
		int result = 0;
		// num을 자동을 1씩 증가
	 	    int number = rs.getMaxNum();		
			board.setRno(number);
			result = rs.insert(board);
			
		model.addAttribute("board", board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum",pageNum);
		return "admin/review/replyWrite";
	}
	@RequestMapping("replyList")
	   public String replyList(int num,String pageNum,Model model) {
		NoticeBoard board = ns.select(num);
		//하나의 게시물에 여러 댓글
		List<Reply> rbdList = rs.list(num);
		model.addAttribute("board", board);
		model.addAttribute("rbdList", rbdList);
		  
		   return "admin/review/replyList";
	   }
	@RequestMapping("rDelete")
	public String rDelete(Reply rb) {
		rs.delete(rb);
		return "redirect:replyList.do?num="+rb.getNum();
	}
	//댓글 수정
		@RequestMapping("rUpdate")
		public String rUpdate(Reply rb) {
			rs.update(rb);
			return "redirect:replyList.do?num="+rb.getNum();
		}
	
}