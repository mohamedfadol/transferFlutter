part of 'transaction_bloc.dart';


abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
}

class GetAllTransactionEvent extends TransactionEvent{
  final int userId;
  const GetAllTransactionEvent({required this.userId});

  @override
  List<Object> get props => [userId];

}


class MakeTransactionEvent extends TransactionEvent{
  final Map<String, dynamic> dataRequest;
  const MakeTransactionEvent({required this.dataRequest});

  @override
  List<Object> get props => [dataRequest];

}