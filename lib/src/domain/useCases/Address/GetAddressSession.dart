import 'package:ecommerce_flutter/src/domain/repository/AddressRepository.dart';

class GetAddressSession {
  AddressRepository addressRepository;
  GetAddressSession(this.addressRepository);

  run() => addressRepository.getAddressSession();
}
