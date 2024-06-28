class Person {
  // attribute
  late String _name; //Private member
  
  String get name => _name; //Getter for name
  set name(String value) => _name = value; //Setter for name
}


class Engine {
  // attributes
  late String _model;
  late int _speed;
  
  String get model => _model; //Getter for model
  set model(String value) => _model = value; //Setter for model
  
  int get speed => _speed; //Getter for speed
  set speed(int value) => _speed = value; //Setter for speed
  
  void displayEngineInfo() {
    print('Model: $_model'); //Model ของเครื่องยนต์
    print('Speed: ${_speed} kh/h');
  }
}


class Car {
  late String _brand;
  late String _model;
  late Person _owner; //มีชนิดข้อมูลเป็น Person
  late Engine _engine; //มีชนิดข้อมูลเป็น `Engine`
  
  //Constructor สำหรับกำหนดค่า `brand`, `model`, `owner`, `engine`
  Car(String brand, String model, Person owner, Engine engine) {
    this._brand = brand;
    this._model = model;
    this._owner = owner;
    this._engine = engine;
  }
  
  void displayCarInfo() {
    print('Brand: $_brand');
    print('Model: $_model');
    print('Owner: ${_owner.name}'); //เข้าถึง name โดยใช้ getter
    _engine.displayEngineInfo(); //ดึงมาจาก class Engine
  }
  
  void run() {
    print('Speed: ${_engine.speed} kh/h');
  } 
}


class Honda extends Car{ //สืบทอดมาจากคลาส Car
  late String _color;
  
  Honda(String brand, String model, Person owner, Engine engine, String color) : super(brand, model, owner, engine) {
    this._color = color;
  }
  
  //Override
  void run() {
    //ให้แสดงความเร็วในขับ 120 km/h
    print('Speed: 120 km/h');
  }
  
  void displayCarInfo() {
    //พิมพ์ค่าของ `brand`, `model`, `color`, `owner`, และ `engine`
    super.displayCarInfo();
    print('Color: $_color');
  }
}


void main(){
  //สร้างฟังก์ชัน main เพื่อสาธิตผลตามที่กำหนดไว้
  var owner = Person();
  owner.name = 'Somchai Jaidee';

  var engine = Engine();
  engine.model = 'V8 Turbo';
  engine.speed = 200;

  var myCar = Car('Toyota', 'Yaris', owner, engine);
  myCar.displayCarInfo();
  myCar.run();
  print('-------------------------');
  
  var hondaOwner = Person();
  hondaOwner.name = 'SomYing Meesuk';
  
  var hondaEngine = Engine();
  hondaEngine.model = 'Hybrid';
  hondaEngine.speed = 180;
  
  var myHonda = Honda('Honda', 'Civic', hondaOwner, hondaEngine, 'Red');
  myHonda.displayCarInfo();
  myHonda.run();
}
