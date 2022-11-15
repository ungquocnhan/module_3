package model;

public class RoomRent {
    private int id;
    private String name;
    private String numberPhone;
    private String startDate;
    private Payment payment;
    private String note;
    private boolean flag;

    public RoomRent() {
    }

    public RoomRent(int id, String name, String numberPhone, String startDate, Payment payment, String note) {
        this.id = id;
        this.name = name;
        this.numberPhone = numberPhone;
        this.startDate = startDate;
        this.payment = payment;
        this.note = note;
    }

    public RoomRent(int id, String name, String numberPhone, String startDate, Payment payment, String note, boolean flag) {
        this.id = id;
        this.name = name;
        this.numberPhone = numberPhone;
        this.startDate = startDate;
        this.payment = payment;
        this.note = note;
        this.flag = flag;
    }

    public RoomRent(String name, String phoneNumber, String startDate, String note, Payment payment, boolean flag) {
        this.name = name;
        this.numberPhone = phoneNumber;
        this.startDate = startDate;
        this.payment = payment;
        this.note = note;
        this.flag = flag;
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

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }
}
