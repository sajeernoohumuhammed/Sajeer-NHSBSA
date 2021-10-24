package pages;

import java.time.Duration;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class NHSEligibilityCheckerPage {
	private WebDriver driver;
	private WebDriverWait wait;

	public NHSEligibilityCheckerPage(WebDriver driver)
	{
		this.driver = driver;
		wait = new WebDriverWait(driver, Duration.ofSeconds(10));
	}

	public void goToNextPage()
	{
		getElementById("next-button").click();
	}

	public void selectCountry(String country)
	{
		getElementById("label-"+country).click();
	}

	public void enterDob(String dob)
	{
		String[] splitDate = dob.split("-",3);
		getElementById("dob-day").sendKeys(splitDate[0]);
		getElementById("dob-month").sendKeys(splitDate[1]);
		getElementById("dob-year").sendKeys(splitDate[2]);
	}

	public void selectYesOrNoRadio(String yesOrNoValue) {

		getElementById("label-"+yesOrNoValue).click();

	}

	public void selectUniversalCreditCheck(String value) {

		if(value.equals("yes"))
		{
			value = value+"-universal";
		}

		getElementByForAttribute(value).click();

	}
	
	public void selectRadioOrCheckBoxWithForAtribute(String value) {

		getElementByForAttribute(value).click();

	}

	public String selectDecisionText(String decision) {
		
		String  decisionText = "";
		switch(decision)
		{
		case "ClaimBenefits" :
			decisionText = this.wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[@class='done-panel']//h2"))).getText();
			break;
		case "WithConditions" :
			decisionText = this.wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("result-heading"))).getText();
			break;
		case "CanApplyForHelp" :
			decisionText = this.wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[@class='done-panel']//h1[2]"))).getText();
			break;
		default:
		return null;
		}
		
		return decisionText;
	}
	

	private WebElement getElementById(String id)
	{
		return this.wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(id)));
	}

	private WebElement getElementByForAttribute(String value)
	{
		return this.wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//label[@for="+"'"+value+"']")));
	}


}
