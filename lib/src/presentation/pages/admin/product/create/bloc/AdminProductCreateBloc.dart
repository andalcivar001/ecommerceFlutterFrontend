import 'dart:io';

import 'package:ecommerce_flutter/src/domain/useCases/category/CategoryUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AdminProductCreateBloc
    extends Bloc<AdminProductCreateEvent, AdminProductCreateState> {
  CategoryUseCases categoryUseCases;

  AdminProductCreateBloc(this.categoryUseCases)
    : super(AdminProductCreateState()) {
    on<AdminProductCreateInitEvent>(_onInitEvent);
    on<AdminProductCreateNameChanged>(_onNameChanged);
    on<AdminProductCreateDescriptionChanged>(_onDescriptionChanged);
    on<AdminProductCreatePickImage>(_onPickImage);
    on<AdminProductCreateTakePhoto>(_onTakePhoto);
    on<AdminProductCreateFormSubmit>(_onFormSubmit);
    on<AdminProductCreateResetForm>(_onResetForm);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(
    AdminProductCreateInitEvent event,
    Emitter<AdminProductCreateState> emit,
  ) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNameChanged(
    AdminProductCreateNameChanged event,
    Emitter<AdminProductCreateState> emit,
  ) async {
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isNotEmpty ? null : 'Ingresa el nombre',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onDescriptionChanged(
    AdminProductCreateDescriptionChanged event,
    Emitter<AdminProductCreateState> emit,
  ) async {
    emit(
      state.copyWith(
        description: BlocFormItem(
          value: event.description.value,
          error:
              event.description.value.isNotEmpty
                  ? null
                  : 'Ingresa la descripcion',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPickImage(
    AdminProductCreatePickImage event,
    Emitter<AdminProductCreateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(image: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onTakePhoto(
    AdminProductCreateTakePhoto event,
    Emitter<AdminProductCreateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(image: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onFormSubmit(
    AdminProductCreateFormSubmit event,
    Emitter<AdminProductCreateState> emit,
  ) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));

    Resource response = await categoryUseCases.create.run(
      state.toCategory(),
      state.image!,
    );
    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onResetForm(
    AdminProductCreateResetForm event,
    Emitter<AdminProductCreateState> emit,
  ) async {
    emit(state.resetForm());
    // state.formKey?.currentState?.reset();
    // emit(state.copyWith(image: null));
  }
}
