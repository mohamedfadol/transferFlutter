
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart' as mat;
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'dart:convert';

import '../models/transaction_model.dart';
import 'api_pdf.dart';

class PdfInvoiceApi {
  static NumberFormat formatCurrency = NumberFormat.simpleCurrency();

  static Future<File> generate(TransactionModel transactionModel, Context) async {

    final pw.Document pdf = pw.Document();
    final ByteData bytes = await rootBundle.load('assets/logos/teepay_logo.png');
    final Uint8List byteList = bytes.buffer.asUint8List();
    final arabicFont = pw.Font.ttf(await rootBundle.load("fonts/arabic-font.ttf"));
    final theme = pw.ThemeData.withFont(
      base: pw.Font.ttf(await rootBundle.load('fonts/Al-Mohanad-Regular.ttf')),
      bold: pw.Font.ttf(await rootBundle.load('fonts/Al-Mohanad-Bold.ttf')),
    );

    pdf.addPage(
      pw.MultiPage(
          pageTheme: pw.PageTheme(
            theme: theme,
            pageFormat: PdfPageFormat.a4,

          ),
          header: (pw.Context context) {
            return  pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Expanded(
                    child: logoWidgetTitle(byteList),
                  ),
                  pw.Spacer(),
                  pw.Spacer(),
                  pw.Container(),
                  pw.Spacer(),
                  pw.SizedBox(
                    width: 200, // Example fixed width, adjust based on your layout needs
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text('إيصال تحويلي', style: pw.TextStyle(fontSize: 15.0, fontWeight: pw.FontWeight.normal,color: PdfColors.black, font: arabicFont),textDirection: pw.TextDirection.rtl),
                        pw.Text('Transfer Receipt', style: pw.TextStyle(fontSize: 15.0, fontWeight: pw.FontWeight.normal,color: PdfColors.black)),

                      ],
                    ),
                  ),
                ],
            );
          },
          build: (pw.Context context) => <pw.Widget>[
            pw.Divider(),
            pw.SizedBox(height: 2.0),

            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Expanded(
                  child: pw.Text('TeePay Beneficiaries', style: pw.TextStyle(fontSize: 15.0, fontWeight: pw.FontWeight.bold,color: PdfColors.black))
                ),
                pw.Spacer(),
                pw.SizedBox(
                  width: 200, // Example fixed width, adjust based on your layout needs
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('Date التاريخ', style: pw.TextStyle(fontSize: 16.0, fontWeight: pw.FontWeight.bold,color: PdfColors.black, font: arabicFont),textDirection: pw.TextDirection.rtl),
                      pw.Text('2024/01/03 - 8:45 PM', style: pw.TextStyle(fontSize: 16.0, fontWeight: pw.FontWeight.bold,color: PdfColors.black))
                    ],
                  ),
                ),
              ],
            ),

            pw.Container(
              color: PdfColors.grey,
              padding: const pw.EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
              width: 600,
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      child: pwTextBuildTitle(Context, 'Transfer Details' , 15.0, pw.FontWeight.bold)
                    ),
                    pw.Expanded(
                        child: pwTextBuildTitle(Context, '' , 15.0, pw.FontWeight.bold)
                    ),
                    pw.Expanded(
                        child: pw.Text('تفاصيل التحويل', style: pw.TextStyle(fontSize: 15.0, fontWeight: pw.FontWeight.bold,color: PdfColors.black, font: arabicFont),textDirection: pw.TextDirection.rtl),
                    ),
                  ]
              ),
            ),

            pw.SizedBox(height: 5.0),

            pw.Container(
              padding: const pw.EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
              width: 600,
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                        child: pwTextBuildTitle(Context, 'Amount' , 15.0, pw.FontWeight.bold)
                    ),
                    pw.Spacer(),
                    pw.Expanded(
                        child: pwTextBuildTitle(Context, '1000 RSA' , 15.0, pw.FontWeight.bold)
                    ),
                    pw.Spacer(),
                    pw.Spacer(),
                    pw.Expanded(
                      child: pw.Text('المبلغ', style: pw.TextStyle(fontSize: 13.0, fontWeight: pw.FontWeight.normal,color: PdfColors.black, font: arabicFont),textDirection: pw.TextDirection.rtl),
                    ),
                  ]
              ),
            ),

            pw.SizedBox(height: 5.0),

            pw.Container(
              padding: const pw.EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
              width: 600,
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                        child: pwTextBuildTitle(Context, 'From' , 15.0, pw.FontWeight.bold)
                    ),
                    pw.Expanded(
                        child: pw.Text('محمد فضل الباري محمد', style: pw.TextStyle(fontSize: 13.0, fontWeight: pw.FontWeight.normal,color: PdfColors.black, font: arabicFont),textDirection: pw.TextDirection.rtl),
                    ),
                    pw.Spacer(),
                    pw.Expanded(
                      child: pw.Text('من', style: pw.TextStyle(fontSize: 13.0, fontWeight: pw.FontWeight.normal,color: PdfColors.black, font: arabicFont),textDirection: pw.TextDirection.rtl),
                    ),
                  ]
              ),
            ),

            pw.SizedBox(height: 5.0),

            pw.Container(
              padding: const pw.EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
              width: 600,
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                        child: pwTextBuildTitle(Context, 'To' , 15.0, pw.FontWeight.bold)
                    ),
                    pw.Expanded(
                        child: pw.Text('الطيب عمر', style: pw.TextStyle(fontSize: 13.0, fontWeight: pw.FontWeight.normal,color: PdfColors.black, font: arabicFont),textDirection: pw.TextDirection.rtl),
                    ),
                    pw.Spacer(),
                    pw.Expanded(
                      child: pw.Text('إلي', style: pw.TextStyle(fontSize: 13.0, fontWeight: pw.FontWeight.normal,color: PdfColors.black, font: arabicFont),textDirection: pw.TextDirection.rtl,),
                    ),
                  ]
              ),
            ),

            pw.SizedBox(height: 5.0),

            pw.Container(
              padding: const pw.EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
              width: 600,
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                        child: pwTextBuildTitle(Context, 'Purpose' , 15.0, pw.FontWeight.bold)
                    ),
                    pw.Expanded(
                        child: pw.Text('مصاريف عائلية', style: pw.TextStyle(fontSize: 13.0, fontWeight: pw.FontWeight.normal,color: PdfColors.black, font: arabicFont),textDirection: pw.TextDirection.rtl),
                    ),
                    pw.Spacer(),
                    pw.Expanded(
                      child: pw.Text('الغرض', style: pw.TextStyle(fontSize: 13.0, fontWeight: pw.FontWeight.normal,color: PdfColors.black, font: arabicFont),textDirection: pw.TextDirection.rtl),
                    ),
                  ]
              ),
            ),

            pw.SizedBox(height: 200.0),

            pw.Container(
              padding: const pw.EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
              width: 600,
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                        child: pw.Column(
                          children: [
                            pw.Row(
                              children: [
                                pw.Expanded(
                                  child: pw.BarcodeWidget(
                                      data: "demo",
                                      barcode: pw.Barcode.qrCode(),
                                      width: 90,
                                      height: 60
                                  ),
                                ),
                                pw.SizedBox(width: 5.0),
                                pw.Expanded(
                                  child: logoWidgetTitle(byteList),
                                ),
                              ]
                            )
                            ]
                        )
                    ),
                    pw.Spacer(),
                    pw.Expanded(
                        child: pw.Column(
                            children: [
                              pw.Text('teePay@test.sa', style: pw.TextStyle(fontSize: 13.0, fontWeight: pw.FontWeight.normal,color: PdfColors.black)),
                              pw.Text('920003344', style: pw.TextStyle(fontSize: 13.0, fontWeight: pw.FontWeight.normal,color: PdfColors.black)),
                              pw.Text('teePay.com', style: pw.TextStyle(fontSize: 13.0, fontWeight: pw.FontWeight.normal,color: PdfColors.black)),
                            ]
                        )
                    ),
                  ]
              ),
            ),



          ],
          footer: (context) {
            final text =
                'page ${context.pageNumber} of ${context.pagesCount}';
            return pw.Column(
                children: [
                  pw.Divider(),
                  pw.Row(
                      children: [
                        pwTextExpandedWithIContainerBuildTitle(Context, text,8.0,pw.FontWeight.bold),
                      ])
                ]);
          }),
    );
    return PDFApi.saveDocument(name: '${transactionModel.transactionName!}.pdf', pdf: pdf);
  }



  static pw.Widget logoWidgetTitle(Uint8List byteList) => pw.Center(
    child: pw.Container(
        padding: const pw.EdgeInsets.all(10.0),
        decoration: pw.BoxDecoration(
          border: pw.Border.all(width: 2.0, color: PdfColors.grey),
          borderRadius: pw.BorderRadius.circular(10),
        ),
        child: pw.Image(pw.MemoryImage(byteList), fit: pw.BoxFit.fitHeight, height: 50, width: 50)
    ),
  );

  static pw.Widget businessInformationWidgetTitle(TransactionModel transactionModel, Context) =>
      pw.Center(
        child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.SizedBox(height: 5.0),
              pwTextBuild(Context, 'businessName  teepay ', 7.0, pw.FontWeight.normal, PdfColors.black),
              pwTextBuild(Context, 'commercial_registration_no 126548484 ', 7.0, pw.FontWeight.normal, PdfColors.black),
              pwTextBuild(Context, 'capital 2023 ', 7.0, pw.FontWeight.normal, PdfColors.black),
            ]),
      );

  static pw.Widget logoWidget(Context) => pw.Container(
    padding: const pw.EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
    decoration: const pw.BoxDecoration(
        border: pw.Border(
            bottom: pw.BorderSide(width: 2, color: PdfColors.blue))),
    child: pw.Row(
        children: [
          pw.PdfLogo(),
          pw.SizedBox(width: 0.8 * PdfPageFormat.mm),
          pwTextBuild(Context, 'company', 15.0, pw.FontWeight.normal, (PdfColors.blue)!),
        ]
    ),
  );

  static pw.Widget businessInformation(TransactionModel transactionModel, Context) => pw.Container(
      child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pwTextExpandedBuildTitle(Context, "Name: ${transactionModel.transactionName}", 7.0, pw.FontWeight.normal,PdfColors.black),
            pw.SizedBox(width: 7.0),
            pwTextExpandedBuildTitle(Context, "Date: ${transactionModel.transactionTime}", 7.0, pw.FontWeight.normal,PdfColors.black),
          ]));


  static pw.Row pwTextBuildTitle(mat.BuildContext context, String title,double fontSize,pw.FontWeight fontWeight) {
    return pw.Row(children: [
      pw.Expanded(child:  pw.Text(title, style: pw.TextStyle(fontSize: fontSize, fontWeight: fontWeight)),)
    ]);
  }

  static pw.Expanded pwTextExpandedWithIContainerBuildTitle(mat.BuildContext context, String title,double fontSize,pw.FontWeight fontWeight) {
    return pw.Expanded(
        child: pw.Container(
          margin: const pw.EdgeInsets.only(top: 1 * PdfPageFormat.cm),
          child: pw.Text(title, style: pw.TextStyle(fontSize: fontSize, fontWeight: fontWeight)),
        )
    );
  }

  static pw.Expanded pwTextExpandedBuildTitle(mat.BuildContext context, String title,double fontSize,pw.FontWeight fontWeight,PdfColor? color) {
    return pw.Expanded(
        child: pw.Text(title, style: pw.TextStyle(fontSize: fontSize, fontWeight: fontWeight,color: color))
    );
  }

  static pw.Text pwTextBuild(mat.BuildContext context, String title,double fontSize,pw.FontWeight fontWeight,PdfColor? color) {
    return  pw.Text(title, style: pw.TextStyle(fontSize: fontSize, fontWeight: fontWeight,color: color));
  }
}