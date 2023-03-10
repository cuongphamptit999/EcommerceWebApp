package vn.ptit.controllers.admin.electronics;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import vn.ptit.models.electronics.Laptop;
import vn.ptit.models.electronics.Manufacturer;

@Controller
@RequestMapping("/admin/electronics")
public class AdminLaptopController {
	private RestTemplate rest = new RestTemplate();
	
	@GetMapping("/add-laptop")
	public String viewAddLaptop(ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		List<Manufacturer> manufacturers =
				Arrays.asList(rest.getForObject("http://localhost:6969/rest/api/manufacturer/find-all",Manufacturer[].class));
		model.addAttribute("manufacturers", manufacturers);
		Laptop laptop = new Laptop();
		model.addAttribute("laptop",laptop);
		return "admin/electronics/add_laptop";
	}
	
	@PostMapping("/add-laptop")
	public String addLaptop(@ModelAttribute("laptop") Laptop laptop, ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		rest.postForObject("http://localhost:6969/rest/api/electronics/laptop/insert", laptop, Laptop.class);
		List<Manufacturer> manufacturers =
				Arrays.asList(rest.getForObject("http://localhost:6969/rest/api/manufacturer/find-all",Manufacturer[].class));
		model.addAttribute("manufacturers", manufacturers);
		return "admin/electronics/add_laptop";
	}
	
	@GetMapping("/laptop")
	public String viewManageLaptop(ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		List<Laptop> laptops = Arrays
				.asList(rest.getForObject("http://localhost:6969/rest/api/electronics/find-by-category/" + "Laptop", Laptop[].class));
		System.out.println(laptops.size());
		model.addAttribute("laptops", laptops);
		return "admin/electronics/manage_laptop";
	}
	
	@GetMapping("/edit-laptop/{id}")
	public String viewEditLaptop(@PathVariable("id") int id, ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		List<Manufacturer> manufacturers =
				Arrays.asList(rest.getForObject("http://localhost:6969/rest/api/manufacturer/find-all",Manufacturer[].class));
		model.addAttribute("manufacturers", manufacturers);
		Laptop laptop = rest.getForObject("http://localhost:6969/rest/api/electronics/laptop/find-by-id/"+id, Laptop.class);
		model.addAttribute("laptop",laptop);
		return "admin/electronics/edit_laptop";
	}
	
	@PostMapping("/edit-laptop")
	public String updateLaptop(@ModelAttribute("laptop") Laptop laptop, ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		rest.postForObject("http://localhost:6969/rest/api/electronics/laptop/insert", laptop, Laptop.class);
		return "redirect:/admin/electronics/laptop";
	}
	
	@GetMapping("/delete-laptop/{id}")
	public String viewDeleteLaptop(@PathVariable("id") int id, ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		rest.getForObject("http://localhost:6969/rest/api/electronics/laptop/delete-by-id/"+id, Integer.class);
		return "redirect:/admin/electronics/laptop";
	}
}
