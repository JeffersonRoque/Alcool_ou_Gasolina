import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class alcoolGasolina extends StatefulWidget {
  @override
  _alcoolGasolinaState createState() => _alcoolGasolinaState();
}

class _alcoolGasolinaState extends State<alcoolGasolina> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = "";

  void _calcular(){
    double precoAlcool = double.tryParse(this._controllerAlcool.text);
    double precoGasolina = double.tryParse(this._controllerGasolina.text);

    setState(() {
      if(precoAlcool == null || precoAlcool <= 0 || precoGasolina == null || precoGasolina <= 0){
        this._resultado = "Preço inválido, digite números maiores que 0 e utilizando (.)";
      }else if ((precoAlcool / precoGasolina) >= 0.7){
        this._resultado = "Melhor abastecer com Gasolina !";
      }else {
        this._resultado = "Melhor abastecer com Álcool !";
      }
//      Limpar os campos
//      this._controllerAlcool.clear();
//      this._controllerGasolina.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: new Container(
            child: SingleChildScrollView( //Permite a quebra de espaço
              padding: new EdgeInsets.all(32),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: new Image.asset("images/logo.png"),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(bottom: 10),
                    child: new Text(
                      "Saiba qual a melhor opção para abastecimento do seu carro",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Preço Alcool, ex: 1.59"
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    controller: this._controllerAlcool,
                  ),
                  new TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Preço Gasolina, ex: 3.15"
                    ),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    controller: this._controllerGasolina,
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: 10),
                    child: new RaisedButton(
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(15),
                      color: Colors.lightBlueAccent,
                      onPressed: this._calcular,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      this._resultado,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
    );
  }
}
