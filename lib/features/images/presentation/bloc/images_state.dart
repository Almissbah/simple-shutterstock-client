part of 'images_bloc.dart';

abstract class ImagesState extends Equatable {
  const ImagesState();
  
  @override
  List<Object> get props => [];
}

class ImagesInitial extends ImagesState {}
class ImagesLoading extends ImagesState {}
class ImagesSuccess extends ImagesState {
  final ImagesPage imagesPage;

  ImagesSuccess(this.imagesPage);
}
class ImagesFailure extends ImagesState {
 final String msg;

  ImagesFailure(this.msg);
}