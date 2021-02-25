package nl.tilburg.HelloWorld.controller;

import nl.tilburg.HelloWorld.model.Greeter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GreetingsController {

    @GetMapping("/")
    protected String defaultPage(Model model) {
        Greeter greeter = new Greeter("Say hello to the world!");
        model.addAttribute("greeting", greeter);
        return "defaultPage";
    }

}
