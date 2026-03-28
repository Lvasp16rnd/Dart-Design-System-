import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart'; // Importe o pacote flutter_colorpicker
import 'package:teste_gemini/DesignSystem/Components/Configurations/LetterChange/letter_change_view_model.dart';

class LetterChange extends StatelessWidget {
  const LetterChange({super.key});

  @override
  Widget build(BuildContext context) {
    // Consome o ViewModel que será provido globalmente
    final viewModel = Provider.of<LetterChangeViewModel>(context);

    return ListView(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Tamanho da Fonte'),
          trailing: DropdownButton<double>(
            value: viewModel.fontSize,
            onChanged: (double? newValue) {
              if (newValue != null) {
                viewModel.setFontSize(newValue);
              }
            },
            items: <double>[12, 14, 16, 18, 20].map((double value) {
              return DropdownMenuItem<double>(
                value: value,
                child: Text(value.toStringAsFixed(0)),
              );
            }).toList(),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Cor da Fonte'),
          trailing: CircleAvatar(
            backgroundColor: viewModel.selectedColor,
            radius: 15,
          ),
          onTap: () {
            _showColorPicker(context, viewModel);
          },
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Estilo da Fonte'),
          trailing: DropdownButton<String>(
            value: viewModel.fontFamily,
            onChanged: (String? newValue) {
              if (newValue != null) {
                viewModel.setFontFamily(newValue);
              }
            },
            items: <String>['Roboto', 'Lato', 'Montserrat']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void _showColorPicker(BuildContext context, LetterChangeViewModel viewModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escolha uma cor'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: viewModel.selectedColor,
              onColorChanged: (Color color) {
                viewModel.setColor(color);
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(child: const Text('OK'), onPressed: () => Navigator.of(context).pop()),
          ],
        );
      },
    );
  }
}