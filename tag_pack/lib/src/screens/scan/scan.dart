import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/screens/reviewandedit/review_and_edit.dart';
import 'package:tag_pack/src/utils/utils.dart';
import 'package:tag_pack/src/widgets/scan_stage_item.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  bool isBrandScanned = false;
  bool isOverviewScanned = true;
  bool isCareScanned = true;

  List<CameraDescription>? cameras;
  CameraController? controller;

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void loadCamera() async {
    cameras = await availableCameras();

    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);

      controller!.initialize().then((value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }

  void closeScanScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void showHelpBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            color: AppColors.beige,
            child: const Center(
              child: Text(
                Strings.help_popup_description,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          );
        });
  }

  void continueScanning(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        getPageRouterWithHorizontalTransition(const ReviewAndEditTag(),
            animationDuration: 300),
        (route) => route.isFirst);
  }

  Widget _createScanStagesIndicators() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScanStageItem(stageName: Strings.brand, isChecked: isBrandScanned),
          SizedBox(
            width: 12,
            height: 1,
            child: Container(
              color: AppColors.backgroundColor,
            ),
          ),
          ScanStageItem(
              stageName: Strings.overview, isChecked: isOverviewScanned),
          SizedBox(
            width: 12,
            height: 1,
            child: Container(
              color: AppColors.backgroundColor,
            ),
          ),
          ScanStageItem(stageName: Strings.care, isChecked: isCareScanned),
        ],
      ),
    );
  }

  Widget _createOverlayWithHint() {
    return Column(
      children: [
        SizedBox(
          width: 248,
          height: 410,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.scanViewportBorder),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: AppColors.scanViewportBorder),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            Strings.scan_hint,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
          ),
        )
      ],
    );
  }

  Widget _createContinueBtn() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        height: 46,
        child: ElevatedButton(
          onPressed: () => continueScanning(context),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.colorDark),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)))),
          child: const Text(
            Strings.text_continue,
            style: TextStyle(
              color: AppColors.backgroundColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.tag_scanning,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () => showHelpBottomSheet(context),
            icon: const Icon(
              Icons.help,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () => closeScanScreen(context),
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        color: AppColors.backgroundColor,
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height - 56,
          color: AppColors.backgroundColor,
          child: Stack(
            children: [
              controller != null
                  ? Transform.scale(
                      scale: 1 /
                          (controller!.value.aspectRatio *
                              MediaQuery.of(context).size.aspectRatio),
                      alignment: Alignment.topCenter,
                      child: CameraPreview(controller!),
                    )
                  : Container(
                      color: AppColors.backgroundColor,
                    ),
              ClipPath(
                clipper: CenterHolePath(holeWidth: 230, holeHeight: 390),
                child: Container(
                  color: AppColors.colorDark40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _createScanStagesIndicators(),
                      _createOverlayWithHint(),
                      _createContinueBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
