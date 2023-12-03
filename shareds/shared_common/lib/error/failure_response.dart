import 'package:shared_libraries/dio/dio.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class FailureResponse extends Equatable {
  final DioException? dioException;
  String? errorMessage;
  FailureResponse({
    this.dioException,
    this.errorMessage,
  }) {
    switch (dioException?.type) {
      case DioExceptionType.badResponse:
        errorMessage = dioException?.response?.data["message"] ?? "Terjadi kesalahan pada server";
        break;
      case DioExceptionType.badCertificate:
        errorMessage = "Terjadi error pada system kami, laporkan segera!";
        break;
      case DioExceptionType.receiveTimeout || DioExceptionType.receiveTimeout:
        errorMessage = "Waktu habis, coba lagi ya!";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "Gagal mengirimkan data";
        break;
      case DioExceptionType.connectionError:
        errorMessage = "Hubungkan dengan internet ya!";
        break;
      case DioExceptionType.cancel:
        errorMessage = "Permintaan dibatalkan";
        break;
      case DioExceptionType.unknown:
        errorMessage = "Unknown Error";
        break;
      default:
        errorMessage ??= dioException?.response?.data["message"];
        break;
    }
  }

  @override
  List<Object?> get props => [
        dioException,
        errorMessage,
      ];
}
