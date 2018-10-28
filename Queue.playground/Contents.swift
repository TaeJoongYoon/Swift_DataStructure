import UIKit

// Queue DataStructure
public struct Queue<T> {
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
  
  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
  
  public var front: T? {
    return array.first
  }
}

// Example
var queue = Queue(array: [1,2,3,4])

queue.enqueue(5)
queue.enqueue(6)
print(queue)

print(queue.dequeue())
print(queue.front)
