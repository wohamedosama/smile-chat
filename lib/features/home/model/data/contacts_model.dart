import 'package:equatable/equatable.dart';

class ContactsModel extends Equatable {
  final String id;
  final String name;
  final String? image;

  const ContactsModel({
    required this.id,
    required this.name,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
