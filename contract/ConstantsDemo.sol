// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract ConstantsDemo{
    address public constant CONSTANTS_ADDR = address(123); //356 gas
    address public non_constants_addr = address(123); //2511 gas


}