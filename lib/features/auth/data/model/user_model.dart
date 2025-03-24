import 'package:blog_app/features/auth/domain/entity/user.dart';

/*
📌 Models/DTOs → Converts raw data into structured format.
  Converts data between Supabase API response and the Domain Layer User entity.

📌 Keeps the Domain Layer independent of Supabase’s response format.

📌 Ensures structured data conversion between the API and the app.

📌 fromJson -> defines a factory constructor named fromJson for a UserModel class.
It is used to create a UserModel object from a Map<String, dynamic> (typically a JSON object).

📌 object?.property
If object is not null, it accesses property.
If object is null, it returns null instead of throwing an error.

📌 value ?? defaultValue
If value is not null, it returns value.
If value is null, it returns defaultValue

📌 variable ??= value;
If variable is null, it assigns value to variable.
If variable is not null, it keeps its original value.
 */
class UserModel extends User {
  UserModel({required super.id, required super.name, required super.emailId});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      emailId: map['emailId'] ?? '',
    );
  }
}
