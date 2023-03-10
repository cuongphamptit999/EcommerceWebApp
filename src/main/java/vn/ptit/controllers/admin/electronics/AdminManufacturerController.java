package vn.ptit.controllers.admin.electronics;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import vn.ptit.models.electronics.Laptop;
import vn.ptit.models.electronics.Manufacturer;

@Controller
@RequestMapping("/admin")
public class AdminManufacturerController {
	private RestTemplate rest = new RestTemplate();
	
	@GetMapping("/add-manufacturer")
	public String viewAddManufacturer(ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		model.addAttribute("manufacturer", new Manufacturer());
		return "admin/electronics/add_manufacturer";
	}
	
	@PostMapping("/add-manufacturer")
	public String addManufacturer(@ModelAttribute("manufacturer") Manufacturer manufacturer, ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		rest.postForObject("http://localhost:6969/rest/api/manufacturer/insert", manufacturer, Manufacturer.class);
		return "admin/electronics/add_manufacturer";
	}
}
