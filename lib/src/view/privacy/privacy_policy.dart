import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:tour_application/src/routes/route.dart';
import 'package:tour_application/src/widget/custom_button.dart';

import '../bottom_nav/bottom_nav.dart';

class PrivacyPolicy extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  RxBool _loaded = false.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        child: Column(
          children: [
            Expanded(
              child: SfPdfViewer.network(
                "https://firebasestorage.googleapis.com/v0/b/tour-application-61013.appspot.com/o/privacy%2Fds1.pdf?alt=media&token=104e3b7c-1e4e-452d-a324-f5f82e033fc5",
                onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                  _loaded.value = true;
                },
              ),
            ),
            Obx(() => _loaded == true
                ? CustomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavigationSection()));
                    },
                    title: "Agree")
                : const Text("Loading........"))
          ],
        ),
      )),
    );
  }
}
