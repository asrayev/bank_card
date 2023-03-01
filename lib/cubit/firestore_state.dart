abstract class PostModelState  {
  const PostModelState();

  @override
  List<Object> get props => [];
}

class PostModelInitial extends PostModelState {}

class PostModelLoading extends PostModelState {}

class PostModelSuccess extends PostModelState {}

class PostModelError extends PostModelState {
  final String message;

  const PostModelError({required this.message});

  @override
  List<Object> get props => [message];
}