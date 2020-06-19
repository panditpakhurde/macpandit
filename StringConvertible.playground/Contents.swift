import Foundation

//Customizing textual representations of values
//'CustomStringConvertible' represents 'description' property, which inturn resposible for output of 'print' api and it can be used for Logging puropse
//'CustomDebugStringConvertible' represents 'debugDescription' property, which in turn responsible for out of 'debugPrint' api and it can be used for 4Debugging purpose

struct Message {
    let from: String
    let message: String
}

let message = Message(from: "Mac", message: "Hey, How are you?")

//print(message)

extension Message: CustomStringConvertible {
    public var description: String {
        return "[\(from)] : \(message)"
    }
}

print(message)

extension Message: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "\(message) : [\(from)]"
    }
}

debugPrint(message)

class Profile {
    let name: String
    let address: String
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
}

extension Profile: CustomStringConvertible {
    public var description: String {
        return "\(name) is staying at \(address)"
    }
}

let profile = Profile(name: "Mac", address: "#18, Avenue Road, Bengluru - 92")

print(profile)

