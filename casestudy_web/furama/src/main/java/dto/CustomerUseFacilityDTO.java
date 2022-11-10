package dto;

public class CustomerUseFacilityDTO {
    private String name;
    private String idCard;
    private String phoneNumber;
    private String address;
    private String startDate;
    private String endDate;
    private double deposit;
    private String nameFacilityAttach;
    private int quantity;

    public CustomerUseFacilityDTO() {
    }

    public CustomerUseFacilityDTO(String name, String idCard, String phoneNumber, String address, String startDate, String endDate, double deposit, String nameFacilityAttach, int quantity) {
        this.name = name;
        this.idCard = idCard;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.startDate = startDate;
        this.endDate = endDate;
        this.deposit = deposit;
        this.nameFacilityAttach = nameFacilityAttach;
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public String getNameFacilityAttach() {
        return nameFacilityAttach;
    }

    public void setNameFacilityAttach(String nameFacilityAttach) {
        this.nameFacilityAttach = nameFacilityAttach;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}

