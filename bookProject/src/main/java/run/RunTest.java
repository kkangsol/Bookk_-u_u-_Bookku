package run;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.junit.Test;

import model.entity.Books;
import util.DBUtil;

public class RunTest {
	// select
	 @Test
	public void step01() {
		EntityManager em = DBUtil.getEntityManager();
		/*
		 * Object em.find(Emp01.class, 1) -> Object em.find(Object byte명, pk): pk 값으로
		 * select하는 기능 - pk 타입에 맞춰 검색 필수
		 */
		System.out.println(em.find(Books.class, 1));
		System.out.println(em.find(Books.class, 2));
		System.out.println(em.find(Books.class, 3));

		em.close();
		em = null;
	}

}
