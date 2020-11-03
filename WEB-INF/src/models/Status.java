package models;

public class Status{
    private Integer statusId;
    private String status;

    public Status(){
        super();
    }

    public Status(Integer statusId){
		this.statusId = statusId;
	}
    public Status(String status){
        this.status = status;
    }
    
    public void setStatusId(int statusId){
        this.statusId = statusId;
    }
    public Integer getStatusId(){
        return this.statusId;
    }
    
    public void setStatus(String status){
        this.status = status;
    }
    public String getStatus(){
        return this.status;
    }
}