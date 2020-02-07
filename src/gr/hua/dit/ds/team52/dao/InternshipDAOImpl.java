package gr.hua.dit.ds.team52.dao;


import gr.hua.dit.ds.team52.entity.Internship;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class InternshipDAOImpl implements InternshipDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public void saveInternship(Internship internship) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.save(internship);
    }

    @Override
    @Transactional
    public void deleteInternship(Internship internship) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.delete(internship);
    }

    @Override
    @Transactional
    public List<Internship> getInternships() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Internship", Internship.class).getResultList();
    }

    @Override
    @Transactional
    public Internship getInternshipByName(String name) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Internship I WHERE I.title LIKE '"+name+"'", Internship.class).getSingleResult();
    }
}
