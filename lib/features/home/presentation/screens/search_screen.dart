import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_chat/features/home/cubit/search_cubit/search_cubit.dart';
import 'package:smile_chat/features/home/model/chat_model.dart';
import 'package:smile_chat/features/home/presentation/widgets/empty_search_content.dart';
import 'package:smile_chat/features/home/presentation/widgets/no_results_found_when_you_search_widget.dart';
import 'package:smile_chat/features/home/presentation/widgets/search_item.dart';
import 'package:smile_chat/features/home/presentation/widgets/search_list_view.dart';
import 'package:smile_chat/features/home/presentation/widgets/search_text_form_field.dart';
import 'package:smile_chat/utils/app_color.dart';

class SearchScreen extends StatefulWidget {
  final List<ChatModel> chats;

  const SearchScreen({
    super.key,
    required this.chats,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchCubit>(context).setAllChats(widget.chats);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.whiteColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
            child: SafeArea(
              child: Column(
                children: [
                  SearchTextFromField(
                    controller: controller,
                    onChanged: (searchedChat) {
                      BlocProvider.of<SearchCubit>(context)
                          .filterChats(searchedChat);
                    },
                    onTapRemoveIcon: () {
                      if (controller.text.isEmpty) {
                        Navigator.pop(context);
                      } else {
                        controller.clear();
                        BlocProvider.of<SearchCubit>(context).clearSearch();
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: buildSearchContent(state),
                  ),
                  const SizedBox(height: 8)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildSearchContent(SearchState state) {
    if (!state.hasSearched! && controller.text.isEmpty) {
      return const EmptySearchContent();
    }

    if (state.filteredChats.isEmpty && state.hasSearched!) {
      return const NoResultsFoundWhenYouSearchWidget();
    }

    return SearchListView(
      itemcount: state.filteredChats.length,
      itemBuilder: (context, index) {
        return SearchItem(
          model: state.filteredChats[index],
        );
      },
    );
  }
}
