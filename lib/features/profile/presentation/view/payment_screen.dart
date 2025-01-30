import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int? _expandedIndex = 0; // Tracks the currently expanded panel index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Payment Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ExpansionPanelList(
            dividerColor: Colors.grey[200],
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _expandedIndex = isExpanded ? index : null; 
              });
            },
            children: [
              _buildPaymentOption(
                index: 0,
                title: 'Credit Card',
                child: _buildCreditCardForm(),
              ),
              _buildPaymentOption(
                index: 1,
                title: 'Debit Card',
                child: _buildDebitCardForm(),
              ),
              _buildPaymentOption(
                index: 2,
                title: 'Net Banking',
                child: _buildNetBankingForm(),
              ),
              _buildPaymentOption(
                index: 3,
                title: 'Cash on Delivery',
                child: _buildCashOnDeliveryInfo(),
              ),
              _buildPaymentOption(
                index: 4,
                title: 'PayPal',
                child: _buildPayPalForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ExpansionPanel _buildPaymentOption({
    required int index,
    required String title,
    required Widget child,
  }) {
    return ExpansionPanel(
      isExpanded: _expandedIndex == index,
      headerBuilder: (context, isExpanded) {
        return ListTile(
          title: Text(title),
        );
      },
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }

  Widget _buildCreditCardForm() {
    return const Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Card Number',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: 'Cardholder\'s Name',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Expiration Date',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDebitCardForm() {
    return _buildCreditCardForm(); // Reusing the same form for simplicity
  }

  Widget _buildNetBankingForm() {
    return const Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Bank Name',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: 'Account Number',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _buildCashOnDeliveryInfo() {
    return const Text(
      'You can pay with cash upon delivery of your order.',
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildPayPalForm() {
    return const Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'PayPal Email',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}