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
}