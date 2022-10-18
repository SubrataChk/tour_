import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PrivacySection extends StatelessWidget {
  const PrivacySection({super.key});

  @override
  Widget build(BuildContext context) {
    PdfViewerController? _pdfViewerController;
    RxBool _loaded = false.obs;

    showPrivacyPdf(data) {
      return SfPdfViewer.network(
        data["url"],
        onDocumentLoaded: (PdfDocumentLoadedDetails details) =>
            {_loaded.value = true},
      );
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Privacy",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("privacy")
              .doc("10000")
              .snapshots(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("There is some error"));
            }
            return showPrivacyPdf(data);
          },
        ));
  }
}
