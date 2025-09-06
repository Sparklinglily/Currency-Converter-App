import 'dart:convert';
import 'package:currency_converter/core/errors/failure.dart';
import 'package:currency_converter/data/model/currency_model.dart';
import 'package:currency_converter/data/model/exchange_rate_model.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/api_constants.dart';

abstract class CurrencyApiService {
  Future<List<CurrencyModel>> getCurrencies();
  Future<ExchangeRateModel> getExchangeRate(String from, String to);
}

class CurrencyApiServiceImpl implements CurrencyApiService {
  final http.Client client;

  CurrencyApiServiceImpl({required this.client});

  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    try {
      final response = await client.get(Uri.parse(ApiConstants.codesEndpoint));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['result'] == 'success') {
          final List<dynamic> codes = data['supported_codes'];
          return codes.map((code) => CurrencyModel.fromJson(code)).toList();
        } else {
          throw ServerFailure('API returned error: ${data['error-type']}');
        }
      } else {
        throw ServerFailure('Server error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is Failure) rethrow;
      throw NetworkFailure('Network error: $e');
    }
  }

  @override
  Future<ExchangeRateModel> getExchangeRate(String from, String to) async {
    try {
      final response = await client.get(
        Uri.parse(ApiConstants.pairEndpoint(from, to)),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['result'] == 'success') {
          return ExchangeRateModel.fromJson(data);
        } else {
          throw ServerFailure('API returned error: ${data['error-type']}');
        }
      } else {
        throw ServerFailure('Server error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is Failure) rethrow;
      throw NetworkFailure('Network error: $e');
    }
  }
}
