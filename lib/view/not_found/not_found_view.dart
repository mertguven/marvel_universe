import 'package:flutter/material.dart';
import 'package:marvel_universe/core/constants/local_keys.dart';

class NotFoundView extends StatefulWidget {
  const NotFoundView({Key? key}) : super(key: key);

  @override
  State<NotFoundView> createState() => _NotFoundViewState();
}

class _NotFoundViewState extends State<NotFoundView> {
  final String _notFound = LocaleKeys.pageNotFound;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(_notFound)),
    );
  }
}
