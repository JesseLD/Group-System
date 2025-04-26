import 'package:flutter/material.dart';
import 'package:group_system_app/common/constants/app_colors.dart';
import 'package:group_system_app/common/widgets/popups.dart';

class OutdatedPage extends StatefulWidget {
  const OutdatedPage({super.key});

  @override
  State<OutdatedPage> createState() => _OutdatedPageState();
}

class _OutdatedPageState extends State<OutdatedPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showUpdatePopup(context, "Aplicativo Desatualizado",
          "Por favor, atualize o aplicativo para a versão mais recente.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      // body: ,
    );
  }
}
