import 'package:flutter/material.dart';

import '../controllers/units_controller.dart';

class UnitsView extends StatefulWidget {
  const UnitsView({super.key});

  @override
  State<UnitsView> createState() => _UnitsViewState();
}

class _UnitsViewState extends State<UnitsView> {
  final UnitService _unitService = UnitService();

  final TextEditingController _unitController = TextEditingController();

  String _selectedValueType = 'double';
  // Varsayılan olarak double
  List<Map<String, dynamic>> _units = [];

  @override
  void initState() {
    super.initState();
    _loadUnits();
  }

  _loadUnits() async {
    var units = await _unitService.getUnits();
    setState(() {
      _units = units;
    });
  }

  // Ölçü birimi ekleme
  _addUnit() {
    String unit = _unitController.text;

    if (unit.isNotEmpty) {
      _unitService.addUnit(unit, _selectedValueType).then((_) {
        _loadUnits();
        _unitController.clear();
      });
    }
  }

  // Ölçü birimini silme
  _removeUnit(String unitId) {
    _unitService.removeUnit(unitId).then((_) {
      _loadUnits();
    });
  }

  // Ölçü türü seçimi
  _onValueTypeChanged(String? newValue) {
    setState(() {
      _selectedValueType = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UnitsView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _unitController,
              decoration: InputDecoration(labelText: 'Unit (e.g. kg, sany)'),
            ),
          ),
          DropdownButton<String>(
            value: _selectedValueType,
            onChanged: _onValueTypeChanged,
            items: ['double', 'int', 'string'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: _addUnit,
            child: Text('Add Unit'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _units.length,
              itemBuilder: (context, index) {
                var unit = _units[index];
                return ListTile(
                  title: Text('${unit['unit']}'),
                  subtitle: Text('Value Type: ${unit['valueType']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeUnit(unit['id']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
