import 'package:bookly_app/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0.0,
        centerTitle: true,
        title: Text("Discover New Books"),
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.close)),
      ),
      body: SafeArea(child: SearchViewBody()),
    );
  }
}
