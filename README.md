# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
```

```shell
需求：去中心化投票系统（Decentralized Voting System）
项目概述
构建一个基于区块链的投票系统，允许用户注册成为选民、提出候选选项，并参与投票过程。所有投票记录和结果都存储在区块链上，确保透明度和不可篡改性。

功能需求
管理员功能
添加选民：只有管理员可以将地址注册为合法选民。
启动投票：管理员可以启动投票，一旦启动，就不能再添加新的选民或候选人。
结束投票：管理员可以在适当的时间点结束投票。
选民功能
查看候选人列表：选民可以看到当前所有的候选人。
投票给候选人：每个选民只能投一票，且不能为自己投票。
查看投票状态：选民可以检查自己是否已经投票。
候选人功能
自我提名：在投票开始前，任何合法选民都可以自我提名成为候选人。
查看得票数：候选人可以查看自己的得票情况。
公开查询
查看最终结果：任何人都可以在投票结束后查看最终的投票结果。
技术要求
使用 Solidity 编写智能合约。
合约应该部署在 Ethereum 测试网络（如 Ropsten 或 Rinkeby）上进行测试。
确保合约的安全性和效率，考虑防止重放攻击、双重投票等安全问题。
提供清晰的注释来解释代码逻辑。
扩展功能（可选）
身份验证：集成某种形式的身份验证机制，例如通过钱包签名验证选民身份。
多重签名：对于关键操作（如添加选民），引入多重签名机制提高安全性。
事件日志：利用事件来记录重要的动作（如投票），以便外部应用可以监听这些事件并作出响应。
学习目标
掌握 Solidity 的基本语法和特性。
理解如何使用结构体（structs）、映射（mappings）、数组（arrays）等数据结构。
学习如何定义和触发自定义事件。
实践编写安全的智能合约，包括正确的权限控制和输入验证。
了解如何与合约交互，包括部署和调用合约方法。
```