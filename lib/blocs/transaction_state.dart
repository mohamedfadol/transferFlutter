part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {}

class TransactionInitial extends TransactionState {
  @override
  List<Object> get props => [];
}

class TransactionSuccessState extends TransactionState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class TransactionLoadingState extends TransactionState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TransactionErrorState extends TransactionState{
  final String message;
  TransactionErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}