import UIKit

// LinkedListNode DataStructure
public class LinkedListNode<T> {
  var value: T
  var next: LinkedListNode?
  weak var previous: LinkedListNode?
  
  public init(value: T) {
    self.value = value
  }
}

// LinkedList DataStructure
public class LinkedList<T> {
  public typealias Node = LinkedListNode<T>
  
  private var head: Node?
  
  public var isEmpty: Bool {
    return head == nil
  }
  
  public var first: Node? {
    return head
  }
  
  public var last: Node? {
    guard var node = head else {
      return nil
    }
    
    while let next = node.next {
      node = next
    }
    return node
  }
  
  public func append(value: T) {
    let newNode = Node(value: value)
    if let lastNode = last {
      newNode.previous = lastNode
      lastNode.next = newNode
    } else {
      head = newNode
    }
  }

  public var count: Int {
    guard var node = head else {
      return 0
    }
    
    var count = 1
    while let next = node.next {
      node = next
      count += 1
    }
    return count
  }
  
  public func node(atIndex index: Int) -> Node {
    if index == 0 {
      return head!
    } else {
      var node = head!.next
      for _ in 1..<index {
        node = node?.next
        if node == nil { //(*1)
          break
        }
      }
      return node!
    }
  }
  
  public subscript(index: Int) -> T {
    let node = self.node(atIndex: index)
    return node.value
  }
  
  public func insert(_ node: Node, atIndex index: Int) {
    let newNode = node
    if index == 0 {
      newNode.next = head
      head?.previous = newNode
      head = newNode
    } else {
      let prev = self.node(atIndex: index-1)
      let next = prev.next
      
      newNode.previous = prev
      newNode.next = prev.next
      prev.next = newNode
      next?.previous = newNode
    }
  }
  
  public func remove(node: Node) -> T {
    let prev = node.previous
    let next = node.next
    
    if let prev = prev {
      prev.next = next
    } else {
      head = next
    }
    next?.previous = prev
    
    node.previous = nil
    node.next = nil
    return node.value
  }
  
  public func removeLast() -> T {
    assert(!isEmpty)
    return remove(node: last!)
  }
  
  public func removeAt(_ index: Int) -> T {
    let node = self.node(atIndex: index)
    assert(node != nil)
    return remove(node: node)
  }
  
  public func removeAll() {
    head = nil
  }
}

var list = LinkedList<Int>()

list.append(value: 1)
list.append(value: 2)
list.append(value: 3)
list.append(value: 4)

print(list.first!.value)
print(list.last!.value)
print(list.first!.next?.value)
print(list.last!.previous?.value)

print(list.node(atIndex: 3).value)

print(list[2])

list.insert(LinkedListNode(value: 5), atIndex: 2)

print(list[2])
