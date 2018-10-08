using NUnit.Framework;
using ProccessInPractice.Controllers;
using System.Web.Mvc;

namespace ProccessInPractice.UnitTests.Controller
{
    [TestFixture]
    public class HomeControllerTest
    {
        [Test]
        public void Index()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("This is My New Home Page Again", result.ViewBag.Title);
        }
    }
}