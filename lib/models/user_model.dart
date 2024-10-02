import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  final String message;
  final Data data;
  final String token;
  User({
    required this.message,
    required this.data,
    required this.token,
  });

  User copyWith({
    String? message,
    Data? data,
    String? token,
  }) {
    return User(
      message: message ?? this.message,
      data: data ?? this.data,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'data': data.toMap(),
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      message: map['message'] as String,
      data: Data.fromMap(map['data'] as Map<String, dynamic>),
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(message: $message, data: $data, token: $token)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.message == message && other.data == data && other.token == token;
  }

  @override
  int get hashCode => message.hashCode ^ data.hashCode ^ token.hashCode;
}

class Data {
  final String id;
  final String firstName;
  final String lastName;
  final bool emailVerified;
  final String username;
  final String email;
  final String password;
  final bool profileCompleted;
  final bool isVerified;
  final List<dynamic> interests;
  final List<dynamic> registeredEvents;
  final List<String> preferences;
  final List<dynamic> eventGroups;
  final List<dynamic> events;
  final List<dynamic> followers;
  final List<dynamic> following;
  final String createdAt;
  final String updatedAt;
  final int v;
  final String role;
  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailVerified,
    required this.username,
    required this.email,
    required this.password,
    required this.profileCompleted,
    required this.isVerified,
    required this.interests,
    required this.registeredEvents,
    required this.preferences,
    required this.eventGroups,
    required this.events,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.role,
  });

  Data copyWith({
    String? id,
    String? firstName,
    String? lastName,
    bool? emailVerified,
    String? username,
    String? email,
    String? password,
    bool? profileCompleted,
    bool? isVerified,
    List<dynamic>? interests,
    List<dynamic>? registeredEvents,
    List<String>? preferences,
    List<dynamic>? eventGroups,
    List<dynamic>? events,
    List<dynamic>? followers,
    List<dynamic>? following,
    String? createdAt,
    String? updatedAt,
    int? v,
    String? role,
  }) {
    return Data(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      emailVerified: emailVerified ?? this.emailVerified,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      profileCompleted: profileCompleted ?? this.profileCompleted,
      isVerified: isVerified ?? this.isVerified,
      interests: interests ?? this.interests,
      registeredEvents: registeredEvents ?? this.registeredEvents,
      preferences: preferences ?? this.preferences,
      eventGroups: eventGroups ?? this.eventGroups,
      events: events ?? this.events,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'emailVerified': emailVerified,
      'username': username,
      'email': email,
      'password': password,
      'profileCompleted': profileCompleted,
      'isVerified': isVerified,
      'interests': interests,
      'registeredEvents': registeredEvents,
      'preferences': preferences,
      'eventGroups': eventGroups,
      'events': events,
      'followers': followers,
      'following': following,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'v': v,
      'role': role,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      emailVerified: map['emailVerified'] as bool,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      profileCompleted: map['profileCompleted'] as bool,
      isVerified: map['isVerified'] as bool,
      interests: List<dynamic>.from((map['interests'] as List<dynamic>)),
      registeredEvents: List<dynamic>.from((map['registeredEvents'] as List<dynamic>)),
      preferences: List<String>.from((map['preferences'] as List<String>)),
      eventGroups: List<dynamic>.from((map['eventGroups'] as List<dynamic>)),
      events: List<dynamic>.from((map['events'] as List<dynamic>)),
      followers: List<dynamic>.from((map['followers'] as List<dynamic>)),
      following: List<dynamic>.from((map['following'] as List<dynamic>)),
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      v: map['v'].toInt() as int,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(id: $id, firstName: $firstName, lastName: $lastName, emailVerified: $emailVerified, username: $username, email: $email, password: $password, profileCompleted: $profileCompleted, isVerified: $isVerified, interests: $interests, registeredEvents: $registeredEvents, preferences: $preferences, eventGroups: $eventGroups, events: $events, followers: $followers, following: $following, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, role: $role)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.emailVerified == emailVerified &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        other.profileCompleted == profileCompleted &&
        other.isVerified == isVerified &&
        listEquals(other.interests, interests) &&
        listEquals(other.registeredEvents, registeredEvents) &&
        listEquals(other.preferences, preferences) &&
        listEquals(other.eventGroups, eventGroups) &&
        listEquals(other.events, events) &&
        listEquals(other.followers, followers) &&
        listEquals(other.following, following) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.v == v &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        emailVerified.hashCode ^
        username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        profileCompleted.hashCode ^
        isVerified.hashCode ^
        interests.hashCode ^
        registeredEvents.hashCode ^
        preferences.hashCode ^
        eventGroups.hashCode ^
        events.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode ^
        role.hashCode;
  }
}