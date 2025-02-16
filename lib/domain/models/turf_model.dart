class TurfModel {
  final String ownerName;
  final String ownerEmail;
  final String turfName;
  final String phone;
  final String email;
  final String price;
  final String state;
  final String country;
  final String catogery;
  final String includes;
  final String landmark;
  final bool reviewStatus;
  List<String>?images;
  TurfModel({
    required this.ownerName,
    required this.ownerEmail,
    required this.turfName,
    required this.phone,
    required this.email,
    required this.price,
    required this.state,
    required this.country,
    required this.catogery,
    required this.includes,
    required this.landmark,
     this.images,
     required this.reviewStatus
  });
}
