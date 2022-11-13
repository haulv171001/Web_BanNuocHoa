package myweb.site.springwebmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import myweb.site.springwebmvc.dao.AccountDAO;
import myweb.site.springwebmvc.dao.OrderDAO;
import myweb.site.springwebmvc.dao.ProductDAO;
import myweb.site.springwebmvc.model.AccountInfo;
import myweb.site.springwebmvc.model.OrderDetailInfo;
import myweb.site.springwebmvc.model.OrderInfo;
import myweb.site.springwebmvc.model.PaginationResult;
import myweb.site.springwebmvc.model.ProductInfo;
import myweb.site.springwebmvc.validator.ProductInfoValidator;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@Transactional
@EnableWebMvc
public class AdminController {
	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private ProductInfoValidator productInfoValidator;
	
	//Rêggister
		@Autowired
		private AccountDAO accountDAO;

	//	
	
	// Configurated In ApplicationContextConfig.
	// Đã cấu hình trong ApplicationContextConfig
	@Autowired
	private ResourceBundleMessageSource messageSource;

	



	//H
	@InitBinder
	public void myInitBinder(WebDataBinder dataBinder) {
		Object target = dataBinder.getTarget();
		if (target == null) {
			return;
		}
		System.out.println("Target=" + target);

		if (target.getClass() == ProductInfo.class) {
			dataBinder.setValidator(productInfoValidator);
			// For upload Image.
			// Sử dụng cho upload Image.
			dataBinder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
		}
	}
//Danh
	// GET: Show Login Page
	// GET: Hiển thị trang login
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String login(Model model) {

		return "login";
	}
//Tong
	@RequestMapping(value = { "/accountInfo" }, method = RequestMethod.GET)
	public String accountInfo(Model model) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("userDetails", userDetails);
		return "accountInfo";
	}
//Danh
	@RequestMapping(value = { "/orderList" }, method = RequestMethod.GET)
	public String orderList(Model model, //
			@RequestParam(value = "page", defaultValue = "1") String pageStr) {
		int page = 1;
		try {
			page = Integer.parseInt(pageStr);
		} catch (Exception e) {
		}
		final int MAX_RESULT = 5;
		final int MAX_NAVIGATION_PAGE = 10;

		PaginationResult<OrderInfo> paginationResult //
				= orderDAO.listOrderInfo(page, MAX_RESULT, MAX_NAVIGATION_PAGE);

		model.addAttribute("paginationResult", paginationResult);
		return "orderList";
	}

//	Danh
	// GET: Show product.
	// GET: Hiển thị product
	@RequestMapping(value = { "/product" }, method = RequestMethod.GET)
	public String product(Model model, @RequestParam(value = "code", defaultValue = "") String code) {
		ProductInfo productInfo = null;

		if (code != null && code.length() > 0) {
			productInfo = productDAO.findProductInfo(code);
		}
		if (productInfo == null) {
			productInfo = new ProductInfo();
			productInfo.setNewProduct(true);
		}
		model.addAttribute("productForm", productInfo);
		return "product";
	}

//	Danh
	
//	Product detail
	

	@RequestMapping(value = { "/productDetail" }, method = RequestMethod.GET)
	public String productDetail(Model model, @RequestParam(value = "code", defaultValue = "") String code) {
		ProductInfo productInfo = null;

		if (code != null && code.length() > 0) {
			productInfo = productDAO.findProductInfo(code);
		}
		if (productInfo == null) {
			productInfo = new ProductInfo();
			productInfo.setNewProduct(true);
		}
		model.addAttribute("productInfo", productInfo);
		productInfo.getFileData();
		return "productDetail";
	}
	
	
	
//	-------------------------------
	//D
	// POST: Save product
	@RequestMapping(value = { "/product" }, method = RequestMethod.POST)
	// Avoid UnexpectedRollbackException (See more explanations)
	// Tránh ngoại lệ: UnexpectedRollbackException (Xem giải thích thêm).
	@Transactional(propagation = Propagation.NEVER)
	public String productSave(Model model, //
			@ModelAttribute("productForm") @Validated ProductInfo productInfo, //
			BindingResult result, //
			final RedirectAttributes redirectAttributes) {
		System.out.println("----------------Update---------------" + productInfo.getCode());
		
		if (result.hasErrors()) {
			return "product";
		}
		try {
			productDAO.save(productInfo);
		} catch (Exception e) {
			// Need: Propagation.NEVER?
			// Cần thiết: Propagation.NEVER?
			String message = e.getMessage();
			model.addAttribute("message", message);
			// Show product form.
			return "product";

		}
		return "redirect:/productList";
	}

	

	//D
//	DELETE
	@RequestMapping(value = "/product/remove", method = RequestMethod.POST)
	public String removeProduct(@RequestParam("productid") String productID) {
		productDAO.delete(productID);
	    return "redirect:/productList";
	}
	
	
//	
	
	
	
//Danh
	@RequestMapping(value = { "/order" }, method = RequestMethod.GET)
	public String orderView(Model model, @RequestParam("orderId") String orderId) {
		OrderInfo orderInfo = null;
		if (orderId != null) {
			orderInfo = this.orderDAO.getOrderInfo(orderId);
		}
		if (orderInfo == null) {
			return "redirect:/orderList";
		}
		List<OrderDetailInfo> details = this.orderDAO.listOrderDetailInfos(orderId);
		orderInfo.setDetails(details);

		model.addAttribute("orderInfo", orderInfo);

		return "order";
	}
	

	
//Tong

		//Tong		
		@RequestMapping(value = "/account/add" ,method = RequestMethod.POST)
		public String addAccount(Model  model,@RequestParam("nameAccount") String nameAccount,@RequestParam("passwordAccount") String password) {
			AccountInfo accountInfo = new AccountInfo(nameAccount, password);
			try {
				System.out.println("-----------------------");
				accountDAO.save(accountInfo);
			} catch(Exception e){
				System.out.println("-----------------------" + e.getMessage());
				 model.addAttribute("messag", "a");
			}
			model.addAttribute("message", "a");
		    return "redirect:/login";
		}
	
}
