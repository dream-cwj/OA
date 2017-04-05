package org.exnon.util;

import java.util.List;

/**
 * 分页辅助类
 * 
 * @author 陈文健
 * 
 */
public class Page<T> {

	private int current = 1; // 当前页

	private int pageSize = 1; // 每页显示记录数

	private int count = 1; // 总记录条数

	private int total = 1; // 总页数

	private List<T> data; // 当前页数据

	public int getCurrent() {
		return current;
	}

	public void setCurrent(int current) {
		this.current = current > 0 ? current : 1;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize > 0 ? pageSize : 1;
	}

	public int getCount() {
		return count;
	}

	/**
	 * 自动统计总页数
	 * 
	 * @param count
	 *            总记录数
	 */
	public void setCount(int count) {
		this.count = count > 0 ? count : 1;
		int total = (int) Math.ceil(this.count * 1d / this.pageSize);
		this.total = total > 0 ? total : 1;
	}

	public int getTotal() {
		return total;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

}
