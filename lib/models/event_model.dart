import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String eventDate;
  String eventName;
  String eventLocation;
  String eventDescription;
  String eventDistance;
  String eventElevation;
  String eventTime;
  String eventLink;
  String eventPhoto;

  EventModel({
    required this.eventDate,
    required this.eventDescription,
    required this.eventDistance,
    required this.eventElevation,
    required this.eventLink,
    required this.eventLocation,
    required this.eventPhoto,
    required this.eventName,
    required this.eventTime,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'eventDate': eventDate,
        'eventDescription': eventDescription,
        'eventDistance': eventDistance,
        'eventElevation': eventElevation,
        'eventLink': eventLink,
        'eventLocation': eventLocation,
        'eventPhoto': eventPhoto,
        "eventName": eventName,
        'eventTime': eventTime,
      };

  ///
  static EventModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return EventModel(
        eventDate: snapshot['eventDate'],
        eventDescription: snapshot['eventDescription'],
        eventPhoto: snapshot['eventPhoto'],
        eventDistance: snapshot['eventDistance'],
        eventElevation: snapshot['eventElevation'],
        eventLink: snapshot['eventLink'],
        eventLocation: snapshot['eventLocation'],
        eventName: snapshot['eventName'],
        eventTime: snapshot['eventTime']);
  }
}
