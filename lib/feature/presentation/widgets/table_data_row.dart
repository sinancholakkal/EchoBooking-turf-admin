import 'package:echo_booking_admin/feature/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class TableDataRowWidget extends StatelessWidget {
  void Function()? viewOnPressed;
  void Function()? bookingOnPressed;
  TableDataRowWidget(
      {super.key,
      required this.values,
      required this.data,
      required this.viewOnPressed,
      this.bookingOnPressed});

  final List<String> values;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: values
              .map(
                (value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: TableCell(
                      child: (value.contains("*"))
                          ? TextWidget(
                              text:
                                  "${value.split("*")[0]}\n${value.split("*")[1]}")
                          : value == "View"
                              ? ElevatedButton(
                                  onPressed: viewOnPressed, child: Text("View"))
                              : value == "Bookings"
                                  ? ElevatedButton(
                                      onPressed: bookingOnPressed??(){},
                                      child: Text("Bookings"))
                                  : TextWidget(text: value),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
