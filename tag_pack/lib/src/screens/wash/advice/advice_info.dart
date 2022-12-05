import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/model/WashAdviceModel.dart';
import 'package:tag_pack/src/utils/utils.dart';
import 'package:tag_pack/src/widgets/advice_item.dart';

class AdviceInfo extends StatefulWidget {
  AdviceInfo({Key? key, required this.data}) : super(key: key);

  WashAdviceModel data;

  @override
  State<AdviceInfo> createState() => _AdviceInfoState();
}

class _AdviceInfoState extends State<AdviceInfo> {
  late List<CommentModel> _comments;

  @override
  void initState() {
    _comments = widget.data.comments != null
        ? widget.data.comments!
        : List.empty(growable: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          elevation: 0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.colorDark),
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        image: AssetImage(widget.data.iconPath),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  'Advice from ${widget.data.adviceOwnerName}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
              color: AppColors.backgroundColor,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight - 88),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ScrollConfiguration(
                      behavior: ScrollBehaviorWithoutGlow(),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AdviceItem(
                              data: widget.data,
                              needToHideTitle: true,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 12),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 32,
                                decoration: BoxDecoration(
                                    color: AppColors.beige,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1, color: AppColors.colorDark)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Container(
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.colorDark),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      Assets.default_avatar),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          decoration:
                                              const InputDecoration.collapsed(
                                                  hintText: Strings.add_comment),
                                          style: const TextStyle(
                                              color: AppColors.gray60,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      IconButton(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 0),
                                          onPressed: () {
                                            print('add photo');
                                          },
                                          icon: const Icon(
                                            Icons.add_photo_alternate,
                                            size: 20,
                                            color: AppColors.colorDark,
                                          )),
                                      IconButton(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 0),
                                          onPressed: () {
                                            print('add comment');
                                          },
                                          icon: const Icon(
                                            Icons.send,
                                            color: AppColors.colorDark,
                                            size: 20,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _comments.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 8,
                                    ),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width - 32,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.colorDark),
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.beige),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 32,
                                                height: 32,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color: AppColors
                                                            .colorDark),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            _comments[index]
                                                                .iconPath),
                                                        fit: BoxFit.cover)),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 6),
                                                child: Text(
                                                  _comments[index].comment,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(_comments[index].comment)
                                        ],
                                      ),
                                    ),
                                  );
                                })
                          ],
                        ),
                      )),
                ),
              )),
        ),
      );
    });
  }
}
