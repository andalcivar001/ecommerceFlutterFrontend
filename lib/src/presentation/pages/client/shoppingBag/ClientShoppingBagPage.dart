import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/ClientShoppingBagItem.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/bloc/ClientShoppingBagEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/bloc/ClientShoppingBagState.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
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
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.grey[300],
        child: Column(
          children: [
            Divider(color: Colors.grey[400], height: 0),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Total: \$0',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 180,
                  child: DefaultButton(
                    text: 'Confirmar Orden',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
