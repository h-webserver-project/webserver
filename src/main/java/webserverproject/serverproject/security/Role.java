package webserverproject.serverproject.security;

public enum Role {
    ROLE_USER("ROLE_USER"),
    ROLE_GUEST("ROLE_GUEST"),
    ROLE_ADMIN("ROLE_ADMIN");

    String role;

    public String getRole() {
        return role;
    }

    Role(String role){
        this.role = role;
    }
}
