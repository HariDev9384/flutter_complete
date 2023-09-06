import 'package:complete/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductHome extends StatefulWidget {
  @override
  _ProductHomeState createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  String id = "";

  @override
  void initState() {
    super.initState();
    // Fetch data or perform any initialization here
    fetch();
    
  }
  fetch()async{
    var prov =Provider.of<ProductsViewModel>(context,listen: false);
    await prov.fetchProductListApi();
    if(mounted){
      setState(() {
        id=prov.product.data!.id.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Screen"),
      ),
      body: Center(
        child: Text(id),
      ),
    );
  }
}
