const { expect } = require("chai");

describe("Smart contrace test", function () {
  it("Vote test result -> ", async function () {
    const contract = await ethers.getContractFactory("AdminManage");
    const deploy = await contract.deploy();
    const result = await deploy.health();

    console.log('result -> ' + result.toString());

    expect(result);
  });
});