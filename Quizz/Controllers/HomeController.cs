using Quizz.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace Quizz.Controllers
{
    public class HomeController : Controller
    {
        DBQUIZEntities db = new DBQUIZEntities();


        [HttpGet]
        public ActionResult Register()
        {
            return View();


        }

        [HttpPost]
        public ActionResult Register(TBL_STUDENT svw)
        {
            try
            {
                db.TBL_STUDENT.Add(svw);

                db.SaveChanges();


               
              //  Response.Write(Session["id"]==null);
               
            }
            catch (Exception)
            {
                ViewBag.msg = "Data could not be inserted";
            }
            List<TBL_STUDENT> li = db.Database.SqlQuery<TBL_STUDENT>("select * from TBL_STUDENT where S_NAME={0} AND PHONE_NO={1}", svw.S_NAME, svw.PHONE_NO).ToList();
            Session["id"] = li[0].S_ID;
            
            return View("Register2");

        }




        [HttpGet]
        public ActionResult Logout()
        {
            Session.Abandon();
            Session.RemoveAll();
            
            return RedirectToAction("Index");

            
        }

        public ActionResult slogin()
        {
            return View();
        }

        [HttpPost]
        public ActionResult slogin(TBL_STUDENT s)
        {
            TBL_STUDENT std = db.TBL_STUDENT.Where(x => x.S_ID == s.S_ID && x.S_PASSWORD == s.S_PASSWORD).SingleOrDefault();
            if (std == null)
            {
                ViewBag.Msg = "Invalid user id or Password";
            }
            else
            {
                Session["std_id"] = std.S_ID;
                return RedirectToAction("StudentExam");
            }
            return View();
        }
        TBL_QUESTIONS q;
        public ActionResult StudentExam()
        {
           
            if (Session["std_id"] == null)
            {
                return RedirectToAction("slogin");
            }

            //
            ////int sid = Convert.ToInt32(Session["std_id"]);
            //int sid = 1;
            //List<tbl_categroy> li = db.tbl_categroy.Where(x => x.cat_fk_adid == sid).ToList();
            //ViewBag.list = new SelectList(li, "cat_id", "cat_name");

           
            List<tbl_categroy> li = db.tbl_categroy.Where(x => x.cat_fk_adid == 1).ToList();
            ViewBag.list = new SelectList(li, "cat_id", "cat_name");
      
            return View();





           
            

        }


        [HttpPost]
        public ActionResult StudentExam(TBL_QUESTIONS t1)
        {
            List<tbl_categroy> list = db.tbl_categroy.ToList();
            Session["paper"] = t1.q_fk_catid;
           


            foreach (var item in list)
            {

                if (item.cat_id == t1.q_fk_catid)
                {
                    List<TBL_QUESTIONS> li = db.TBL_QUESTIONS.Where(x=>x.q_fk_catid==item.cat_id).ToList();
                    Queue<TBL_QUESTIONS> queue = new Queue<TBL_QUESTIONS>();
                    int count = 0;
                    foreach (TBL_QUESTIONS a in li)
                    {
                        queue.Enqueue(a);
                        count += 1;

                    }
                   
                    Session["countq"] = count;
                    TempData["examid"] = item.cat_id;
                    TempData["questions"] = queue;
                    TempData["score"] = 0;
                    Session["score"] = 0;
                    Session["question"] = 0;
                    //TempData["examid"] = item.cat_id;
                    TempData.Keep();
                    return RedirectToAction("QuizStart");

                }
                else
                {
                    ViewBag.error = "No paper found";
                }

            }
            


            return View();


        }
        public ActionResult Report()
        {
            return View(db.USER_REPORT.ToList());
        }


        
        public ActionResult QuizStart()
        {

            if (Session["std_id"] == null)
            {
                return RedirectToAction("slogin");
            }

            if (TempData["questions"] == null)
            {
                return RedirectToAction("StudentExam");

            }

           TempData.Keep();
            

            if (TempData["questions"] != null)
            {
                Queue<TBL_QUESTIONS> qlist = (Queue<TBL_QUESTIONS>)TempData["questions"];
                if (qlist.Count != 0)
                {
                    q = qlist.Peek();
                  
                    qlist.Dequeue();
                    TempData["questions"] = qlist;
                    Session["question"] = (Convert.ToInt32(Session["question"])) + 1;
                    TempData["ques"] = Session["question"];
                     TempData.Keep();

                    return View(q);
                    
                    
                }
                
            }

            else
            {
                return View("EndExam");
            }
            return RedirectToAction("EndExam");

        }


  




        //if (TempData["examid"] == null)
        //{
        //    RedirectToAction("StudentExam");
        //}



        //return View();


    


        public ActionResult EndExam()
        {
            var student=db.TBL_STUDENT.Find(Session["std_id"]);
            USER_REPORT user = new USER_REPORT();
            user.USER_ID = Convert.ToInt32(Session["std_id"]);
            user.USER_NAME = student.S_NAME;
            user.USER_PAPER = Session["Paper"].ToString();
            if ((Convert.ToDouble(Session["countq"]) == 0))
            {
                TempData["qwerty"] = "No questions";
                return RedirectToAction("StudentExam");
            }
            else
            {
                double score = ((Convert.ToDouble(Session["score"])) / (Convert.ToDouble(Session["countq"])) * 100);
                user.USER_SCORE = Convert.ToInt32(score);
                Session["MAX"] = user.USER_SCORE;
                user.MAX_MARKS = 100;
                db.USER_REPORT.Add(user);
                db.SaveChanges();
            }
            return View();


        }
        [HttpPost]
        public ActionResult EndExam(int? s)
        {
            Session.Abandon();
            return RedirectToAction("Index");


        }

        [HttpPost]

        public ActionResult QuizStart(TBL_QUESTIONS q)
        {
            DBQUIZEntities de = new DBQUIZEntities();
            try { 
            TempData.Keep();
            string ca = null;
            
            if (q.OPA != null)
            {
                    ca = "A";
                    TBL_QUESTIONS q1 = de.TBL_QUESTIONS.Find(int.Parse(q.OPA));
                    if (q1.COP.Equals(ca))
                    {
                        Session["score"]= Convert.ToInt32(Session["score"]) + 1;
                    }
                
            }
            else if (q.OPB != null)
            {
                ca = "B";
                    if (de.TBL_QUESTIONS.Find(int.Parse(q.OPB)).COP.Equals(ca))
                    {
                        Session["score"] = Convert.ToInt32(Session["score"]) + 1;
                    }
                }
            else if (q.OPC != null)
            {
                ca = "C";
                    if (de.TBL_QUESTIONS.Find(int.Parse(q.OPC)).COP.Equals(ca))
                    {
                        Session["score"] = Convert.ToInt32(Session["score"]) + 1;
                    }
                }
            else if (q.OPD != null)
            {
                ca = "D";
                    if (de.TBL_QUESTIONS.Find(int.Parse(q.OPD)).COP.Equals(ca))
                    {
                        Session["score"] = Convert.ToInt32(Session["score"]) + 1;
                    }
                }

           
        }
            catch (Exception e)
            {
                Session["score"] = Convert.ToInt32(Session["score"]) + 0;

            }


            TempData.Keep();

            return RedirectToAction("QuizStart");


        }




        [HttpGet]
        public ActionResult tlogin()
        {

            return View();
        }


        [HttpPost]
        public ActionResult tlogin(TBL_ADMIN a)
        {
            TBL_ADMIN ad = db.TBL_ADMIN.Where(x => x.AD_NAME == a.AD_NAME && x.AD_PASSWORD == a.AD_PASSWORD).SingleOrDefault();
            if (ad != null)
            {
                Session["ad_id"] = ad.AD_ID;
                return RedirectToAction("Dashboard");
            }
            else
            {
                ViewBag.msg = "Invalid username or password";
            }
            return View();
        }

        public ActionResult Dashboard()
        {
            if (Session["ad_id"] == null)
            {
                return RedirectToAction("Index");
            }
            return View();
        }






        [HttpGet]
        public ActionResult Addcategory()
        {
            if (Session["ad_id"] == null)
            {
                return RedirectToAction("Index");
            }
           // Session["ad_id"] = 2;//remove
            int adid = Convert.ToInt32(Session["ad_id"].ToString());
            List <tbl_categroy> li = db.tbl_categroy.Where(x=>x.cat_fk_adid== adid).OrderByDescending(x => x.cat_id).ToList();
            ViewData["list"] = li;
            return View();
        }


        [HttpPost]
        public ActionResult Addcategory(tbl_categroy cat)
        {

            try
            {
                List<tbl_categroy> li = db.tbl_categroy.OrderByDescending(x => x.cat_id).ToList();
                ViewData["list"] = li;

                tbl_categroy c = new tbl_categroy();
                c.cat_name = cat.cat_name;
                c.cat_fk_adid = Convert.ToInt32(Session["ad_id"].ToString());
                db.tbl_categroy.Add(c);
                db.SaveChanges();
            }
            catch(Exception e)
            {
                TempData["qwerty"] = "Please fill category";
            }

            return RedirectToAction("Addcategory");
        }

        [HttpGet]
        public ActionResult Addquestion()
        {
            int sid = Convert.ToInt32(Session["ad_id"]);
            List<tbl_categroy> li = db.tbl_categroy.Where(x => x.cat_fk_adid == sid).ToList();
            ViewBag.list = new SelectList(li, "cat_id", "cat_name");
            List<string> LL = new List<string>() { "EASY", "MEDIUM", "HARD" };
            ViewBag.L1 = new SelectList(LL);
            List<string> LO = new List<string>() { "A", "B", "C","D" };
            ViewBag.L2 = new SelectList(LO);

            return View();
        }


        [HttpPost]
        public ActionResult Addquestion(TBL_QUESTIONS q)
        {
            /*int sid = Convert.ToInt32(Session["ad_id"]);
            List<tbl_categroy> li = db.tbl_categroy.Where(x => x.cat_fk_adid == sid).ToList();
            ViewBag.list = new SelectList(li, "cat_id", "cat_name");
            //
            TBL_QUESTIONS QA = new TBL_QUESTIONS();
            QA.Q_TEXT = q.Q_TEXT;
            QA.OPA = q.OPA;
            QA.OPB = q.OPB;
            QA.OPC = q.OPC;
            QA.OPD = q.OPD;
            QA.COP = q.COP;
            QA.q_fk_catid = q.q_fk_catid;

          */
            //q
            db.TBL_QUESTIONS.Add(q);
            db.SaveChanges();
            TempData["message"] = "Questions added Successfully";
            TempData.Keep();
            return RedirectToAction("Addquestion");

           
        }


        public ActionResult Index()
        {
            if (Session["ad_id"] != null)
            {
                return RedirectToAction("Dashboard");

            }
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }


        //
        public ActionResult Viewquestion()
        {
            int sid = Convert.ToInt32(Session["ad_id"]);
            List<tbl_categroy> li = db.tbl_categroy.Where(x => x.cat_fk_adid == sid).ToList();
            ViewBag.list = new SelectList(li, "cat_id", "cat_name");
            return View();
        }

        [HttpPost]
        public ActionResult Viewquestion(TBL_QUESTIONS id)
        {
            int sid = Convert.ToInt32(Session["ad_id"]);
            List<TBL_QUESTIONS> li = db.TBL_QUESTIONS.Where(x => x.q_fk_catid == id.q_fk_catid).ToList();
          
            return View("Viewquestionhttp",li);
        }
        public ActionResult Edit(int id)
        {
            var q = db.TBL_QUESTIONS.Where(s => s.QUESTION_ID == id).FirstOrDefault();
            List<string> LL = new List<string>() { "EASY", "MEDIUM", "HARD" };
            ViewBag.L1 = new SelectList(LL);
            List<string> LO = new List<string>() { "A", "B", "C", "D" };
            ViewBag.L2 = new SelectList(LO);


            return View("Edit2",q);
        }
        [HttpPost]
        public ActionResult Edit2(TBL_QUESTIONS obj)
        {
            List<TBL_QUESTIONS> list1 = new List<TBL_QUESTIONS>();
            List<string> LL = new List<string>() { "EASY", "MEDIUM", "HARD" };
            ViewBag.L1 = new SelectList(LL);
            List<string> LO = new List<string>() { "A", "B", "C", "D" };
            ViewBag.L2 = new SelectList(LO);
            if (ModelState.IsValid)
            {
                var QA = db.TBL_QUESTIONS.Where(x => x.QUESTION_ID.Equals(obj.QUESTION_ID)).FirstOrDefault();
                QA.Q_TEXT = obj.Q_TEXT;
                QA.OPA = obj.OPA;
                QA.OPB = obj.OPB;
                QA.OPC = obj.OPC;
                QA.OPD = obj.OPD;
                QA.COP = obj.COP;
                QA.Q_level = obj.Q_level;
                
                TempData.Keep();
                db.SaveChanges();
                TempData["msg"] = "<script>alert('Updated successfully')</script>";
                TempData.Keep();
               
            }
            return View();

            
            
        }


        public ActionResult Delete(int id)
        {
            var QA = db.TBL_QUESTIONS.Single(x => x.QUESTION_ID == id);
            int ct_id = Convert.ToInt32(QA.q_fk_catid);

            db.Database.ExecuteSqlCommand("select * from TBL_QUESTIONS where q_fk_catid=@x", new SqlParameter("@x",id));

            TBL_QUESTIONS q = db.TBL_QUESTIONS.Find(id);
            db.TBL_QUESTIONS.Remove(q);
            db.SaveChanges();
            TBL_QUESTIONS tab = new TBL_QUESTIONS();
            TempData["msg"] = "<script>alert('Deleted Successfully')</script>";
            List<TBL_QUESTIONS> list1 = db.Database.SqlQuery<TBL_QUESTIONS>("select * from TBL_QUESTIONS where q_fk_catid=@x", new SqlParameter("@x", ct_id)).ToList();
            return View("Viewquestionhttp", list1);

        }












        








    }
}