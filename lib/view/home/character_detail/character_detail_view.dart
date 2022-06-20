import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marvel_universe/core/constants/assets_constants.dart';
import 'package:marvel_universe/core/constants/local_keys.dart';
import 'package:marvel_universe/core/extensions/context_extension.dart';
import 'package:marvel_universe/core/extensions/string_extension.dart';
import 'package:marvel_universe/cubit/character_detail/character_detail_cubit.dart';
import 'package:marvel_universe/model/character/characters_response_model.dart';
import 'package:marvel_universe/model/detail/character_comics_request_model.dart';
import 'package:marvel_universe/model/detail/character_comics_response_model.dart';
import 'package:marvel_universe/view/home/character_detail/components/container_loading_widget.dart';

class CharacterDetailView extends StatefulWidget {
  final Results model;
  const CharacterDetailView({Key? key, required this.model}) : super(key: key);

  @override
  State<CharacterDetailView> createState() => _CharacterDetailViewState();
}

class _CharacterDetailViewState extends State<CharacterDetailView> {
  late Results character;

  List<ComicsResults> comicsList = <ComicsResults>[];

  @override
  void initState() {
    character = widget.model;
    _fetchComics();
    super.initState();
  }

  Future<void> _fetchComics() async {
    context
        .read<CharacterDetailCubit>()
        .fetchCharacterComics(CharacterComicsRequestModel(character.id!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          FadeInImage.assetNetwork(
            placeholder: AssetsConstants.logoWithBg,
            image: "".formatImagePath(
                character.thumbnail!.path!, character.thumbnail!.extension!),
            width: double.infinity,
          ),
          _infoWidget(),
        ],
      ),
    );
  }

  Column _infoWidget() {
    return Column(
      children: [
        const Spacer(),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            height: context.screenHeight * 0.5,
            padding: context.p10,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.elliptical(80, 40),
                  topLeft: Radius.elliptical(80, 40)),
            ),
            child: Column(
              children: [
                _characterNameWidget(),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleTextWidget(
                            LocaleKeys.characterDetail.description),
                        _descriptionWidget(),
                        _titleTextWidget(LocaleKeys.characterDetail.comics),
                        BlocConsumer<CharacterDetailCubit,
                            CharacterDetailState>(
                          listener: (context, state) {
                            if (state is CharacterDetailLoadedState &&
                                state.model.data != null &&
                                state.model.data!.results != null) {
                              comicsList.addAll(state.model.data!.results!);
                            }
                          },
                          builder: (context, state) {
                            if (state is CharacterDetailLoadedState) {
                              return comicsList.isEmpty
                                  ? SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                          LocaleKeys.characterDetail.noComics))
                                  : Column(
                                      children: [
                                        _comicsWidget(),
                                        Padding(
                                          padding: context.p10,
                                          child: Text(
                                              state.model.attributionText ??
                                                  ""),
                                        )
                                      ],
                                    );
                            } else if (state is CharacterDetailLoadingState) {
                              return _loadingGrid();
                            } else {
                              return Center(
                                  child: Text(LocaleKeys.somethingWentWrong));
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  GridView _loadingGrid() {
    return GridView.builder(
      shrinkWrap: true,
      padding: context.p0,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
      itemBuilder: (context, index) {
        return const ContainerLoadingWidget();
      },
    );
  }

  GridView _comicsWidget() {
    return GridView.builder(
      shrinkWrap: true,
      padding: context.p0,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: comicsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
      itemBuilder: (context, index) => Column(
        children: [
          Expanded(
            child: FadeInImage.assetNetwork(
              placeholder: AssetsConstants.logoWithBg,
              image: "".formatImagePath(comicsList[index].thumbnail!.path!,
                  comicsList[index].thumbnail!.extension!),
            ),
          ),
          Text(comicsList[index].title!,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Text _descriptionWidget() {
    return Text(character.description == "" || character.description == null
        ? LocaleKeys.characterDetail.noDescription
        : character.description!);
  }

  Align _characterNameWidget() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        character.name!,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  AppBar get _appbar => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              color: Theme.of(context).colorScheme.primary,
            )),
      );

  Widget _titleTextWidget(String text) => Padding(
        padding: context.pv20,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      );
}
