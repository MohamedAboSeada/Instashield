import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../forms/password_field/password_field.dart';

class Workspace extends StatefulWidget {
  const Workspace({super.key});

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  late final GlobalKey<FormBuilderState> _formKey;
  late final TextEditingController _createController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormBuilderState>();
    _createController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _createController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          alignment: .center,
          child: FormBuilder(
            key: _formKey,
            autovalidateMode: .onUserInteractionIfError,
            child: Column(
              crossAxisAlignment: .stretch,
              mainAxisSize: .min,
              children: [
                const PasswordField(
                  name: "password",
                  label: "Password",
                  hintText: "Create strong password",
                  type: .login,
                ),
                const SizedBox(height: 16.0),
                PasswordField(
                  name: "create_password",
                  label: "Create Password",
                  hintText: "Create strong password",
                  type: .signUp,
                  otherFieldController: _createController,
                ),
                const SizedBox(height: 16.0),
                PasswordField(
                  name: "confirm_password",
                  label: "Confirm Password",
                  hintText: "Create strong password",
                  type: .confirm,
                  otherFieldController: _createController,
                ),
                const SizedBox(height: 32.0),
                SizedBox(
                  height: 52.0,
                  child: FilledButton(
                    onPressed: () {
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        debugPrint(_formKey.currentState!.value.toString());
                      }
                    },
                    child: const Text("Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
