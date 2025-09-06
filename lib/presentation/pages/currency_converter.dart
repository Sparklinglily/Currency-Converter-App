// import 'package:currency_converter/core/constants/app_assets.dart';
// import 'package:currency_converter/core/constants/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CurrencyConverter extends StatelessWidget {
//   const CurrencyConverter({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20.0, right: 20),
//           child: SingleChildScrollView(
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.,
//               children: [
//                 SizedBox(height: 14),
//                 Text(
//                   "Currency Converter",
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.roboto(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 25,
//                     color: AppColors.blueColor,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "Check live rates, set rate alerts, receive notifications and more.",
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.roboto(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 16,
//                     color: AppColors.greyColor,
//                   ),
//                 ),
//                 SizedBox(height: 41),
//                 Container(
//                   padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     color: AppColors.whiteColor,
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(width: 1, color: AppColors.borderColor),
//                   ),

//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Amount",
//                         textAlign: TextAlign.start,
//                         style: GoogleFonts.roboto(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 15,
//                           color: AppColors.greyColor,
//                         ),
//                       ),

//                       SizedBox(height: 14),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(AppAssets.sdg, height: 45, width: 45),
//                               SizedBox(width: 8),
//                               Text(
//                                 "SDG",

//                                 style: GoogleFonts.roboto(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 20,
//                                   color: AppColors.blueColor,
//                                 ),
//                               ),
//                               SizedBox(width: 8),
//                               SvgPicture.asset(AppAssets.dropDown),
//                             ],
//                           ),

//                           SizedBox(width: 24),

//                           Expanded(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: AppColors.backgroundColor,
//                                 borderRadius: BorderRadius.circular(7),
//                               ),

//                               child: TextFormField(
//                                 style: GoogleFonts.roboto(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 20,
//                                   color: AppColors.blueColor,
//                                 ),
//                                 keyboardType: TextInputType.number,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   prefixIcon: SizedBox(width: 70),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 15),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Divider(
//                               color: AppColors.backgroundColor,
//                               thickness: 2,
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.all(14),
//                             decoration: BoxDecoration(
//                               color: AppColors.blueColor,
//                               shape: BoxShape.circle,
//                             ),
//                             child: SvgPicture.asset(AppAssets.flipper),
//                           ),
//                           Expanded(
//                             child: Divider(
//                               color: AppColors.backgroundColor,
//                               thickness: 2,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 15),
//                       Text(
//                         "Converted Amount",
//                         textAlign: TextAlign.start,
//                         style: GoogleFonts.roboto(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 15,
//                           color: AppColors.greyColor,
//                         ),
//                       ),
//                       SizedBox(height: 14),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Image.asset(AppAssets.usa, height: 45, width: 45),
//                               SizedBox(width: 8),
//                               Text(
//                                 "USD",

//                                 style: GoogleFonts.roboto(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 20,
//                                   color: AppColors.blueColor,
//                                 ),
//                               ),
//                               SizedBox(width: 8),
//                               SvgPicture.asset(AppAssets.dropDown),
//                             ],
//                           ),
//                           SizedBox(width: 24),

//                           Expanded(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: AppColors.backgroundColor,
//                                 borderRadius: BorderRadius.circular(7),
//                               ),

//                               child: TextFormField(
//                                 style: GoogleFonts.roboto(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 20,
//                                   color: AppColors.blueColor,
//                                 ),
//                                 keyboardType: TextInputType.number,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   prefixIcon: SizedBox(width: 70),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(
//                     "Indicative Exchange Rate",
//                     textAlign: TextAlign.start,
//                     style: GoogleFonts.roboto(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16,
//                       color: AppColors.greyColor,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 13),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(
//                     "1 SGD = 0.7367 USD",
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.roboto(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 18,
//                       color: AppColors.blackColor,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:currency_converter/core/constants/app_assets.dart';
import 'package:currency_converter/core/constants/app_colors.dart';
import 'package:currency_converter/core/utils/extension.dart';
import 'package:currency_converter/presentation/providers/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrencyConverterPage extends ConsumerStatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  ConsumerState<CurrencyConverterPage> createState() =>
      _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends ConsumerState<CurrencyConverterPage> {
  final TextEditingController amountController = TextEditingController(
    text: '1.0',
  );
  bool showFromDropdown = false;
  bool showToDropdown = false;

  @override
  void initState() {
    super.initState();
    amountController.addListener(onAmountChanged);
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  void onAmountChanged() {
    final text = amountController.text;
    if (text.isValidNumber) {
      final viewModel = ref.read(currencyConverterViewModelProvider.notifier);
      viewModel.setAmount(text.toDouble);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(currencyConverterViewModelProvider);
    final viewModel = ref.read(currencyConverterViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
                Text(
                  "Currency Converter",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: AppColors.blueColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Check live rates, set rate alerts, receive notifications and more.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.greyColor,
                  ),
                ),

                // Error Message below title
                if (state.errorMessage != null) ...[
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.error, color: Colors.red.shade700, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            state.errorMessage!,
                            style: GoogleFonts.roboto(
                              color: Colors.red.shade700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => viewModel.loadCurrencies(),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 41),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: AppColors.borderColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Amount",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppColors.greyColor,
                        ),
                      ),
                      const SizedBox(height: 14),

                      // FROM Currency Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap:
                                () => setState(
                                  () => showFromDropdown = !showFromDropdown,
                                ),
                            child: Row(
                              children: [
                                getCurrencyFlag(
                                  state.fromCurrency?.code ?? 'SDG',
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  state.fromCurrency?.code ?? 'SDG',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: AppColors.blueColor,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SvgPicture.asset(AppAssets.dropDown),
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              alignment: Alignment.centerRight,
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                controller: amountController,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: AppColors.blueColor,
                                ),
                                maxLines: 1,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d*\.?\d*'),
                                  ),
                                ],
                                decoration: const InputDecoration(
                                  border: InputBorder.none,

                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // From Currency Dropdown
                      if (showFromDropdown && state.currencies.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          height: 200,
                          child: ListView.builder(
                            itemCount: state.currencies.length,
                            itemBuilder: (context, index) {
                              final currency = state.currencies[index];
                              return ListTile(
                                leading: getCurrencyFlag(currency.code),
                                title: Text(
                                  currency.code,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blueColor,
                                  ),
                                ),
                                subtitle: Text(
                                  currency.name,
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                                onTap: () {
                                  viewModel.setFromCurrency(currency);
                                  setState(() => showFromDropdown = false);
                                },
                              );
                            },
                          ),
                        ),

                      const SizedBox(height: 15),

                      // Swap Icon
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.backgroundColor,
                              thickness: 2,
                            ),
                          ),
                          GestureDetector(
                            onTap: viewModel.swapCurrencies,
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: AppColors.blueColor,
                                shape: BoxShape.circle,
                              ),
                              child:
                                  state.isLoading
                                      ? SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                AppColors.whiteColor,
                                              ),
                                        ),
                                      )
                                      : SvgPicture.asset(AppAssets.flipper),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColors.backgroundColor,
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

                      Text(
                        "Converted Amount",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppColors.greyColor,
                        ),
                      ),
                      const SizedBox(height: 14),

                      // TO Currency Row(Converted amount)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap:
                                () => setState(
                                  () => showToDropdown = !showToDropdown,
                                ),
                            child: Row(
                              children: [
                                getCurrencyFlag(
                                  state.toCurrency?.code ?? 'USD',
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  state.toCurrency?.code ?? 'USD',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: AppColors.blueColor,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SvgPicture.asset(AppAssets.dropDown),
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Container(
                                height: 45,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  maxLines: 1,

                                  state.convertedAmount.formatted,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: AppColors.blueColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // To Currency Dropdown
                      if (showToDropdown && state.currencies.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          height: 200,
                          child: ListView.builder(
                            itemCount: state.currencies.length,
                            itemBuilder: (context, index) {
                              final currency = state.currencies[index];
                              return ListTile(
                                leading: getCurrencyFlag(currency.code),
                                title: Text(
                                  currency.code,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blueColor,
                                  ),
                                ),
                                subtitle: Text(
                                  currency.name,
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                                onTap: () {
                                  viewModel.setToCurrency(currency);
                                  setState(() => showToDropdown = false);
                                },
                              );
                            },
                          ),
                        ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Exchange Rate Information
                if (state.currentRate != null) ...[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Indicative Exchange Rate",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "1 ${state.currentRate!.baseCode} = ${state.currentRate!.rate.formatted} ${state.currentRate!.targetCode}",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getCurrencyFlag(String currencyCode) {
    if (currencyCode == 'USD') {
      return Image.asset(
        AppAssets.usa,
        height: 45,
        width: 45,
        errorBuilder: (context, error, stackTrace) => _dummyFlag(currencyCode),
      );
    } else if (currencyCode == 'SDG') {
      return Image.asset(
        AppAssets.sdg,
        height: 45,
        width: 45,
        errorBuilder: (context, error, stackTrace) => _dummyFlag(currencyCode),
      );
    } else {
      return _dummyFlag(currencyCode);
    }
  }

  Widget _dummyFlag(String currencyCode) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Center(
        child: Text(
          currencyCode.length >= 2
              ? currencyCode.substring(0, 2)
              : currencyCode,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColors.blueColor,
          ),
        ),
      ),
    );
  }
}
