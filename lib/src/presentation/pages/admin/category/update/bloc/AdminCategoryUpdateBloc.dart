import 'dart:io';

import 'package:ecommerce_flutter/src/domain/useCases/category/CategoryUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AdminCategoryUpdateBloc
    extends Bloc<AdminCategoryUpdateEvent, AdminCategoryUpdateState> {
  CategoryUseCases categoryUseCases;

  AdminCategoryUpdateBloc(this.categoryUseCases)
    : super(AdminCategoryUpdateState()) {
    on<AdminCategoryUpdateInitEvent>(_onInitEvent);
    on<AdminCategoryUpdateNameChanged>(_onNameChanged);
    on<AdminCategoryUpdateDescriptionChanged>(_onDescriptionChanged);
    on<AdminCategoryUpdatePickImage>(_onPickImage);
    on<AdminCategoryUpdateTakePhoto>(_onTakePhoto);
    on<AdminCategoryUpdateFormSubmit>(_onFormSubmit);
    on<AdminCategoryUpdateResetForm>(_onResetForm);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(
    AdminCategoryUpdateInitEvent event,
    Emitter<AdminCategoryUpdateState> emit,
  ) async {
    emit(
      state.copyWith(
        id: event.category?.id,
        name: BlocFormItem(value: event.category?.name ?? ''),
        description: BlocFormItem(value: event.category?.description ?? ''),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onNameChanged(
    AdminCategoryUpdateNameChanged event,
    Emitter<AdminCategoryUpdateState> emit,
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
    AdminCategoryUpdateDescriptionChanged event,
    Emitter<AdminCategoryUpdateState> emit,
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
    AdminCategoryUpdatePickImage event,
    Emitter<AdminCategoryUpdateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(image: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onTakePhoto(
    AdminCategoryUpdateTakePhoto event,
    Emitter<AdminCategoryUpdateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(image: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onFormSubmit(
    AdminCategoryUpdateFormSubmit event,
    Emitter<AdminCategoryUpdateState> emit,
  ) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));

    Resource response = await categoryUseCases.update.run(
      state.id,
      state.toCategory(),
      state.image,
    );
    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onResetForm(
    AdminCategoryUpdateResetForm event,
    Emitter<AdminCategoryUpdateState> emit,
  ) async {
    emit(state.resetForm());
  }
}
