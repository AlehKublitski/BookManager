package net.proselyte.partmanager.controller;

import net.proselyte.partmanager.model.Part;
import net.proselyte.partmanager.service.PartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PartController {
    private PartService partService;

    @Autowired(required = true)
    @Qualifier(value = "partService")
    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @RequestMapping(value = "parts", method = RequestMethod.GET)
    public String listBooks(Model model){
        if(this.partService.currentList().size() == 0) this.partService.list();
        model.addAttribute("fullList", this.partService.getFullList());
        model.addAttribute("listAll", this.partService.currentList());
        model.addAttribute("part", new Part());
        model.addAttribute("listParts", this.partService.listParts());
        model.addAttribute("countComputers", this.partService.countOfComputer());
        return "parts";
    }

    @RequestMapping(value = "redirect")
    public String initialize() {
        this.partService.list();
        this.partService.redirectFrom();
        return "redirect:/parts";
    }

    @RequestMapping(value = "/parts/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("part") Part part){
        if(part.getId() == 0){
            this.partService.addPart(part);
        }else {
            this.partService.updatePart(part);
        }
        return "redirect:/redirect";
    }

    @RequestMapping(value = "/parts/search", method = RequestMethod.POST)
    public String getBookByName(@ModelAttribute("part") Part part, Model model) {
        model.addAttribute("part", partService.getPartByName(part.getName()));
        return "search";
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id){
        this.partService.removeBook(id);
        return "redirect:/redirect";
    }

    @RequestMapping("decrement/{id}")
    public String decrementPart(@PathVariable("id") int id){
        Part part = this.partService.getPartById(id);
        if((part.getNumber() - 1) >= 0) {
            part.setNumber(part.getNumber() - 1);
            this.partService.updatePart(part);
        }
        return "redirect:/redirect";
    }

    @RequestMapping("increment/{id}")
    public String incrementPart(@PathVariable("id") int id){
        Part part = this.partService.getPartById(id);
        part.setNumber(part.getNumber() + 1);
        this.partService.updatePart(part);
        return "redirect:/redirect";
    }

    @RequestMapping("next")
    public String nextList() {
        return "redirect:/parts";
    }

    @RequestMapping("previous")
    public String previousList() {
        this.partService.listPrevious();
        return "redirect:/parts";
    }

    @RequestMapping(value = "/parts/selectNeeded", method = RequestMethod.GET)
    public String selectNeeded(Model model) {
        this.partService.selectNeeded();
        return "redirect:/parts";
    }
    @RequestMapping(value = "/parts/selectNoNeeded", method = RequestMethod.GET)
    public String selectNoNeeded(Model model) {
        this.partService.selectNoNeeded();
        return "redirect:/parts";
    }

}
