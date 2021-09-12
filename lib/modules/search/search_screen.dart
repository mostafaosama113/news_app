import 'package:flutter/material.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var data = NewsCubit.get(context).search;
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    style: Theme.of(context).textTheme.bodyText1,
                    autofocus: true,
                    controller: searchController,
                    onChanged: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'بحث',
                        labelStyle: Theme.of(context).textTheme.bodyText1,
                        prefixIcon: Icon(
                          Icons.search,
                          color: NewsCubit.get(context).isDark
                              ? Colors.white
                              : Colors.black,
                        )),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return buildArticaleItem(
                            context, NewsCubit.get(context).search[index]);
                      },
                      separatorBuilder: (context, index) => getSeperatedLine(),
                      itemCount: NewsCubit.get(context).search.length),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
