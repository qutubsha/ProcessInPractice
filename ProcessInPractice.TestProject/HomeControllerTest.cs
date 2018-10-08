using NUnit.Framework;
using System.Web.Mvc;
using ProccessInPractice.Controllers;

namespace ProcessInPractice.TestProject
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
