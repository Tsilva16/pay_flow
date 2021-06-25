import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({ Key? key }) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Escaneie o codigo de barras do boleto",
        style: TextStyles.buttonBackground,
        ),
        leading: BackButton(
          color: AppColors.background,
        ),
      ),
      body: Column(children:[
        Expanded(
          child: Container(
            color: Colors.black,
            )),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.transparent,
            )),
        Expanded(
          child: Container(
            color: Colors.black,))
      ],
      ),
        bottomNavigationBar: SetLabelButtons(
              primaryLabel: "Inserir codigo do boleto", 
              primaryOnPressed: () {},
              secondaryLabel: "Adicionar da galeria", 
              secondaryOnPressed: () {}));
    
  }
}