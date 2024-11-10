
// String toDateFormated(DateTime date){
//   DateFormat formater = DateFormat('dd/MM/YYYY');
//   return formater.format(date);
// }
extension Dateformate on DateTime{
  String get toFormattedDate => '$day / $month / $year';
}