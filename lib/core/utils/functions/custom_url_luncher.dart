import 'package:bookly_app/core/utils/functions/custom_snac_bar_error.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customUrlLuncher(BuildContext context) async {
  final Uri url = Uri.parse('https://flutter.dev');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    showErrorSnackBar(context, "this book not found");
  }
}
