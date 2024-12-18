import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Row(
        children: [
          Text("Bookly",
              style: AppStyles.styleAguDisplayRegular20(context),
              textAlign: TextAlign.center),
          const Spacer(),
          GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.searchView);
              },
              child: const Icon(FontAwesomeIcons.magnifyingGlass, size: 22))
        ],
      ),
    );
  }
}
