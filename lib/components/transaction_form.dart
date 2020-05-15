import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function(String title, double value) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    if (titleController.text.isEmpty ||
        double.tryParse(valueController.text) <= 0) {
      return;
    }

    widget.onSubmit(
        titleController.text, double.tryParse(valueController.text) ?? 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (value) => _submitForm,
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (value) => _submitForm,
              controller: valueController,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    color: Colors.purple[50],
                    onPressed: _submitForm,
                    child: Text(
                      'NOVA TRANSAÇÃO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textColor: Colors.purple,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
