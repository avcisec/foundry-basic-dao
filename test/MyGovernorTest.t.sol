// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {MyGovernor} from "../src/MyGovernor.sol";
import {GovToken} from "../src/GovToken.sol";
import {Box} from "../src/Box.sol";
import {TimeLock,TimelockController} from "../src/TimeLock.sol";
import {IVotes} from "@openzeppelin/contracts/governance/utils/IVotes.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract MyGovernorTest is Test {
    GovToken token;
    TimeLock timeLock;
    MyGovernor myGovernor;
    Box box;

address[] public proposers;
address[] public executors;
address admin = makeAddr("admin");
address USER = makeAddr("user");
address proposer1 = makeAddr("proposer1");
address proposer2 = makeAddr("proposer2");
address executor1 = makeAddr("executor1");
address executor2 = makeAddr("executor2");
uint256  constant MIN_DELAY = 5;
uint256 INITIAL_SUPPLY = 100 ether;

    function setUp() public {
        proposers.push(proposer1);
        proposers.push(proposer2);
        executors.push(executor1);
        executors.push(executor2);

        token = new GovToken();
        vm.prank(USER);
        token.mint(USER, INITIAL_SUPPLY);
        token.delegate(USER);
        timeLock = new TimeLock(MIN_DELAY, proposers, executors, admin);
        myGovernor = new MyGovernor(IVotes(token), TimelockController(timeLock));
        box = new Box();
    }

    

}