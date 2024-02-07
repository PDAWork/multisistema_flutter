import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/features/user/home/presentation/bloc/drop_down_button_app/drop_down_button_app_bloc.dart';

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropDownButtonAppBloc, DropDownButtonAppState>(
      builder: (context, state) {
        return DropdownButton(
          isExpanded: true,
          underline: const SizedBox(),
          iconEnabledColor: Colors.white,
          value: state.selectItem,
          selectedItemBuilder: (BuildContext context) {
            return state.items.map(
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
          items: state.items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      '${item.house}, ${item.number}',
                      style: const TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ))
              .toList(),
          onChanged: (item) {
            context
                .read<DropDownButtonAppBloc>()
                .add(DropDownButtonOnChangeEvent(selectItem: item!));
            // context.read<DropDownButtonAppCubit>().onChanged(item!);
          },
        );
      },
    );
  }
}
