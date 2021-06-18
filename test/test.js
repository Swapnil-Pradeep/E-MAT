const TestMath = artifacts.require("./build/TestMath");

contract("Test", async accounts => {
    it("Deploy and put two numbers and check sum", async () => {
        const instance = await TestMath.deployed();
        await instance.firstNoSet(5);
        await instance.secondNoSet(7);
        const sum = await instance.add.call();
        assert.equal(sum.toNumber(), 12);
    });
});