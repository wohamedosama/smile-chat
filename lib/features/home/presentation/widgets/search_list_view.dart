import 'package:flutter/material.dart';
import 'package:smile_chat/features/home/model/data/search_model_list.dart';
import 'package:smile_chat/features/home/presentation/widgets/search_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 6),
        itemBuilder: (context, index) => SearchItem(model: model[index]),
        itemCount: model.length,
      ),
    );
  }
}
