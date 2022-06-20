import 'package:flutter/material.dart';
import 'package:marvel_universe/core/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

class ListTileLoadingWidget extends StatelessWidget {
  const ListTileLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: const Color(0xFFEBEBF4),
      child: _modelContainer(context),
    );
  }

  Container _modelContainer(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
    );
  }
}
