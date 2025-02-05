// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;
// owner: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// owner2: 0xdD870fA1b7C4700F2BD7f44238821C26f7392148
// admin 0xbe0c81bbf1e4621a034257cd57bebf662837347c8ec6ac7500055aed546e83c1
// user 0xb5e0b75e2d0ecf9b1c041994a419d2fd407a808b3905cdf78a9a5a6f6d882ad7

contract AccsessControl {
    bytes32 public ADMIN = keccak256(abi.encode("admin"));
    bytes32 public USER = keccak256(abi.encode("user"));

    mapping(bytes32 => mapping(address => bool)) public roles;

    constructor() {
        _grantRole(msg.sender, ADMIN);
    }

    event grant(string);
    event revoke(string);

    modifier onlyRole(bytes32 role) {
        require(roles[role][msg.sender] == true, "You must be an admin");
        _;
    }

    function _grantRole(address _user, bytes32 _role) internal {
        roles[_role][_user] = true;
        emit grant("constructor grant access");
    }

    function grantRole(address _user, bytes32 _role)
        external
        onlyRole(ADMIN)
    {
        _grantRole(_user,_role);
    }

    function revokeRole(address _user, bytes32 _role)
        external
        onlyRole(ADMIN)
    {
        roles[_role][_user] = false;
        emit grant("revoke access");
    }
}
