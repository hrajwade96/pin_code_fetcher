import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'selectable_text.dart' as st;
import '../model/location_details.dart';

class GenerateAddressOutput extends StatefulWidget {
  const GenerateAddressOutput({super.key, required this.data});
  final LocationData data;
  @override
  DataTableExample createState() => DataTableExample();
}

class DataTableExample extends State<GenerateAddressOutput> {
  // final List<DataRow> dataList= widget.data;

  @override
  Widget build(BuildContext context) {
    final ScrollController controller1 = ScrollController();
      final ScrollController controller2 = ScrollController();

    return Scrollbar(
      child: SingleChildScrollView(
        controller: controller2,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: controller1,
          child: 
          // const Center(
          //     child: SizedBox(
          //   child: Text(
          //     'Location Details',
          //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          //   ),
          // )),
          DataTable(
            columns: const [
              DataColumn(
                  label: Text('Pincode',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('State',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('City',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Area',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Locality',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
            ],
            rows: [
              if (widget.data.results != null)
                for (var i in widget.data.results!) _buildTableRow(i)
            ],
          ),
        ),
      ),
    );
  }

  DataRow _buildTableRow(Results result) {
    return DataRow(cells: [
      DataCell((st.Selectable(result.postalCode ?? ''))),
      DataCell(st.Selectable(result.adminName1 ?? '')),
      DataCell(st.Selectable(result.adminName2 ?? '')),
      DataCell(st.Selectable(result.adminName3 ?? '')),
      DataCell(st.Selectable(result.placeName ?? '')),
    ]);
  }
}
