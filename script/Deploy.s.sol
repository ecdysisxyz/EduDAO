// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCScript, MCDevKit} from "@mc/devkit/Flattened.sol";
import {DeployLib} from "./DeployLib.sol";

// Import all function contracts
import {AddLiquidity} from "bundle/main/functions/AddLiquidity.sol";
import {BurnGovernanceToken} from "bundle/main/functions/BurnGovernanceToken.sol";
import {ClaimGovernanceToken} from "bundle/main/functions/ClaimGovernanceToken.sol";
import {PostJobListing} from "bundle/main/functions/PostJobListing.sol";
import {PostSkillSet} from "bundle/main/functions/PostSkillSet.sol";
import {ReportEmploymentMatch} from "bundle/main/functions/ReportEmploymentMatch.sol";
import {ReportLearningHours} from "bundle/main/functions/ReportLearningHours.sol";
import {SponsorLearner} from "bundle/main/functions/SponsorLearner.sol";
import {Stake} from "bundle/main/functions/Stake.sol";
import {SubmitResume} from "bundle/main/functions/SubmitResume.sol";
import {Swap} from "bundle/main/functions/Swap.sol";
import {Unstake} from "bundle/main/functions/Unstake.sol";
import {InvestigateMatch} from "bundle/main/functions/InvestigateMatch.sol";

// Import facade contract for proxy interactions
import {DAOFacade} from "./DAOFacade.sol";

contract DeployScript is MCScript {
    using DeployLib for MCDevKit;

    function run() public startBroadcastWith("DEPLOYER_PRIV_KEY") {
        // Prepare deployer address with initial funds
        vm.deal(deployer, 100 ether);

        // Initialize the DAO bundle
        mc.init("dao");

        // Use all function contracts
        mc.use("AddLiquidity", AddLiquidity.addLiquidity.selector, address(new AddLiquidity()));
        mc.use("BurnGovernanceToken", BurnGovernanceToken.burnGovernanceToken.selector, address(new BurnGovernanceToken()));
        mc.use("ClaimGovernanceToken", ClaimGovernanceToken.claimGovernanceToken.selector, address(new ClaimGovernanceToken()));
        mc.use("PostJobListing", PostJobListing.postJobListing.selector, address(new PostJobListing()));
        mc.use("PostSkillSet", PostSkillSet.postSkillSet.selector, address(new PostSkillSet()));
        mc.use("ReportEmploymentMatch", ReportEmploymentMatch.reportEmploymentMatch.selector, address(new ReportEmploymentMatch()));
        mc.use("ReportLearningHours", ReportLearningHours.reportLearningHours.selector, address(new ReportLearningHours()));
        mc.use("SponsorLearner", SponsorLearner.sponsorLearner.selector, address(new SponsorLearner()));
        mc.use("Stake", Stake.stake.selector, address(new Stake()));
        mc.use("SubmitResume", SubmitResume.submitResume.selector, address(new SubmitResume()));
        mc.use("Swap", Swap.swap.selector, address(new Swap()));
        mc.use("Unstake", Unstake.unstake.selector, address(new Unstake()));
        mc.use("InvestigateMatch", InvestigateMatch.investigateMatch.selector, address(new InvestigateMatch()));

        // Set the DAO facade for proxy interactions on Etherscan
        mc.set(address(new DAOFacade()));

        // Deploy the DAO bundle and get the proxy address
        address dao = mc.deploy().toProxyAddress();

        // Encode the DAO address and write it to the .env file for later use
        bytes memory encodedData = abi.encodePacked("DAO_ADDR=", vm.toString(address(dao)));
        vm.writeLine(
            string(
                abi.encodePacked(vm.projectRoot(), "/.env")
            ),
            string(encodedData)
        );
    }
}
