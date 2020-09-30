package models;

public class State{
    private Integer stateId;
    private String state;

    public State(){

    }
    public State(String state){
        this.state = state;
    }
    
    public void setStateId(Integer stateId){
        this.stateId = stateId;
    }
    public Integer getStateId(){
        return this.stateId;
    }
    public void setState(String state){
        this.state = state;
    }
    public String getState(){
        return this.state;
    }

}