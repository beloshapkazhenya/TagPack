import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';

class WashTemperaturePicker extends StatefulWidget {
  const WashTemperaturePicker({Key? key}) : super(key: key);

  @override
  State<WashTemperaturePicker> createState() => _WashTemperaturePickerState();
}

class _WashTemperaturePickerState extends State<WashTemperaturePicker> {
  List<String> temperatures = ['20 ℃', '30 ℃', '40 ℃', '60 ℃', '95 ℃'];
  int selectedTemperatureIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 46,
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          color: AppColors.beige,
          border: Border.all(
            width: 1,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: const EdgeInsets.all(1),
            itemCount: temperatures.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 70,
                height: 46,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    color: (index == selectedTemperatureIndex)
                        ? AppColors.colorDark
                        : AppColors.beige,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedTemperatureIndex = index;
                    });
                  },
                  child: Center(
                    child: Text(
                      temperatures[index],
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: (index == selectedTemperatureIndex)
                              ? AppColors.backgroundColor
                              : AppColors.colorDark),
                    ),
                  ),
                ),
              );
            }));
  }
}
