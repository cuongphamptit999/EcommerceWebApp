package vn.ptit.models.order;

public class Shipment {
	private int id;
	private String name;
	private double price;
	private String address;

	public Shipment() {
		// TODO Auto-generated constructor stub
	}

	public Shipment(String name, double price, String address) {
		super();
		this.name = name;
		this.price = price;
		this.address = address;
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
