import 'package:transfer_flutter/blocs.transactions/transaction_bloc.dart';
import 'package:transfer_flutter/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../blocs.currencies/currency_bloc.dart';
import '../../blocs.users/user_bloc.dart';
import '../../../constants/constant.dart';
import '../../../models/Currency.dart';
import '../../../models/user_model.dart';
import '../../../repository/currency_repository.dart';
import '../../../repository/user_repository.dart';
import '../widgets/custom_text.dart';
class TransferTransaction extends StatefulWidget {
  final CartModel cartModel ;
  const TransferTransaction({super.key, required this.cartModel});

  @override
  State<TransferTransaction> createState() => _TransferTransactionState();
}

class _TransferTransactionState extends State<TransferTransaction> {
  final _formKey = GlobalKey<FormState>();
   final TextEditingController _amountController = TextEditingController();
  final TextEditingController _nameDepositToController = TextEditingController();
  final TextEditingController _paymentAmountController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();

  TransactionBloc? transactionBloc;

  static const _locale = 'en';
  late Map<String, dynamic> dataRequest;

  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency => NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transactionBloc = BlocProvider.of<TransactionBloc>(context);
  }

  @override
  Widget build(BuildContext context) {

    final amountField = TextFormField(
      controller: _amountController,
      onChanged: (string) {
        string = _formatNumber(string.replaceAll(',', ''));
        _amountController.value = TextEditingValue(
          text: string,
          selection: TextSelection.collapsed(offset: string.length),
        );
      },
      keyboardType: TextInputType.number,
      autofocus: false,
      obscureText: false,
      decoration: InputDecoration(
          prefixText: _currency,
          prefixIcon: const Icon(Icons.monetization_on_outlined, color: backGroundColorAppBar,),
          filled: true,
          fillColor: const Color(0xFFF2F3F5),
          focusColor: backGroundColorAppBar,
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: backGroundColorAppBar),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            // borderSide: BorderSide(color: backGroundColorAppBar),
          ),
          labelText: 'Amount',
          hintStyle: const TextStyle(fontWeight: FontWeight.bold, color: backGroundColorAppBar)
      ),

    );

    final nameDepositToField =  SizedBox(
      width: double.infinity,
      child: RepositoryProvider(
        create: (context) => UserBloc(UserRepository())..add(UserLoadEvent()),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserLoadedState) { 

              if (state is UserLoadedState) {
                return DropdownButtonHideUnderline(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]!),
                        gapPadding: 0.0,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      // Optionally, add a label if you like
                      // label: Text('Select Item'),
                    ),
                    child: DropdownButton<String> (
                      focusColor: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
                      elevation: 10,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(),
                      hint: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.monetization_on_outlined, size: 25.0, color: backGroundColorAppBar,),
                          const SizedBox(width: 6.0,),
                          CustomText(text: 'Select Customer'),
                        ],
                      ),
                      value: state.selectedUser?.name,
                      onChanged: (String? newValue) {
                        if (newValue != null && newValue != "Select User") {
                          final userIndex = state.users.indexWhere((user) => user.name == newValue);
                          if (userIndex != -1) {
                            final User selectedUser = state.users[userIndex];
                            _nameDepositToController.text = selectedUser.userId.toString();
                            print(_nameDepositToController.text);
                            context.read<UserBloc>().add(DropdownItemSelectedUserEvent(selectedUser: selectedUser));
                          } else {
                            print("No matching user found for the name: $newValue");
                          }
                        }
                      },
                      items: state.users.map<DropdownMenuItem<String>>((User user) {
                        return DropdownMenuItem<String>(
                          value: user.name,
                          child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Icon(Icons.man, size: 25.0, color: backGroundColorAppBar,),
                                  CustomText(text: user.name!),
                                ],
                              )
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              }
            } else if (state is UserErrorState) {
              return CustomText(text: "No Customers Found");
            }
            return Container(); // For initial and other states
          },
        ),
      ),
    );


    final paymentAmountField = TextFormField(
      controller: _paymentAmountController,
      autofocus: false,
      obscureText: false,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail, color: backGroundColorAppBar,),
          filled: true,
          fillColor: const Color(0xFFF2F3F5),
          focusColor: backGroundColorAppBar,
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: backGroundColorAppBar),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            // borderSide: BorderSide(color: backGroundColorAppBar),
          ),
          labelText: 'E-Mail',
          hintStyle: const TextStyle(fontWeight: FontWeight.bold, color: backGroundColorAppBar)
      ),

    );


    final  currencies   = SizedBox(
      width: double.infinity,
      child: RepositoryProvider(
        create: (context) => CurrencyBloc(CurrencyRepository())..add(CurrencyLoadEvent()),
        child: BlocBuilder<CurrencyBloc, CurrencyState>(
          builder: (context, state) {
            if (state is CurrencyLoadingState) {
              return const Center(child: CircularProgressIndicator(color: Colors.green,));
            } else if (state is CurrencyLoadedState) {
              if (state is CurrencyLoadedState) {
                return DropdownButtonHideUnderline(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]!),
                        gapPadding: 0.0,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      // Optionally, add a label if you like
                      // label: Text('Select Item'),
                    ),
                    child: DropdownButton<String>(
                      focusColor: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
                      elevation: 10,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(),
                      hint: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.monetization_on_outlined, size: 25.0, color: backGroundColorAppBar,),
                          const SizedBox(width: 6.0,),
                          CustomText(text: "Select a Currency"),
                        ],
                      ),
                      value: state.selectedCurrency?.currencyName,
                      onChanged: (String? newValue) {
                        if (newValue != null && newValue != "Select Currency") {
                          final currencyIndex = state.currencies.indexWhere((user) => user.currencyName == newValue);
                          if (currencyIndex != -1) {
                            final Currency selectedCurrency = state.currencies[currencyIndex];
                            _currencyController.text = selectedCurrency.currencyId.toString();
                            print(_currencyController.text);
                            context.read<CurrencyBloc>().add(DropdownItemSelectedCurrencyEvent(selectedCurrency: selectedCurrency));
                          } else {
                            print("No matching currency found for the name: $newValue");
                          }
                        }
                      },
                      items: state.currencies.map<DropdownMenuItem<String>>((Currency currency) {
                        return DropdownMenuItem<String>(
                          value: currency.currencyName,
                          child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Icon(Icons.monetization_on_outlined, size: 25.0, color: backGroundColorAppBar,),
                                  CustomText(text: currency.currencyName!),
                                ],
                              )
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              }
            } else if (state is CurrencyErrorState) {
              return CustomText(text: "No Currencies Found");
            }
            return Container();// Return an empty container for initial and other states
          },
        ),
      ),
    );

    final cartAccount = Container(
      height: 200,
      clipBehavior: Clip.antiAlias,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient:  LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.1, 1.0],
          colors: [
            widget.cartModel.color![0]!,
            widget.cartModel.color![1]!,
          ],
        ),
        boxShadow: const [
          BoxShadow(blurRadius: 9.0),
          BoxShadow(color: Colors.white, offset: Offset(0, -16)),
          BoxShadow(color: Colors.white, offset: Offset(0, 16)),
          BoxShadow(color: Colors.white, offset: Offset(0, -13)),
          BoxShadow(color: Colors.white, offset: Offset(0, 13)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomText(text: 'Amount \$ 152,15', textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: textColor),),
                    CustomText(text: '8548 2647 6985 ...', textStyle: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: textColor),),
                    CustomText(text: 'Mohamed Fadl Elbary', textStyle: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: textColor),),
                  ],
                ),
              )
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(text: widget.cartModel.bankName!, textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                      const SizedBox(width: 3.0,),
                      Expanded(child: widget.cartModel.bankLogo!)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:8.0, bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      widget.cartModel.icon!
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

    final transferButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.lightBlueAccent,
        elevation: 1,
        backgroundColor: backGroundColorAppBar,
        fixedSize: const Size(200.0, 50.2),
        shape: const StadiumBorder(),
      ),
      onPressed: () async{
        dataRequest = {
                        "amount": _amountController.text,
                        "status": "pending",
                        "final_total": "1500",
                        "account_deposit": _nameDepositToController.text,
                        "account_withdraw": _paymentAmountController.text,
                        "currency": _currencyController.text,
                        "method": "card",
                        // "status": "status",
                      };
        print(dataRequest);
        transactionBloc!.add(MakeTransactionEvent(dataRequest: dataRequest));
        _showDynamicInfoSnackBar(context,'Have Successfully add transfer 👏', Colors.white, Icons.gpp_good, Colors.green);
       Navigator.pushNamed(context, '/home');
        // authBloc!.add(LoginEvent(email: email.text, password: password.text));
      },
      child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              colors: [
                backGroundColorBackAppBar,
                backGroundColorAppBar,
              ],
            ),
          ),
          child: Center(child: CustomText(text:'Send Request',textStyle: const TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.normal, fontSize: 20.0, color: textColor),))
      ),
    );


    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        leadingWidth: 35,
        centerTitle: false,
        leading: const BackButton(color: iconColor,),
        elevation: 2.0,
        title: CustomText(text: 'Transfer .....', textStyle: const TextStyle(color: textColor, fontSize: 15.0, fontWeight: FontWeight.bold),),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(-18.0), // i want to set second AppBar's height
          child: SizedBox(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                    cartAccount,
                  const SizedBox(height: 10.0,),
                  currencies,
                  const SizedBox(height: 10.0,),
                  amountField,
                  const SizedBox(height: 10.0,),
                  nameDepositToField,
                  const SizedBox(height: 10.0,),
                  paymentAmountField,
                  const SizedBox(height: 10.0,),
                  transferButton
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDynamicInfoSnackBar(BuildContext context,String text, Color? backgroundColor , IconData? icon, Color? iconColor) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: const Duration(seconds: 2),
            elevation: 1,
            backgroundColor: backgroundColor,
            content: Center(
                child: Center(
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                        color: Colors.green.shade50,
                        child:  Padding(
                          padding: const EdgeInsets.fromLTRB(32, 56, 32, 32),
                          child: CustomText(text: text, textStyle: const TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.bold,)),
                        ),
                      ),
                      Positioned(
                        top: -40,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.green.shade50, width: 4),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(icon, color: iconColor, size: 48),
                        ),
                      )
                    ],
                  ),
                )
            )
        )
    );
  }
}
