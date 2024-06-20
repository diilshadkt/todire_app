import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/core/constants/homepage.dart';
import 'package:task_app/features/todo/presentation/widgets/profile_part_widget.dart';
import 'package:task_app/features/todo/presentation/widgets/todo_items_container_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txtConstants = ref.watch(homePageConstantsProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const ProfilePartWidget(),

          /// Good morning text
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15),
                child: Text(
                  txtConstants.txtGoodMorning,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),

          /// Todo items list container
          const TodoItemsContainerWidget(),
        ],
      ),
    );
  }
}
