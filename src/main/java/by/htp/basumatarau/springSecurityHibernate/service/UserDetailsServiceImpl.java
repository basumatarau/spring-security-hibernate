package by.htp.basumatarau.springSecurityHibernate.service;

import by.htp.basumatarau.springSecurityHibernate.dao.UserDetailsDao;
import by.htp.basumatarau.springSecurityHibernate.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserDetailsDao userDetailsDao;

    @Transactional(readOnly = true)
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User user = userDetailsDao.findUserByUserEmail(username);
        UserBuilder builder = null;
        if(user != null){
            builder = org.springframework.security.core.userdetails.User.withUsername(user.getEmail());
            builder.disabled(!user.isEnabled());
            builder.password(user.getPassword());
            builder.authorities(
                    user.getAuthoritySet()
                            .stream().map(a->a.getAuthority())
                            .toArray(String[]::new)
            );
        }else{
            throw new UsernameNotFoundException("User not found.");
        }
        return builder.build();
    }
}
