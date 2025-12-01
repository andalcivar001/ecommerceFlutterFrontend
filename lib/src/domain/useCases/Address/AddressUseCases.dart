import 'package:ecommerce_flutter/src/domain/useCases/Address/CreateAddressUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Address/DeleteAddressFromSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Address/DeleteAddressUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Address/GetAddressSession.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Address/GetUserAddressUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Address/SaveAddressInSessionUseCase.dart';

class AddressUseCases {
  CreateAddressUseCase create;
  GetUserAddressUseCase getUserAddress;
  SaveAddressInSessionUseCase saveAddressInSession;
  GetAddressSession getAddressSession;
  DeleteAddressUseCase delete;
  DeleteAddressFromSessionUseCase deleteFromSession;
  AddressUseCases({
    required this.create,
    required this.getUserAddress,
    required this.saveAddressInSession,
    required this.getAddressSession,
    required this.delete,
    required this.deleteFromSession,
  });
}
