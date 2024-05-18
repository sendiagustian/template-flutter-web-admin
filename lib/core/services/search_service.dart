import '../providers/search_provider.dart';

class SearchService {
  List<Map<String, dynamic>> onChangeSearch({
    required String textSearch,
    required List<String> searchKeys,
    required SearchProvider searchProvider,
    required List<Map<String, dynamic>> searchDatas,
  }) {
    if (textSearch.isNotEmpty) {
      searchProvider.isSearch = true;
      return searchDatas.where((element) {
        return searchKeys.any((key) {
          if (key.contains('.')) {
            List<String> keys = key.split('.');
            dynamic value = element;
            for (var k in keys) {
              if (value is Map<String, dynamic>) {
                value = value[k];
              } else {
                return false;
              }
            }
            if (value != null && value.toString().toLowerCase().contains(textSearch.toLowerCase())) {
              return true;
            }
          } else {
            dynamic value = element[key];
            if (value != null && value.toString().toLowerCase().contains(textSearch.toLowerCase())) {
              return true;
            }
          }
          return false;
          // return element[key].toString().toLowerCase().contains(textSearch.toLowerCase());
        });
      }).toList();
    } else {
      searchProvider.isSearch = false;
      return [];
    }
  }

  void onCloseSearch(SearchProvider searchProvider) {
    searchProvider.searchController.clear();
    searchProvider.isSearch = false;
  }

  void clearSearch(SearchProvider searchProvider) {
    searchProvider.searchController.clear();
    searchProvider.searchResults.clear();
    searchProvider.isSearch = false;
  }
}
