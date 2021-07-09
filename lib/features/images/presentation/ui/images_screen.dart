import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shutterstock_client/features/images/presentation/ui/keys/images_screen_keys.dart';
import 'package:shutterstock_client/features/images/presentation/ui/widgets/simple_images_list_widget.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key(ImagesScreenKeys.SCAFOLD_KEY),
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text(
          "Shutterstock Images",
          key: Key(ImagesScreenKeys.TITLE_TEXT_KEY),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
      key: Key(ImagesScreenKeys.BODY_KEY),
      child: SimpleImageListWidget(
        key: Key(ImagesScreenKeys.IMAGE_LIST_WIDGET_KEY),
      ),
    );
  }
}
