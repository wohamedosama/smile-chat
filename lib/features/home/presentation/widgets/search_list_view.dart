import 'package:flutter/material.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
    required this.itemcount,
    required this.itemBuilder,
  });
  final int itemcount;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 6),
          itemBuilder: itemBuilder,
          itemCount: itemcount),
    );
  }
}
