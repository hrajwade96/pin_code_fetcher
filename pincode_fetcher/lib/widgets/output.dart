import 'package:flutter/material.dart';  

class GenerateAddressOutput extends StatefulWidget {
  final List<DataRow> dataList;
   GenerateAddressOutput({required this.dataList});
  
  @override  
  _DataTableExample createState() => _DataTableExample();  
}  
  
class _DataTableExample extends State<GenerateAddressOutput> {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: Scaffold(  
          appBar: AppBar(  
            title: const Text('Flutter DataTable Example'),  
          ),  
          body: ListView(children: <Widget>[  
            const Center(  
                child: Text(  
                  'People-Chart',  
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),  
                )),  
            DataTable(  
              columns: const [  
                DataColumn(label: Text(  
                    'ID',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                )),  
                DataColumn(label: Text(  
                    'Name',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                )),  
                DataColumn(label: Text(  
                    'Profession',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                )),  
              ],  
              rows: const [  
                DataRow(cells: [  
                  DataCell(Text('1')),  
                  DataCell(Text('Stephen')),  
                  DataCell(Text('Actor')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('5')),  
                  DataCell(Text('John')),  
                  DataCell(Text('Student')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('10')),  
                  DataCell(Text('Harry')),  
                  DataCell(Text('Leader')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('15')),  
                  DataCell(Text('Peter')),  
                  DataCell(Text('Scientist')),  
                ]),  
              ],  
            ),  
          ])  
      ),  
    );  
  }  
}