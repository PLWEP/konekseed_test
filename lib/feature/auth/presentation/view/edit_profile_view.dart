// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:konekseed_test/common/constant.dart';

import 'package:konekseed_test/common/utils.dart';
import 'package:konekseed_test/common/widget/custom_text_input.dart';
import 'package:konekseed_test/feature/auth/data/model/bussiness.dart';
import 'package:konekseed_test/feature/auth/presentation/presentation_provider.dart';

class EditProfileView extends ConsumerStatefulWidget {
  final Bussiness bussiness;
  const EditProfileView({
    Key? key,
    required this.bussiness,
  }) : super(key: key);

  @override
  ConsumerState<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends ConsumerState<EditProfileView> {
  List<String> sectorDropdown = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  File? image;

  void pop() => Navigator.pop(context);

  Future<void> showPictureDialog() async {
    final imagePicker = ImagePicker();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Pilih Metode'),
          children: [
            SimpleDialogOption(
              onPressed: () async {
                final file = await getFromCamera(imagePicker);
                setState(() {
                  image = file;
                });
                pop();
              },
              child: const Text('Buka Kamera'),
            ),
            SimpleDialogOption(
              onPressed: () async {
                final file = await getFromGallery(imagePicker);
                setState(() {
                  image = file;
                });
                pop();
              },
              child: const Text('Buka Gallery'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.bussiness.name;
    _valueController.text = widget.bussiness.value;
    sectorDropdown = [...widget.bussiness.sector];
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _valueController.dispose();
  }

  void edit() {
    ref.read(authNotifierProvider.notifier).editBussinessProfile(
          context,
          widget.bussiness.copyWith(
            name: _nameController.text.trim(),
            sector: sectorDropdown,
            value: _valueController.text.trim(),
          ),
          image,
        );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: ListView(
          children: [
            Form(
              key: _formKey,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  children: [
                    Column(
                      textDirection: TextDirection.ltr,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Logo',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () => showPictureDialog(),
                                  child: Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(),
                                    ),
                                    child: image != null
                                        ? Image.file(image!)
                                        : Image.network(widget.bussiness.logo),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomTextInput(
                                title: "Bussiness Name",
                                controller: _nameController,
                                enabled: authState.state == EnumState.loading
                                    ? false
                                    : true,
                                validator: (value) => value!.isEmpty
                                    ? "Please Fill The Field"
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Bussiness Sector',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            items: ['Industry', 'Finance', 'F&B', 'Tech']
                                .map(
                                  (String item) => DropdownMenuItem(
                                    value: item,
                                    enabled:
                                        authState.state == EnumState.loading
                                            ? false
                                            : true,
                                    child: StatefulBuilder(
                                      builder: (context, menuSetState) {
                                        final isSelected =
                                            sectorDropdown.contains(item);
                                        return InkWell(
                                          onTap: () {
                                            if (sectorDropdown.length < 3) {
                                              isSelected
                                                  ? sectorDropdown.remove(item)
                                                  : sectorDropdown.add(item);
                                            } else {
                                              sectorDropdown.remove(item);
                                            }
                                            setState(() {});
                                            menuSetState(() {});
                                          },
                                          child: Container(
                                            height: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            child: Row(
                                              children: [
                                                isSelected
                                                    ? const Icon(Icons
                                                        .check_box_outlined)
                                                    : const Icon(Icons
                                                        .check_box_outline_blank),
                                                const SizedBox(width: 16),
                                                Expanded(
                                                  child: Text(item),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                                .toList(),
                            value: sectorDropdown.isEmpty
                                ? null
                                : sectorDropdown.last,
                            onChanged: (value) {},
                            selectedItemBuilder: (context) {
                              return ['Industry', 'Finance', 'F&B', 'Tech'].map(
                                (item) {
                                  return Container(
                                    alignment: AlignmentDirectional.center,
                                    child: Text(
                                      sectorDropdown.join(', '),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 1,
                                    ),
                                  );
                                },
                              ).toList();
                            },
                            buttonStyleData: ButtonStyleData(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              height: 40,
                              decoration: BoxDecoration(border: Border.all()),
                            ),
                            menuItemStyleData:
                                const MenuItemStyleData(height: 40),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextInput(
                          title: 'Bussiness Value',
                          controller: _valueController,
                          enabled: authState.state == EnumState.loading
                              ? false
                              : true,
                          validator: (value) =>
                              value!.isEmpty ? "Please Fill The Field" : null,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (image != null || sectorDropdown.isNotEmpty) {
                              edit();
                            } else {
                              showSnackBarAlert(
                                context,
                                'Please input image and sector',
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: authState.state == EnumState.loading
                            ? const Loader()
                            : const Text(
                                'Edit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
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
