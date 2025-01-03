import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/functions/my_bloc_observer.dart';
import 'package:bookly_app/core/utils/functions/setup_service_locator.dart';
import 'package:bookly_app/core/utils/shared/entities/book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class InitializationService {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BookEntityAdapter());
    await Hive.openBox<BookEntity>(kFeaturedBox);
    await Hive.openBox<BookEntity>(kNewestdBox);
    await Hive.openBox<BookEntity>(kSimilarBox);

    // Hive.registerAdapter(SearchBookEntitiesAdapter());
    await Hive.openBox<BookEntity>(kSearchBox);

    Bloc.observer = MyBlocObserver();
    setupServersLocator();
  }
}
