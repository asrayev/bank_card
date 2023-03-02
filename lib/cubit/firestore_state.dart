import '../data/model/card_model.dart';

abstract class PostCardState  {
  const PostCardState();

}

class PostCardInitial extends PostCardState {}

class CardLoading extends PostCardState {}

class PostCardSuccess extends PostCardState {}

class GetCardSuccess extends PostCardState {
  List<CardModel> data;

  GetCardSuccess({required this.data});
}


class CardError extends PostCardState {
  final String message;

  const CardError({required this.message});

}