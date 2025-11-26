import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/ClientShoppingBagBottomBar.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/ClientShoppingBagItem.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/bloc/ClientShoppingBagEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/bloc/ClientShoppingBagState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientShoppingBagPage extends StatefulWidget {
  const ClientShoppingBagPage({super.key});

  @override
  State<ClientShoppingBagPage> createState() => _ClientShoppingBagPageState();
}

class _ClientShoppingBagPageState extends State<ClientShoppingBagPage> {
  ClientShoppingBagBloc? bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bloc?.add(GetClientShoppingBag());
      bloc?.add(GetTotalClientShoppingBag());
    });
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<ClientShoppingBagBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Mi Orden')),
      body: BlocBuilder<ClientShoppingBagBloc, ClientShoppingBagState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ClientShoppingBagItem(bloc, state, state.products[index]);
            },
          );
        },
      ),
      bottomNavigationBar:
          BlocBuilder<ClientShoppingBagBloc, ClientShoppingBagState>(
            builder: (context, state) {
              return ClientShoppingBagBottomBar(state);
            },
          ),
    );
  }
}
