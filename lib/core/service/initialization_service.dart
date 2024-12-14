import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

class InitializationService {
  Future<void> initialize() async {
    await Hive.initFlutter();
    await Hive.openBox(kFeaturedBox);
    await Hive.openBox(kNewestdBox);
    Hive.registerAdapter(BookEntityAdapter());
  }
}
