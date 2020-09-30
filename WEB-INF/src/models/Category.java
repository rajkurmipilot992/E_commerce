package models;

public class Category{
    private Integer categoryId;
    private String category;

    public Category(){
    }

    public Category(String category){
        this.category = category;
    }

    public void setCategory(String category){
        this.category = category;
    }
    public String getCategory(){
        return this.category;
    }

    public void setCategoryId(Integer categoryId){
        this.categoryId = categoryId;
    }
    public Integer getCategoryId(){
        return this.categoryId;
    }

}