package gr.hua.dit.ds.team52.dao;

import gr.hua.dit.ds.team52.entity.Petition;
import gr.hua.dit.ds.team52.entity.Student;

import java.util.List;

public interface StudentDAO {

    public List<Petition> getPetitions();
    public Boolean savePetition(Petition petition);
//            ,String studentUsername);             add this later
    public Student getStudent(String username);  //probably not needed later on
    public List<Petition> getPetitionsPending();
    public boolean acceptPetition(String title);

    }
