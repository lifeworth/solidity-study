// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract ToDo {
    struct ToDo {
        string text;
        bool completed;
    }

    ToDo[] public todos;

    function create(string calldata _text) external {
        todos.push(ToDo(_text, false));
    }

    function update(uint256 _index, string calldata _text) external {
        //直接更新
        todos[_index].text = _text;
        //根据变量更新
        ToDo storage _temp = todos[_index];
        _temp.text = _text;
    }

    function toggleCompleted(uint256 _index) external {
        todos[_index].completed = !todos[_index].completed;
    }

    function get(uint256 _index)
        external
        view
        returns (string memory, bool completed)
    {
        return (todos[_index].text, todos[_index].completed);
    }
}
