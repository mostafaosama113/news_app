import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      // ignore: missing_return
      builder: (BuildContext context, state) {
        var bloc = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('اخبار'),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {
                  navigateTo(context, SearchScreen());
                  //todo navigate to search page
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
                onPressed: () {
                  NewsCubit.get(context).toggleDarkMode();
                },
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bloc.currentIndex,
            items: bloc.bottomItems,
            onTap: (index) => bloc.changeBottomNavBar(index),
          ),
          body: bloc.screenList[bloc.currentIndex],
        );
      },
    );
  }
}
