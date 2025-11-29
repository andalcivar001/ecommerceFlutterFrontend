import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Address/AddressUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientAddressListBloc
    extends Bloc<ClientAddressListEvent, ClientAddressListState> {
  AddressUseCases addressUseCase;
  AuthUseCases authUseCases;
  ClientAddressListBloc(this.addressUseCase, this.authUseCases)
    : super(ClientAddressListState()) {
    on<ClientAddressListGetUserAddress>(_onGetUserAddress);
    // on<ClientAddressListDeleteUserAddress>(_onDeleteUserAddress);
  }

  Future<void> _onGetUserAddress(
    ClientAddressListGetUserAddress event,
    Emitter<ClientAddressListState> emit,
  ) async {
    AuthResponse? authResponse = await authUseCases.getUserSession.run();
    if (authResponse != null) {
      emit(state.copyWith(response: Loading()));
      Resource response = await addressUseCase.getUserAddress.run(
        authResponse.user.id!,
      );
      emit(state.copyWith(response: response));
    }
  }

  // Future<void> _onDeleteUserAddress(
  //   ClientAddressListDeleteUserAddress event,
  //   Emitter<ClientAddressListState> emit,
  // ) async {
  //   emit(state.copyWith(response: Loading()));
  //   Resource response = await categoryUseCase.delete.run(event.id);
  //   emit(state.copyWith(response: response));
  // }
}
