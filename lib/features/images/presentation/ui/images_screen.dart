import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shutterstock_client/features/images/presentation/ui/keys/images_screen_keys.dart';
import 'package:shutterstock_client/features/images/presentation/ui/widgets/simple_images_list_widget.dart';

class ImagesScreen extends StatelessWidget {
  static String routeName = 'ImagesScreen';
  const ImagesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key(ImagesScreenKeys.SCAFOLD_KEY),
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text.rich(
          TextSpan(
              text: 'Shutterstock ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              children: <InlineSpan>[
                TextSpan(
                  text: 'Client',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )
              ]),
          key: Key(ImagesScreenKeys.TITLE_TEXT_KEY),
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
