import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:post_app/models/user_model.dart';

class EventModel {
  final String? message;
  final Data? data;
  EventModel({
    this.message,
    this.data,
  });

  EventModel copyWith({
    String? message,
    Data? data,
  }) {
    return EventModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      message: map['message'] as String?,
      data: map['data'] != null ? Data.fromMap(map['data'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) => EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'EventModel(message: $message, data: $data)';

  @override
  bool operator ==(covariant EventModel other) {
    if (identical(this, other)) return true;

    return other.message == message && other.data == data;
  }

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}

class Data {
  final int? currentPage;
  final int? totalPages;
  final List<Event>? events;
  Data({
    this.currentPage,
    this.totalPages,
    this.events,
  });

  Data copyWith({
    int? currentPage,
    int? totalPages,
    List<Event>? events,
  }) {
    return Data(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      events: events ?? this.events,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentPage': currentPage,
      'totalPages': totalPages,
      'events': events?.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      currentPage: map['currentPage'] != null ? map['currentPage'].toInt() as int : null,
      totalPages: map['totalPages'] != null ? map['totalPages'].toInt() as int : null,
      events: map['events'] != null
          ? List<Event>.from(
              (map['events'] as List<dynamic>).map<Event>(
                (x) => Event.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Data(currentPage: $currentPage, totalPages: $totalPages, events: $events)';

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.currentPage == currentPage &&
        other.totalPages == totalPages &&
        listEquals(other.events, events);
  }

  @override
  int get hashCode => currentPage.hashCode ^ totalPages.hashCode ^ events.hashCode;
}

class Event {
  final EventLocation? eventLocation;
  final String? id;
  final UserHere? user;
  final String? description;
  final String? title;
  final List<String>? images;
  final List<dynamic>? likedUsers;
  final List<dynamic>? comments;
  final List<String>? eventCategory;
  final String? eventStartAt;
  final String? eventEndAt;
  final bool? registrationRequired;
  final List<String>? keywords;
  final List<dynamic>? hashTags;
  final List<dynamic>? registration;
  final int? likes;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  Event({
    this.eventLocation,
    this.id,
    this.user,
    this.description,
    this.title,
    this.images,
    this.likedUsers,
    this.comments,
    this.eventCategory,
    this.eventStartAt,
    this.eventEndAt,
    this.registrationRequired,
    this.keywords,
    this.hashTags,
    this.registration,
    this.likes,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Event copyWith({
    EventLocation? eventLocation,
    String? id,
    UserHere? user,
    String? description,
    String? title,
    List<String>? images,
    List<dynamic>? likedUsers,
    List<dynamic>? comments,
    List<String>? eventCategory,
    String? eventStartAt,
    String? eventEndAt,
    bool? registrationRequired,
    List<String>? keywords,
    List<dynamic>? hashTags,
    List<dynamic>? registration,
    int? likes,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return Event(
      eventLocation: eventLocation ?? this.eventLocation,
      id: id ?? this.id,
      user: user ?? this.user,
      description: description ?? this.description,
      title: title ?? this.title,
      images: images ?? this.images,
      likedUsers: likedUsers ?? this.likedUsers,
      comments: comments ?? this.comments,
      eventCategory: eventCategory ?? this.eventCategory,
      eventStartAt: eventStartAt ?? this.eventStartAt,
      eventEndAt: eventEndAt ?? this.eventEndAt,
      registrationRequired: registrationRequired ?? this.registrationRequired,
      keywords: keywords ?? this.keywords,
      hashTags: hashTags ?? this.hashTags,
      registration: registration ?? this.registration,
      likes: likes ?? this.likes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'eventLocation': eventLocation?.toMap(),
      'id': id ?? '',
      'user': user?.toMap(),
      'description': description ?? '',
      'title': title ?? '',
      'images': images,
      'likedUsers': likedUsers,
      'comments': comments,
      'eventCategory': eventCategory,
      'eventStartAt': eventStartAt ?? '',
      'eventEndAt': eventEndAt ?? '',
      'registrationRequired': registrationRequired,
      'keywords': keywords,
      'hashTags': hashTags,
      'registration': registration,
      'likes': likes,
      'createdAt': createdAt ?? '',
      'updatedAt': updatedAt ?? '',
      'v': v,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
     print("Map received: $map"); // Debugging line
    return Event(
      eventLocation: map['eventLocation'] != null ? EventLocation.fromMap(map['eventLocation'] as Map<String, dynamic>) : null,
      id: map['_id'] as String? ?? '',
      user: map['user'] != null ? UserHere.fromMap(map['user'] as Map<String, dynamic>) : null,

      description: map['description'] as String? ?? '',
      title: map['title'] as String? ?? '',
      images: map['images'] != null ? List<String>.from((map['images'] as List<dynamic>)) : [],
      likedUsers: map['likedUsers'] != null ? List<dynamic>.from((map['likedUsers'] as List<dynamic>)) : [],
      comments: map['comments'] != null ? List<dynamic>.from((map['comments'] as List<dynamic>)) : [],
      eventCategory: map['eventCategory'] != null ? List<String>.from((map['eventCategory'] as List<dynamic>)) : [],
      eventStartAt: map['eventStartAt'] as String? ?? '',
      eventEndAt: map['eventEndAt'] as String? ?? '',
      registrationRequired: map['registrationRequired'] as bool?,
      keywords: map['keywords'] != null ? List<String>.from((map['keywords'] as List<dynamic>)) : [],
      hashTags: map['hashTags'] != null ? List<dynamic>.from((map['hashTags'] as List<dynamic>)) : [],
      registration: map['registration'] != null ? List<dynamic>.from((map['registration'] as List<dynamic>)) : [],
      likes: map['likes'] != null ? map['likes'].toInt() as int : 0,
      createdAt: map['createdAt'] as String? ?? '',
      updatedAt: map['updatedAt'] as String? ?? '',
      v: map['v'] != null ? map['v'].toInt() as int : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Event(eventLocation: $eventLocation, id: $id, user: $user, description: $description, title: $title, images: $images, likedUsers: $likedUsers, comments: $comments, eventCategory: $eventCategory, eventStartAt: $eventStartAt, eventEndAt: $eventEndAt, registrationRequired: $registrationRequired, keywords: $keywords, hashTags: $hashTags, registration: $registration, likes: $likes, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(covariant Event other) {
    if (identical(this, other)) return true;

    return other.eventLocation == eventLocation &&
        other.id == id &&
        other.user == user &&
        other.description == description &&
        other.title == title &&
        listEquals(other.images, images) &&
        listEquals(other.likedUsers, likedUsers) &&
        listEquals(other.comments, comments) &&
        listEquals(other.eventCategory, eventCategory) &&
        other.eventStartAt == eventStartAt &&
        other.eventEndAt == eventEndAt &&
        other.registrationRequired == registrationRequired &&
        listEquals(other.keywords, keywords) &&
        listEquals(other.hashTags, hashTags) &&
        listEquals(other.registration, registration) &&
        other.likes == likes &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.v == v;
  }

  @override
  int get hashCode {
    return eventLocation.hashCode ^
        id.hashCode ^
        user.hashCode ^
        description.hashCode ^
        title.hashCode ^
        images.hashCode ^
        likedUsers.hashCode ^
        comments.hashCode ^
        eventCategory.hashCode ^
        eventStartAt.hashCode ^
        eventEndAt.hashCode ^
        registrationRequired.hashCode ^
        keywords.hashCode ^
        hashTags.hashCode ^
        registration.hashCode ^
        likes.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}

class EventLocation {
  final List<double>? coordinates;
  final String? type;
  EventLocation({
    this.coordinates,
    this.type,
  });

  EventLocation copyWith({
    List<double>? coordinates,
    String? type,
  }) {
    return EventLocation(
      coordinates: coordinates ?? this.coordinates,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coordinates': coordinates,
      'type': type ?? '',
    };
  }

  factory EventLocation.fromMap(Map<String, dynamic> map) {
    return EventLocation(
      coordinates: map['coordinates'] != null ? List<double>.from((map['coordinates'] as List<dynamic>)) : [],
      type: map['type'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EventLocation.fromJson(String source) => EventLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'EventLocation(coordinates: $coordinates, type: $type)';

  @override
  bool operator ==(covariant EventLocation other) {
    if (identical(this, other)) return true;

    return listEquals(other.coordinates, coordinates) && other.type == type;
  }

  @override
  int get hashCode => coordinates.hashCode ^ type.hashCode;
}

class UserHere {
  final String id; // The user ID
  final String firstName; // The user's first name
  final String lastName; // The user's last name
  final bool isVerified; // Whether the user is verified

  UserHere({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.isVerified,
  });

  factory UserHere.fromMap(Map<String, dynamic> map) {
    return UserHere(
      id: map['_id'] as String? ?? '', // Provide a default value if null
      firstName: map['firstName'] as String? ?? '', // Provide a default value if null
      lastName: map['lastName'] as String? ?? '', // Provide a default value if null
      isVerified: map['isVerified'] as bool? ?? false, // Provide a default value if null
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'isVerified': isVerified,
    };
  }
}

