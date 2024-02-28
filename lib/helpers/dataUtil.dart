import 'package:intl/intl.dart';

class DataUtil{

  static final  _formatPTBR = "dd/MM/yyyy";
  static final  _formatDB = "yyyy-MM-dd";

  static String stringDateFromDb(String dataString){

    // Defina o formato da string de entrada
    DateFormat formatoEntrada = DateFormat('dd/MM/yyyy');

    // Defina o formato da string de saída
    DateFormat formatoSaida = DateFormat('yyyy-MM-dd');

    // Parse da string de entrada para um objeto DateTime
    DateTime data = formatoEntrada.parse(dataString);
    // Formate o objeto DateTime para a string de saída
    String dataFormatada = formatoSaida.format(data);
    return dataFormatada;
  }

  static String stringDateFromUS(DateTime data){
    return DateFormat(_formatDB).format(data);
  }

  static String stringDateFromPTBR(DateTime data){
    return DateFormat(_formatPTBR).format(data);
  }
}