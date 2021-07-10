import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shutterstock_client/features/images/presentation/ui/keys/images_screen_keys.dart';
import 'package:shutterstock_client/features/images/presentation/ui/widgets/search_app_bar.dart';
import 'package:shutterstock_client/features/images/presentation/ui/widgets/simple_images_list_widget.dart';

class ImagesScreen extends StatelessWidget {
  static String routeName = 'ImagesScreen';
  ImagesScreen({Key key}) : super(key: key);

  final GlobalKey<SimpleImageListWidgetState> _imageListKey =
      GlobalKey<SimpleImageListWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key(ImagesScreenKeys.SCAFOLD_KEY),
      appBar: SearchAppBar(
        title: _buildTitleText(),
        searchHint: 'Search Images ..',
        onSearchQueryChanged: _onSearchQueryChanged,
      ),
      body: _buildBody(),
    );
  }

  Text _buildTitleText() {
    return Text.rich(
      TextSpan(
          text: 'Shutterstock ',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          children: <InlineSpan>[
            TextSpan(
              text: 'Client',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            )
          ]),
      key: Key(ImagesScreenKeys.TITLE_TEXT_KEY),
    );
  }

  Container _buildBody() {
    return Container(
      key: Key(ImagesScreenKeys.BODY_KEY),
      child: _simpleImageListWidget(),
    );
  }

  Container _simpleImageListWidget() {
    return Container(
      key: Key(ImagesScreenKeys.IMAGE_LIST_WIDGET_KEY),
      child: SimpleImageListWidget(
        key: _imageListKey,
      ),
    );
  }

  _onSearchQueryChanged(String query) {
    _imageListKey.currentState.updateSearchQuery(query);
  }
}
