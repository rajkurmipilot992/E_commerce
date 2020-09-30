package models;

public class City{
    private Integer cityId;
    private State state;
    private String city;

    public City(){

    }
    public City(String city, State state){
        this.state = state;
        this.city = city;
    }

    public void setCityId(State state, String city){
        this.state = state;
        this.city = city;
    }
}
