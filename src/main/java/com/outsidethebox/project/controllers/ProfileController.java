package com.outsidethebox.project.controllers;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.outsidethebox.project.models.Order;
import com.outsidethebox.project.models.Post;
import com.outsidethebox.project.models.User;
import com.outsidethebox.project.services.OrderService;
import com.outsidethebox.project.services.UserService;
import com.outsidethebox.project.utils.ModelUtils;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {

	@Autowired
	private UserService serv;
	@Autowired
	private OrderService os;

	@GetMapping("/perfil")
	public String perfil(Model model, HttpSession session) {
		User userTemp = (User) session.getAttribute("userInSession");
		if (userTemp == null) {
			return "redirect:/iniciar-sesion";
		}

		User user = serv.findById(userTemp.getId());
		if (user.isSupplier()) {
			ModelUtils.setupModel(user, model, "Mi Perfil", "/private/perfil-laburante-privado.jsp");
			List<Order> pendingOrders = os.getOrdersBySupplierAndStatus(user, "0").stream()
					.sorted((p1, p2) -> p2.getCreatedAt().compareTo(p1.getCreatedAt())).collect(Collectors.toList());
			List<Order> completedOrders = os.getOrdersBySupplierAndStatus(user, "1").stream()
					.sorted((p1, p2) -> p2.getCreatedAt().compareTo(p1.getCreatedAt())).collect(Collectors.toList());
			List<Post> sortedPosts = user.getSupplierPost().stream()
					.sorted((p1, p2) -> p2.getCreatedAt().compareTo(p1.getCreatedAt())).collect(Collectors.toList());
			model.addAttribute("pendingOrders", pendingOrders);
			model.addAttribute("completedOrders", completedOrders);
			model.addAttribute("posts", sortedPosts);
		} else {
			return "redirect:/";
		}
		return "index.jsp";
	}
}
