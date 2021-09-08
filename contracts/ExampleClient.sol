//SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "@api3/airnode-protocol/contracts/AirnodeClient.sol";

contract ExampleClient is AirnodeClient {
    mapping(bytes32 => bool) public incomingFulfillments;
    mapping(bytes32 => int256) public fulfilledData;

    constructor (address airnodeAddress)
        public
        AirnodeClient(airnodeAddress)
    {}

    function makeRequest(
        bytes32 providerId,
        bytes32 endpointId,
        uint256 requesterInd,
        address designatedWallet
        )
        external
    {
        bytes32 requestId = airnode.makeFullRequest(
            providerId,
            endpointId,
            requesterInd,
            designatedWallet,
            address(this),
            this.fulfill.selector,
            abi.encode(
                bytes32("1SS"),
                bytes32("period"), "30d",
                bytes32("symbols"), "btc,eth,matic,link,uni,sushi,aave,chz,theta,rsr,grt,enj,ocean,kacy"
            )
            );
        incomingFulfillments[requestId] = true;
    }
    function fulfill(
        bytes32 requestId,
        uint256 statusCode,
        int256 data
        )
        external
        onlyAirnode()
    {
        require(incomingFulfillments[requestId], "No such request made");
        delete incomingFulfillments[requestId];
        if (statusCode == 0)
        {
            fulfilledData[requestId] = data;
        }
    }
}
