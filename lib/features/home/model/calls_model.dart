class CallsModel {
  final String profileImage, title, subtitle;
  final StatusOfCall typeOfCall;
  const CallsModel({
    required this.title,
    required this.subtitle,
    required this.typeOfCall,
    required this.profileImage,
  });
}

enum StatusOfCall {
  incomingCall,
  outgoingcall,
  declindcall,
}
