import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContainerLoadingWidget extends StatelessWidget {
  const ContainerLoadingWidget({Key? key}) : super(key: key);

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
    );
  }
}
