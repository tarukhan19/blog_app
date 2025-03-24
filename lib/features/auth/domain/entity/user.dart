/*
Entities → Core business objects (e.g., User).

It defines what a user is in your app.

This is used across the Domain Layer and is independent of data sources (e.g., Supabase).

Keeps your business logic decoupled from the data layer.
 */
class User {
  final String id;
  final String name;
  final String emailId;

  User({required this.id, required this.name, required this.emailId});
}