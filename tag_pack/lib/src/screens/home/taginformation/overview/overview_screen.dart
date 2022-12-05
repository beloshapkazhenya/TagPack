import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/model/TagInfoModel.dart';
import 'package:tag_pack/src/screens/home/taginformation/overview/widgets/overview_list_item.dart';
import 'package:tag_pack/src/screens/home/taginformation/overview/widgets/pie_chart.dart';

class OverviewPart extends StatefulWidget {
  OverviewPart({Key? key, required this.composition}) : super(key: key);

  List<ItemCompositionModel> composition;

  @override
  State<OverviewPart> createState() => _OverviewPartState();
}

class _OverviewPartState extends State<OverviewPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
          color: AppColors.beige,
          image: DecorationImage(
              image: AssetImage(Assets.bg_category_overview),
              fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28, bottom: 16),
                child: PieChartItem(composition: widget.composition),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return OverviewListItem(
                            composition: widget.composition[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 8,
                          ),
                      itemCount: widget.composition.length)),
              const SizedBox(
                height: 68,
              )
            ],
          ),
        ),
      ),
    );
  }
}
