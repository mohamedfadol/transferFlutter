import 'package:transfer_flutter/constants/constant.dart';
import 'package:transfer_flutter/models/transaction_model.dart';
import 'package:transfer_flutter/pages/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../../utility/api_pdf.dart';
import '../../../utility/invoice_pdf.dart';
import '../../widgets/CustomImageWidget.dart';
class TransactionView extends StatefulWidget {
  final TransactionModel transactionModel ;
  const TransactionView({super.key, required this.transactionModel});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {

  Future<Uint8List> logo()async{
    final ByteData bytes = await rootBundle.load('assets/logos/teepay_logo.png');
    final Uint8List byteList = bytes.buffer.asUint8List();
    return byteList;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        leadingWidth: 35,
        centerTitle: false,
        leading: const BackButton(color: iconColor,),
        elevation: 2.0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(-18.0), // i want to set second AppBar's height
          child: SizedBox(),
        ),
        title: CustomText(text: widget.transactionModel.transactionName!, textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0, color: textColor),),
        actions: [
          IconButton(
              onPressed: () async {await Share.share('check out my website https://example.com');},
              icon: const Icon(Icons.share, size: 20.0, color: Colors.white,)
          ),

          IconButton(
              onPressed: () async {
                //await Share.share('check out my website https://example.com');
                final pdfFile = await PdfInvoiceApi.generate(widget.transactionModel!,context);
                if(await PDFApi.requestPermission()){
                  PDFApi.openFile(pdfFile!);
                }
              },
              icon: const Icon(Icons.picture_as_pdf_sharp, size: 20.0, color: Colors.white,)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 70,
                        height: 70,
                        child: Image.asset('assets/logos/teepay_logo.png')
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(text: "إيصال التحويل", textStyle: const TextStyle(fontFamily: 'arabic-font',fontWeight: FontWeight.bold, fontSize: 15.0),),
                        CustomText(text: "Transfer Receipt", textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.grey[300],
                padding: const EdgeInsets.all(6.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("TeePay Beneficiary"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("التاريخ Date", style: TextStyle(fontFamily: 'arabic-font'), textDirection: TextDirection.rtl,),
                      Text("2024/01/03 - 8:45 PM"),
                    ],
                  )
                ],
                ),
              ),

              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Amount",textStyle: const TextStyle(fontSize: 12.0),),
                  CustomText(text: widget.transactionModel.transactionTotal!,textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                  CustomText(text: "المبلغ",textStyle: const TextStyle(fontFamily: 'arabic-font'), textDirection: TextDirection.rtl,),
                ],
              ),

              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "From",textStyle: const TextStyle(fontSize: 12.0),),
                  CustomText(text: "محمد فضل الباري محمد أحمد",textStyle: const TextStyle(fontFamily: 'arabic-font',fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                  CustomText(text: "من",textStyle: const TextStyle(fontFamily: 'arabic-font',fontWeight: FontWeight.bold), textDirection: TextDirection.rtl,),
                ],
              ),

              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "To",textStyle: const TextStyle(fontSize: 12.0),),
                  CustomText(text: "الطيب عمر المبارك",textStyle: const TextStyle(fontWeight: FontWeight.bold,fontFamily: 'arabic-font'), textDirection: TextDirection.rtl),
                  CustomText(text: "إلي",textStyle: const TextStyle(fontFamily: 'arabic-font',fontWeight: FontWeight.bold), textDirection: TextDirection.rtl,),
                ],
              ),

              const SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Purpose",textStyle: const TextStyle(fontSize: 12.0),),
                  CustomText(text: "مصاريف عائلية",textStyle: const TextStyle(fontFamily: 'arabic-font',fontWeight: FontWeight.bold), textDirection: TextDirection.rtl),
                  CustomText(text: "الغرض",textStyle: const TextStyle(fontFamily: 'arabic-font',fontWeight: FontWeight.bold), textDirection: TextDirection.rtl,),
                ],
              ),

              const SizedBox(height: 200.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            QrImageView(
                            data: '1234567890',
                              version: QrVersions.auto,
                              size: 50.0,
                            ),
                            SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.asset('assets/logos/teepay_logo.png')
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CustomImageWidget(imagePath: 'assets/icons/google.svg',width: 18,height: 18,fit: BoxFit.contain,),
                                const SizedBox(width: 2.0,),
                                CustomText(text: "Google", textStyle: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),),
                              ],
                            ),
                            const SizedBox(width: 3.0,),
                            Row(
                              children: [
                                const CustomImageWidget(imagePath: 'assets/icons/apple.svg',width: 18,height: 18,fit: BoxFit.contain,),
                                const SizedBox(width: 2.0,),
                                CustomText(text: "Apple",textStyle: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),),
                              ],
                            ),
                            const SizedBox(width: 3.0,),
                            Row(
                              children: [
                                const CustomImageWidget(imagePath: 'assets/icons/paypal.svg',width: 18,height: 18,fit: BoxFit.contain,),
                                const SizedBox(width: 2.0,),
                                CustomText(text: "PayPal",textStyle: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                 Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         CustomText(text: "E-mail:- mohamedtapo@gmail.com",textStyle: const TextStyle(fontSize: 9.0, fontWeight: FontWeight.normal),),
                         CustomText(text: "Phone:- 0535447543",textStyle: const TextStyle(fontSize: 9.0, fontWeight: FontWeight.normal),),
                         CustomText(text: "Fax:- 215478596",textStyle: const TextStyle(fontSize: 9.0, fontWeight: FontWeight.normal),)
                       ],
                     ),
                 )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
