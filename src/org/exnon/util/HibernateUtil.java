package org.exnon.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

public class HibernateUtil {

	private static Configuration cfg;

	private static SessionFactory factory;

	static {
		cfg = new Configuration().configure();
		factory = cfg.buildSessionFactory();
	}

	public static void ddl() {
		SchemaExport export = new SchemaExport(cfg);
		export.create(true, true);
	}

	public static Session getCurrentSession() {
		return factory.getCurrentSession();
	}

}
