import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breaking_bad/cubit/cubit.dart';
import 'package:breaking_bad/cubit/states.dart';
import 'package:breaking_bad/models/character.dart';
import 'package:breaking_bad/shared/local/ma_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterDetails extends StatelessWidget {
  CharacterDetails({Key? key, required this.character}) : super(key: key);
  Character character;

  Widget buildSliverAppBar() {

    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.nickname!,
          style: const TextStyle(
            color: MyColors.myWhite,
          ),
        ),
        centerTitle: true,
        background: Hero(
            tag:character.char_id!,
            child: Image.network(
                character.img!,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context,Object object,StackTrace? stackTrace)
                {
                  return const Icon(
                    Icons.image_not_supported_outlined,
                    size: 100,
                    color: MyColors.myWhite,
                  );
                },
            )),
      ),
    );
  }

  Widget myDivider(double end) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: end,
      thickness: 2,
    );
  }

  Widget characterInfo({
    required String title,
    required String value,
  }) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 16,
              color: MyColors.myWhite,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AppCubit>(context).getQuote(character.name!);
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo(
                        title: "Job :   ",
                        value: character.occupation!.join(" / ")),
                    myDivider(150),
                    characterInfo(
                        title: "Appeared in :   ", value: character.category!),
                    myDivider(200),
                    characterInfo(
                        title: "Seasons :   ",
                        value: character.appearance!.join(" / ")),
                    myDivider(250),
                    characterInfo(
                        title: "Status :   ", value: character.status!),
                    myDivider(200),
                    character.better_call_saul_appearance!.isNotEmpty
                        ? characterInfo(
                        title: "Better Call Saul Seasons :-  ",
                        value: character.better_call_saul_appearance!
                            .join(" / "))
                        : const SizedBox(),
                    character.better_call_saul_appearance!.isNotEmpty
                        ? myDivider(250)
                        : const SizedBox(),
                    characterInfo(
                        title: "Actor/Actress  :   ",
                        value: character.portrayed!),
                    myDivider(250),
                    const SizedBox(
                      height: 100,
                    ),
                    BlocBuilder<AppCubit,AppStates>(
                      builder:(context,state,)=>
                         Center(
                            child: AnimatedTextKit(
                                animatedTexts: [
                                 TypewriterAnimatedText("It is not enough to do beat",
                                  textStyle: const TextStyle(color: MyColors.myYellow, fontSize: 40,),),
                                 TypewriterAnimatedText("you must know what to do",
                                  textStyle: const TextStyle(color: MyColors.myYellow, fontSize: 40,),),
                                  TypewriterAnimatedText("and then do your best",
                                    textStyle: const TextStyle(color: MyColors.myYellow, fontSize: 40,),),
                                  TypewriterAnimatedText("- W.edwards Deming ",
                                    textStyle: const TextStyle(color: MyColors.myYellow, fontSize: 40,),),
                                ]),
                        )
                    ),
                    const SizedBox(
                      height: 500,
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
