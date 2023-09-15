import 'package:farmer_app/constants/colors.dart';
import 'package:flutter/material.dart';
class Policy extends StatelessWidget {
  const Policy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 36),
        
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,children: [
          const SizedBox(height: 10,),
           Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: GlobalColors.iconColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
           const SizedBox(
            height: 10,
           ),
           RichText(
            softWrap: true,
            textAlign: TextAlign.center,           
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Privacy  ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  
                  TextSpan(
                    text: 'Policy',
                    style: TextStyle(
                      fontSize: 25,
                      color: GlobalColors.primaryButtonColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
           Container(
            height:250,
            width:double.infinity,

            decoration: const BoxDecoration(
              image: DecorationImage(image:AssetImage("assets/images/policies.jpg"))
            ),
          ),
          Container(
            child: Column(children: const [Text("Thank you for chosing GoTool. GoTool is currently under development and so is the Privacy Policy. We will update the privacy policy once development is finished. And we will send notice of these updates.",
            textAlign: TextAlign.justify),
            SizedBox(height: 8,),
            Text("This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.",
            textAlign: TextAlign.justify),
            SizedBox(height: 8,),
            Text('We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. We have the right to modify this policy and will send notice of any changes.',
            textAlign: TextAlign.justify),],),

          ),
      

        ],), 
      ),
     ) );
  }
}