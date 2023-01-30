package products;


public class ProductDTO {

    private int MA_SP;
    private String TEN_SP;
    private double GIABAN;
    private int SOLUONG;
    private String NGAY_THEMSP;
    private String HINHANH_SP;
    private int TINHTRANG;
    private int MA_DM;
    private int quantityPurchased;

    public int getQuantityPurchased() {
        return quantityPurchased;
    }

    public void setQuantityPurchased(int quantityPurchased) {
        this.quantityPurchased = quantityPurchased;
    }

    public ProductDTO() {

    }

    public ProductDTO(int MA_SP, String TEN_SP, double GIABAN, int SOLUONG, String NGAY_THEMSP, String HINHANH_SP, int TINHTRANG, int MA_DM) {
        this.MA_SP = MA_SP;
        this.TEN_SP = TEN_SP;
        this.GIABAN = GIABAN;
        this.SOLUONG = SOLUONG;
        this.NGAY_THEMSP = NGAY_THEMSP;
        this.HINHANH_SP = HINHANH_SP;
        this.TINHTRANG = TINHTRANG;
        this.MA_DM = MA_DM;
    }

    public ProductDTO(int MA_SP, String TEN_SP, double GIABAN, String HINHANH_SP, int quantityPurchased) {
        this.MA_SP = MA_SP;
        this.TEN_SP = TEN_SP;
        this.GIABAN = GIABAN;
        this.HINHANH_SP = HINHANH_SP;
        this.quantityPurchased = quantityPurchased;
    }

    public int getMA_SP() {
        return MA_SP;
    }

    public void setMA_SP(int MA_SP) {
        this.MA_SP = MA_SP;
    }

    public String getTEN_SP() {
        return TEN_SP;
    }

    public void setTEN_SP(String TEN_SP) {
        this.TEN_SP = TEN_SP;
    }

    public double getGIABAN() {
        return GIABAN;
    }

    public void setGIABAN(double GIABAN) {
        this.GIABAN = GIABAN;
    }

    public int getSOLUONG() {
        return SOLUONG;
    }

    public void setSOLUONG(int SOLUONG) {
        this.SOLUONG = SOLUONG;
    }

    public String getNGAY_THEMSP() {
        return NGAY_THEMSP;
    }

    public void setNGAY_THEMSP(String NGAY_THEMSP) {
        this.NGAY_THEMSP = NGAY_THEMSP;
    }

    public String getHINHANH_SP() {
        return HINHANH_SP;
    }

    public void setHINHANH_SP(String HINHANH_SP) {
        this.HINHANH_SP = HINHANH_SP;
    }

    public int getTINHTRANG() {
        return TINHTRANG;
    }

    public void setTINHTRANG(int TINHTRANG) {
        this.TINHTRANG = TINHTRANG;
    }

    public int getMA_DM() {
        return MA_DM;
    }

    public void setMA_DM(int MA_DM) {
        this.MA_DM = MA_DM;
    }

}
