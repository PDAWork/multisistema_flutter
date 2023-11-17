import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/app/future/home/ui/widget/bottom_navigation_bar_app.dart';
import 'package:multisitema_flutter/app/future/home/ui/widget/item_card_indicators.dart';

import 'state/cubit/drop_down_button_app_cubit.dart';
import 'state/cubit/home_cubit.dart';
import 'widget/drawer_app.dart';
import 'widget/drop_down_button_app.dart';
import 'widget/item_card_sensor.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const DropdownButtonApp(),
      ),
      drawer: const DrawerApp(),
      bottomNavigationBar: const BottomNavigationBarApp(),
      body: BlocBuilder<DropDownButtonAppCubit, DropDownButtonAppState>(
        builder: (context, stateDrop) {
          if (stateDrop is DropDownButtonAppSeccues) {
            return RefreshIndicator(
              onRefresh: () => context
                  .read<HomeCubit>()
                  .onRefresh(stateDrop.item.id.toString()),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, stateHome) {
                  if (stateHome is HomeInitial) {
                    context.read<HomeCubit>().init(
                          stateDrop.item.id.toString(),
                        );
                  }

                  if (stateHome is HomeLoad) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (stateHome is ExeptionHome) {
                    context
                        .read<HomeCubit>()
                        .onDropChangedObject(stateDrop.item.id.toString());
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (stateHome is HomeSeccues) {
                    return ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: stateHome.listSensor.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ...stateHome.listSensor[index].metersList
                                  .map((e) {
                                return ItemCardIndicators(meter: e);
                              }).toList(),
                              ItemCardSensor(
                                  sensor: stateHome.listSensor[index])
                            ],
                          );
                        },
                      ),
                    );
                  }
                  if (stateHome is HomeRefresh) {
                    return SizedBox();
                  }
                  return const Text('Упc техническая ошибка');
                },
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
