package model;

import model.entity.*;
import javax.persistence.*;

import java.sql.SQLException;
import java.util.List;

public class BookDAO {
	
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("dbinfo");  //??

    public List<Books> findAll()  {
    	
        EntityManager em = emf.createEntityManager();
        List<Books> list = null;

        try {
            list = em.createQuery("SELECT b FROM book b", Books.class).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            em.close();
        }

        return list;
        
    }
    
    
    public List<Books> findTitle(String title) throws SQLException {
    	
        EntityManager em = emf.createEntityManager();
        List<Books> list = null;

        try {
            list = em.createQuery(
                "SELECT b FROM book b WHERE LOWER(b.title) LIKE LOWER(CONCAT('%', :title, '%'))", Books.class)
                .setParameter("title", title)
                .getResultList();
        } finally {
            em.close();
        }

        return list;
        
    }
    
    
    public List<Books> findCategory(String category) throws SQLException{
    	
    	EntityManager em = emf.createEntityManager();
        List<Books> list = null;
        
        try {
        	list = em.createQuery("SELECT b FROM book b WHERE LOWER(b.category) LIKE LOWER(CONCAT('%', :category, '%'))", Books.class)
        			.setParameter("category", category)
        			.getResultList();
        } finally {
        	em.close();
        }
        
        return list;
        
    }
    
    
    public List<Books> findAuthor(String author) throws SQLException{
    	
    	EntityManager em = emf.createEntityManager();
        List<Books> list = null;
        
        try {
        	list = em.createQuery("SELECT b FROM book b WHERE LOWER(b.author) LIKE LOWER(CONCAT('%', :author, '%'))", Books.class)
        			.setParameter("author", author)
        			.getResultList();
        } finally {
        	em.close();
        }
        
        return list;
        
    }

}