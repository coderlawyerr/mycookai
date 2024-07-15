import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mycooksai/const/colors.dart';
import 'package:mycooksai/data/kitchen_items.dart';
import 'package:mycooksai/widget/custom_textfield.dart';

class MyKitchenPage extends StatefulWidget {
  const MyKitchenPage({super.key});

  @override
  State<MyKitchenPage> createState() => _MyKitchenPageState();
}

class _MyKitchenPageState extends State<MyKitchenPage> {
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _productAmountController = TextEditingController();
  String _selectedUnit = 'Adet';

  void _addProduct() {
    final productName = _productNameController.text;
    final productAmount = _productAmountController.text;

    if (productName.isEmpty || productAmount.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Hata"),
            content: Text("Lütfen ürün adı ve miktarını giriniz."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Tamam"),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        kitchenItems.add({
          'productName': productName,
          'amount': '$productAmount $_selectedUnit',
        });
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xfff5f5f5),
        title: Text("Mutfağım"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Ürün Ekle"),
                  content: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextField(
                              label: "Ürün Adı",
                              controller: _productNameController),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                    label: "Miktar",
                                    controller: _productAmountController),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: _selectedUnit,
                                  items: [
                                    DropdownMenuItem(
                                      value: 'Adet',
                                      child: Text("Adet"),
                                    ),
                                    DropdownMenuItem(
                                      value: 'kg',
                                      child: Text("kg"),
                                    ),
                                    DropdownMenuItem(
                                      value: 'lt',
                                      child: Text("lt"),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedUnit = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text("Ekle"),
                      onPressed: _addProduct,
                    ),
                    ElevatedButton(
                      child: Text("İptal"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
        child: Column(
          children: [
            Text(
              "Buradan mutfağındaki ürünleri görebilir ve onları güncelleyebilirsin.",
              style: TextStyle(fontSize: 18.0),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: kitchenItems.length,
                itemBuilder: (context, index) {
                  final item = kitchenItems[index];
                  return Slidable(
                    key: Key(item['productName']! + index.toString()),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              kitchenItems.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${item["productName"]} silindi"),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(12.0),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Sil',
                        ),
                      ],
                    ),
                    child:
                        _MyKitchenCard(item['productName']!, item['amount']!),
                  );
                },
              ),
            ),
            SizedBox(height: 40)
          ],
        ),
      ),
    );
  }

  Widget _MyKitchenCard(String productName, String amount) {
    return Card(
      color: AppColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productName,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            Text(
              amount,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
