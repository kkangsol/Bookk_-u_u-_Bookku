package util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class DBUtil {

	private static EntityManagerFactory emf;

	static {
		// persistence.xml에서 정의한 "dbinfo"라는 persistence-unit을 이용해 팩토리 생성
		emf = Persistence.createEntityManagerFactory("dbinfo");
	}

	public static EntityManager getEntityManager() {
		return emf.createEntityManager();
	}

	public static void close() {
		if (emf != null) { 
			emf.close();
			emf = null;
		}
	}
}
