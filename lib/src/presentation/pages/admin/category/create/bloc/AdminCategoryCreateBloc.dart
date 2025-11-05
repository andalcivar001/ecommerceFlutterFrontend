import 'dart:io';

import 'package:ecommerce_flutter/src/domain/useCases/category/CategoryUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AdminCategoryCreateBloc
    extends Bloc<AdminCategoryCreateEvent, AdminCategoryCreateState> {
  CategoryUseCases categoryUseCases;

  AdminCategoryCreateBloc(this.categoryUseCases)
    : super(AdminCategoryCreateState()) {
    on<AdminCategoryCraeteInitEvent>(_onInitEvent);
    on<AdminCategoryCreateNameChanged>(_onNameChanged);
    on<AdminCategoryCreateDescriptionChanged>(_onDescriptionChanged);
    on<AdminCategoryCreatePickImage>(_onPickImage);
    on<AdminCategoryCreateTakePhoto>(_onTakePhoto);
    on<AdminCategoryCreateFormSubmit>(_onFormSubmit);
    on<AdminCategoryCreateResetForm>(_onResetForm);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(
    AdminCategoryCraeteInitEvent event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNameChanged(
    AdminCategoryCreateNameChanged event,
    Emitter<AdminCategoryCreateState> emit,
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
    AdminCategoryCreateDescriptionChanged event,
    Emitter<AdminCategoryCreateState> emit,
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
    AdminCategoryCreatePickImage event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(image: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onTakePhoto(
    AdminCategoryCreateTakePhoto event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(image: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onFormSubmit(
    AdminCategoryCreateFormSubmit event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));

    Resource response = await categoryUseCases.create.run(
      state.toCategory(),
      state.image!,
    );
    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onResetForm(
    AdminCategoryCreateResetForm event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    emit(state.resetForm());
    // state.formKey?.currentState?.reset();
    // emit(state.copyWith(image: null));
  }
}
