import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      home:Imc(),
    )
  );
}

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String infor = "Informe seus dados";


  void reset(){
    setState(() {
      pesoController.text = "";
      alturaController.text = "";
      infor = "Informe seus dados";   
    });
  }

  void calcular(){
      double weight = double.parse(pesoController.text);
      double height = double.parse(alturaController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.5) {
        infor = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.5 && imc <= 24.9) {
        infor = "Peso normal(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 25.0 && imc <= 29.9) {
        infor = "Sobrepeso(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 30.0 && imc <= 34.9) {
        infor = "Obesidade grau 1 (${imc.toStringAsPrecision(3)})";
      } else {
        infor = "Obesidade grau 2 (${imc.toStringAsPrecision(3)})";
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Calculadora IMC",style:TextStyle(color:Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions:[
          IconButton(onPressed:reset , icon: Icon(Icons.update))
        ]
      ),
      body:Container(
        padding:EdgeInsets.all(16),
        child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
        Icon(Icons.person_2_outlined,size:120,color: Colors.green,),
        TextField(
          controller: pesoController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Peso (kg)',
            labelStyle: TextStyle(color:Colors.green,fontSize:25)
          ),
        ),

        TextField(
          controller:alturaController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Altura (cm)',
            labelStyle: TextStyle(color:Colors.green,fontSize:25)
          ),
        ),
        ElevatedButton(
          onPressed: calcular, 
          child:Text('Calcular'),
          style:ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 136, 198, 138),
            textStyle: const TextStyle(color :Colors.green,fontSize:25 )
          )  
        ),
        Text(infor,
          textAlign:TextAlign.center,
          style:TextStyle(color:Colors.green,fontSize: 25)
        )
      ]
      ),
      )
    );
  }
}