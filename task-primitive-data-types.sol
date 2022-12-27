// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

enum TodoType {
    TASK,
    BUG
}

/**
 * @title TodoList
 * @dev CRUD ops for a TodoList
 */
contract TodoList {
    struct Todo {
        string text;
        bool isCompleted;
        TodoType typeOfTodo;
    }

    Todo[] public todos; // the State variable for TodoList contract

    /**
     * @dev Read
     * @param _index position of the updated todo element
     */
    function getById(uint256 _index) external view returns (Todo memory) {
        return todos[_index];
    }

    /**
     * @dev Create
     * @param _text content for the new todo
     * @param _todoType type of the new todo
     */
    function create(string calldata _text, TodoType _todoType) external {
        todos.push(
            Todo({text: _text, isCompleted: false, typeOfTodo: _todoType})
        );
    }

    /**
     * @dev Update
     * @param _index position of the updated todo element
     * @param _text content for the todo
     */
    function updateText(uint256 _index, string calldata _text) external {
        todos[_index].text = _text;
    }

    /**
     * @dev Toggle
     * @param _index position of the updated todo element
     */
    function toggleTodo(uint256 _index) external {
        todos[_index].isCompleted = !todos[_index].isCompleted;
    }
}
