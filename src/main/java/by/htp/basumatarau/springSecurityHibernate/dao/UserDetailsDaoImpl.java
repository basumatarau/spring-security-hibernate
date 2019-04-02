package by.htp.basumatarau.springSecurityHibernate.dao;

import by.htp.basumatarau.springSecurityHibernate.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDetailsDaoImpl implements UserDetailsDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public User findUserByUserEmail(String email) {
        Session currentSession = sessionFactory.getCurrentSession();

        Query<User> query = currentSession.createQuery(
                "from User u " +
                        "join fetch u.authoritySet " +
                        "where u.email=:email", User.class);

        query.setParameter("email", email);
        List<User> resList = query.getResultList();
        User result;

        if(resList.size()!=1) {
            result = null;
        }else {
            result = resList.get(0);
        }
        return result;
    }
}
