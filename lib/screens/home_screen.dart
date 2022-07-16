import 'package:breaking_bad/cubit/cubit.dart';
import 'package:breaking_bad/cubit/states.dart';
import 'package:breaking_bad/shared/local/ma_colors.dart';
import 'package:breaking_bad/shared/local/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.myYellow,
          title: const Text(
            "Breaking Bad",
            style: TextStyle(color: MyColors.myGrey),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: MyColors.myGrey,
            child: Column(
              children: [
                GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                    childAspectRatio: 2/3,
                    crossAxisSpacing:1,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (context,index)=>MyWidgets.gridViewItem(
                      AppCubit.get(context).characters[index],
                      context
                  ),
                  itemCount: AppCubit.get(context).characters.length,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

