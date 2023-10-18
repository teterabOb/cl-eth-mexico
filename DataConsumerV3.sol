// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract DataConsumerV3 {
    //AggregatorV3Interface internal dataFeed;

    constructor() {
    }

    function getV3Interface(address _address) public pure returns(AggregatorV3Interface){
        return AggregatorV3Interface(_address);
    }

    function getChainlinkDataFeedLatestAnswer(address _address) public view returns (int) {
        // prettier-ignore
        (
            /* uint80 roundID */,
            int answer,
            /*uint startedAt*/,
            uint timeStamp,
            /*uint80 answeredInRound*/
        ) = getV3Interface(_address).latestRoundData();
        require(timeStamp > 0, "La ronda no ha terminado");
        return answer;
    }
}

