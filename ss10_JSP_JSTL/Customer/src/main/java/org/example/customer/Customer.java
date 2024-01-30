package org.example.customer;

public class Customer {
    private String name;
    private String dateBirth;
    private String address;
    private String image;

    public Customer() {
    }

    public Customer(String name, String dateBirth, String address, String image) {
        this.name = name;
        this.dateBirth = dateBirth;
        this.address = address;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateBirth() {
        return dateBirth;
    }

    public void setDateBirth(String dateBirth) {
        this.dateBirth = dateBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
