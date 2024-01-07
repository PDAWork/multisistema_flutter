import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/app/features/home/presentation/cubit/drop_down_button_app_cubit.dart';
import 'package:multisitema_flutter/app/features/home/presentation/cubit/home_cubit.dart';
import 'package:multisitema_flutter/app/features/home/presentation/widget/bottom_navigation_bar_app.dart';
import 'package:multisitema_flutter/app/features/home/presentation/widget/drawer_app.dart';
import 'package:multisitema_flutter/app/features/home/presentation/widget/drop_down_button_app.dart';
import 'package:multisitema_flutter/app/features/home/presentation/widget/item_card_sensor.dart';

import 'widget/item_car_indicators.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const DropdownButtonApp(),
        // title: AppBar(),
      ),
      drawer: const DrawerApp(),
      bottomNavigationBar: const BottomNavigationBarApp(),
      body: BlocBuilder<DropDownButtonAppCubit, DropDownButtonAppState>(
        builder: (context, state) {
          return switch (state) {
            ErrorState() => const Center(
                child: Text('Упс, произошла техническая ошибка'),
              ),
            OnSelectItemState() => BlocBuilder<HomeCubit, HomeState>(
                builder: (ctx, st) {
                  return switch (st) {
                    HomeError() => const Center(
                        child: Text('Упс, произошла техническая ошибка'),
                      ),
                    HomeSeccues(:final meters) => ScrollConfiguration(
                        behavior: const ScrollBehavior(),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: meters.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ...meters[index].meterList.map((e) {
                                  return ItemCardIndicators(meter: e);
                                }).toList(),
                                ItemCardSensor(sensor: meters[index])
                              ],
                            );
                          },
                        ),
                      ),
                    _ => const Center(
                        child: CircularProgressIndicator(),
                      )
                  };
                },
              ),
            _ => const Center(child: CircularProgressIndicator())
          };
        },
      ),
      // body: BlocBuilder<DropDownButtonAppCubit, DropDownButtonAppState>(
      //   builder: (context, stateDrop) {
      //     if (stateDrop is DropDownButtonAppSeccues) {
      //       return RefreshIndicator(
      //         onRefresh: () => context
      //             .read<HomeCubit>()
      //             .onRefresh(stateDrop.item.id.toString()),
      //         child: BlocBuilder<HomeCubit, HomeState>(
      //           builder: (context, stateHome) {
      //             if (stateHome is HomeInitial) {
      //               context.read<HomeCubit>().init(
      //                     stateDrop.item.id.toString(),
      //                   );
      //             }

      //             if (stateHome is HomeLoad) {
      //               return const Center(
      //                 child: CircularProgressIndicator(),
      //               );
      //             }
      //             if (stateHome is ExeptionHome) {
      //               context
      //                   .read<HomeCubit>()
      //                   .onDropChangedObject(stateDrop.item.id.toString());
      //               return const Center(
      //                 child: CircularProgressIndicator(),
      //               );
      //             }
      //             if (stateHome is HomeSeccues) {
      //               return ScrollConfiguration(
      //                 behavior: ScrollBehavior(),
      //                 child: ListView.builder(
      //                   shrinkWrap: true,
      //                   itemCount: stateHome.listSensor.length,
      //                   itemBuilder: (context, index) {
      //                     return Column(
      //                       children: [
      //                         ...stateHome.listSensor[index].metersList
      //                             .map((e) {
      //                           return ItemCardIndicators(meter: e);
      //                         }).toList(),
      //                         ItemCardSensor(
      //                             sensor: stateHome.listSensor[index])
      //                       ],
      //                     );
      //                   },
      //                 ),
      //               );
      //             }
      //             if (stateHome is HomeRefresh) {
      //               return SizedBox();
      //             }
      //             return const Text('Упc техническая ошибка');
      //           },
      //         ),
      //       );
      //     }

      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
    );
  }
}
