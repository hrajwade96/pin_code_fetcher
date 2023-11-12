// Import the style file
import 'package:flutter/material.dart';
import '../theme/custom_theme.dart';
import 'selectable_text.dart' as st;
import '../model/location_details.dart';

class GenerateAddressOutput extends StatefulWidget {
  const GenerateAddressOutput({Key? key, required this.data}) : super(key: key);
  final LocationData data;

  @override
  _GenerateAddressOutputState createState() => _GenerateAddressOutputState();
}

class _GenerateAddressOutputState extends State<GenerateAddressOutput> {
  late List<DataRow> _dataRows;

  @override
  void initState() {
    super.initState();
    _dataRows = widget.data.results?.map(_buildTableRow).toList() ?? [];
  }

  DataRow _buildTableRow(Results result) {
    return DataRow(cells: [
      DataCell(st.Selectable(result.postalCode ?? '')),
      DataCell(st.Selectable(result.adminName1 ?? '')),
      DataCell(st.Selectable(result.adminName2 ?? '')),
      DataCell(st.Selectable(result.adminName3 ?? '')),
      DataCell(st.Selectable(result.placeName ?? '')),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(

              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: DataTable(
                showBottomBorder: true,
                headingRowColor: MaterialStateProperty.all(kTableHeaderColor),
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text('Pincode', style: kTableHeaderTextStyle),
                  ),
                  DataColumn(
                    label: Text('State', style: kTableHeaderTextStyle),
                  ),
                  DataColumn(
                    label: Text('City', style: kTableHeaderTextStyle),
                  ),
                  DataColumn(
                    label: Text('Area', style: kTableHeaderTextStyle),
                  ),
                  DataColumn(
                    label: Text('Locality', style: kTableHeaderTextStyle),
                  ),
                ],
                rows: _dataRows,
              ),
            ),
          ),
        );
      },
    );
  }
}
