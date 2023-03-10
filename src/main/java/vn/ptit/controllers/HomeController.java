package vn.ptit.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.ibm.icu.text.SimpleDateFormat;

import vn.ptit.models.book.Author;
import vn.ptit.models.book.BookItem;
import vn.ptit.models.clothes.ClothesItem;
import vn.ptit.models.customer.Customer;
import vn.ptit.models.customer.CustomerMember;
import vn.ptit.models.electronics.ElectronicsItem;
import vn.ptit.models.employee.Employee;
import vn.ptit.models.employee.TotalVisit;
import vn.ptit.models.shoes.ShoesItem;

@Controller
public class HomeController {
	private RestTemplate rest = new RestTemplate();
	@Autowired
	PasswordEncoder passwordEncoder;

	@GetMapping("/")
	public String home(ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		List<BookItem> bookItems = Arrays.asList(
				rest.getForObject("http://localhost:6969/rest/api/book-item/get-item-in-home", BookItem[].class));

		List<ElectronicsItem> electronicsItems = Arrays.asList(rest.getForObject(
				"http://localhost:6969/rest/api/electronics-item/get-item-in-home", ElectronicsItem[].class));

		List<ShoesItem> shoesItems = Arrays.asList(
				rest.getForObject("http://localhost:6969/rest/api/shoes-item/get-8-shoes-item", ShoesItem[].class));

		List<ClothesItem> clothesItems = Arrays.asList(rest
				.getForObject("http://localhost:6969/rest/api/clothes-item/get-8-clothes-item", ClothesItem[].class));

		model.addAttribute("bookItems", bookItems);
		model.addAttribute("electronicsItems", electronicsItems);
		model.addAttribute("shoesItems", shoesItems);
		model.addAttribute("clothesItems", clothesItems);

		rest.postForObject("http://localhost:6969/rest/api/statistic/add-total-visit",
				new TotalVisit(req.getRemoteAddr(), new Date()), TotalVisit.class);
		return "home";
	}

	@GetMapping(value = "/search-name")
	public String viewSearch(@RequestParam("key") String name, ModelMap model, HttpServletRequest req,
			HttpServletResponse resp) {
		List<BookItem> bookItems = Arrays.asList(
				rest.getForObject("http://localhost:6969/rest/api/book-item/find-by-name/" + name, BookItem[].class));
		List<ElectronicsItem> electronicsItems = Arrays.asList(rest.getForObject(
				"http://localhost:6969/rest/api/electronics-item/find-by-name/" + name, ElectronicsItem[].class));
		List<ShoesItem> shoesItems = Arrays.asList(
				rest.getForObject("http://localhost:6969/rest/api/shoes-item/find-by-name/" + name, ShoesItem[].class));
		List<ClothesItem> clothesItems = Arrays.asList(rest
				.getForObject("http://localhost:6969/rest/api/clothes-item/find-by-name/" + name, ClothesItem[].class));
		model.addAttribute("bookItems", bookItems);
		model.addAttribute("electronicsItems", electronicsItems);
		model.addAttribute("shoesItems", shoesItems);
		model.addAttribute("clothesItems", clothesItems);
		return "view_search";
	}

	@GetMapping("/login-employee")
	public String viewLoginEmployee() {

		return "admin/login_employee";
	}

	@PostMapping("/perform-login")
	public String loginEmpSloyee(ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		Employee employee = rest.getForObject("http://localhost:6969/rest/api/employee/get/" + username,
				Employee.class);
		boolean flag = passwordEncoder.matches(password, employee.getPassword());
		if (flag) {
			UserDetails userDetail = buildUser(employee);
			UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail,
					null, userDetail.getAuthorities());
			authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(req));
			SecurityContextHolder.getContext().setAuthentication(authentication);
			return "redirect:/admin/manage";
		}
		
		return "redirect:/login-employee";
	}

	private UserDetails buildUser(Employee employee) {
		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(employee.getRole()));

		UserDetails userDetail = new User(employee.getUsername(), employee.getPassword(), enabled, accountNonExpired,
				credentialsNonExpired, accountNonLocked, authorities);

		return userDetail;
	}

}
