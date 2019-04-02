package by.htp.basumatarau.springSecurityHibernate.dao;

import by.htp.basumatarau.springSecurityHibernate.model.User;

public interface UserDetailsDao {
    User findUserByUserEmail(String name);
}
