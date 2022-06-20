import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marvel_universe/core/constants/assets_constants.dart';
import 'package:marvel_universe/core/constants/local_keys.dart';
import 'package:marvel_universe/core/extensions/context_extension.dart';
import 'package:marvel_universe/core/extensions/string_extension.dart';
import 'package:marvel_universe/core/helper/app_router.dart';
import 'package:marvel_universe/cubit/characters/characters_cubit.dart';
import 'package:marvel_universe/model/character/characters_request_model.dart';
import 'package:marvel_universe/model/character/characters_response_model.dart';
import 'package:marvel_universe/view/home/characters/components/listtile_loading_widget.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({Key? key}) : super(key: key);

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  ScrollController scrollController = ScrollController();
  int offset = 0;
  int offsetIncrements = 30;
  bool gotTheWholeList = false;
  List<Results> characterList = <Results>[];

  @override
  void initState() {
    _fetch();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await _fetch(offset += offsetIncrements);
      }
    });
    super.initState();
  }

  Future<void> _fetch([int offset = 0]) async {
    context
        .read<CharactersCubit>()
        .fetchCharacters(CharactersRequestModel(offset: offset));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: BlocConsumer<CharactersCubit, CharactersState>(
        listener: (context, state) {
          if (state is CharactersLoadedState &&
              state.model.data != null &&
              state.model.data!.results != null) {
            characterList.addAll(state.model.data!.results ?? []);
            if (state.model.data!.results!.length < offsetIncrements) {
              gotTheWholeList = true;
            }
          }
        },
        builder: (context, state) {
          if (state is CharactersLoadedState) {
            return _characterListWidget();
          } else if (state is CharactersLoadingState) {
            return ListView.separated(
              shrinkWrap: true,
              padding: context.p10,
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const ListTileLoadingWidget();
              },
            );
          } else {
            return Center(child: Text(LocaleKeys.somethingWentWrong));
          }
        },
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      centerTitle: true,
      title: Image.asset(
        AssetsConstants.logo,
        width: context.appbarSize,
      ),
    );
  }

  Widget _characterListWidget() => SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              padding: context.p10,
              itemCount: characterList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, Screens.characterDetailView,
                      arguments: characterList[index]),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      height: context.screenHeight * 0.15,
                      padding: context.por10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.05),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _characterImageWidget(index),
                          _characterNameWidget(index),
                          _chevronRightWidget(),
                        ],
                      )),
                );
              },
            ),
            Visibility(
              visible: !gotTheWholeList,
              child: Padding(
                padding: context.p10,
                child: const ListTileLoadingWidget(),
              ),
            ),
          ],
        ),
      );

  Widget _characterImageWidget(int index) => ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      child: FadeInImage.assetNetwork(
        placeholder: AssetsConstants.logoWithBg,
        image: "".formatImagePath(characterList[index].thumbnail!.path!,
            characterList[index].thumbnail!.extension!),
        width: context.screenWidth * 0.34,
        fit: BoxFit.cover,
      ));

  Flexible _characterNameWidget(int index) => Flexible(
        child: Text(
          characterList[index].name ?? LocaleKeys.characters.characterName,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      );

  Icon _chevronRightWidget() => Icon(
        FontAwesomeIcons.chevronRight,
        color: Theme.of(context).colorScheme.primary,
        size: 18,
      );
}
