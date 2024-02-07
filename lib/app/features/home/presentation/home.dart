import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/app/features/home/presentation/bloc/drop_down_button_app/drop_down_button_app_bloc.dart';
import 'package:multisitema_flutter/app/features/home/presentation/bloc/home/home_bloc.dart';
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
      ),
      drawer: const DrawerApp(),
      bottomNavigationBar: const BottomNavigationBarApp(),
      body: BlocListener<DropDownButtonAppBloc, DropDownButtonAppState>(
        listener: (ctx, state) {
          context.read<HomeBloc>().add(
                HomeInitialEvent(
                  idObject: state.selectItem!.id,
                  date: state.date!,
                ),
              );
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (ctx, st) {
            return switch (st) {
              HomeError() => const Center(
                  child: Text('Упс, произошла техническая ошибка'),
                ),
              HomeSuccess(:final meters) => ScrollConfiguration(
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
      ),
    );
  }
}
