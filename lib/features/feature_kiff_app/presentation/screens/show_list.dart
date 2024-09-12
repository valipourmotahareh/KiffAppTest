import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiff_app_test/core/dependency_injection/locator.dart';
import 'package:kiff_app_test/features/feature_kiff_app/data/models/item_data.dart';
import 'package:kiff_app_test/features/feature_kiff_app/presentation/bloc/kiff_app_bloc.dart';
import 'package:kiff_app_test/features/feature_kiff_app/presentation/bloc/kiff_app_status.dart';
import 'package:kiff_app_test/features/feature_kiff_app/presentation/screens/show_list_two.dart';

class ShowList extends StatelessWidget {
  const ShowList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<KiffAppBloc>(),
      child: BlocConsumer<KiffAppBloc, KiffAppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state.kiffAppStatus is KiffAppLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          if (state.kiffAppStatus is KiffAppCompleted) {
            final KiffAppCompleted kiffAppCompleted =
                state.kiffAppStatus as KiffAppCompleted;
            final List<ItemData> itemData = kiffAppCompleted.itemData;
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      'خانه',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'متن خود را وارد کنید',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'متن خود را وارد کنید',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                // گوشه‌های گرد
                                borderSide: BorderSide.none, // بدون خط دور
                              ),
                              // padding چپ و راست
                              fillColor: Colors.grey.withOpacity(0.3),
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy),
                        onPressed: () {
                          // عمل کپی متن
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ShowListTwo(),
                              ),
                            );
                          },
                          child: const Text(
                            'صفحه لیست آیتم ها',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'لیستی با${itemData.length}',
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: itemData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                Icons.circle,
                                color: Colors.red,
                                size: 5,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                itemData[index].text ?? '',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
