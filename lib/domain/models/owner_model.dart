class OwnerModel {
  final String ownerName;
  final String ownerEmail;
  final String ownerPhone;
  final String ownerId;
  final String viewAction;
  final String bookingAction;
  OwnerModel({
    required this.ownerName,
    required this.ownerEmail,
    required this.ownerPhone,
    required this.ownerId,
    this.viewAction = "View",
    this.bookingAction = "Bookings"
  });
}
