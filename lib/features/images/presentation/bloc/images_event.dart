part of 'images_bloc.dart';

abstract class ImagesEvent extends Equatable {
  const ImagesEvent();

  @override
  List<Object> get props => [];
}

class LoadImagesEvent extends ImagesEvent {
  final String query;
  final int pageNumber;
  final int itemsPerPage;

  LoadImagesEvent({this.query, this.pageNumber, this.itemsPerPage});
}
