import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:konekseed_test/common/constant.dart';
import 'package:konekseed_test/common/utils.dart';
import 'package:konekseed_test/common/widget/custom_text_input.dart';
import 'package:konekseed_test/feature/target/presentation/presentation_provider.dart';

class AddTargetView extends ConsumerStatefulWidget {
  const AddTargetView({super.key});

  @override
  ConsumerState<AddTargetView> createState() => _AddTargetViewState();
}

class _AddTargetViewState extends ConsumerState<AddTargetView> {
  var startDate = DateTime.now();
  var endDate = DateTime.now();

  var categoryDropdown = 'Quantitative';
  var statusDropdown = 'to do';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void addTarget() => ref.read(targetNotifierProvider.notifier).addTarget(
        context: context,
        name: _nameController.text.trim(),
        weight: int.parse(_weightController.text.trim()),
        startDate: startDate,
        endDate: endDate,
        category: categoryDropdown,
        status: statusDropdown,
      );

  @override
  Widget build(BuildContext context) {
    final targetState = ref.watch(targetNotifierProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Add Target')),
        body: ListView(
          children: [
            Form(
              key: _formKey,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextInput(
                      title: "Name",
                      controller: _nameController,
                      enabled:
                          targetState.state == EnumState.loading ? false : true,
                      validator: (value) =>
                          value!.isEmpty ? "Please Fill The Field" : null,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Category',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        items: ['Quantitative', 'Qualitative']
                            .map(
                              (String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            )
                            .toList(),
                        value: categoryDropdown,
                        onChanged: (String? value) {
                          setState(() {
                            categoryDropdown = value!;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        menuItemStyleData: const MenuItemStyleData(height: 40),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Weight',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _weightController,
                      validator: (value) =>
                          value!.isEmpty ? "Please Fill The Field" : null,
                      decoration: decoration,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      enabled:
                          targetState.state == EnumState.loading ? false : true,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Start Date',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () => showDatePicker(
                        context: context,
                        initialDate: startDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2099),
                      ).then(
                        (value) {
                          setState(() {
                            if (value != null) startDate = value;
                          });
                        },
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 10)),
                            const Icon(Icons.date_range),
                            const SizedBox(width: 10),
                            Text(
                              DateFormat.yMEd().format(startDate).toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'End Date',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () => showDatePicker(
                        context: context,
                        initialDate: endDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2099),
                      ).then(
                        (value) {
                          setState(() {
                            if (value != null) endDate = value;
                          });
                        },
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 10)),
                            const Icon(Icons.date_range),
                            const SizedBox(width: 10),
                            Text(
                              DateFormat.yMEd().format(endDate).toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Status',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        items: ['to do', 'in progress', 'done']
                            .map(
                              (String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            )
                            .toList(),
                        value: statusDropdown,
                        onChanged: (String? value) {
                          setState(() {
                            statusDropdown = value!;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        menuItemStyleData: const MenuItemStyleData(height: 40),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            addTarget();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadowColor: Colors.black,
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: targetState.state == EnumState.loading
                            ? const Loader()
                            : const Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
