package gr.hua.dit.ds.team52.dao;

import gr.hua.dit.ds.team52.entity.Petition;
import gr.hua.dit.ds.team52.entity.Student;
import gr.hua.dit.ds.team52.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class StudentDAOImpl implements StudentDAO {

    // inject the session factory
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Petition> getPetitions(){
        Session currentSession = sessionFactory.getCurrentSession();

        // create a query
        Query<Petition> query = currentSession.createQuery("from Petition", Petition.class);

        // execute the query and get the results list
        List<Petition> Petitions = query.getResultList();
        return Petitions;
    }

    @Override
    @Transactional
    public List<Petition> getPetitionsPending(String name){
        Session currentSession = sessionFactory.getCurrentSession();

        // create a query
        Query<Petition> query = currentSession.createQuery("from Petition P where P.status= 'pending' and P.company_name= :name ", Petition.class);
        query.setParameter("name", name);

        // execute the query and get the results list
        List<Petition> Petitions = query.getResultList();
        return Petitions;
    }

    @Override
    @Transactional
    public boolean acceptPetition(String title) {

        Session currentSession = sessionFactory.getCurrentSession();

        try {

            int q = currentSession.createSQLQuery("UPDATE `petition` SET `status` = 'accepted'  WHERE `petition`.`title` = '" + title + "';").executeUpdate();

        } catch (Exception e) {
            return false;
        }
        return true;
    }

    @Override
    @Transactional
    public Boolean savePetition(Petition petition) {
        /**
         * This function is an INSERT tool ONLY.
         */
        try {
            Session currentsession=sessionFactory.getCurrentSession();
//            Student student = currentsession.get(Student.class,studentID);
//            petition.setStudent(student);

            currentsession.save(petition);
        } catch (Exception e) {
            // TODO: handle exception
            return false;
        }

        return true;
    }

    @Override
    @Transactional
    public List<Student> getStudent(String username) {

        Session currentSession = sessionFactory.getCurrentSession();

        System.out.println(username);

        String hql = "FROM Student E WHERE E.username = :username";
        Query query = currentSession.createQuery(hql);
        query.setParameter("username",username);
        List<Student> results = query.list();

        return results;
    }
}
