import 'package:flutter/material.dart';

class SearchProvider<T> with ChangeNotifier {
  TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  set searchController(TextEditingController value) {
    _searchController = value;
    notifyListeners();
  }

  bool _isSearch = false;
  bool get isSearch => _isSearch;

  set isSearch(bool value) {
    _isSearch = value;
    notifyListeners();
  }

  List<T> _searchResults = [];
  List<T> get searchResults => _searchResults;

  set searchResults(List<T> value) {
    _searchResults = value;
    notifyListeners();
  }
}
