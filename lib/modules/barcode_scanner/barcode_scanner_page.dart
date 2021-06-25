import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({ Key? key }) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvaibleCameras();
    super.initState();
  }

  @override
  void dispose() {
    controller.getAvaibleCameras();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [

          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier, builder: (_,status,__){
              if(status.showCamera){
                return Container(
                  child: status.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),

          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("Escaneie o codigo de barras do boleto",
                style: TextStyles.buttonBackground,
                ),
                centerTitle: true,
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
                      secondaryOnPressed: () {})),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier, builder: (_,status,__){
              if(status.hasError){
                  return BottomSheetWidget(
                  title: "Não foi possivel indentificar o codigo de barras",
                  subtitle: "Tente scannear novamente ou digite o codigo de barras",
                  primaryLabel: "Escanear Novamente",
                  primaryOnPressed: () {
                    controller.getAvaibleCameras();
                  },
                  secondaryLabel: "Digitar Codigo",
                  secondaryOnPressed: () {},
                  );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
    
  }
}