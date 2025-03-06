import 'package:echo_booking_admin/domain/models/user_model.dart';
import 'package:echo_booking_admin/feature/presentation/provider/user_provider/user_provider.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/table_data_row.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDataRowBuilder extends StatelessWidget {
  const UserDataRowBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<UserProvider>(context).fetchAllUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              SizedBox(
                height: 300,
              ),
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                ),
                TextWidget(text: "No Users!"),
              ],
            ),
          );
        }
        final List<UserModel>? users = snapshot.data;
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: users!.length,
          itemBuilder: (context, index) {
            UserModel data = users[index];
    
            List<String> values = [
              "${index + 1}",
              data.userName,
              data.gender,
              data.phone,
              data.address
            ];
            return TableDataRowWidget(
              values: values,
              data: data,
              viewOnPressed: () {},
            );
          },
        );
      },
    );
  }
}
