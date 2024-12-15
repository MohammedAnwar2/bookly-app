import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/core/utils/functions/my_bloc_observer.dart';
import 'package:bookly_app/core/utils/functions/setup_service_locator.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class InitializationService {
  Future<void> initialize() async {
    await Hive.initFlutter();
    await Hive.openBox<BookEntity>(kFeaturedBox);
    await Hive.openBox<BookEntity>(kNewestdBox);
    Hive.registerAdapter(BookEntityAdapter());
    Bloc.observer = MyBlocObserver();
    setupServersLocator();
  }
}
