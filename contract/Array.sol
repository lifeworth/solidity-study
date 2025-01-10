// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract ArrayDemo {
    uint256[] public nums = [1, 2, 3];
    uint256[3] public nomsFixed = [4, 5, 6];

    function insert() external {
        nums.push(4); //1,2,3,4
    }

    function length() external view returns (uint256) {
        return nums.length; //4
    }

    function update(uint256 index, uint256 _x) external {
        require(index <= nums.length - 1, "Index out of bound");
        nums[index] = _x;
    }

    function deleteByIndex(uint256 index) external {
        require(index <= nums.length - 1, "Index out of bound");
        delete nums[index];
    }

    //通过移动删除数组元素
    //1，2，3 =》 删除元素2 =》 1，3
    function deleteByValue(uint256 _index) external {
        require(_index <= nums.length - 1, "Index out of bound");
        for (uint256 i = _index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
        nums.pop();
    }

    //通过替换最后一个元素删除
    //1，2，3 =》 删除元素1 =》 3,2
    function deleteValueByLasted(uint256 _index) external {
        require(_index <= nums.length - 1, "Index out of bound");
        nums[_index] = nums[nums.length-1];
        nums.pop();
    }
}
