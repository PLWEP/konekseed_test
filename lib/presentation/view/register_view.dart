import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:konekseed_test/common/custom_text_input.dart';
import 'package:konekseed_test/common/utils.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  void backToLogin(BuildContext context) => Navigator.pop(context);

  var sectorDropdown = [];

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
          title: const Text('Pick image method'),
          children: [
            SimpleDialogOption(
              onPressed: () async {
                final file = await getFromCamera(imagePicker);
                setState(
                  () => image = file,
                );
                pop();
              },
              child: const Text('Open Kamera'),
            ),
            SimpleDialogOption(
              onPressed: () async {
                final file = await getFromGallery(imagePicker);
                setState(
                  () => image = file,
                );
                pop();
              },
              child: const Text('Open Gallery'),
            ),
            if (image != null)
              SimpleDialogOption(
                onPressed: () {
                  setState(
                    () => image = null,
                  );
                  pop();
                },
                child: const Text('Delete Logo'),
              ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Column(
                  children: [
                    Column(
                      textDirection: TextDirection.ltr,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
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
                                        : const Center(
                                            child: Icon(Icons.camera, size: 30),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomTextInput(
                                title: "Bussiness Name",
                                controller: _nameController,
                                enabled: true,
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
                                    enabled: false,
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
                          enabled: true,
                          validator: (value) =>
                              value!.isEmpty ? "Please Fill The Field" : null,
                        ),
                        const SizedBox(height: 10),
                        CustomTextInput(
                          title: "Email",
                          controller: _emailController,
                          enabled: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Fill The Field";
                            } else if (!EmailValidator.validate(value)) {
                              return "Email is not valid";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        PasswordTextInput(
                          title: "Password",
                          controller: _passwordController,
                          enabled: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Fill The Field";
                            } else if (value.length < 6) {
                              return "Password is too short";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        PasswordTextInput(
                          title: "Confirm Password",
                          controller: _confirmPasswordController,
                          enabled: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Fill The Field";
                            } else if (_passwordController.text !=
                                _confirmPasswordController.text) {
                              return "Password does not match";
                            } else if (value.length < 6) {
                              return "Password is too short";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => backToLogin(context),
                      child: const Text(
                        "Already have an account? Login here",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (image != null || sectorDropdown.isNotEmpty) {
                              // register();
                            } else {
                              showSnackBar(
                                context,
                                'Please input image and sector',
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text(
                          'Register',
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
            ],
          ),
        ),
      ),
    );
  }
}
