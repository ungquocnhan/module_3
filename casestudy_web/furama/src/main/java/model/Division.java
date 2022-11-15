package model;

public class Division {
    private int id;
    private String name;

    public Division() {
    }

    public Division(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Division(String name_division) {
        this.name = name_division;
    }

    public Division(int id) {
        this.id = id;
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
