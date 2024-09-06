// protocol common contract or blueprint, It hold functions and variables 
// but only hold the defintion not the actual body (similar to interface)

protocol CarProto {
    var color: String {get set}
    func drive()
    func isAllWheelDrive() -> Bool
        
}

class Car {

}

// it sthe way to inherit from calss and protocol
class BMW: Car, CarProto{
    var color: String
    init(color:String) {
        self.color = color
    }
    func drive() {
    code
    }
    func isAllWheelDrive() -> Bool {
    code
    }
}