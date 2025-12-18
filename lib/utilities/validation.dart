// import 'package:flutter/cupertino.dart';
// import 'package:regexed_validator/regexed_validator.dart';
// import 'package:talent_app/extension/context_extension.dart';
// import 'package:talent_app/logger/app_logger.dart';
//
// class Validators {
//   BuildContext context;
//
//   Validators(this.context);
//
//   String? validatorName(value) {
//     if (value.isEmpty) {
//       return context.loc.validationName;
//     }
//     return null;
//   }
//
//   String? validatorPassword(value) {
//     if (value.isEmpty) {
//       return context.loc.validationPass;
//     } else if (value.toString().length < 8) {
//       return context.loc.validationPassLength;
//     }
//     return null;
//   }
//
//   String? validatorPasswordForLogin(value) {
//     if (value.isEmpty) {
//       return context.loc.validationPass;
//     }
//     return null;
//   }
//
//   String? validatorEmail(value) {
//     if (value.isEmpty) {
//       return context.loc.validationEmail;
//     } else if (validator.email(value) == false) {
//       return context.loc.validationEmailValid;
//     }
//
//     return null;
//   }
//
//   String? validatorPhone(value) {
//     if (value.isEmpty) {
//       return context.loc.validationPhone;
//     }
//     return null;
//   }
//
//   String? validatorFirstName(value) {
//     if (value.isEmpty) {
//       return context.loc.validationFirstName;
//     }
//     return null;
//   }
//
//   String? validatorLastName(value) {
//     if (value.isEmpty) {
//       return context.loc.validationLastName;
//     }
//     return null;
//   }
//
//   // String? validatorGovtId(value) {
//   //   if (value.isEmpty && value.length()) {
//   //     return context.loc.validationID;
//   //   }
//   //   return null;
//   // }
//
//   String? validatorGovtId(value) {
//     if (value.isEmpty) {
//       return context.loc.validationID;
//     } else if (value.length != 9) {
//       return context.loc.validationIDInvalid;
//     }
//     return null;
//   }
//
//   String? validatorAddress(value) {
//     if (value.isEmpty) {
//       return context.loc.validationAddress;
//     }
//     return null;
//   }
//
//   String? validatorCompanyName(value) {
//     if (value.isEmpty) {
//       return context.loc.validationCompanyName;
//     }
//     return null;
//   }
//
//   String? validatorMinAge(value) {
//     if (value.isEmpty) {
//       return context.loc.validationMinAge;
//     }
//     return null;
//   }
//
//
//   String? validatorMaxAge2(String min, max) {
//     if (max.isEmpty) {
//       return context.loc.validationMaxAge;
//     } else if (double.parse(max) < double.parse(min)) {
//       return context.loc.validationMaxAgeInvalid;
//     }
//     return null;
//   }
//
//   String? validatorMinWeight(value) {
//     if (value.isEmpty) {
//       return context.loc.validationMinWeight;
//     } else if (double.parse(value) < 1) {
//       return context.loc.validationMinWeightInvalid;
//     }
//     return null;
//   }
//
//
//
//   String? validatorMaxWeight2(String min, max) {
//     if (max.isEmpty) {
//       return context.loc.validationMaxWeight;
//     } else if (double.parse(max) < double.parse(min)) {
//       return context.loc.validationMaxWeightInvalid;
//     }
//     return null;
//   }
//
//
//   String? validatorWeight(value) {
//     if (value.isEmpty) {
//       return context.loc.validationWeight;
//     } else if (double.parse(value) < 1) {
//       return context.loc.validationWeightInvalid;
//     }
//     return null;
//   }
//   String? validatorMinHeight(value) {
//     if (value.isEmpty) {
//       return context.loc.validationMinHeight;
//     } else if (double.parse(value) < 1) {
//       return context.loc.validationMinHeightInvalid;
//     }
//     return null;
//   }
//
//
//
//
//   String? validatorMaxHeight2(String min, max) {
//     if (max.isEmpty) {
//       return context.loc.validationMaxHeight;
//     } else if (double.parse(max) < double.parse(min)) {
//       return context.loc.validationMaxHeightInvalid;
//     }
//     return null;
//   }
//
//
//   String? validatorHeight(value) {
//     if (value.isEmpty) {
//       return context.loc.validationHeight;
//     } else if (double.parse(value) < 1) {
//       return context.loc.validationHeightInvalid;
//     }
//     return null;
//   }
//
//
//   String? validatorDescription(value) {
//     if (value.isEmpty) {
//       return context.loc.validationDescription;
//     }
//     return null;
//   }
//
//   String? validatorAboutYou(value) {
//     if (value.isEmpty) {
//       return context.loc.validationTellAbout;
//     }
//     return null;
//   }
//
//
//   String? validatorSubject(value) {
//     if (value.isEmpty) {
//       return "Subject is required.";
//     }
//     return null;
//   }
//
//   String? validatorMessage(value) {
//     if (value.isEmpty) {
//       return "Message is required.";
//     }
//     return null;
//   }
//
// }
