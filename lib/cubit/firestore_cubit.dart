// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_exam/data/model/card_model.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/service/firestore_service.dart';
import 'firestore_state.dart';



class PostCardCubit extends Cubit<PostCardState> {
  final FirebaseFirestore _firestore;

  PostCardCubit({
    required FirebaseFirestore firestore,
  })   : _firestore = firestore,
        super(PostCardInitial());
Future<void> postCardToFirestore(CardModel cardCard) async {
    emit(CardLoading());
    try {
      await FireStoreService(fireStore: _firestore).addCard(cardModel: cardCard);
      emit(PostCardSuccess());
    } catch (e) {

    }
  }

  getAllCards(){
    emit(CardLoading());
    FireStoreService(fireStore: _firestore).getAllCards().listen((List<CardModel> cardModel) {
      emit(GetCardSuccess(data: cardModel));});


  }

  Future<void> deleteCardById({required id})async{
  emit(CardLoading());
  await FireStoreService(fireStore: _firestore).deleteCardById(id: id);

  }


}