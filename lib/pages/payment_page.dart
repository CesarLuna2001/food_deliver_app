import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_deliver_app/components/my_button.dart';
import 'package:food_deliver_app/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  // Key para validar el formulario de la tarjeta
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Variables para almacenar los datos de la tarjeta
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';

  // Variable para saber si el CVV está enfocado (mostrar reverso de la tarjeta)
  bool isCvvFocused = false;

  // Método que se ejecuta cuando el usuario toca "Pay now"
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // Si el formulario es válido, mostrar cuadro de confirmación con los datos
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Confirm Payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name: $cardHolderName"),
                Text("CVV Code: $cvvCode"),
              ],
            ),
          ),
          actions: [
            // Botón Cancelar: cierra el diálogo
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),

            // Botón Yes: cierra diálogo y navega a DeliveryProgressPage
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryProgressPage(),
                  ),
                );
              },
              child: const Text("Yes"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo según tema
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Widget visual que muestra la tarjeta con la información ingresada
              CreditCardWidget(
                cardNumber: cardNumber, 
                expiryDate: expiryDate, 
                cardHolderName: cardHolderName, 
                cvvCode: cvvCode, 
                showBackView: isCvvFocused, // Muestra reverso si CVV enfocado
                onCreditCardWidgetChange: (p0) {}, // Callback no usado aquí
              ),
          
              // Formulario para que el usuario ingrese los datos de la tarjeta
              CreditCardForm(
                cardNumber: cardNumber, 
                expiryDate: expiryDate, 
                cardHolderName: cardHolderName, 
                cvvCode: cvvCode, 
                onCreditCardModelChange: (data) {
                  // Actualiza los datos en estado cuando el formulario cambia
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                  });
                }, 
                formKey: formKey, // Asocia la key para validar
              ),
          
              // Botón para proceder con el pago
              MyButton(
                onTap: userTappedPay, 
                text: "Pay now",
              ),
          
              // Espacio extra opcional
              // const SizedBox(height: 25),
            ],
          ),
        ),
      )
    );
  }
}
