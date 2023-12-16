// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Token {
  string public name="HardHat Token";
  string public symbol="HHT";
  uint public totalSupply=10000;
  // address of the owner yani ki is tokens ka owner hai
  address public owner;
  // aur 11 line me jo likha hai vo ye batayehga ki har address ke pass kitne tokens hai
  mapping(address=>uint) balances;
  constructor(){
    // 15th line me jo likha hai uska ye matlab hai ki "jo bhi is contract ko deploy kar raha hai ya karega uska jo bhi address hoga, uske ander hum sare totalSupply of token dal de rahe hai yani ki pure 10000 tokens dal de rahe hai"
    // yani ki jo bhi is contact ka malik hoga uske pass hi sabse pahle sare tokens honge , bad me vo jisko dena chahega vo de sakta hai toh abhi sabse pahele malik vo hi hai creater vo hi hai contact ka isliye sare tokens uske hi pass honge
balances[msg.sender]=totalSupply;
// aur 17th line me humne us smart contact banane wale ko hi owner bhi bana diya yani ki jisne bhi ye contact banaya hai vo hi usko hi owner banaya hai 
 owner=msg.sender;
  }
  // transfer() toh is transfer function se hi hum , token to transfer kar sakte hai 
  // toh is function me vo humne do arguments pass kiya ha "to" aur "amount" toh "to" ka matlab hai ye ek variable jaisa hi yani ki uss bande kar addresss jisko mujhe paisa bhejne hai yani mujhe jise paisa bhejna hai us bande ka address , aur "amount" iska matlab jine paisa bhejne hai us bande ko usko "amount" se denote kiya hai 
  function transfer(address to , uint amount) external {
// 26th line me vo likha hai jisme me require ka use kiya ha uska matlab ye hai ki , matlab require laga hai matlab ye condition true honi chahiye toh 
// toh 26th line me jo code likha hai uska matlab ye hai ki vo balance hai msg.sender ka yani ki jo owner hai uske pass itne "paisa" or "amount" or "tokens" hai bhi ki vo transfer karne ka soch raha hai 
// yani ki agar mujhe "tokens" or "pasia" send karna hai tab mere pass utne "paisa" or "tokens" or "amount" hone bhi chahiye tabhi toh me "paisa" or "tokens" send kar paunga
require(balances[msg.sender]>=amount,"Not enough tokens");
// 28th line ka  matlab ye hai ki agar mere pass 100 tokens hai aur mene 10 tokens kisi ko de diye toh ab mere balance me 10 tokens kam ho jyenge
balances[msg.sender]-=amount; // balances[msg.sender]=balances[msg.sender]-amount;
// aur jiske address me ye amount send hoga uske address me utna badha dinge
balances[to]+=amount;
  }
  // aur balanceOf() is function se hum apna balance check karenge ki hamamre account me yani humamare address me kitna address hai 
  // is function me hum jis bhi account ka addresss pass karinge dinge uska balance batayega hum ye function
  function balanceOf(address account) external view returns(uint){
    return balances[account];
  }
}