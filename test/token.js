const {expect} = require('chai');


describe("Token Contract",function(){
    let Token;
    let hardhatToken;
    let owner;
    let addr1;
    let addr2;
    let addrs;
    beforeEach(async function(){
    Token = await ethers.getContractFactory("Token");
    [owner, addr1, addr2,...addrs]=await ethers.getSigners();
    hardhatToken=await Token.deploy()
    })
    describe("Deployment",function(){
        // ye wala funciton hamarra owner check karega ki jo hamne owner set kiya hai vo sahi se set hua hai ki nahi
        it("Should set the right owner",async function(){
            expect(await hardhatToken.owner()).to.equal(owner.address);
        })
        // ye check karega ki owner me pure totalsupply set hua ki nahi vo hamne smart contrance mem likha tha 
        it("Should assign the total supply to tokens to the owner",async function(){
            const ownerBalance=await hardhatToken.balanceOf(owner.address)
            expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
        })
    })
    describe("Transaction",function(){
        it("Should tranfer tokens between accunts",async function(){
            // owner ke account se hi address1 ko ho raha hai 
            await hardhatToken.transfer(addr1.address);
            const addr1Balance=await hardhatToken.balanceOf(addr1.address);
            expect(addr1Balance).to.equal(5);
            await hardhatToken.connect(addr1).transfer(addr2.address,5);
            const addr2Balance=await hardhatToken.balanceOf(addr2.address);
            expect(addr2Balance).to.equal(5);
        })
        it("Should fail if sender does not have enough tokens",async function(){
            const initalOwnerBalance=await hardhatToken.balanceOf(owner.address)
            await hardhatToken.connect(addr1).transfer(owner.address,1).to.be.revertedWith("Not enough tokens")
            expect(await hardhatToken.balanceOf(owner.address)).to.equal(initalOwnerBalance)
        })
    })
})