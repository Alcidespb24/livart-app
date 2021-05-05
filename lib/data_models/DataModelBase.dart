abstract class DataModelBase<T> {
  Map<String, dynamic> toMap();

  //T.fromMap();
  T fromMap(Map<String, dynamic> map);
}
