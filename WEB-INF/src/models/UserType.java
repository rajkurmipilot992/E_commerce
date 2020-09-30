package models;

public class UserType{
    private Integer userTypeId;
    private String userType;
    
    public UserType(){
        super();
    }
    public UserType( String userType){
        super();
        this.userType = userType;
    }

    public Integer getUserTypeId(){
        return this.userTypeId;
    }
    public void setUserTypeId(Integer userTypeId){
        this.userTypeId = userTypeId;
    }
    public String getUserType(){
        return this.userType;
    }
    public void setUserTypeId(String userType){
        this.userType = userType;
    }
}