import 'package:flutter/material.dart';

class DropdownButtonApp extends StatefulWidget {
  const DropdownButtonApp({super.key, required this.items});

  final List<String> items;

  @override
  State<DropdownButtonApp> createState() => _DropdownButtonAppState();
}

class _DropdownButtonAppState extends State<DropdownButtonApp> {
  String _selectitem = "";

  @override
  void initState() {
    _selectitem = widget.items.isEmpty ? " " : widget.items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      isDense: true,
      underline: const SizedBox(),
      iconEnabledColor: Colors.white,
      value: _selectitem,
      selectedItemBuilder: (BuildContext context) {
        return widget.items.map(
          (String value) {
            return Text(
              value,
              style: const TextStyle(color: Colors.white),
            );
          },
        ).toList();
      },
      items: widget.items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(color: Colors.black),
                ),
              ))
          .toList(),
      onChanged: (String? value) {
        setState(() {
          _selectitem = value ?? "";
        });
      },
    );
  }
}
