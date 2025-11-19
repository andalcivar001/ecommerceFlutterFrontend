import 'package:equatable/equatable.dart';

abstract class ClientHomeEvent extends Equatable {
  const ClientHomeEvent();
  @override
  List<Object?> get props => [];
}

class ClientHomeChangeDrawerPage extends ClientHomeEvent {
  final int pageIndex;
  const ClientHomeChangeDrawerPage({required this.pageIndex});
  @override
  List<Object?> get props => [pageIndex];
}

class ClientHomeLogout extends ClientHomeEvent {
  const ClientHomeLogout();
}
