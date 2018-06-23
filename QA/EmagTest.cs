using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EmagTest
{
    public class Test
    {
        
        IWebDriver driver = new ChromeDriver();
        
        [Test]
        public void test()
        {
            driver.Url = "https://www.emag.bg/homepage";
            driver.Manage().Window.Maximize();
            WebDriverWait wait = new WebDriverWait(driver, TimeSpan.FromSeconds(60));

            IWebElement searchBox = wait.Until<IWebElement>((w) => 
                                    { return w.FindElement(By.Id("searchboxTrigger")); });
            searchBox.Clear();
            searchBox.SendKeys("Тостер Star-Light TS-800");
            searchBox.Submit();

            IWebElement addProduct = driver.FindElement(By.XPath("//*[@id=\"card_grid\"]/div[1]/div/div/div[3]/div[3]/form/button"));
            addProduct.Click();
            System.Threading.Thread.Sleep(500);

            IWebElement modalClose = driver.FindElement(By.CssSelector("body>div.ph-modal.modal.fade.in>div>div>div.modal-header>button"));
            modalClose.Click();
            System.Threading.Thread.Sleep(500);

            IWebElement basket =  driver.FindElement(By.XPath("//*[@id=\"my_cart\"]/i"));
            basket.Click();

            IWebElement basketElement = driver.FindElement(By.XPath("//*[@id=\"vendorsContainer\"]/div/div[1]/div/div[2]/div[1]/div[1]/a"));
            Assert.AreEqual(basketElement.Text, "Тостер Star-Light TS-800W, 800 W, 2 филии, Регулируема степен на изпичане, Функция размразяване, Инокс");

            driver.Close();
            driver.Quit();
        }

    }
}
