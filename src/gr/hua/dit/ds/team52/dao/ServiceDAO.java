package gr.hua.dit.ds.team52.dao;

import gr.hua.dit.ds.team52.entity.Role;
import gr.hua.dit.ds.team52.entity.Service;

import java.util.List;

public interface ServiceDAO {

    public Role getRoleByName(String name);
    public Service getServiceByName(String name);

    public List<Role> getRoles();
    public List<Service> getServices();

    public void saveService(Service service);
    public void saveRole(Role role);

    public void deleteService(Service service);
    public void deleteRole(Role role);

    public void addRoleToService(Service service, Role role);
    public void deleteRoleFromService(Service service, Role role);

}
