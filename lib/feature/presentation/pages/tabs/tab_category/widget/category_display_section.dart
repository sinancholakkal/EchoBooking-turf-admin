import 'package:echo_booking_admin/core/theme/colors.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/alert_box_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/costum_button.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CategoryDisplaySection extends StatefulWidget {
  const CategoryDisplaySection({
    super.key,
  });

  @override
  State<CategoryDisplaySection> createState() => _CategoryDisplaySectionState();
}

class _CategoryDisplaySectionState extends State<CategoryDisplaySection> {
  late TextEditingController _editController;
  @override
  void initState() {
    _editController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _editController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        
        itemCount: 10,
        itemBuilder: (context, index) {
          _editController.text = "Football";
         return  Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: kwhite),
            borderRadius: BorderRadius.circular(14)
          ),
           child: ListTile(
            
              title: TextWidget(text: "Football"),
              trailing: Row(
                spacing: 12,
                mainAxisSize: MainAxisSize.min,
                children: [
                 CustomButton(text: "Edit", onTap: (){
                  alertBox(context: context, onPressed: (){}, title: "Edit category",contentWidget: TextFormField(
                    controller: _editController,
                  ));
                 },height: 30,color: Colors.green,textStyle: TextStyle(color: Colors.white),),
                  CustomButton(text: "Delete", onTap: (){
                    alertBox(context: context, onPressed: (){}, title: "Delete category",content: "Are you sure want to delete this category?");
                  },height: 30,color: Colors.green,textStyle: TextStyle(color: Colors.white),),
                ],
              ),
            ),
         );
        },
      ),
    );
  }
}
