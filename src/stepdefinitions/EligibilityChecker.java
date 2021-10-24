package stepdefinitions;

import org.testng.Assert;
import org.testng.Reporter;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import runner.TestRunner;

public class EligibilityChecker extends TestRunner{

	@Given("I am person from {string}")
	public void selectUserCountry1(String country) {
		nhsCheckerPage.goToNextPage();
		nhsCheckerPage.selectCountry(country);
		nhsCheckerPage.goToNextPage();
	}

	@When("My Date of birth is {string} , Live With partner status {string}")
	public void enterDobAndSelectPartnerStatus(String dob, String partnerStatus) {
		nhsCheckerPage.enterDob(dob);
		nhsCheckerPage.goToNextPage();
		nhsCheckerPage.selectYesOrNoRadio(partnerStatus);
		nhsCheckerPage.goToNextPage();
	}
	
	@And("Me or My partner -if partner exists, claim any benefits - {string}")
	public void selectBenefitStatus(String benefitStatus) {
		nhsCheckerPage.selectYesOrNoRadio(benefitStatus);
		nhsCheckerPage.goToNextPage();
	}

	@And("Me or My partner -if partner exists, getting universal credits - {string}")
	public void selectUniversalCreditStatus(String universalCreditStatus) {
		nhsCheckerPage.selectUniversalCreditCheck(universalCreditStatus);
		nhsCheckerPage.goToNextPage();
		if(universalCreditStatus.equals("not-yet"))
		{
			nhsCheckerPage.goToNextPage();
		}
	}

	@And("Me or My partner -if partner exists, getting any of the universal credit benefits - {string}")
	public void selectUniversalCreditBenefitStatus(String universalCreditBenefitStatus) {
		nhsCheckerPage.selectYesOrNoRadio(universalCreditBenefitStatus);
		nhsCheckerPage.goToNextPage();
	}

	@And("Me or My partner -if partner exists, select any of the credit benefits - {string}")
	public void SelectUniversalCreditBenefits(String universalCreditBenefits) {
		nhsCheckerPage.selectRadioOrCheckBoxWithForAtribute(universalCreditBenefits);
		nhsCheckerPage.goToNextPage();
	}

	@And("Me or My partner -if partner exists, type of tax credits - {string}")
	public void SelectTaxCredits(String taxCredits) {
		nhsCheckerPage.selectRadioOrCheckBoxWithForAtribute(taxCredits);
		nhsCheckerPage.goToNextPage();
	}

	@And("Me or My partner -if partner exists, select type of allowance - {string}")
	public void SelectTypeOFAllowance(String typeOFAllowance) {
		nhsCheckerPage.selectRadioOrCheckBoxWithForAtribute(typeOFAllowance);
		nhsCheckerPage.goToNextPage();
	}
	
	@And("Me or My partner -if partner exists, select type of pension credit - {string}")
	public void SelectTypeOfPensionCredit(String typeOfPensionCredit) {
		nhsCheckerPage.selectRadioOrCheckBoxWithForAtribute(typeOfPensionCredit);
		nhsCheckerPage.goToNextPage();
	}

	@And("Me or My partner -if partner exists, take home pay less than {string} {string}")
	public void selectTakeHomePayStatus(String pay, String takeHomePayStatus) {
		nhsCheckerPage.selectYesOrNoRadio(takeHomePayStatus);
		nhsCheckerPage.goToNextPage();
	}
	
	@And("Me or My partner -if partner exists, house hold income less than {string}")
	public void selectIncomeLessThanOrEquals(String incomeLessThanOrEquals) {
		nhsCheckerPage.selectYesOrNoRadio(incomeLessThanOrEquals);
		nhsCheckerPage.goToNextPage();
	}
	
	@And("Are you pregnant - {string}")
	public void selectPregnantStatus(String pregnantStatus) {
		nhsCheckerPage.selectYesOrNoRadio(pregnantStatus);
		nhsCheckerPage.goToNextPage();
	}
	
	@And("Do I have injury by serving armed forces - {string}")
	public void selectInjuryStatus(String injuryStatus) {
		nhsCheckerPage.selectYesOrNoRadio(injuryStatus);
		nhsCheckerPage.goToNextPage();
	}
	
	@And("Do I have diabetes  {string}")
	public void selectDiabetesStatus(String diabetesStatus) {
		nhsCheckerPage.selectYesOrNoRadio(diabetesStatus);
		nhsCheckerPage.goToNextPage();
	}
	
	@And("Do I or family member have glaucoma  {string}")
	public void selectGlaucomaStatus(String glaucomaStatus) {
		nhsCheckerPage.selectYesOrNoRadio(glaucomaStatus);
		nhsCheckerPage.goToNextPage();
	}
	
	@And("Do I or partner live in care home  {string}")
	public void selectCareHome(String careHome) {
		nhsCheckerPage.selectYesOrNoRadio(careHome);
		nhsCheckerPage.goToNextPage();
	}
	
	@And("I get help to pay care home {string}")
	public void selectGetHelpToPayStatus(String getHelpToPayStatus) {
		nhsCheckerPage.selectYesOrNoRadio(getHelpToPayStatus);
		nhsCheckerPage.goToNextPage();
		if(getHelpToPayStatus.equals("no"))
		{
			nhsCheckerPage.selectYesOrNoRadio("no");
			nhsCheckerPage.goToNextPage();
		}
	}
	
	@And("Do I have more than 16000 in savings  {string}")
	public void selectSavings(String savings) {
		nhsCheckerPage.selectYesOrNoRadio(savings);
		nhsCheckerPage.goToNextPage();
	}

	@Then("Verify I will get a help or not")
	public void verifyResultWithClaimBenefit() {
		String decisionText = nhsCheckerPage.selectDecisionText("ClaimBenefits");
		if(decisionText.contains("You get help with NHS costs"))
		{
			Reporter.log(decisionText);
		}
	}
	
	@Then("Verify I will get a help or not with above conditions")
	public void verifyResultWithOutClaimBenefit() {
		String decisionText = nhsCheckerPage.selectDecisionText("WithConditions");
		String expectedText ="You get help with NHS costs";
		Assert.assertTrue(decisionText.contains(expectedText), "You will not get help with NHS costs");
	    Reporter.log(decisionText);
	}

	@Then("Verify I can apply for help from NHS")
	public void verifyCanApplyForNHSHelp() {
		String decisionText = nhsCheckerPage.selectDecisionText("CanApplyForHelp");
		String expectedText ="You can apply for help with NHS costs";
		Assert.assertTrue(decisionText.contains(expectedText), "You cannot apply for help with NHS costs");
	    Reporter.log(decisionText);
	}
}

