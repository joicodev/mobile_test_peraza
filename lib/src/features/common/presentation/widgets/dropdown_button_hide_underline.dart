import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String text;
  final int value;
  final IconData? icon;

  const MenuItem({
    this.icon,
    required this.text,
    required this.value,
  });
}

class AppDropdownButtonHideUnderline extends StatefulWidget {
  final List<MenuItem> items;
  final int? selectedValue;
  final void Function(Object?) onChanged;

  const AppDropdownButtonHideUnderline({
    Key? key,
    this.selectedValue,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AppDropdownButtonHideUnderline> createState() =>
      _AppDropdownButtonHideUnderlineState();
}

class _AppDropdownButtonHideUnderlineState
    extends State<AppDropdownButtonHideUnderline> {
  //
  // Dividers for list
  //
  List<DropdownMenuItem<int>> _addDividersAfterItems(List<MenuItem> items) {
    List<DropdownMenuItem<int>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<int>(
            value: item.value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item.text,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<int>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> itemsHeights = [];
    for (var i = 0; i < (widget.items.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isDense: false,
        isExpanded: true,
        hint: Text(
          'Select Item',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        value: widget.selectedValue,
        onChanged: widget.onChanged,
        items: _addDividersAfterItems(widget.items),
        buttonStyleData: const ButtonStyleData(height: 40, width: 140),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
        ),
        menuItemStyleData: MenuItemStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          customHeights: _getCustomItemsHeights(),
        ),
      ),
    );
  }
}
