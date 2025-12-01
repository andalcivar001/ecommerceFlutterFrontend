import 'package:ecommerce_flutter/src/domain/models/Address.dart';
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
    on<ClientAddressListChangeRadioValue>(_onChanedRadioValue);
    on<SetAddressSession>(_onSetAddressSession);
    on<DeleteAddress>(_onDeleteAddress);
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

  Future<void> _onChanedRadioValue(
    ClientAddressListChangeRadioValue event,
    Emitter<ClientAddressListState> emit,
  ) async {
    await addressUseCase.saveAddressInSession.run(event.address);
    emit(state.copyWith(radioValue: event.radioValue));
  }

  Future<void> _onSetAddressSession(
    SetAddressSession event,
    Emitter<ClientAddressListState> emit,
  ) async {
    Address? addressSession = await addressUseCase.getAddressSession.run();
    if (addressSession != null) {
      int index = event.addressList.indexWhere(
        (address) => address.id == addressSession.id,
      );
      //YA SE HA SELECCIONADO UNA DIRECCION Y ESTA GUARDADA EN SESSION
      if (index != -1) {
        emit(state.copyWith(radioValue: index));
      }
    }
  }

  Future<void> _onDeleteAddress(
    DeleteAddress event,
    Emitter<ClientAddressListState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));
    Resource<bool> response = await addressUseCase.delete.run(event.id);
    emit(state.copyWith(response: response));
    Address? addressSession = await addressUseCase.getAddressSession.run();
    if (addressSession != null) {
      if (addressSession.id == event.id) {
        await addressUseCase.deleteFromSession.run();
        emit(state.copyWith(radioValue: null));
      }
    }
  }
}
