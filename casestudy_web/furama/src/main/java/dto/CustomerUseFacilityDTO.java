package dto;

import model.*;

public class CustomerUseFacilityDTO {
    private int id;
    private String name;
    private String idCard;
    private String phoneNumber;
    private String address;
    private Facility facility;
    private Contract contract;
    private ContractDetail contractDetail;
    private AttachDetail attachDetail;

    public CustomerUseFacilityDTO(int id, String name, String idCard, String phoneNumber, String address, Facility facility, Contract contract, ContractDetail contractDetail, AttachDetail attachDetail) {
        this.id = id;
        this.name = name;
        this.idCard = idCard;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.facility = facility;
        this.contract = contract;
        this.contractDetail = contractDetail;
        this.attachDetail = attachDetail;
    }

    public CustomerUseFacilityDTO() {
    }

    public CustomerUseFacilityDTO(int id, String name, String idCard, String phoneNumber, String address,  Contract contract, Facility facility) {
        this.id = id;
        this.name = name;
        this.idCard = idCard;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.contract = contract;
        this.facility = facility;
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

    public Facility getFacility() {
        return facility;
    }

    public void setFacility(Facility facility) {
        this.facility = facility;
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }

    public ContractDetail getContractDetail() {
        return contractDetail;
    }

    public void setContractDetail(ContractDetail contractDetail) {
        this.contractDetail = contractDetail;
    }

    public AttachDetail getAttachDetail() {
        return attachDetail;
    }

    public void setAttachDetail(AttachDetail attachDetail) {
        this.attachDetail = attachDetail;
    }
}

