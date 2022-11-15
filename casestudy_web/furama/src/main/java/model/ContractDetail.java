package model;

public class ContractDetail {
    private int id;
    private Contract contract;
    private AttachDetail attachDetail;
    private int quantity;

    public ContractDetail() {
    }

    public ContractDetail(int id, Contract contract, AttachDetail attachDetail, int quantity) {
        this.id = id;
        this.contract = contract;
        this.attachDetail = attachDetail;
        this.quantity = quantity;
    }

    public ContractDetail(Contract contract) {
        this.contract = contract;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }

    public AttachDetail getAttachDetail() {
        return attachDetail;
    }

    public void setAttachDetail(AttachDetail attachDetail) {
        this.attachDetail = attachDetail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
