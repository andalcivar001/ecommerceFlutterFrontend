import 'package:ecommerce_flutter/src/data/dataSource/remote/services/MercadoPagoService.dart';
import 'package:ecommerce_flutter/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:ecommerce_flutter/src/domain/repository/MercadoPagoRepository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class MercadoPagoRepositoryImpl extends MercadoPagoRepository {
  MercadoPagoService mercadoPagoService;

  MercadoPagoRepositoryImpl(this.mercadoPagoService);

  @override
  Future<Resource<List<MercadoPagoIdentificationType>>>
  getIdentificationTypes() {
    return mercadoPagoService.getIdentificationTypes();
  }
}
