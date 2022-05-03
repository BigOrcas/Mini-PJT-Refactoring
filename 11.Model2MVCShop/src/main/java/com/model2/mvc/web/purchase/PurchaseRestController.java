package com.model2.mvc.web.purchase;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;

import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;


@RestController
@RequestMapping("/purchase/*")






public class PurchaseRestController {
	
	/// Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	


	public PurchaseRestController() {
		System.out.println(this.getClass());
	}
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping( value="json/addPurchase", method=RequestMethod.POST )

	public Purchase addPurchase(@RequestBody Purchase purchase ) throws Exception {


		
		
		
		productService.getProduct(purchase.getPurchaseProd().getProdNo());
		
		
		 System.out.println(purchase);
		userService.getUser(purchase.getBuyer().getUserId());
		User user = userService.getUser(purchase.getBuyer().getUserId());
		Product product = productService.getProduct(purchase.getPurchaseProd().getProdNo());
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		
		
		purchaseService.addPurchase(purchase);
		
//		Map map  = new HashMap() ;
//		 
//		 map.put("purchase", purchase); 
		
		 System.out.println(purchase);
		 
		 return  purchase;
	
		 
	}
	@RequestMapping( value="json/getPurchase/{tranNo}", method=RequestMethod.GET )
	public Purchase getPurchase( @PathVariable int tranNo ) throws Exception{
		
	
		return purchaseService.getPurchase(tranNo);
		
	}
	
	@RequestMapping( value="json/updatePurchase", method=RequestMethod.POST )
	public Purchase updatePurchase(  @RequestBody Purchase purchase  ) throws Exception{
		
	
		
		purchaseService.updatePurchase(purchase);
		
	
		return purchaseService.getPurchase(purchase.getTranNo());
		
	}
	@RequestMapping( value="json/listPurchase/{buyerId}", method=RequestMethod.POST )
	public Map  listPurchase(  @RequestBody Search search, @PathVariable String buyerId ) throws Exception{
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		
		search.setPageSize(pageSize);
		
	
		
		Map<String,Object> map = purchaseService.getPurchaseList(search, buyerId);
		
		//List<Object> list = (List<Object>)map.get("list");
		
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),pageUnit , pageSize);
		System.out.println(resultPage);
		
		
		User user = userService.getUser(buyerId);
		Map map1 = new HashMap();
		map1.put("search", search);
		map1.put("resultPage", resultPage);
		map1.put("list", map.get("list"));
		map1.put("user", user);
		
		
		System.out.println(map1);
		return  map1;
		
	}
	@RequestMapping(value="json/listSale/{buyerId}")
	public Map listSales( @RequestBody Search search,@PathVariable String buyerId) throws Exception{
		
		
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		// Business logic ¼öÇà
		Map<String,Object> map = purchaseService.getPurchaseList(search, buyerId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		User user = userService.getUser(buyerId);
		
		Map map1 = new HashMap();
		map1.put("search", search);
		map1.put("resultPage", resultPage);
		map1.put("list", map.get("list"));
		map1.put("user", user);
		
		
		return map1;
	}
	@RequestMapping(value = "json/updateTranCode", method = RequestMethod.POST)
	public Purchase updateTranCode(@RequestBody Purchase purchase) throws Exception {

		
		
		// Business Logic
		Purchase purchase1=purchaseService.getPurchase(purchase.getTranNo());
		System.out.println(purchase1.getTranCode());
		
		if(purchase1.getTranCode().equals("100")) {
			purchase1.setTranCode("200");
		}else if(purchase1.getTranCode().equals("200")) {
			purchase1.setTranCode("300");
		}
		
		System.out.println(purchase1.getTranCode());

		
		purchaseService.updateTranCode(purchase1);


		
	
		return purchaseService.getPurchase(purchase1.getTranNo());
	}
	
	
	
	

}
