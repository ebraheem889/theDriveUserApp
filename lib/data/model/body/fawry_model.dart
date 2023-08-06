class FawryModel {
  String billItemId; // put it as a unique id
  String billDescription;
  int billQuantity;
  double billPrice;
  String customerName;
  String customerEmail;
  String customerMobile;
  String merchantRefNum;
  FawryModel(
      {required this.billItemId,
      required this.billDescription,
      required this.billQuantity,
      required this.billPrice,
      required this.customerName,
      required this.customerEmail,
      required this.customerMobile,
      required this.merchantRefNum});
}
