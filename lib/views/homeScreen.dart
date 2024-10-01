import 'package:flutter/material.dart';
import 'package:mvvm_project/data/response/status.dart';
import 'package:mvvm_project/utlis/routes/routesName.dart';
import 'package:mvvm_project/viewModel/home_view_model.dart';
import 'package:mvvm_project/viewModel/user_view_model.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();

    Provider.of<HomeViewModel>(context, listen: false).movieListApi();
    print("init start");
  }

  @override
  Widget build(BuildContext context) {
    final userViewModelProvider = Provider.of<UserViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          actions: [
            Center(
              child: InkWell(
                  onTap: () {
                    userViewModelProvider.removeUser().then((val) {
                      Navigator.popAndPushNamed(
                          context, RoutesName.loginScreen);
                    });
                  },
                  child: Text("Logout")),
            )
          ],
        ),
        body: Consumer<HomeViewModel>(
          builder: (BuildContext context, HomeViewModel value, Widget? child) {
            switch (value.movieList.status) {
              case Status.LOADING:
                return Text("data loading");

              case Status.COMPLETED:
                return Text("data");
              case Status.ERROR:
                Text(value.movieList.message.toString());
              default:
            }
            return Container();
          },
        )

        //  Column(
        //   children: [

        //   ],
        // ),
        );
  }
}
