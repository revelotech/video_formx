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
                        border: OutlineInputBorder(),
                        labelText: 'Your email*',
                        errorStyle: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onChanged: (value) {}, //TODO: call function
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
                              value: false, //TODO: change to VM value
                              onChanged: (value) {}, //TODO: call function
                            ),
                            const Expanded(
                              child: Text(
                                'I accept the Terms and Conditions.',
                              ),
                            )
                          ],
                        ),
                        if (true) //TODO: Change to checkbox error validation
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Text(
                              '', //TODO: Add checkbox error here
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
                // TODO: add condition to show results
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
                        Text(
                          'Form results',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('Email: '),
                        SizedBox(height: 14),
                        Text('Accepted terms: '),
                        SizedBox(height: 14),
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
                      onPressed: () {}, //TODO: add submitForm callback
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