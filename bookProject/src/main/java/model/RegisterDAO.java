package model;

import java.sql.SQLException;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import model.entity.Books;
import util.DBUtil;

public class RegisterDAO {

	public void insertBook(Books book) throws SQLException {

		EntityManager em = DBUtil.getEntityManager();
		EntityTransaction tx = em.getTransaction();

		try {
			tx.begin();
			em.persist(book);
			tx.commit();
		} finally {
			em.close();
		}
		
	}
}
