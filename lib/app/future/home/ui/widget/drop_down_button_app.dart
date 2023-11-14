import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/app/data/dto/object/object_dto.dart';
import 'package:multisitema_flutter/app/future/home/ui/state/cubit/home_cubit.dart';

class DropdownButtonApp extends StatefulWidget {
  const DropdownButtonApp({super.key,});


  @override
  State<DropdownButtonApp> createState() => _DropdownButtonAppState();
}

class _DropdownButtonAppState extends State<DropdownButtonApp> {
  ObjectDTO _selectitem = ObjectDTO.empty();
  List<ObjectDTO> list = [];
  @override
  void didChangeDependencies() {
    if(list.isEmpty){

    list = context.watch<HomeCubit>().listObeject;
    _selectitem = list.isNotEmpty ? list.first : ObjectDTO.empty();
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      underline: const SizedBox(),
      iconEnabledColor: Colors.white,
      value: _selectitem,
      selectedItemBuilder: (BuildContext context) {
        return list.map(
          (item) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${item.house}, ${item.number}',
                style: const TextStyle(
                  color: Colors.white,
                  // overflow: TextOverflow.ellipsis,
                  fontSize: 13,
                ),
              ),
            );
          },
        ).toList();
      },
      items: list
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  '${item.house}, ${item.label}',
                  style: const TextStyle(color: Colors.black, fontSize: 13),
                ),
              ))
          .toList(),
      onChanged: (value) {
        context.read<HomeCubit>().changeObejt(value!.id.toString());
        setState(() {
          _selectitem = value ?? ObjectDTO.empty();
        });
        
      },
    );
  }
}
