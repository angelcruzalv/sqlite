import 'package:flutter/material.dart';
import 'package:flutter_app_sqlite/scr/services/scanlist_provider.dart';
import 'package:flutter_app_sqlite/scr/utils/utils.dart';
import 'package:provider/provider.dart';

class ScanTiles extends StatelessWidget {
  final String type;

  const ScanTiles({@required this.type});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.only(left: 12.0, right: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          onDismissed: (DismissDirection direction) {
            Provider.of<ScanListProvider>(context, listen: false)
                .deleteScanById(scans[index].id);
          },
          child: ListTile(
            leading: Icon(
              this.type == 'http' ? Icons.link : Icons.map,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(scans[index].valor),
            subtitle: Text(scans[index].id.toString()),
            trailing: Icon(Icons.keyboard_arrow_down),
            onTap: () {
              launchURL(context, scans[index]);
            },
          ),
        );
      },
    );
  }
}
