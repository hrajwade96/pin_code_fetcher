import 'package:flutter/material.dart';

import 'model/location_details.dart';  

class GenerateAddressOutput extends StatefulWidget {
  GenerateAddressOutput({required this.data});
  LocationData data;
  @override  
  _DataTableExample createState() => _DataTableExample();  
}  
  
class _DataTableExample extends State<GenerateAddressOutput> {  
    // final List<DataRow> dataList= widget.data;

  @override  
  Widget build(BuildContext context) {  
    return ListView(children: <Widget>[  
            const Center(  
                child: SizedBox(
                  child: Text(  
                    'Location Details',  
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),  
                  ),
                )),  
            DataTable(  
              columns: const [  
                DataColumn(label: Text(  
                    'Pincode',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                )),  
                DataColumn(label: Text(  
                    'State',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                )),  
                DataColumn(label: Text(  
                    'City',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                )),
                DataColumn(label: Text(  
                    'Area',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                )),
                DataColumn(label: Text(  
                    'Locality',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                ))  
              ],  
              rows: [  
                if(widget.data.results!=null)
                for(var i in widget.data.results!) _buildTableRow(i)  
 
              ],  
            ),  
          ]);
  }  
    DataRow _buildTableRow(Results result) {
    return DataRow(cells: [  
                  DataCell(Text(result.postalCode??'')),  
                  DataCell(Text(result.adminName1??'')),  
                  DataCell(Text(result.adminName2??'')),
                  DataCell(Text(result.adminName3??'')),
                  DataCell(Text(result.placeName??'')),
                ]); 
  }
}