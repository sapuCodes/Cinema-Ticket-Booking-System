package cinema.user.payment;

public class OrderDetail {
    private float total;

    public OrderDetail(float total) {
        this.total = total;
    }

    public String getTotal() {
        return String.format("%.2f", total);
    }
}
