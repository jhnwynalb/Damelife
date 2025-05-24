import 'package:flutter/material.dart';

class VendPage extends StatefulWidget {
  const VendPage({super.key});

  @override
  State<VendPage> createState() => _VendPageState();
}

class _VendPageState extends State<VendPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  int _photoCount = 0;

  @override
  void dispose() {
    _productNameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product submitted successfully!')),
      );
      _formKey.currentState!.reset();
      setState(() {
        _photoCount = 0;
      });
    }
  }

  OutlineInputBorder _darkGreenBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 0, 41, 0)),
    );
  }

  TextStyle _greenLabelStyle() {
    return const TextStyle(color: Color(0xFF015701));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
              color: Colors.white,
            ),
          ),
          title: const Text(
            'Vend Product',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 1, 135, 1),
                      Color.fromARGB(255, 0, 64, 1),
                      Color.fromARGB(255, 0, 34, 5),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  onPressed: _submitForm,
                  child: const Text(
                    'Vend',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Juan Dela Cruz',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Icon(Icons.storefront, size: 16, color: Color.fromARGB(255, 56, 56, 56)),
                            SizedBox(width: 6),
                            Text(
                              'Selling in the University Market',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 56, 56, 56),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 0, 41, 0)),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[100],
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _photoCount++;
                    });
                  },
                  child: Center(
                    child: _photoCount == 0
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.photo_camera, size: 40, color: Color.fromARGB(255, 0, 41, 0)),
                              SizedBox(height: 8),
                              Text('Tap to add photos', style: TextStyle(color: Color.fromARGB(255, 0, 41, 0))),
                            ],
                          )
                        : Text(
                            '$_photoCount photo(s) added',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 41, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _productNameController,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  labelStyle: _greenLabelStyle(),
                  border: _darkGreenBorder(),
                  enabledBorder: _darkGreenBorder(),
                  focusedBorder: _darkGreenBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter product name' : null,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                  labelStyle: _greenLabelStyle(),
                  prefixText: '',
                  border: _darkGreenBorder(),
                  enabledBorder: _darkGreenBorder(),
                  focusedBorder: _darkGreenBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter price';
                  }
                  final price = double.tryParse(value);
                  if (price == null || price <= 0) {
                    return 'Enter a valid price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: _greenLabelStyle(),
                  border: _darkGreenBorder(),
                  enabledBorder: _darkGreenBorder(),
                  focusedBorder: _darkGreenBorder(),
                ),
                maxLines: 3,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter description' : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
