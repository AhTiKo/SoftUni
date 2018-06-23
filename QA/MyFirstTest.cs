using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using System.Windows.Forms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewSeleniumProject
{
    public class MyFirstTest
    {
        IWebDriver driver = new ChromeDriver();

        //[Test]
        //public void myFirstTest()
        //{
        //    driver.Navigate().GoToUrl("https://www.swtestacademy.com");
        //    Assert.AreEqual("Software Test Academy", driver.Title);
        //    driver.Close();
        //    driver.Quit();
        //}

        [Test]
        public void DemoQA()
        {
            driver.Url = "http://demoqa.com";
            WebDriverWait wait = new WebDriverWait(driver, TimeSpan.FromSeconds(60));
            IWebElement regButton = wait.Until(ExpectedConditions.ElementToBeClickable(By.LinkText("Registration")));
            regButton.Click();
            IWebElement firstName = driver.FindElement(By.Id("name_3_firstname"));
            Type(firstName, "Ventsislav");
            //       firstName.SendKeys("Ventsislav");
            IWebElement lasttName = driver.FindElement(By.Id("name_3_lastname"));
            lasttName.SendKeys("Ventsislavov");

            IWebElement matrialStatus = driver.FindElement(By.XPath("//*[@id=\"pie_register\"]/li[2]/div/div/input[1]"));
            matrialStatus.Click();
            List<IWebElement> hobbys = driver.FindElements(By.Name("checkbox_5[]")).ToList();
            hobbys[0].Click();
            hobbys[1].Click();
            IWebElement countryDropDown = driver.FindElement(By.Id("dropdown_7"));
            SelectElement country = new SelectElement(countryDropDown);
            country.SelectByText("Bulgaria");
            SelectElement month = new SelectElement(driver.FindElement(By.Id("mm_date_8")));
            month.SelectByText("1");
            SelectElement day = new SelectElement(driver.FindElement(By.Id("dd_date_8")));
            day.SelectByText("1");
            SelectElement year = new SelectElement(driver.FindElement(By.Id("yy_date_8")));
            year.SelectByText("2000");
            IWebElement phoneNumber = driver.FindElement(By.Id("phone_9"));
            phoneNumber.SendKeys("003591234567890");
            IWebElement userName = driver.FindElement(By.Id("username"));
            userName.SendKeys("VentsiVents4");
            IWebElement email = driver.FindElement(By.Id("email_1"));
            email.SendKeys("ventsi_vents4@abv.bg");

            IWebElement picButton = driver.FindElement(By.Id("profile_pic_10"));
            picButton.Click();

            //           wait = new WebDriverWait(driver, TimeSpan.FromSeconds(10));
            //           wait.Until(ExpectedConditions.AlertIsPresent());

            //           driver.SwitchTo().ActiveElement().SendKeys("C:\\Users\\jojo\\Desktop\\prof_pic.jpg");

            SendKeys.SendWait(@"C:\Users\jojo\Desktop\prof_pic.jpg");
            SendKeys.SendWait(@"{Enter}");

            IWebElement password = driver.FindElement(By.Id("password_2"));
            password.SendKeys("password");
            IWebElement comfPassword = driver.FindElement(By.Id("confirm_password_password_2"));
            comfPassword.SendKeys("password");
            IWebElement submit = driver.FindElement(By.Name("pie_submit"));
            submit.Click();

            IWebElement regMessage = driver.FindElement(By.ClassName("piereg_message"));
 //           Assert.IsTrue(regButton.Displayed);
            Assert.AreEqual("Thank you for your registration", regMessage.Text);

            driver.Close();
            driver.Quit();
        }

        public static void Type(IWebElement element, string text)
        {
            element.Clear();
            element.SendKeys(text);
        }


    }
}
