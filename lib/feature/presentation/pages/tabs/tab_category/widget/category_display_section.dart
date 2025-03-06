import 'package:echo_booking_admin/core/theme/colors.dart';
import 'package:echo_booking_admin/feature/presentation/provider/category_provider/category_provider.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/alert_box_widget.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/costum_button.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/text_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    Future.microtask(() => 
      Provider.of<CategoryProvider>(context, listen: false).fetchCategory()
    );
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
      child: Consumer<CategoryProvider>(
        builder: (context, categoryProvider, child) {
          if(categoryProvider.isLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(categoryProvider.categorys.isEmpty){
            return Center(child: TextWidget(text: "No category"),);
          }
          return ListView.builder(
          
          itemCount: categoryProvider.categorys.length,
          itemBuilder: (context, index) {
            _editController.text = categoryProvider.categorys[index]['category'];
           return  Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: kwhite),
              borderRadius: BorderRadius.circular(14)
            ),
             child: ListTile(
              
                title: TextWidget(text: categoryProvider.categorys[index]['category']),
                trailing: Row(
                  spacing: 12,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Edit custom button---------
                   CustomButton(text: "Edit", onTap: (){
                    alertBox(context: context, onPressed: (){
                      Navigator.pop(context);
                      Provider.of<CategoryProvider>(context,listen: false).editCategory(category: _editController.text.trim(), id: categoryProvider.categorys[index]['id']);
                    }, title: "Edit category",contentWidget: TextFormField(
                      controller: _editController,
                    ));
                   },height: 30,color: Colors.green,textStyle: TextStyle(color: Colors.white),),
                   //Delete custom button---------------
                    CustomButton(text: "Delete", onTap: (){
                      alertBox(context: context, onPressed: (){
                         Navigator.pop(context);
                        Provider.of<CategoryProvider>(context,listen: false).deleteCategory(id: categoryProvider.categorys[index]['id']);
                      }, title: "Delete category",content: "Are you sure want to delete this category?");
                    },height: 30,color: Colors.green,textStyle: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
           );
          },
        );
        },
      
      ),
    );
  }
}
