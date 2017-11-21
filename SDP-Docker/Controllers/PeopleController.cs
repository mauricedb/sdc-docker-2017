using System.Linq;
using Microsoft.AspNetCore.Mvc;
using SDP_Docker.Models;

namespace SDP_Docker.Controllers
{
    public class PeopleController : Controller
    {
        public IActionResult Index()
        {
            using (var db = new PeopleDbContext())
            {
                var people = from person in db.People
                    orderby person.FirstName
                    select person;

                return View(people.ToList());
            }
        }

        [HttpPost]
        public IActionResult Index(int id)
        {
            using (var db = new PeopleDbContext())
            {
                var person = db.People.SingleOrDefault(p => p.Id == id);
                db.People.Remove(person);
                db.SaveChanges();
            }

            return Redirect("/people");
        }
    }
}