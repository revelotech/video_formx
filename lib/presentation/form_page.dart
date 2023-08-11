import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formx_video/presentation/form_page_view_model.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late FormPageViewModel _viewModel;

  @override
  void initState() {
    _viewModel = FormPageViewModel();
    _viewModel.onViewReady();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF9FDFE),
        body: Observer(
          builder: (context) {
            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                  backgroundColor: Color(0xFF0C152C),
                  title: Center(child: Text('Form Example')),
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  bottom: PreferredSize(
                      preferredSize: Size.fromHeight(30),
                      child: SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Powered by Revelo',
                            style: TextStyle(
                              color: Color(0xFF5AC2D7),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      )),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Job application form',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: InputDecoration(
                        errorText: _viewModel.getFieldErrorMessage('email'),
                        border: const OutlineInputBorder(),
                        labelText: 'Your email*',
                        errorStyle: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onChanged: (value) =>
                          _viewModel.updateAndValidateField(value, 'email'),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _viewModel.getFieldValue('acceptedTerms'),
                              onChanged: (value) =>
                                  _viewModel.updateAndValidateField(
                                      value, 'acceptedTerms'),
                            ),
                            const Expanded(
                              child: Text(
                                'I accept the Terms and Conditions.',
                              ),
                            )
                          ],
                        ),
                        if (_viewModel.getFieldErrorMessage('acceptedTerms') !=
                            null)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Text(
                              _viewModel.getFieldErrorMessage('acceptedTerms')!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                if (_viewModel.showSuccessInfo)
                  SliverToBoxAdapter(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFBDE7EF),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: const EdgeInsets.all(24.0),
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Form results',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text('Email: ${_viewModel.getFieldValue('email')}'),
                          const SizedBox(height: 14),
                          Text(
                            'Accepted terms: '
                            '${_viewModel.getFieldValue('acceptedTerms')}',
                          ),
                          const SizedBox(height: 14),
                        ],
                      ),
                    ),
                  ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed:
                          _viewModel.isFormValid ? _viewModel.submitForm : null,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        minimumSize: const Size.fromHeight(48),
                        backgroundColor: Colors.blue,
                      ),
                      child: Text('Submit'),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
