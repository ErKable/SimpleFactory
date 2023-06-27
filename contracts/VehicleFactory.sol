//SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import './Vehicle.sol';

import "hardhat/console.sol";


contract VehicleFactory {
    Vehicle[] public vehicles;

    function addVehicle(uint wheel, string calldata color) public {
        Vehicle v = new Vehicle(wheel, color);
        vehicles.push(v);
    }

    function getVehicles() external view returns(Vehicle[] memory){
        return vehicles;
    }

    function getVehicle(uint index) external view returns(uint wheel, string memory color){
        Vehicle v = Vehicle(vehicles[index]);
        wheel = v.wheel();
        color = v.color();
    }

    function removeVehicle(uint index) external {
        require(index < vehicles.length, 'Index out of bound');

        vehicles[index] = vehicles[vehicles.length - 1];
        vehicles.pop();
    }

    function getVehiclesLenght() external view returns(uint length) {
        length = vehicles.length;
    }
}