import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hikkingfinder_web/models/event_model.dart';
import 'package:hikkingfinder_web/services/storage_method.dart';
import 'package:uuid/uuid.dart';

class FirebaseMethods {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  var uuid = Uuid().v4();

  Future<String> createEvent(
      Uint8List eventPhoto,
      String eventDescriptionController,
      String eventlocationController,
      String eventDateController,
      String eventNameController,
      String eventElevationControler,
      String eventDistanceController,
      String eventtimeController,
      String eventLinkController) async {
    String res = "Some Information is Missing";
    try {
      String clubPhoto = await StorageMethods()
          .uploadImageToStorage("clubCoverPhoto", eventPhoto, true);

      EventModel postModel = EventModel(
          eventDate: eventDateController,
          eventDescription: eventDescriptionController,
          eventDistance: eventDistanceController,
          eventElevation: eventElevationControler,
          eventLink: eventLinkController,
          eventName: eventNameController,
          eventLocation: eventlocationController,
          eventPhoto: clubPhoto,
          eventTime: eventtimeController);

      ///Uploading Post To Firebase
      _firebaseFirestore.collection('events').doc(uuid).set(postModel.toJson());
      res = 'Successfully Event is Created';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
