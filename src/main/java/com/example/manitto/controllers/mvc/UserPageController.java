package com.example.manitto.controllers.mvc;

import com.example.manitto.common.LoginSessionManager;
import com.example.manitto.dtos.Match;
import com.example.manitto.dtos.User;
import com.example.manitto.dtos.User.InfoDto;
import com.example.manitto.dtos.UserMatch;
import com.example.manitto.services.MatchService;
import com.example.manitto.services.UserMatchService;
import com.example.manitto.services.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by jonghyeon on 2023/01/21,
 * Package : com.example.manitto.controllers.mvc
 */
@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserPageController {
    private final LoginSessionManager loginSessionManager;
    private final UserMatchService userMatchService;
    private final MatchService matchService;
    private final UserService userService;

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
        try {
            User.InfoDto info = loginSessionManager.getLoginUserInfo();
            if (info == null) return loginPage();
            if (info.getIsAdmin()) return "admin";
            return "main";
        } catch (RuntimeException e) {
            return "index";
        }
    }

    @GetMapping("/match-list")
    public ModelAndView matchList() {
        ModelAndView mv = new ModelAndView();
        List<Match> dto = matchService.getMatchListActive();
        String match1 = dto.get(0).getId().toString();
        String match2 = dto.get(1).getId().toString();
        mv.addObject("match1", match1);
        mv.addObject("match2", match2);
        mv.setViewName("match-list");
        return mv;
    }

    @GetMapping("/match-detail/{matchId}")
    public ModelAndView matchDetail(HttpSession session, @PathVariable long matchId) {

        ModelAndView mv = new ModelAndView();
        User.InfoDto info = (InfoDto) session.getAttribute("info");

        List<UserMatch.ExtendedDto> extendedDto = userMatchService.getUserMatchByMatchId(matchId);
        UserMatch.ExtendedDto contributorInfo = extendedDto.get(0);
        UserMatch.ExtendedDto receiverInfo = extendedDto.get(1);
        mv.addObject("contributorInfo", contributorInfo);
        mv.addObject("receiverInfo", receiverInfo);
        mv.setViewName("match-detail");
        return mv;
    }

    @GetMapping("/pmrreg")
    public ModelAndView pmrregPage() {
        //waiting id 값
        List<Match> matchList = matchService.getMatchListWaiting();
        ModelAndView mv = new ModelAndView();
        mv.addObject("matchList", matchList);
        mv.setViewName("admin/pmrreg");
        return mv;
    }

    @RequestMapping("/userrev")
    public ModelAndView getAllUserLimits(@RequestParam(value="page", required=false, defaultValue="1") int page) {
        int totalboard = userService.getTotalUser();
        int limit = (page-1)*5;
        List<User.InfoDto> userList = userService.getAllUserLimits(limit);
        ModelAndView mv = new ModelAndView();
        mv.addObject("totalboard", totalboard);
        mv.addObject("list",userList);
        mv.setViewName("/userrev");
        return mv;
    }


}
