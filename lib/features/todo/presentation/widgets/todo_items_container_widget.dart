import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/core/constants/homepage.dart';

class TodoItemsContainerWidget extends ConsumerWidget {
  const TodoItemsContainerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txtConstants = ref.watch(homePageConstantsProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 2.4,
          decoration: BoxDecoration(
              color: Colors.white38, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      txtConstants.txtDailyTasks,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.amber,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 2.85,
                width: MediaQuery.sizeOf(context).width,
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Container(
                        height: 60,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: Colors.amber,
                              size: 32,
                            ),
                            const Text(
                              "Styudy at 6 am",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 115,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.amber,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.amber,
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
