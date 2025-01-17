package com.outsidethebox.project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.outsidethebox.project.models.Category;
import com.outsidethebox.project.models.Order;
import com.outsidethebox.project.models.Post;
import com.outsidethebox.project.models.SubCategory;
import com.outsidethebox.project.models.User;
import com.outsidethebox.project.services.OrderService;
import com.outsidethebox.project.services.PostService;
import com.outsidethebox.project.services.UserService;
import com.outsidethebox.project.utils.ModelUtils;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class PostController {

	@Autowired
	private PostService postService;

	@Autowired
	private UserService userService;

	@GetMapping("/nueva-publicacion")
	public String createPost(HttpSession session, Model model, @ModelAttribute("post") Post post) {
		User userTemp = (User) session.getAttribute("userInSession");
		if (userTemp == null) {
			return "redirect:/iniciar-sesion";
		}
		User user = userService.findById(userTemp.getId());
		if (!user.isSupplier()) { // si no es supplier no puede crear publicaciones
			return "redirect:/";
		}

		model.addAttribute("categoryValues", Category.values());
		model.addAttribute("subCategoryValues", SubCategory.values());

		ModelUtils.setupModel(user, model, "Crear publicación", "/private/crearpost.jsp");

		return "index.jsp";
	}

	@PostMapping("/publicacion/create")
	public String save(@Valid @ModelAttribute("post") Post post, BindingResult result, Model model,
			HttpSession session) {
		User userTemp = (User) session.getAttribute("userInSession");
		if (userTemp == null) { // sin sesion no puede ingresar
			return "redirect:/iniciar-sesion";
		}
		User user = userService.findById(userTemp.getId());

		if (result.hasErrors() || postService.isDuplicateTitle(post.getTitle())) {
			model.addAttribute("categoryValues", Category.values());
			model.addAttribute("subCategoryValues", SubCategory.values());
			if (postService.isDuplicateTitle(post.getTitle())) {
				result.rejectValue("title", "Duplicate", "El título ya existe.");
			}
			ModelUtils.setupModel(user, model, "Crear publicación", "/private/crearpost.jsp");
			return "index.jsp";
		}
		post.setSupplier(user);
		postService.save(post);
		return "redirect:/perfil";

	}

	 @GetMapping("/{id}/edit")
	    public String updateForm(@PathVariable Long id, Model model, HttpSession session) {
	        User userTemp = (User) session.getAttribute("userInSession");
	        if (userTemp == null) {
	            return "redirect:/iniciar-sesion";
	        }
	        User user = userService.findById(userTemp.getId());
	        if (!user.isSupplier()) {
	            return "redirect:/";
	        }
	        Post post = postService.findById(id);
	        if (post != null) {
	            model.addAttribute("post", post);
	            model.addAttribute("categoryValues", Category.values());
	            model.addAttribute("subCategoryValues", SubCategory.values());

	            ModelUtils.setupModel(user, model, "Editar publicación", "/private/editar-post.jsp");

	            return "index.jsp";
	        } else {
	            return "redirect:/"; // Redirigir a la lista de posts si no se encuentra el post
	        }
	    }

	// Método para guardar los cambios en la publicación
	 @PostMapping("/{id}/update")
	 public String update(@PathVariable Long id, @Valid @ModelAttribute("post") Post post, BindingResult result, Model model,
	                      HttpSession session) {
	     User userTemp = (User) session.getAttribute("userInSession");
	     if (userTemp == null) { // sin sesion no puede ingresar
	         return "redirect:/iniciar-sesion";
	     }
	     User user = userService.findById(userTemp.getId());

	     if (result.hasErrors() || postService.isDuplicateTitle(post.getTitle())) {
	         model.addAttribute("categoryValues", Category.values());
	         model.addAttribute("subCategoryValues", SubCategory.values());
	         if (postService.isDuplicateTitle(post.getTitle())) {
	             result.rejectValue("title", "Duplicate", "El título ya existe.");
	         }
	         ModelUtils.setupModel(user, model, "Editar publicación", "/private/editar-post.jsp");
	         return "index.jsp";
	     }

	     // Cargar la entidad existente desde la base de datos
	     Post existingPost = postService.findById(id);
	     if (existingPost == null) {
	         return "redirect:/";
	     }

	     // Mantener la referencia a la colección de reviews
	     post.setReviews(existingPost.getReviews());
	     post.setSupplier(user);

	     // Actualizar otras propiedades según sea necesario
	     existingPost.setTitle(post.getTitle());
	     existingPost.setCategory(post.getCategory());
	     existingPost.setSubCategory(post.getSubCategory());
	     existingPost.setDescription(post.getDescription());
	     existingPost.setPrice(post.getPrice());

	     // Guardar la entidad actualizada
	     postService.save(existingPost);

	     return "redirect:/perfil";
	 }

	
	@DeleteMapping("/{id}")
	public String delete(@PathVariable Long id) {
		postService.deleteById(id);
		return "redirect:/posts"; // Redirigir a la lista de posts después de eliminar
	}

	@GetMapping("/publicaciones/{postId}")
	public String supplierPost(@PathVariable("postId") Long postId, HttpSession session, Model model) {
		User userTemp = (User) session.getAttribute("userInSession");
		if (userTemp == null) {
			return "redirect:/iniciar-sesion";
		}

		User user = userService.findById(userTemp.getId());
		Post post = postService.findById(postId);
		List<Order> orders = post.getOrdersPost();
		Integer averageRating = postService.calculateAverageRatingByPost(post);
		ModelUtils.setupModel(user, model, post.getTitle(), "/private/publicacion-supplier.jsp");

		model.addAttribute("post", post);
		model.addAttribute("orders", orders);
		model.addAttribute("rating", "Puntuacion" + averageRating);

		return "index.jsp";
	}
}
