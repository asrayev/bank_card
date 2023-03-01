// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/data/model/card_model.dart';

class FireStoreService {
  final FirebaseFirestore _firestore;

  FireStoreService({required FirebaseFirestore fireStore})
      : _firestore = fireStore;
  Future<void> addCard({required CardModel cardModel}) async {
    try {
      DocumentReference newCard =
      await _firestore.collection("cards").add(cardModel.toJson());
      await _firestore.collection("cards").doc(newCard.id).update({
        "id": newCard.id,
      });

    } on FirebaseException catch (er) {
      print(er.message.toString());
    }
  }
  // Future<void> postModelToFirestore(String collection, MyModel model) async {
  //   try {
  //     await _firestore.collection(collection).add(model.toMap());
  //   } catch (e) {
  //     throw Exception('Failed to post data to Firestore: $e');
  //   }
  // }
}