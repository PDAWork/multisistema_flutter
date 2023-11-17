import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/app/future/home/ui/state/cubit/home_cubit.dart';

import '../state/cubit/drop_down_button_app_cubit.dart';

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropDownButtonAppCubit, DropDownButtonAppState>(
      builder: (context, state) {
        if (state is DropDownButtonAppSeccues) {
          return DropdownButton(
            isExpanded: true,
            underline: const SizedBox(),
            iconEnabledColor: Colors.white,
            value: state.item,
            selectedItemBuilder: (BuildContext context) {
              return state.itemList.map(
                (item) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${item.house}, ${item.number}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  );
                },
              ).toList();
            },
            items: state.itemList
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        '${item.house}, ${item.label}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              context.read<HomeCubit>().onDropChangedObject(value!.id.toString());
              context.read<DropDownButtonAppCubit>().onChangedItem(value);
            },
          );
        }
        if (state is DropDownButtonAppInitial) {
          context.read<DropDownButtonAppCubit>().init();
        }
        return const SizedBox();
      },
    );
  }
}
