import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shutterstock_client/features/images/domain/entities/images_page.dart';
import 'package:shutterstock_client/features/images/presentation/bloc/images_bloc.dart';
import 'package:shutterstock_client/features/images/presentation/ui/keys/simple_images_list_keys.dart';

class SimpleImageListWidget extends StatefulWidget {
  SimpleImageListWidget({Key key}) : super(key: key);

  @override
  _SimpleImageListWidgetState createState() => _SimpleImageListWidgetState();
}

class _SimpleImageListWidgetState extends State<SimpleImageListWidget> {
  static const _pageSize = 10;
  int currentPageNumber = 1;
  int currentPageKey = 1;
  ImagesBloc _imagesBloc;
  final PagingController<int, ImageData> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _imagesBloc = BlocProvider.of<ImagesBloc>(context);
    _pagingController.addPageRequestListener(_loadImages);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _buildBlocListener();

  BlocListener<ImagesBloc, ImagesState> _buildBlocListener() {
    return BlocListener<ImagesBloc, ImagesState>(
      key: Key(SimpleImagesListKeys.BLOC_LISTENER_KEY),
      listener: (context, state) {
        _handleState(state);
      },
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.white,
      child: PagedListView<int, ImageData>(
        key: Key(SimpleImagesListKeys.PAGED_LIST_VIEW_KEY),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<ImageData>(
          itemBuilder: (context, item, index) => _buildListItem(item, index),
          animateTransitions: true,
          firstPageErrorIndicatorBuilder: (context) => _buildErrorState(),
          newPageErrorIndicatorBuilder: (context) => _buildErrorState(),
        ),
      ),
    );
  }

  Padding _buildListItem(ImageData item, int index) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        key: Key(SimpleImagesListKeys.LIST_ITEM_KEY_PRIFIX + '_$index'),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 1),
                  blurRadius: 3,
                  spreadRadius: 1)
            ]),
        child: Column(
          children: [
            CachedNetworkImage(
              key: Key(
                  SimpleImagesListKeys.LIST_ITEM_IMAGE_KEY_PRIFIX + '_$index'),
              imageUrl: item.assetsData.preview.url,
              placeholder: (context, url) => Center(
                  child: Container(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator())),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                item.description,style: TextStyle(color: Colors.black,fontSize: 16),
                key: Key(
                    SimpleImagesListKeys.LIST_ITEM_DESC_KEY_PRIFIX + '_$index'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return BlocBuilder<ImagesBloc, ImagesState>(
      builder: (context, state) {
        var msg = "";
        if (state is ImagesFailure) {
          msg = state.msg;
        }
        return Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                msg,
                key: Key(SimpleImagesListKeys.ERROR_TEXT_KEY),
              ),
              TextButton(
                  key: Key(SimpleImagesListKeys.RETRY_BUTTON_KEY),
                  onPressed: () {
                    _pagingController.retryLastFailedRequest();
                  },
                  child: Text(
                    "Try Again",
                    key: Key(SimpleImagesListKeys.RETRY_TEXT_KEY),
                  )),
            ],
          ),
        );
      },
    );
  }

  _loadImages(int pageKey) {
    currentPageKey = pageKey;
    currentPageNumber = _getCurrentPageNumber(pageKey);
    _imagesBloc.loadImages(
        query: "Nature",
        pageNumber: currentPageNumber,
        imagesPerPage: _pageSize);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  void _handleState(ImagesState state) {
    if (state is ImagesSuccess) {
      var images = state.imagesPage.imagesData;
      final isLastPage = images.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(images);
      } else {
        final nextPageKey = currentPageKey + images.length;
        _pagingController.appendPage(images, nextPageKey);
      }
    } else if (state is ImagesFailure) {
      _pagingController.error = state;
    }
  }

  int _getCurrentPageNumber(int pageKey) {
    return (pageKey / _pageSize).round() + 1;
  }
}
