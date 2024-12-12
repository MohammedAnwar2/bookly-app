import 'package:bookly_app/core/utils/constants/app_style.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_aoo_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const FeaturedBookListView(),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 24),
            child:
                Text("Best Seller", style: AppStyles.styleSemiBolde18(context)),
          )
        ],
      ),
    );
  }
}
