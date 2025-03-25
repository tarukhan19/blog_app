import 'package:blog_app/features/auth/domain/entity/user.dart';

/*
📌 Models/DTOs → Converts raw data into structured format.
  Converts data between Supabase API response and the Domain Layer User entity.

📌 Keeps the Domain Layer independent of Supabase’s response format.

📌 Ensures structured data conversion between the API and the app.

📌 fromJson -> defines a factory constructor named fromJson for a UserModel class.
It is used to create a UserModel object from a Map<String, dynamic> (typically a JSON object).

✅ factory constructor in Dart is a special type of constructor that does not always create a new instance of a class.
Instead, it can return an existing instance, cache objects, or return a subclass instance.

📌 object?.property
If object is not null, it accesses property.
If object is null, it returns null instead of throwing an error.

📌 value ?? defaultValue
If value is not null, it returns value.
If value is null, it returns defaultValue

📌 variable ??= value;
If variable is null, it assigns value to variable.
If variable is not null, it keeps its original value.

📌 Named parameter ({}) : allow to specify arguments explicitly by name.
                     parameters are optional by default.
                     By default, named parameters are optional.
                     we can make them required using the required keyword.

📌 Positional parameters () : It is passed in order, just like traditional function parameters.
                          we can use square brackets [] to make parameters optional

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
