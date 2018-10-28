import UIKit

// Deque DataStructure
public struct Deque<T> {
  fileprivate var array = [T]()
  
  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public var count: Int {
    return array.count
  }
  
  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  public mutating func enqueueFront(_ element: T) {
    array.insert(element, at: 0)
  }
  
  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
  
  public mutating func dequeueBack() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeLast()
    }
  }
  
  public func peekFront() -> T? {
    return array.first
  }
  
  public func peekBack() -> T? {
    return array.last
  }
}

// Example
var deque = Deque(array: [1,2,3,4])

print(deque.dequeue())
print(deque.dequeueBack())
print(deque)

deque.enqueueFront(5)
print(deque)
print(deque.dequeue())
