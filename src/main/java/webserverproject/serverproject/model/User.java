package webserverproject.serverproject.model;

import org.hibernate.annotations.GenericGenerator;
import webserverproject.serverproject.jpaAuditing.JpaAuditingConfiguration;
import webserverproject.serverproject.security.Role;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Entity
@Table(name ="USER_TABLE")
public class User extends JpaAuditingConfiguration {

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(name ="User_ID")
    private String user;


    @Column(nullable = false)
    private String email;


    @Column(nullable = false)
    private String password;


    @Column(nullable = false)
    private String userName;

    @Column(nullable = false,length=13)
    private String phoneNumber;

    @Column(nullable = false)
    private String nickName;



    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private Role roles;

    public User() {
    }


    public String getNickName() {
        return nickName;
    }

    public User(String email, String password, String userName, String phoneNumber, Role roles, String nickName) {
        this.email = email;
        this.password = password;
        this.userName = userName;
        this.phoneNumber = phoneNumber;
        this.roles = roles;
        this.nickName = nickName;
    }

    public List<Role> getRoleList(){
        if(this.roles!=null){
            return Arrays.asList(this.roles);
        }

        return new ArrayList<>();
    }

    public String getUser() {
        return user;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getUserName() {
        return userName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public Role getRoles() {
        return roles;
    }
    public LocalDateTime getCreateDate(){
        return getCreateDate();
    }
    public LocalDateTime getModifiedDate(){
        return getModifiedDate();
    }
}
