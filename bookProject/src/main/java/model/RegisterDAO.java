package model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import model.entity.Books;
import util.DBUtil;

public class RegisterDAO {

	public void insertBook(Books book) {

		EntityManager em = DBUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();

		try {
			tx.begin();
			em.persist(book); // 전달받은 book 객체 저장
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		} finally {
			em.close();
		}
	}
}
