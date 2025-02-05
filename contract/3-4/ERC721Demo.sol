// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external returns (bool);
}

interface IERC721 is IERC165 {
    function balanceOf(address owner) external view returns (uint256);

    function ownerOf(uint256 tokenId) external view returns (address);

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function approve(address to, uint256 tokenId) external;

    function getApprove(uint256 tokenId)
        external
        view
        returns (address operator);

    function setApproveForAll(address operator, bool _approved) external;

    function isApproveForAll(address owner, address operator)
        external
        view
        returns (bool);
}

interface IERC721Receiver {
    function onIERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

contract ERC721 is IERC721 {
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed id
    );
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 indexed id
    );
    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approvaled
    );

    mapping(uint256 => address) internal _ownerOf;
    mapping(address => uint256) internal _banlanceOf;
    mapping(uint256 => address) internal _approvals;
    mapping(address => mapping(address => bool)) public isApprovalForAll;

    function supportsInterface(bytes4 interfaceId)
        external
        pure
        returns (bool)
    {
        return
            interfaceId == type(IERC721).interfaceId ||
            interfaceId == type(IERC165).interfaceId;
    }

    function balanceOf(address owner) external view returns (uint256) {
        require(owner != address(0), "address 0!");
        return _banlanceOf[owner];
    }

    function ownerOf(uint256 tokenId) external view returns (address result) {
        result = _ownerOf[tokenId];
        require(result != address(0), "address 0!");
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external {
        transferFrom(from, to, tokenId);

        require(
            to.code.length == 0 ||
                IERC721Receiver(to).onIERC721Received(
                    msg.sender,
                    from,
                    tokenId,
                    ""
                ) ==
                IERC721Receiver.onIERC721Received.selector,
            "unsafe recipient"
        );
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external {
        transferFrom(from, to, tokenId);

        require(
            to.code.length == 0 ||
                IERC721Receiver(to).onIERC721Received(
                    msg.sender,
                    from,
                    tokenId,
                    data
                ) ==
                IERC721Receiver.onIERC721Received.selector,
            "unsafe recipient"
        );
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public {
        require(from == _ownerOf[tokenId], "not owner");
        require(to != address(0), "can not zero");
        require(_isApprovaledOrOwner(from, msg.sender, tokenId));

        _ownerOf[tokenId] = to;
        delete _approvals[tokenId];
        emit Transfer(from, to, tokenId);
    }

    function approve(address to, uint256 tokenId) external {
        address owner = _ownerOf[tokenId];
        require(
            msg.sender == owner || isApprovalForAll[owner][msg.sender],
            "not owner"
        );
        _approvals[tokenId] = to;
        emit Approval(owner, to, tokenId);
    }

    function getApprove(uint256 tokenId)
        external
        view
        returns (address operator)
    {
        require(_ownerOf[tokenId] != address(0), "zero address !");
        operator = _approvals[tokenId];
    }

    function setApproveForAll(address operator, bool _approved) external {
        isApprovalForAll[msg.sender][operator] = _approved;
    }

    function isApproveForAll(address owner, address operator)
        external
        view
        returns (bool)
    {}

    function _isApprovaledOrOwner(
        address owner,
        address spender,
        uint256 tokenId
    ) internal view returns (bool) {
        return (spender == owner ||
            isApprovalForAll[owner][spender] ||
            spender == _approvals[tokenId]);
    }

    function _mint(address to, uint256 tokenId) internal {
        require(to != address(0), "zero address!");
        require(_ownerOf[tokenId] != address(0), "zero address!");

        _banlanceOf[to]++;
        _ownerOf[tokenId] = to;

        emit Transfer(address(0), to, tokenId);
    }

    function _burn(uint256 tokenId) internal {
        address owner = _ownerOf[tokenId];
        require(owner != address(0), "zero address!");

        _banlanceOf[owner]--;
        delete _ownerOf[tokenId];
        delete _approvals[tokenId];

        emit Transfer(owner, address(0), tokenId);
    }
}

contract MyNFT is ERC721 {
    function mint(address to, uint256 tokenId) external {
        _mint(to, tokenId);
    }

    function burn(uint256 tokenId) external {
        require(msg.sender == _ownerOf[tokenId], "not owner!");
        _burn(tokenId);
    }
}
