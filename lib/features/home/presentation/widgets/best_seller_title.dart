import 'package:bookly_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class BestSellerTextTile extends StatelessWidget {
  const BestSellerTextTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 24),
      child: Text("Best Seller", style: AppStyles.styleSemiBolde18(context)),
    );
  }
}
