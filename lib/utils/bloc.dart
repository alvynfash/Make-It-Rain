import 'dart:async';

class Bloc extends Validators {
  final _ageSink = new StreamController<String>();
  final _heightSink = new StreamController<String>();

  Stream<String> get age {
    return _ageSink.stream
        .transform(isEmptyValidator)
        .transform(isNumericValidator)
        .transform(isValidAgeValidator)
        .transform(isAdultValidator);
  }

  Function(String) get changeAge => _ageSink.sink.add;
  Function(String) get changeHeight => _heightSink.sink.add;

  dispose() {
    _ageSink.close();
    _heightSink.close();
  }
}

class Validators {
  StreamTransformer<String, String> get isAdultValidator =>
      StreamTransformer.fromHandlers(
        handleData: (age, sink) {
          if (double.parse(age) >= 18)
            sink.add(age);
          else
            sink.addError("Sorry, minors not valid");
        },
      );

  StreamTransformer<String, String> get isNumericValidator =>
      StreamTransformer.fromHandlers(
        handleData: (value, sink) {
          if (double.tryParse(value) != null)
            sink.add(value);
          else
            sink.addError("Only numeric values allowed");
        },
      );

  StreamTransformer<String, String> get isEmptyValidator =>
      StreamTransformer.fromHandlers(
        handleData: (value, sink) {
          if (value.length > 0)
            sink.add(value);
          else
            sink.addError("This field is required");
        },
      );

  StreamTransformer<String, String> get isValidAgeValidator =>
      StreamTransformer.fromHandlers(
        handleData: (value, sink) {
          if (!value.contains("."))
            sink.add(value);
          else
            sink.addError("Special characters not allowed");
        },
      );
}
Bloc bloc = new Bloc();