package com.tanerdiler.aspectj.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.swing.text.html.parser.Entity;

public class Repository {
	private static final Map<Class<?>, Map<Integer, GenericEntity>> entities = new HashMap<Class<?>, Map<Integer,GenericEntity>>();
	
	public static final void put (GenericEntity entity) {
		Map<Integer, GenericEntity> models = entities.get(entity.getClass());
		if (models == null) {
			models = new HashMap();
			entities.put(entity.getClass(), models);
		}
		models.put(entity.getId(), entity);
	}
	
	public static final GenericEntity get (Class clazz, Integer id) {
		Map<Integer, GenericEntity> models = entities.get(clazz);
		if (models == null) {
			return null;
		}
		return models.get(id);
	}
}
