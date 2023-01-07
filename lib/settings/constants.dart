// App info
const String appName = "EBR";

// Route names
const String electricBillDetailsScreenRouteName =
    '/electric_bill_details_screen';
const String electricBillsListScreenRouteName = '/electric_bill_list_screen';
const String electricBillAddScreenRouteName = '/electric_bill_create_screen';
const String electricBillEditScreenRouteName = '/electric_bill_edit_screen';

const String authSignUpScreenRouteName = '/auth_sign_up_screen';
const String authSignInScreenRouteName = '/auth_sign_in_screen';
const String authPasswordRequestScreenRouteName =
    '/auth_password_forgot_screen';
const String authPasswordResetScreenRouteName =
    '/auth_password_reset_screen';

// Spaces
const double spaceSmall = 4.0;
const double spaceMedium = 8.0;
const double spaceLarge = 12.0;
const double spaceExtraLarge = 16.0;
const double spaceMax = 24.0;

// Screens
const String electricBillsListScreenTitle = 'Electric Bills';
const String electricBillEditScreenTitle = 'Edit';
const String electricBillAddScreenTitle = 'Add New';
const String electricBillDetailsScreenTitle = 'Details';

// Strings
const String currency = 'টাকা';

// Form validation
const String emailPattern =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
RegExp regExpEmail = RegExp(
  emailPattern,
  multiLine: false,
  caseSensitive: false,
);
const String passwordPattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{8,}$";
RegExp regExpPassword = RegExp(
  passwordPattern,
  multiLine: false,
  caseSensitive: true,
);
