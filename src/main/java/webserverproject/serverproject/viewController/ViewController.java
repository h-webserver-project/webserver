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

    @GetMapping("/")
    public String main(){
        return "/main";
    }

    @GetMapping("/user")
    public String mainLogin(){
        return "/user";
    }

    @GetMapping("/admin")
    public String adminLogin(){
        return "/admin";
    }

    @GetMapping("/movieCreate")
    public String movieCreate(){return "/movieCreate";}

    @GetMapping("/moviedetail")
    public String movieDetail(){
        return "/moviedetail";
    }
    @GetMapping("/user/moviesearch")
    public String usermovieSearch(){
        return "usersearch";
    }

    @GetMapping("/admin/moviesearch")
    public String adminmovieSearch(){
        return "adminsearch";
    }
    @GetMapping("/moviesearch")
    public String movieSearch(){
        return "moviesearch";
    }

    @GetMapping("/myinfo")
    public String myInfo(){
        return "myinfo";
    }
}

