package com.project;

public class FormData {

    private String serverUrl;
    private String database1;
    private String database2;
    private int portNumber;
    private String username;
    private String password;
    private String tableName;

    public FormData() {
    }

    public FormData(String serverUrl, String database1, String database2, int portNumber, String username, String password, String tableName) {
        this.serverUrl = serverUrl;
        this.database2 = database1;
        this.database2 = database2;
        this.portNumber = portNumber;
        this.username = username;
        this.password = password;
        this.tableName = tableName;
    }

    public String getServerUrl() {
        return serverUrl;
    }

    public void setServerUrl(String serverUrl) {
        this.serverUrl = serverUrl;
    }

    public String getdatabase2() {
        return database2;
    }

    public void setdatabase2(String database2) {
        this.database2 = database2;
    }
    
    public String getdatabase1() {
        return database1;
    }

    public void setdatabase1(String database1) {
        this.database1 = database1;
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
    
    public String gettableName() {
        return tableName;
    }

    public void settableName(String tableName) {
        this.tableName = tableName;
    }

    public boolean isValid() {
        return tableName != null && !tableName.isEmpty() &&
        		database1 != null && !database1.isEmpty() &&
        		database2 != null && !database2.isEmpty() &&
                /*portNumber > 0 &&*/
                username != null && !username.isEmpty() &&
                serverUrl !=null && !serverUrl.isEmpty() &&
                password != null && !password.isEmpty();
    }
}
