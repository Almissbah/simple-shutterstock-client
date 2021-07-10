import 'package:flutter/material.dart';
import 'package:shutterstock_client/features/images/presentation/ui/keys/search_app_keys.dart';

class SearchAppBar extends StatefulWidget with PreferredSizeWidget {
  final Widget title;
  final String searchHint;
  final Function(String) onSearchQueryChanged;
  const SearchAppBar(
      {Key key, @required this.title, @required this.onSearchQueryChanged, this.searchHint='Search ..'})
      : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}

class _SearchAppBarState extends State<SearchAppBar> {
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "";
  @override
  Widget build(BuildContext context) {
    return AppBar(key: Key(SearchAppBarKeys.APP_BAR_KEY),
      elevation: 3,
      backgroundColor: Colors.white,
      leading: _isSearching ? _buildBackButton() : Container(),
      title: _isSearching ? _buildSearchField() : widget.title,
      actions: _buildActions(),
    );
  }

   

  BackButton _buildBackButton() {
    return BackButton(
      key: Key(SearchAppBarKeys.BACK_BUTTON_KEY),
      color: Colors.black,
      onPressed: () {
        setState(() {
          _isSearching = false;
        });
      },
    );
  }

  Widget _buildSearchField() {
    return TextField(
      key: Key(SearchAppBarKeys.SEARCH_FIELD_KEY),
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: widget.searchHint,
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black),
      ),
      style: TextStyle(color: Colors.black, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          key: Key(SearchAppBarKeys.CLEAR_BUTTON_KEY),
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
          onPressed: () {
            _stopSearching();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        key: Key(SearchAppBarKeys.SEARCH_BUTTON_KEY),
        icon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
      widget.onSearchQueryChanged(searchQuery); 
    });
  }

  void _stopSearching() {
    _clearSearchQuery();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }
}
