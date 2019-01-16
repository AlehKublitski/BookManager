package net.proselyte.bookmanager.dao;

import net.proselyte.bookmanager.model.Part;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PartDaoImpl implements PartDao {
    private static final Logger logger = LoggerFactory.getLogger(PartDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addBook(Part part) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(part);
        System.out.println(part.getName() + "добавлено удачно да");
        logger.info("Part successfully saved. Part details: " + part);
    }

    @Override
    public void updateBook(Part part) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(part);
        logger.info("Part successfully update. Part details: " + part);
    }

    @Override
    public void removeBook(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Part part = (Part) session.load(Part.class, new Integer(id));

        if(part !=null){
            session.delete(part);
        }
        logger.info("Part successfully removed. Part details: " + part);
    }

    @Override
    public Part getBookById(int id) {
        Session session =this.sessionFactory.getCurrentSession();
        Part part = (Part) session.load(Part.class, new Integer(id));
        logger.info("Part successfully loaded. Part details: " + part);

        return part;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> listBooks() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Part> partList = session.createQuery("from Part").list();

        for(Part part : partList){
            System.out.println(part.getName() + " взято из базы");
            logger.info("Part list: " + part);
        }

        return partList;
    }
}
