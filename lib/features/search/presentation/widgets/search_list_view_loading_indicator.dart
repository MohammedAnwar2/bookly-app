import 'package:flutter/material.dart';

import 'list_view_items_loading_indicator.dart';

class SearchListViewLoadingIndicator extends StatelessWidget {
  const SearchListViewLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListViewItemsLoadingIndicator(),
        );
      },
    );
  }
}
