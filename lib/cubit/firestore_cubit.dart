// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_exam/data/model/card_model.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/service/firestore_service.dart';
import 'firestore_state.dart';



class PostModelCubit extends Cubit<PostModelState> {
  final FirebaseFirestore _firestore;

  PostModelCubit({
    required FirebaseFirestore firestore,
  })   : _firestore = firestore,
        super(PostModelInitial());

  Future<void> postCardModelToFirestore(CardModel cardModel) async {
    emit(PostModelLoading());
    try {
      await FireStoreService(fireStore: _firestore).addCard(cardModel: cardModel);
      emit(PostModelSuccess());
    } catch (e) {
      emit(PostModelError(message: e.toString()));
    }
  }
}