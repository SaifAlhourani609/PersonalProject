import 'package:get/get.dart';
import 'app_colors.dart';



class AppVariables extends GetxController {

  ///=============== variable app. ===============
  /// Note !!
  /// To search for anything, all you have to do is type the name of the calss.

  /// ================================================     ======================================================
  ///                                                  NEW
  /// ================================================     ======================================================

  /// Data from Api ===================================================================

  //.

  /// Splash ===================================================================

  // splashScreen.
  var titleSplashScreen = "WashApp".obs;
  var titleSplashScreentest = 44.obs;

  /// Home =====================================================================

  //Home Appbar Widget.
  var home_appbar_logo_text = 'WashApp'.obs;
  var home_appbar_user_profile_image = 'assets/images/home/Completed-off.png'.obs;
  var home_appbar_user_profile_border_color = AppColors.appbarImageBorderColor.obs;

  // var home_appbar_user_name_text = '${_homeContr/oller.listOfPartners[0].name}'.obs;
  var home_appbar_user_name_text = "Guest".obs;

  var home_appbar_user_location_text = 'Canada, Ontario, Toronto'.obs;

  //Home Card Adc widget View All.
  var home_adc_card_view_all = 'Special Package and Offers'.obs;

  //Home Card Adc Widget
  var home_order_adc_card_number = 3.obs;

  //Home Basket Widget
  var home_basket_condition_there_are_items = false.obs; // basket card false to add items or true to view basket
  var home_basket_title_text_on = 'There is items in your basket'.obs;
  var home_basket_title_text_off = 'There is no items in your basket'.obs;
  var home_basket_subtitle_text_on = 'Basket is abandoned after \${3} Hours'.obs;
  var home_basket_subtitle_text_off = 'Add more items to basket'.obs;
  var home_basket_image_on = 'assets/images/home/laundry-basket64.png'.obs;
  var home_basket_image_off = 'assets/images/home/adcCardImage.png'.obs;
  var home_basket_button_text_on = 'View Basket'.obs;
  var home_basket_button_text_off = 'Add To Basket'.obs;

  //Home In Progress Orders Widget
  var home_order_card_view_all = 'In Progress Orders'.obs;
  var home_order_in_progress_card_number = 3.obs;
  var home_order_in_progress_card_no = '\${000002}'.obs;
  var home_order_in_progress_card_currency = '\${CAD} '.obs;
  var home_order_in_progress_card_total = '\${152.00}'.obs;
  var home_order_in_progress_card_status = '\${in Process}'.obs;
  var home_order_in_progress_card_step1 = 'Confirmed'.obs;
  var home_order_in_progress_card_step2 = 'Pick up'.obs;
  var home_order_in_progress_card_step3 = 'In Process'.obs;
  var home_order_in_progress_card_step4 = 'Drop off'.obs;
  var home_order_in_progress_card_step5 = 'Completed'.obs;
  var home_order_in_progress_condition_there_are_order = true.obs;

  //Home Orders History Widget
  var home_order_history_view_all = 'Orders History'.obs;
  var home_order_history_card_number =5.obs;
  var home_order_history_card_no = '\${000002}'.obs;
  var home_order_history_card_currency = '\${CAD} '.obs;
  var home_order_history_card_total = '\${152.00}'.obs;
  var home_order_history_card_status = '\${in Process}'.obs;
  var home_order_history_card_step1 = 'Confirmed'.obs;
  var home_order_history_card_step2 = 'Pick up'.obs;
  var home_order_history_card_step3 = 'In Process'.obs;
  var home_order_history_card_step4 = 'Drop off'.obs;
  var home_order_history_card_step5 = 'Completed'.obs;
  var home_order_history_condition_there_are_order = false.obs;
  var order_card_service_type = 'normal or express'.obs;
  var order_card_massage = 'massage'.obs;


  //Home Bottom Navigation Bar Widget
  var home_bottom_basket_title_text  = 'Your Basket'.obs;
  var home_bottom_basket_total_items = 'Total items: '.obs;
  var home_bottom_basket_total_items_count = '16'.obs;
  var home_bottom_basket_total_text = 'Total: '.obs;
  var home_bottom_basket_total_currency = '\$'.obs;
  var home_bottom_basket_total_price = 190.obs;
  var home_bottom_basket_total_tax = '\$20'.obs;
  var home_bottom_basket_total_percentage = '5%'.obs;
  var home_bottom_basket_tax_text = 'Tax '.obs;
  var home_bottom_basket_arrow_container_height = 11.37.obs;
  var home_bottom_basket_arrow_container_width = 7.0.obs;
  var home_bottom_condition_there_are_items = false.obs;

  /// Items ====================================================================

  //Items Search appbar
  var items_appbar_text_filed_hint = 'Items'.obs;

  //Items Card
  var items_show_delete_button = false.obs;


  /// Services =================================================================

  var items_services_text_header = 'You can choose one :'.obs;
  var items_add_to_basket_switch_button = true.obs;


  /// +++++ ====================================================================
  ///
  ///


  /// ================================================     ======================================================
  ///                                                  OLD
  /// ================================================     ======================================================

  // selectSignIn.
  // =
  var titleSelectSignIn = "WashApp".obs;
  var subtitleSelectSignIn = "A Unique Landry App".obs;
  var facebookBottonSelectSignIn = "Continue With Facebook".obs;
  var twitterBottonSelectSignIn = "Continue With Twitter".obs;
  var googleBottonSelectSignIn = "Continue With Google".obs;
  var appleBottonSelectSignIn = "Continue With Apple".obs;

  var signInBottonSelectSignIn = "Sign In".obs;
  var signUpBottonSelectSignIn = "Sign Up".obs;
  // =

  // SignIn.
  // =
  var titleSignIn = "WashApp".obs;
  var subtitle1SignIn = "Welcome back you've".obs;
  var subtitle2SignIn = "been missed".obs;

  var emailInputHintBottonSignIn = "Email".obs;
  var passwordInputHintBottonSignIn = "Password".obs;
  var BottontoSignIn = "Sign In".obs;
  // =

  // SignUp.
  // =
  var title1UnderImageSignUp = "We are to serve".obs;
  var title2UnderImageSignUp = "you all time".obs;
  var phoneInputHintBottonSignUp = "Phone Number".obs;
  var emailInputHintBottonSignUp = "Email".obs;
  var fullNameInputHintBottonSignUp = "Full Name".obs;
  var passwordInputHintBottonSignUp = "Password".obs;
  var confirmPasswordInputHintBottonSignUp = "Confirm Password".obs;
  var acceptTextline1SignUp = "By tapping on 'Sign Up' you agree that ".obs;
  var acceptTextline2SignUp = "you have read and accept our ".obs;
  var termsOfServiceSignUp = "Terms of Service ".obs;
  var prepositionSignUp = "and ".obs;
  var privacyPolicyTextBottonSignUp = "Privacy Policy".obs;
  var PointSignUp = ".".obs;

  var BottontoSignUp = "Sign Up".obs;
  // =

  // menu.
  // =
  var list1content1 = "Order History".obs;
  var list1content2 = "Washapp Help".obs; // have a list inside.
  var list1content3 = "Share With Friends (Referral)".obs;
  var list1content4 = "My Ratings".obs;
  var list1content5 = "DisPutes".obs;
  var list1content6 = "Log Out".obs;
  // =

}