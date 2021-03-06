package com.ch.daitso.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.daitso.model.Member;
import com.ch.daitso.model.Product;
import com.ch.daitso.model.Reply;
import com.ch.daitso.service.MemberService;
import com.ch.daitso.service.MypageService;
import com.ch.daitso.service.ProductService;
import com.ch.daitso.service.ReplyService;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService rs;

	@Autowired
	private MemberService ms;

	@Autowired
	private ProductService ps;
	
	@Autowired
	private MypageService mys;

	@RequestMapping("replyWriteForm2")
	public String replyWriteForm(int p_num, String pageNum, Model model) {
	// 입력에 필요한 value : p_num
	//	rno 초기값 설정을 여기서 설정함 ( 이전은 jsp에서 0으로 설정됨 )
		int rno = 0;
		model.addAttribute("rno",rno);
		model.addAttribute("p_num", p_num);
		model.addAttribute("pageNum", pageNum);
		Product product = ps.select(p_num);
		model.addAttribute("product",product);
		System.out.println("fir rno : " + rno);
		System.out.println("fir product : " + product);
		return "admin/review/replyWriteForm";
	}

	@RequestMapping("replyWrite2")
	public String replyWrite(Reply board, Model model, HttpSession session, int rating, Member member, Product product,
			String pageNum, int rno, int p_num) throws IOException {
		String id = (String)session.getAttribute("id");
		Member member2 = ms.selectId(id);
		int result = 0;
		// num을 자동을 1씩 증가
		int number = rs.getMaxNum();
		board.setRno(number);
		// 별점에 대한 등급영향 grage = rating
		Product product2 = ps.select2(p_num); // 판매자 아이디 정보가져와
		// 가져온 정보로 seller에 아이디 입력
		String seller = product2.getId();
		board.setSeller(seller);
		ms.star(board.getRating(), product2.getId());
		// 일단 판매자 게시물(num)에 대하여 인서트를 한다
		result = rs.insert(board);
		if (result > 0) mys.reviewInsertSuccess(p_num);
		model.addAttribute("product", product);
		model.addAttribute("board", board);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		System.out.println("product re : "+product);
		System.out.println("board rd : " +board);
		return "admin/review/replyWrite";
	}

	@RequestMapping("replyList2")
	public String replyList(int p_num, String pageNum, Model model, Product product, Member member) {
		/* NoticeBoard board = ns.select(num); */
		Product product2 = ps.select2(product.getP_num()); // 판매자 아이디 정보가져와
		member.setId(product2.getId()); // 저장
		// 하나의 게시물에 여러 리뷰
		List<Reply> rbdList = rs.list(member.getId()); // 판매자에 대한 리뷰라 판매자 아이디
		// model.addAttribute("product", product);
		model.addAttribute("rbdList", rbdList);
		model.addAttribute("p_num",p_num);
		return "admin/review/replyList";
	}

	@RequestMapping("rDelete2")
	public String rDelete(Reply rb) {
		rs.delete(rb);
		return "redirect:replyList2.do?num=" + rb.getP_num();
	}

	// 리뷰 수정
	@RequestMapping("rUpdate2")
	public String rUpdate(Reply rb) {
		rs.update(rb);
		return "redirect:replyList2.do?num=" + rb.getP_num();
	}

}
