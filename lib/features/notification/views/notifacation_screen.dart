import 'package:eccommerce_riverpord/features/notification/views/notification_view_screen.dart';
import 'package:flutter/material.dart';

class NotifacationScreen extends StatelessWidget {
  const NotifacationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (mcontext, index) {
            return _notificationCardTile(context,index);
          }),
      ),
    );
  }

  ListTile _notificationCardTile( BuildContext context,int index) {
    return ListTile(
      contentPadding: EdgeInsets.all(3),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context) => NotificationViewScreen(),));
      },
      leading: CircleAvatar(child: Text("N")),
          title: Text('Notification $index'),
          subtitle: Text("Product $index Delivery on Progress..", overflow: TextOverflow.ellipsis,),
        );
  }
}