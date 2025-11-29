import 'package:ecommerce_flutter/src/domain/useCases/Address/CreateAddressUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Address/GetUserAddressUseCase.dart';

class AddressUseCases {
  CreateAddressUseCase create;
  GetUserAddressUseCase getUserAddress;
  AddressUseCases({required this.create, required this.getUserAddress});
}
