#问
217. 存在重复元素
给你一个整数数组 nums 。如果任一值在数组中出现 至少两次 ，返回 true ；如果数组中每个元素互不相同，返回 false 。
 

示例 1：

输入：nums = [1,2,3,1]
输出：true
示例 2：

输入：nums = [1,2,3,4]
输出：false
示例 3：

输入：nums = [1,1,1,3,3,4,3,2,4,2]
输出：true
 

提示：

1 <= nums.length <= 105
-109 <= nums[i] <= 109


#解
解法1：Hash
ExistDuplicateElements01
对于数组中每个元素，我们将它插入到哈希表中。如果插入一个元素时发现该元素已经存在于哈希表中，则说明存在重复的元素。

复杂度分析
时间复杂度：O(N)，其中 N 为数组的长度。
空间复杂度：O(N)，其中 N 为数组的长度。

解法2：排序
ExistDuplicateElements01
在对数字从小到大排序之后，数组的重复元素一定出现在相邻位置中。因此，我们可以扫描已排序的数组，每次判断相邻的两个元素是否相等，如果相等则说明存在重复的元素。
复杂度分析
时间复杂度：O(NlogN)，其中 N 为数组的长度。需要对数组进行排序。
空间复杂度：O(logN)，其中 N 为数组的长度。注意我们在这里应当考虑递归调用栈的深度。

解法3：借助stream流
ExistDuplicateElements03
复杂度分析
时间复杂度：O(N)，其中 N 为数组的长度。需要对数组进行排序。
空间复杂度：O(N)，其中 N 为数组的长度。注意我们在这里应当考虑递归调用栈的深度。