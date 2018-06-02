/*:
 # 144. Binary Tree Preorder Traversal
 
 Given a binary tree, return the preorder traversal of its nodes' values.
 
 Example:
 
 Input: [1,null,2,3]
 1
 \
  2
 /
 3
 
 Output: [1,2,3]
 
 **Implement below function**
 
 /**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
 
 func postorderTraversal(_ root: TreeNode?) -> [Int] {
 
 }
 
 */

/*:
 **Time Complexity:** O(n)
 
 **Space Complexity:** O(n)
 */


 // Definition for a binary tree node.
public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }
}



func postorderTraversal(_ root: TreeNode?) -> [Int] {
  
  guard let root = root else { return [] }
  
  var stack1: [TreeNode] = []
  var stack2: [TreeNode] = []
  var result: [Int] = []
  
  stack1.append(root)
  
  while (!stack1.isEmpty) {
    
    let node = stack1.removeLast()
    
    stack2.append(node)
    
    if let leftNode = node.left {
      stack1.append(leftNode)
    }
    
    if let rightNode = node.right {
      stack1.append(rightNode)
    }
    
  }
  
  while (!stack2.isEmpty) {
    
    let node = stack2.removeLast()
    result.append(node.val)
  }
  
  return result
    
}


/*:
 ## Test
 */
import XCTest

class TestBinaryTreePostorderTraversal: XCTestCase {
  
  func getTestTree() -> TreeNode {
    // [1,null,2,3]
    let root = TreeNode(1)
    root.left = .none
    let nodeTwo = TreeNode(2)
    nodeTwo.left = TreeNode(3)
    root.right = nodeTwo
    return root
  }
  
  func testBinaryTreePostorderTraversal() {
    let result = postorderTraversal(getTestTree())
    XCTAssertEqual(result, [3, 2, 1])
  }
  
  
}

TestBinaryTreePostorderTraversal.defaultTestSuite.run()
