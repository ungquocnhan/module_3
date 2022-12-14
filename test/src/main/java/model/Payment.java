package model;

public class Payment {
    private int id;
    private String name;

    public Payment() {
    }

    public Payment(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Payment(int id) {
        this.id = id;
    }

    public Payment(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
