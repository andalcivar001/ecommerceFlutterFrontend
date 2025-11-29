import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Address/AddressUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientAddressCreateBloc
    extends Bloc<ClientAddressCreateEvent, ClientAddressCreateState> {
  AddressUseCases addressUseCases;
  AuthUseCases authUseCases;

  ClientAddressCreateBloc(this.addressUseCases, this.authUseCases)
    : super(const ClientAddressCreateState()) {
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
    AuthResponse? authResponse = await authUseCases.getUserSession.run();
    emit(state.copyWith(formKey: formKey));
    if (authResponse != null) {
      emit(state.copyWith(formKey: formKey, idUser: authResponse.user.id));
    }
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
        neighborhood: BlocFormItem(
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
  ) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    Resource response = await addressUseCases.create.run(state.toAddress());
    emit(state.copyWith(response: response, formKey: formKey));
  }
}
