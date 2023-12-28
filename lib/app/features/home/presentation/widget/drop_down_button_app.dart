import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/app/features/home/presentation/cubit/drop_down_button_app_cubit.dart';

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropDownButtonAppCubit, DropDownButtonAppState>(
      builder: (context, state) {
        return switch (state) {
          SeccuceState(:final items, :final selectItem) ||
          OnSelectItemState(:final items, :final selectItem) ||
          OnChangedItemState(:final items, :final selectItem) =>
            DropdownButton(
              isExpanded: true,
              underline: const SizedBox(),
              iconEnabledColor: Colors.white,
              value: selectItem,
              selectedItemBuilder: (BuildContext context) {
                return items.map(
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
              items: items
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          '${item.house}, ${item.number}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13),
                        ),
                      ))
                  .toList(),
              onChanged: (item) {
                context.read<DropDownButtonAppCubit>().onChanged(item!);
              },
            ),
          ErrorState(:final errorMessage) => Text(errorMessage),
          _ => const SizedBox(),
        };
      },
    );
  }
}
