package runner;

import org.openqa.selenium.WebDriver;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import drivers.WebDriverFactory;
import io.cucumber.testng.CucumberOptions;
import io.cucumber.testng.FeatureWrapper;
import io.cucumber.testng.PickleWrapper;
import io.cucumber.testng.TestNGCucumberRunner;
import pages.NHSEligibilityCheckerPage;

@CucumberOptions(
        features = {"src\\features"},
        glue = {"stepdefinitions"},
        tags = "@nhscostchecker" )
public class TestRunner  {
	
	public WebDriverFactory webDriverFactory;
	public static WebDriver driver;
	public static NHSEligibilityCheckerPage nhsCheckerPage;
	private TestNGCucumberRunner testNGCucumberRunner;
	

	
	@BeforeClass(alwaysRun = true)
	public void setUpClass() {
		
		testNGCucumberRunner = new TestNGCucumberRunner(this.getClass());
	}
	
	@BeforeMethod(alwaysRun = true)
	@Parameters ( { "browser" })
	public void setUpBrowser(String browser) {
		
		webDriverFactory = new WebDriverFactory();
		driver = webDriverFactory.GetWebDriver(browser);
		driver.get("https://services.nhsbsa.nhs.uk/check-for-help-paying-nhs-costs/start");
		nhsCheckerPage = new NHSEligibilityCheckerPage(driver); 
	}
	
	
	 @Test(groups = "cucumber", description = "Runs Cucumber Scenarios", dataProvider = "scenarios")
	    public void scenario(PickleWrapper pickle, FeatureWrapper cucumberFeature) {

	        testNGCucumberRunner.runScenario(pickle.getPickle());
	    }
	 
	 @DataProvider
	    public Object[][] scenarios() {
	        return testNGCucumberRunner.provideScenarios();
	    }
	 @AfterMethod(alwaysRun = true)
	    public void tearDownBrowser() {
	        driver.quit();
	    }

	    @AfterClass(alwaysRun = true)
	    public void tearDownClass() {
	        testNGCucumberRunner.finish();
	    }
}


