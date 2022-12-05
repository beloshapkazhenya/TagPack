import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tag_pack/src/model/TagInfoModel.dart';

class PieChartItem extends StatefulWidget {
  PieChartItem({Key? key, required this.composition}) : super(key: key);

  List<ItemCompositionModel> composition;

  @override
  State<PieChartItem> createState() => _PieChartItemState();
}

class _PieChartItemState extends State<PieChartItem> {
  late Map<String, double> _compositionChartData;
  late List<Color> _colorList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _compositionChartData = {
      for (var elem in widget.composition)
        elem.compositionName: elem.compositionPercent.toDouble()
    };
    for (var element in widget.composition) {
      _colorList.add(element.compositionColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PieChart(
          dataMap: _compositionChartData,
          chartType: ChartType.ring,
          colorList: _colorList,
          ringStrokeWidth: 50,
          legendOptions: const LegendOptions(showLegends: false),
          chartValuesOptions: const ChartValuesOptions(showChartValues: false),
          animationDuration: const Duration(milliseconds: 0),
          initialAngleInDegree: 215,
          chartRadius: MediaQuery.of(context).size.width / 1.8,
        ),
        Column(
          children: [
            Text(
              '${_compositionChartData.values.reduce(max)}%',
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Text(
              '${widget.composition.firstWhere((element) => element.compositionPercent == _compositionChartData.values.reduce(max)).compositionType.toLowerCase()} fabric',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            )
          ],
        ),
      ],
    );
  }
}
