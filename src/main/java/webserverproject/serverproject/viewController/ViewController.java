package webserverproject.serverproject.viewController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

    @GetMapping("/join")
    public  String join(){
        return "/join";
    }

    @GetMapping("/login")
    public String login(){
        return "/login";
    }
}
