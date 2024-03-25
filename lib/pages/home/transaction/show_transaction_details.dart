import 'package:employee/blocs/transaction_bloc.dart';
import 'package:employee/repository/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowTransactionDetails extends StatelessWidget {
  final TransactionRepository transactionRepository;

  const ShowTransactionDetails(
      {super.key, required this.transactionRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TransactionBloc(transactionRepository),
        child: Center(
          child: IconButton(
              onPressed: () {
                final dataBloc = BlocProvider.of<TransactionBloc>(context);
                dataBloc.add(TransactionEvent as TransactionEvent);
              },
              icon: Icon(Icons.abc_sharp)
          ),
        ),
      ),
    );
  }
}
