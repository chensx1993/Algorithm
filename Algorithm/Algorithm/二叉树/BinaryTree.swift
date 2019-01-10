//
//  BinaryTree.swift
//  Algorithm
//
//  Created by 陈思欣 on 2018/8/28.
//  Copyright © 2018年 chensx. All rights reserved.
//

import UIKit

func binaryTreeTest() {
    let node = TreeNode.init(5);
    
    let node2 = TreeNode.init(2);
    
    let node3 = TreeNode.init(1);
    
    let node4 = TreeNode.init(4);
    
    node.left = node2
    
    node2.left = node3
    node2.right = node4
    
//    node3.left = node4
    
    let maxDepthInt = maxDepth(root: node)
    print(maxDepthInt)
    
    let isSortTree = isValidBST(root: node)
    print(isSortTree)
    
    let res = levelOrderTraversal(root: node)
    print(res)
    
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
    }
}

// ============= 用队列实现二叉树的层次遍历 =============
func levelOrderTraversal(root: TreeNode?) -> [[Int]] {
    var res = [[Int]]()
    var queue = [TreeNode]()
    if let root = root {
        queue.append(root)
    }
    
    while queue.count > 0 {
        let size = queue.count
        var level = [Int]()
        
        for _ in 0 ..< size {
            let node = queue.removeFirst()
            
            level.append(node.val)
            
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right);
            }
        }
        res.append(level)
    }
    
    return res;
}

// ============= 用栈实现二叉树的前序遍历 ================
func preorderTraversal(root: TreeNode?) -> [Int] {
    var res = [Int]()
    var stack = [TreeNode]()
    var node = root
    
    while !stack.isEmpty || node != nil {
        if node != nil {
            res.append(node!.val)
            stack.append(node!)
            node = node?.left
        }else {
            node = stack.removeLast().right
        }
    }
    return res;
    
}

// ==================  二叉树的深度  ==================
func maxDepth(root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    return max(maxDepth(root: root.left), maxDepth(root: root.right)) + 1;
}


// ================== 判断是否是二叉查找树 ================
func isValidBST(root: TreeNode?) -> Bool {
    return _helper(node: root, nil, nil)
}

private func _helper(node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
    guard let node = node else { return true }
    
    // 所有右子节点都必须大于根节点
    if let min = min, node.val <= min {
        return false
    }
    
    // 所有左子节点都必须小于根节点
    if let max = max, node.val >= max {
        return false
    }
    
    return _helper(node: node.left, min, node.val) && _helper(node: node.right, node.val, max)
}

class BinaryTree: NSObject {

}
