package myweb.site.springwebmvc.dao;

import myweb.site.springwebmvc.entity.Product;
import myweb.site.springwebmvc.model.PaginationResult;
import myweb.site.springwebmvc.model.ProductInfo;

public interface ProductDAO {
	public Product findProduct(String code);

	public ProductInfo findProductInfo(String code);

	public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage);

	public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage, String likeName);

	public void save(ProductInfo productInfo);
	
	public void delete(String code);
}
