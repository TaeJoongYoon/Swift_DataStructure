import UIKit

// Stack DataStructure
public struct Stack<T> {
  fileprivate var array = [T]()
  
  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public var count: Int {
    return array.count
  }
  
  public mutating func push(_ element: T) {
    array.append(element)
  }
  
  public mutating func pop() -> T? {
    return array.popLast()
  }
  
  public var top: T? {
    return array.last
  }
}

// Example

var stack = Stack(array: [5,2,3])

stack.push(4)
stack.push(7)

print(stack)

print(stack.pop())
print(stack.top)
