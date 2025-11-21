import 'package:equatable/equatable.dart';

abstract class ClientProductListEvent extends Equatable {
  const ClientProductListEvent();

  @override
  List<Object?> get props => [];
}

class GetProductsByCategoryEvent extends ClientProductListEvent {
  final int idCategory;

  const GetProductsByCategoryEvent({required this.idCategory});

  @override
  List<Object?> get props => [idCategory];
}
