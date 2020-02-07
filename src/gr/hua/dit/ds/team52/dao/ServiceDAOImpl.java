package gr.hua.dit.ds.team52.dao;

import gr.hua.dit.ds.team52.entity.Role;
import gr.hua.dit.ds.team52.entity.Service;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class ServiceDAOImpl implements ServiceDAO {


    @Autowired
    private SessionFactory sessionFactory;



    @Override
    @Transactional
    public List<Role> getRoles() {
        Session currentSession = sessionFactory.getCurrentSession();
        List<Role> roles = currentSession.createQuery("from Role", Role.class).getResultList();
        return roles;
    }

    @Override
    @Transactional
    public Role getRoleByName(String roleName) {
        Session currentSession = sessionFactory.getCurrentSession();
        //id 1=manager 2=petitions 3=internships 6=create petition
        // create a query
        return currentSession.createQuery("from Role R WHERE R.title LIKE '"+roleName+"'", Role.class).getSingleResult();
    }

    @Override
    @Transactional
    public Service getServiceByName(String name) {
        Session currentSession = sessionFactory.getCurrentSession();
        //id 1=manager 2=petitions 3=internships 6=create petition
        // create a query
        return currentSession.createQuery("from Service S WHERE S.title LIKE '"+name+"'", Service.class).getSingleResult();
    }

    @Override
    @Transactional
    public void saveService(Service service) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(service);
    }

    @Override
    @Transactional
    public void saveRole(Role role) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(role);
    }

    @Override
    @Transactional
    public void deleteService(Service service) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.delete(service);
    }

    @Override
    @Transactional
    public void deleteRole(Role role) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.delete(role);
    }



    @Override
    @Transactional
    public List<Service> getServices(){
        Session currentSession = sessionFactory.getCurrentSession();
        // execute the query and get the results list
        List<Service> services = currentSession.createQuery("from Service", Service.class).getResultList();

        return services;
    }

    @Override
    @Transactional
    public void addRoleToService(Service service, Role role) {

        Session currentSession = sessionFactory.getCurrentSession();

        service.add(role);

        currentSession.saveOrUpdate(service);
    }

    @Override
    @Transactional
    public void deleteRoleFromService(Service service, Role role) {
        //update only
        Session currentSession = sessionFactory.getCurrentSession();

        service.getRoles().remove(role);
        currentSession.update(service);
    }
}
