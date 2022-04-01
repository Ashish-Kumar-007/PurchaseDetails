//SPDX-License-Identifier:UNLICENSED
pragma solidity 0.8.10;

contract BuyingSelling{
    struct buyer{
        address user;
        string name;
        string[] purchasedItem;
        bool[] status;
        uint[] purchaseTime;
    }

    address payable owner;
    string public sellerPAN = "XYZAB145Q";

    mapping(string =>buyer) Buyers;

    string[] public items = ["Smartwatch", "Speaker", "Pendrive", "SmartPhone", "Laptop"];

    constructor (){
        owner = payable (msg.sender);
    }
    string buyerPAN;
    function Register(string memory _buyerPAN, string memory _name) public {
        Buyers[_buyerPAN].name = _name;
        buyerPAN = _buyerPAN;
        Buyers[_buyerPAN].user = msg.sender;
    }

    function BuyItems(uint _id) payable public{
        Buyers[buyerPAN].purchasedItem.push(items[_id]);
        Buyers[buyerPAN].status.push(true);
        Buyers[buyerPAN].purchaseTime.push(block.timestamp);
    }
    
    function BuyerDetails(string memory _buyerPAN) public view returns(string memory, string memory, address, bool[] memory, string[] memory, uint[] memory){     
        return (sellerPAN, _buyerPAN, 
        Buyers[_buyerPAN].user, 
        Buyers[_buyerPAN].status, 
        Buyers[_buyerPAN].purchasedItem, 
        Buyers[_buyerPAN].purchaseTime);
    }
}
