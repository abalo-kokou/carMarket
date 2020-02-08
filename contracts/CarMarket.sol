pragma solidity >=0.4.21 <0.7.0;

contract CarMarket {
   address payable public seller;
   address payable public buyer;
    // car
    struct Car {
        address owner;
        uint    sell_price
        address car_id;
    }
    event LogAddCar(
          uint _id
     );
    event LogBuyCar(
          uint _id
     );
    // car list
    mapping (address => Car) public listCar;
    uint public _carCounter;

    constructor(uint  ID, uint256 price) public {
        Car memory  newCar;
        newCar.owner = msg.sender // to retriever seller address
        newCar.car_id = ID;
        newCar.sell_price=price;
   	}

    // to add a car
    function addCar(uint  ID, uint256 price ) public {
        Car memory  newCar;
        newCar.owner = msg.sender // to retriever seller address
        newCar.car_id = ID;
        newCar.sell_price=price;
        _carCounter++;
        listCar[carCounter] = newCar;
        emit LogAddCar(ID);
    }
    //
   function buyCar( uint ID ) public {
        Car car = listCar[ID]
        address  owner = car.owner
        uint256 price = car.sell_price
        //(verifier si la balance de msg.sender > price )
        // msg.value i how much ether was sent
        //require(msg.value == price);
        // send the ether to "owner"
        owner.transfer(msg.value);
        // msg.sender is the new "owner"
        car.owner = msg.sender
        listCar[ID]= car
        emit LogBuyCar(ID);
     }
