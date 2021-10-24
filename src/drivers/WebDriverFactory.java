
package drivers;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

public class WebDriverFactory {
	
	protected WebDriver driver;
	
	public WebDriver GetWebDriver(String browser)
	{
		switch(browser.toLowerCase())
		{
		case "chrome":
			System.setProperty("webdriver.chrome.driver", "./src/customdrivers/chromedriver.exe");
			 driver = new ChromeDriver();
			 break;
		case "firefox":
			System.setProperty("webdriver.gecko.driver", "./src/customdrivers/geckodriver.exe");
			 driver = new FirefoxDriver();
			 break;
		}
		
		driver.manage().window().maximize();
		return driver;
	}

}
