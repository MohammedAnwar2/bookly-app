import 'package:bookly_app/features/home/presentation/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly_app/features/home/presentation/widgets/best_seller_list_view_bloc_builder.dart';
import 'package:bookly_app/features/home/presentation/widgets/best_seller_title.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/widgets/featured_book_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController _scrollController = ScrollController();
  bool loading = false;
  int nextPage = 1;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scroll);
  }

  void _scroll() async {
    if (_scrollController.position.pixels >=
        0.7 * _scrollController.position.maxScrollExtent) {
      if (!loading) {
        loading = true;
        await BlocProvider.of<NewestBookCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);
        loading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBookListViewBlocConsumer(),
              SizedBox(height: 50),
              BestSellerTextTile(),
            ],
          ),
        ),
        BestSellerListViewBlocBuilder(),
        SliverToBoxAdapter(child: SizedBox(height: 30)),
      ],
    );
  }
}
