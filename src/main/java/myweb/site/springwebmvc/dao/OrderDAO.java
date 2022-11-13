package myweb.site.springwebmvc.dao;

import java.util.List;

import myweb.site.springwebmvc.model.CartInfo;
import myweb.site.springwebmvc.model.OrderDetailInfo;
import myweb.site.springwebmvc.model.OrderInfo;
import myweb.site.springwebmvc.model.PaginationResult;

public interface OrderDAO {
	public void saveOrder(CartInfo cartInfo);

	public PaginationResult<OrderInfo> listOrderInfo(int page, int maxResult, int maxNavigationPage);

	public OrderInfo getOrderInfo(String orderId);

	public List<OrderDetailInfo> listOrderDetailInfos(String orderId);
}
