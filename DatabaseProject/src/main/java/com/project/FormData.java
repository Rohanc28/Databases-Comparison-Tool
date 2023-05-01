package com.project;

public class FormData {

    private String serverName;
    private String databaseName;
    private int portNumber;
    private String username;
    private String password;

    public FormData() {
    }

    public FormData(String serverName, String databaseName, int portNumber, String username, String password) {
        this.serverName = serverName;
        this.databaseName = databaseName;
        this.portNumber = portNumber;
        this.username = username;
        this.password = password;
    }

    public String getServerName() {
        return serverName;
    }

    public void setServerName(String serverName) {
        this.serverName = serverName;
    }

    public String getDatabaseName() {
        return databaseName;
    }

    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }

    public int getPortNumber() {
        return portNumber;
    }

    public void setPortNumber(int portNumber) {
        this.portNumber = portNumber;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isValid() {
        return serverName != null && !serverName.isEmpty() &&
                databaseName != null && !databaseName.isEmpty() &&
                portNumber > 0 &&
                username != null && !username.isEmpty() &&
                password != null && !password.isEmpty();
    }
}
