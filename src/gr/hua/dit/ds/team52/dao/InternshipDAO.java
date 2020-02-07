package gr.hua.dit.ds.team52.dao;

import gr.hua.dit.ds.team52.entity.Internship;

import java.util.List;

public interface InternshipDAO {


    public void saveInternship(Internship internship);
    public void deleteInternship(Internship internship);
    public List<Internship> getInternships();
    public Internship getInternshipByName(String name);

}
