import 'dart:io';

import 'package:ecommerce_flutter/src/domain/useCases/products/ProductUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AdminProductUpdateBloc
    extends Bloc<AdminProductUpdateEvent, AdminProductUpdateState> {
  ProductUseCases productUseCases;

  AdminProductUpdateBloc(this.productUseCases)
    : super(AdminProductUpdateState()) {
    on<AdminProductUpdateInitEvent>(_onInitEvent);
    on<AdminProductUpdateNameChanged>(_onNameChanged);
    on<AdminProductUpdateDescriptionChanged>(_onDescriptionChanged);
    on<AdminProductUpdatePriceChanged>(_onPriceChanged);
    on<AdminProductUpdatePickImage>(_onPickImage);
    on<AdminProductUpdateTakePhoto>(_onTakePhoto);
    on<AdminProductUpdateFormSubmit>(_onFormSubmit);
    on<AdminProductUpdateResetForm>(_onResetForm);
  }

  final formKey = GlobalKey<FormState>();
  final List<int> imagesToUpdate = <int>[];

  Future<void> _onInitEvent(
    AdminProductUpdateInitEvent event,
    Emitter<AdminProductUpdateState> emit,
  ) async {
    emit(
      state.copyWith(
        id: event.product?.id,
        name: BlocFormItem(value: event.product?.name ?? ''),
        description: BlocFormItem(value: event.product?.description ?? ''),
        price: BlocFormItem(value: event.product?.price.toString() ?? ''),
        idCategory: event.product?.idCategory,
        formKey: formKey,
      ),
    );
  }

  Future<void> _onNameChanged(
    AdminProductUpdateNameChanged event,
    Emitter<AdminProductUpdateState> emit,
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
    AdminProductUpdateDescriptionChanged event,
    Emitter<AdminProductUpdateState> emit,
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

  Future<void> _onPriceChanged(
    AdminProductUpdatePriceChanged event,
    Emitter<AdminProductUpdateState> emit,
  ) async {
    emit(
      state.copyWith(
        price: BlocFormItem(
          value: event.price.value,
          error: event.price.value.isNotEmpty ? null : 'Ingresa el precio',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPickImage(
    AdminProductUpdatePickImage event,
    Emitter<AdminProductUpdateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (event.numberFile == 1) {
        emit(
          state.copyWith(
            image1: File(image.path),
            //formKey: formKey
          ),
        );
      } else if (event.numberFile == 2) {
        emit(
          state.copyWith(
            image2: File(image.path),
            //formKey: formKey
          ),
        );
      }
    }
  }

  Future<void> _onTakePhoto(
    AdminProductUpdateTakePhoto event,
    Emitter<AdminProductUpdateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      if (event.numberFile == 1) {
        emit(
          state.copyWith(
            image1: File(image.path),
            //formKey: formKey
          ),
        );
      } else if (event.numberFile == 2) {
        emit(
          state.copyWith(
            image2: File(image.path),
            //formKey: formKey
          ),
        );
      }
    }
  }

  Future<void> _onFormSubmit(
    AdminProductUpdateFormSubmit event,
    Emitter<AdminProductUpdateState> emit,
  ) async {
    //reinicio la lista
    imagesToUpdate.clear();

    emit(state.copyWith(response: Loading(), formKey: formKey));

    List<File> images = [];
    if (state.image1 != null) {
      images.add(state.image1!);
      imagesToUpdate.add(0);

      // emit(state.copyWith(response: response, formKey: formKey));
    }
    if (state.image2 != null) {
      images.add(state.image2!);
      imagesToUpdate.add(1);
    }
    Resource response = await productUseCases.update.run(
      state.id,
      state.toProduct(),
      images.isNotEmpty ? images : null,
      imagesToUpdate.isNotEmpty ? imagesToUpdate : null,
    );

    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onResetForm(
    AdminProductUpdateResetForm event,
    Emitter<AdminProductUpdateState> emit,
  ) async {
    emit(state.resetForm());
    // state.formKey?.currentState?.reset();
    // emit(state.copyWith(image: null));
  }
}
