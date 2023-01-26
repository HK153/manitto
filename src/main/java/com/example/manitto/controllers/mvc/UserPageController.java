package com.example.manitto.controllers.mvc;

import com.example.manitto.common.LoginSessionManager;
import com.example.manitto.dtos.Match;
import com.example.manitto.dtos.User;
import com.example.manitto.dtos.User.InfoDto;
import com.example.manitto.dtos.UserMatch.ExtendedDto;
import com.example.manitto.services.MatchService;
import com.example.manitto.services.UserMatchService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by jonghyeon on 2023/01/21,
 * Package : com.example.manitto.controllers.mvc
 */
@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserPageController {
    private final LoginSessionManager loginSessionManager;
    private final MatchService matchService;
    private final UserMatchService userMatchService;
    
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    @GetMapping("/main")
    public String mainPage() {
        User.InfoDto info = loginSessionManager.getLoginUserInfo();
        if (info == null) return loginPage();
        if (info.getIsAdmin()) return "admin";
        if (!info.getAwareRole()) return "role-check";
        return "main";
    }


    
    @GetMapping("/match-list")
    public ModelAndView matchList() {
    		ModelAndView mv = new ModelAndView();
    		List<Match> dto = matchService.getMatchListActive();
    		String match1 = dto.get(0).getId().toString();
    		String match2 = dto.get(1).getId().toString();
    		mv.addObject("match1",match1);
    		mv.addObject("match2",match2);
        mv.setViewName("match-list");
    		return mv;
    }
    
    @GetMapping("/match-detail1")
    public ModelAndView matchDetail1(HttpSession session) {
    		ModelAndView mv = new ModelAndView();
    		User.InfoDto info = (InfoDto) session.getAttribute("info");
    		List<Match> dto = matchService.getMatchListActive();
    		String match1 = dto.get(0).getId().toString();
//    		ExtendedDto userMatch = 
//    				userMatchService.getUserMatchExtendedByUserIdAndMatchId(info.getId(), Long.parseLong(match1)).get();
    		
			/*
			 * long id = info.getId(); userMatchService. String matchId = "";
			 * request.setAttribute("matchId",matchId);
			 */
    		mv.addObject("userId", info.getId());
    		mv.addObject("match1",match1);
    		//mv.addObject("userMatch",userMatch);
    		
    		
    		mv.setViewName("match-detail1");
        return mv;
    }
    @GetMapping("/match-detail2")
    public ModelAndView matchDetail2(HttpSession session) {
	    	ModelAndView mv = new ModelAndView();
	    	User.InfoDto info = (InfoDto) session.getAttribute("info");
	    	List<Match> dto = matchService.getMatchListActive();
	    	String match2 = dto.get(1).getId().toString();
	    ExtendedDto userMatch = 
	    			userMatchService.getUserMatchExtendedByUserIdAndMatchId(info.getId(), Long.parseLong(match2)).get();

	    	/*
	    	 * long id = info.getId(); userMatchService. String matchId = "";
	    	 * request.setAttribute("matchId",matchId);
	    	 */
	    	mv.addObject("userId", info.getId());
	    	mv.addObject("match2",match2);
	    	//mv.addObject("userMatch",userMatch);
	    	mv.setViewName("match-detail2");
	    	return mv;
    }
    
    @GetMapping("/pmrreg")
    public String pmrregPage() {
        return "pmrreg";
    }
    
    
}
