
package com.phonemarket.util;

import java.util.List;

public class PageValue<T> {

	private List<T> list;//当前页的所有数据
	private Integer currentPage;//当前的页码
	private Integer totalCount;//总条数
	private Integer totalPage;//总页数
	private Integer pageSize=10;//每页的数据条数
	public PageValue() {
		super();
	}
	public PageValue(List<T> list, Integer currentPage, Integer totalCount,
			Integer totalPage, Integer pageSize) {
		super();
		this.list = list;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
		this.pageSize = pageSize;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
}
