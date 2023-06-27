const { ethers } = require("hardhat");
const { expect, assert } = require("chai");

describe(`Factory smart contract test`, function(){
    let factory;
    let factoryAddress;
    let owner
    let ownerAddress

    it(`Should retrive the owner`, async function(){
        owner = ethers.provider.getSigner(0)
        ownerAddress = await owner.getAddress()
        console.log(`Owener address ${ownerAddress}`)
    })

    it(`Should deploy the factory SC`, async function(){
        factory = await(await(await ethers.getContractFactory('VehicleFactory', owner)).deploy()).deployed()
        factoryAddress = factory.address
        console.log(`Factory deployed to ${factoryAddress}`)
    })

    it(`Should add a new Vehicle`, async function(){
        await factory.addVehicle(4, 'red')
        const {wheel, color} = await factory.getVehicle(0)
        console.log(wheel, color)
    })

})