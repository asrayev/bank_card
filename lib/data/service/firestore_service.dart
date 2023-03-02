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

  Future<void> deleteCardById({required String id}) async {
    try {
      await _firestore.collection("cards").doc(id).delete();
      print("Card Deleted Success");
    } on FirebaseException catch (er) {
      print("Card Deleted ERROR $er");
    }
  }

  Future<void> updateCard({required CardModel cardModel}) async {
    try {
      await _firestore
          .collection("cards")
          .doc(cardModel.id)
          .update(cardModel.toJson());

      print("Buyurtma muvaffaqiyatli yangilandi!");
    } on FirebaseException catch (er) {
      print("Update ERROR $er");
    }
  }

  Stream<List<CardModel>> getAllCards() =>
      _firestore.collection("cards").snapshots().map(
            (e) => e.docs
            .map((doc) => CardModel.fromJson(doc.data()))
            .toList(),
      );

}