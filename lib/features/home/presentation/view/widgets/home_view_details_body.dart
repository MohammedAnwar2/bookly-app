import 'package:bookly_app/core/utils/app_style.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/action_details_button.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/view/widgets/custom_home_view_details.dart';
import 'package:flutter/material.dart';
import 'book_rating.dart';

class HomeViewDetailsBody extends StatelessWidget {
  const HomeViewDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomHomeViewDetails(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .2),
                  child: const CustomBookImage(),
                ),
                const SizedBox(height: 30),
                Text("The Jungle Book",
                    style: AppStyles.styleSemiBold25(context)),
                Opacity(
                  opacity: 0.7,
                  child: Text("Rudyard Kipling",
                      style: AppStyles.styleSemiBolde18(context)
                          .copyWith(fontStyle: FontStyle.italic)),
                ),
                const SizedBox(height: 18),
                const BookRating(),
                const SizedBox(height: 20),
                const ActionButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
