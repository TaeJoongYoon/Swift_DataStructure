import UIKit

// 1-D Array

let array = [Int](repeating: 0, count: 7) // int array[7]

// 2-D Array

let array2D = [[Int]](repeating: [Int](repeating: 0, count: 5), count: 4) // int array2D[4][5]

// Helper func

func dim<T>(_ count: Int, _ value: T) -> [T] {
  return [T](repeating: value, count: count)
}

let array2DWithFunc = dim(4, dim(5, 0)) // int array2DWithFunc[4][5]

let array3D = dim(3, dim(4, dim(5, 0))) // int array3D[3][4][5]

// like 2-D

public struct Array2D<T> {
  public let columns: Int
  public let rows: Int
  fileprivate var array: [T]
  
  public init(columns: Int, rows: Int, initialValue: T) {
    self.columns = columns
    self.rows = rows
    array = .init(repeating: initialValue, count: rows*columns)
  }
  
  public subscript(column: Int, row: Int) -> T {
    get {
      precondition(column < columns, "Column \(column) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
      precondition(row < rows, "Row \(row) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
      return array[row*columns + column]
    }
    set {
      precondition(column < columns, "Column \(column) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
      precondition(row < rows, "Row \(row) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
      array[row*columns + column] = newValue
    }
  }
}

let array2DLikely = Array2D(columns: 5, rows: 4, initialValue: 0) // int array2DLikely[5][4]
