import 'package:correctsoc/core/components/components.dart';
import 'package:correctsoc/features/presentation/screens/onbaording/widgets/custom_indicator.dart';
import 'package:correctsoc/features/presentation/screens/onbaording/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../data/shared/local_network.dart';
import '../../tools/backgroundimage1.dart';
import '../selectlanguage/select_language.dart';

class OnBoardingBody extends StatefulWidget {

  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {

 PageController? pageController;



   @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return    Scaffold(
      body: Stack(
        children: [
          const Background2Widget(),
          CustomPageView(pageController: pageController,),
            CustomIndicator( dotIndex: pageController!.hasClients ? pageController?.page : 0,),
            //  Visibility(
            //   visible:   pageController!.hasClients
            //   ? (pageController?.page == 3 ? false : true)
            //   : true,
            //    child: Padding(
            //      padding:  EdgeInsets.only(top: 80,left: 280.dg,right: 35),
            //      child: SubTitle(text: 'Skip'.tr(context), size: 18, color: whiteColor, weight: FontWeight.bold),
            //    ),
            //  ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: 
              
               InkWell(
                onTap: (){
                 if(pageController!.page! < 3){
                  pageController?.nextPage(duration: const Duration(microseconds: 500), curve: Curves.easeIn);
                 }else{
                   navigateAndFinish(context,  const SelectLanguage());
                 }
                },
                 child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [bg3, bg4],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child:
                  
                    Center(
                    child: pageController!.hasClients
                    ?(pageController?.page == 3 ?  const Icon(Icons.arrow_right_alt,) : const Icon(Icons.arrow_right_alt,))
                    :const Icon(Icons.arrow_right_alt,),
                    //  SubTitle(
                    // text: pageController!.hasClients
                    // ?(pageController?.page == 3 ? 'Get started'.tr(context) : 'Nxt'.tr(context))
                    // :'Nxt'.tr(context),
                    //  size: 18, color: textTitleColor, weight: FontWeight.w600)
                     ),
                  
                  //  IconButton(
                  //     onPressed: () {
                  //       navigateAndFinish(context, const SelectLanguage());
                  //     },
                  //     icon: const Icon(
                  //       Icons.arrow_right_alt,
                  //       size: 35,
                  //     )
                  //     ),
                               ),
               ),
            ),
          ),
        ],
      ),
    );
  }
}

//  Icon(Icons.arrow_right_alt,)