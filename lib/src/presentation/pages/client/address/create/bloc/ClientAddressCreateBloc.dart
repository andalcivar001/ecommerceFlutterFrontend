import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientAddressCreateBloc
    extends Bloc<ClientAddressCreateEvent, ClientAddressCreateState> {
  ClientAddressCreateBloc() : super(const ClientAddressCreateState()) {
    on<InitEventClientAddressCreate>(_onInitEvent);
    on<AddressChangedClientAddressCreate>(_onAddressChanged);
    on<NeighborhoodChangedClientAddressCreate>(_onNeighborhoodChanged);
    on<FormSubmitClientAddressCreate>(_onFormSubmit);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(
    InitEventClientAddressCreate event,
    Emitter<ClientAddressCreateState> emit,
  ) async {
    emit(state.copyWith(formKey: formKey));
    // Inicializacion si es necesaria
  }

  Future<void> _onAddressChanged(
    AddressChangedClientAddressCreate event,
    Emitter<ClientAddressCreateState> emit,
  ) async {
    emit(
      state.copyWith(
        address: BlocFormItem(
          value: event.address.value,
          error:
              event.address.value.isNotEmpty ? null : 'Ingresa una dirección',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onNeighborhoodChanged(
    NeighborhoodChangedClientAddressCreate event,
    Emitter<ClientAddressCreateState> emit,
  ) async {
    emit(
      state.copyWith(
        address: BlocFormItem(
          value: event.neighborhood.value,
          error:
              event.neighborhood.value.isNotEmpty ? null : 'Ingresa el barrio',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onFormSubmit(
    FormSubmitClientAddressCreate event,
    Emitter<ClientAddressCreateState> emit,
  ) async {}
}
