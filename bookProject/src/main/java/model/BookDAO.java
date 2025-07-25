package model;

import model.entity.book;
import javax.persistence.*;
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
}
