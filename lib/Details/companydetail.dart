import 'package:directories/Details/detailpage.dart';
import 'package:flutter/material.dart';

class CompanyDetail extends StatefulWidget {
  final Company_Detail details;
  const CompanyDetail({super.key, required this.details});

  @override
  State<StatefulWidget> createState() {
    return CompanyDetailState();
  }
}

class CompanyDetailState extends State<CompanyDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   return Scaffold(
      appBar: AppBar(
       title: Text(
          widget.details.name,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: size.height * 0.55,
                    ),
                    decoration: BoxDecoration(
                        borderRadius:const BorderRadius.only(                           
                            bottomRight: Radius.circular(100)),
                        image: DecorationImage(
                            image: AssetImage(
                            widget.details.imageUrl,
                            ),
                            fit: BoxFit.fill)
                            ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 10,
                    child: Text(
                      widget.details.name,
                      ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
             const Text(
                "Company details",
              ),
              Divider(
                color: Colors.black,
                indent: size.width * 0.045,
                endIndent: size.width * 0.045,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Text(widget.details.imageUrl,)),
                 SizedBox(
                height: size.height * 0.02,
              ),
             const Text(
                "Contact Agent",
              ),
            ],
          ),
        ),
      )),
    );
  }
}
