import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:products_task/Models/market_model.dart';

class SymbolDropDown extends StatelessWidget {
  const SymbolDropDown({Key? key, required this.items, this.selectedValue, this.title = "Select", this.notifier, this.onChange})
      : super(key: key);

  final List<ActiveSymbol>? items;
  final Rx<ActiveSymbol>? selectedValue;
  final String? title;
  final ActiveSymbol? notifier;
  final Function(ActiveSymbol)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: [
                const Icon(
                  Icons.list,
                  size: 16,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                ?.map((item) => DropdownMenuItem<ActiveSymbol>(
                      value: item,
                      child: Text(
                        item.symbol ?? "",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue?.value,
            onChanged: (value) {
              if (value == null) return;
              selectedValue?.value = value as ActiveSymbol;
              onChange?.call(selectedValue!.value);
            },
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.grey,
            ),
            buttonStyleData: ButtonStyleData(
              height: 50,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.redAccent,
              ),
              elevation: 2,
            ),
            dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                padding: const EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.redAccent,
                ),
                elevation: 8,
                scrollbarTheme: const ScrollbarThemeData(
                  radius: Radius.circular(40),
                  thickness: WidgetStatePropertyAll(6),
                )),
            menuItemStyleData: const MenuItemStyleData(height: 40),
          ),
        ),
      ),
    );
  }
}
