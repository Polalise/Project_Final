package com.ch.daitso.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.daitso.model.Product;
import com.ch.daitso.service.LikesService;
import com.ch.daitso.service.MemberService;
import com.ch.daitso.service.MypageService;
import com.ch.daitso.service.ProductService;

@Controller
public class TradeController {

	@Autowired
	private ProductService ps;

	@Autowired
	private MemberService ms;

	@Autowired
	private LikesService ls;

	@Autowired
	private MypageService mys;

//	n : 판매중
//	i : 배송중
//	y : 거래완료
	// 판매자 배송 완료
	// 2022 05 24 작동 확인
	@RequestMapping("sendProduct")
	public String sendProduct(int p_num, HttpSession session,Model model) {
		Product product = ps.select(p_num);
		product.setSel("i");
		int result = mys.changeStatus(product);
		model.addAttribute("result",result);
		return "/product/temporaryPage";
	}

	// 구매자 구매 확정
	@RequestMapping("confirmTrade")
	public String confirmTrade(int p_num, HttpSession session,Model model) {
		Product product = ps.select(p_num);
		product.setSel("y");
		int result = mys.changeStatus(product);
		model.addAttribute("result",result);
		return "/product/temporaryPage";
	}

}