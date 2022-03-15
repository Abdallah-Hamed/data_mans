import 'package:data_mans/Network/remote/dio_Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('NewsApp'),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                DioHelper.getData(url: 'v2/top-headlines', quiry: {
                  'country': 'eg',
                  'category': 'business',
                  'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
                }).then((value) {
                  print(value.data.toString());
                }).catchError((error) {
                  print(error.toString());
                });
              },
              child: Icon(
                Icons.add,
              ),
            ),
            body: cubit.Screens[cubit.current_index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.current_index,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.BottomItems,
            ),
          );
        },
      ),
    );
  }
}
