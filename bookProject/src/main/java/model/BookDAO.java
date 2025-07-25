package model;

import model.entity.book;
import javax.persistence.*;

import java.sql.SQLException;
import java.util.List;

public class BookDAO {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("dbinfo");

    public List<book> findAll() {
        EntityManager em = emf.createEntityManager();
        List<book> list = null;

        try {
            list = em.createQuery("SELECT b FROM book b", book.class).getResultList();
            System.out.println("출력");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	System.out.println("aa");
            em.close();
        }

        return list;
    }
    
    public List<book> findTitle(String title) throws SQLException {
        EntityManager em = emf.createEntityManager();
        List<book> list = null;

        try {
            System.out.println("🔍 DAO findTitle 실행, 입력 title = [" + title + "]");
            list = em.createQuery(
                "SELECT b FROM book b WHERE LOWER(b.title) LIKE LOWER(CONCAT('%', :title, '%'))", book.class)
                .setParameter("title", title)
                .getResultList();
            System.out.println("📚 검색 결과 수: " + list.size());
        } finally {
            em.close();
        }

        return list;
    }
    
    public List<book> findCategory(String category) throws SQLException{
    	EntityManager em = emf.createEntityManager();
        List<book> list = null;
        
        try {
        	list = em.createQuery("SELECT b FROM book b WHERE LOWER(b.category) LIKE LOWER(CONCAT('%', :category, '%'))", book.class)
        			.setParameter("category", category)
        			.getResultList();
        } finally {
        	em.close();
        }
        
        return list;
    }
    
    public List<book> findAuthor(String author) throws SQLException{
    	EntityManager em = emf.createEntityManager();
        List<book> list = null;
        
        try {
        	list = em.createQuery("SELECT b FROM book b WHERE LOWER(b.author) LIKE LOWER(CONCAT('%', :author, '%'))", book.class)
        			.setParameter("author", author)
        			.getResultList();
        } finally {
        	em.close();
        }
        
        return list;
    }

}
