public class Customer {
private String name;
private String dateOfBirth;
private String address;
private String urlImg;

    public Customer() {
    }

    public Customer(String name, String dateOfBirth, String address, String urlImg) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.urlImg = urlImg;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }
}
