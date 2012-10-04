package com.tanerdiler.aspectj.persistence;

public abstract class GenericEntity<T> {
	private Integer id;
	
	public void setId (Integer id) {
		this.id=id;
	}
	public Integer getId() {
		return id;
	}
	
	public void save () {
		System.out.println("Save Entity");
		Repository.put(this);
	}
}
