// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import {TimelockController} from "@openzeppelin/contracts/governance/TimelockController.sol";


contract TimeLock is TimelockController {


    /**
     * 
     * @param minDelay is how long you have to wait before executing
     * @param proposers is the list of addresses that can propose
     * @param executors is the list of addresses that can execute
     * @param admin is the admin
     */
    constructor(uint256 minDelay, address[] memory proposers, address[] memory executors, address admin) TimelockController(minDelay,proposers,executors, msg.sender) {}

}