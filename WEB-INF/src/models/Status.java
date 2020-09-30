package models;

public class Status{
    private Integer statusId;
    private String status;

    public Status(){
        super();
    }
    public Status(String status){
        this.status = status;
    }
    
    public void setStatusId(statusId){
        this.statusId = statusId;
    }
    public Integer getStatusId(){
        return this.statusId;
    }
    
    public void setStatus(status){
        this.status = status;
    }
    public Integer getStatus(){
        return this.status;
    }
}