using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Quizz.Models;

namespace Quizz.Controllers
{
    public class TBL_QUESTIONSController : Controller
    {
        private DBQUIZEntities db = new DBQUIZEntities();

        // GET: TBL_QUESTIONS
        public ActionResult Index()
        {
            var tBL_QUESTIONS = db.TBL_QUESTIONS.Include(t => t.tbl_categroy);
            return View(tBL_QUESTIONS.ToList());
        }

        // GET: TBL_QUESTIONS/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TBL_QUESTIONS tBL_QUESTIONS = db.TBL_QUESTIONS.Find(id);
            if (tBL_QUESTIONS == null)
            {
                return HttpNotFound();
            }
            return View(tBL_QUESTIONS);
        }

        // GET: TBL_QUESTIONS/Create
        public ActionResult Create()
        {
            ViewBag.q_fk_catid = new SelectList(db.tbl_categroy, "cat_id", "cat_name");
            return View();
        }

        // POST: TBL_QUESTIONS/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "QUESTION_ID,Q_TEXT,OPA,OPB,OPC,OPD,COP,q_fk_catid,Q_level")] TBL_QUESTIONS tBL_QUESTIONS)
        {
            if (ModelState.IsValid)
            {
                db.TBL_QUESTIONS.Add(tBL_QUESTIONS);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.q_fk_catid = new SelectList(db.tbl_categroy, "cat_id", "cat_name", tBL_QUESTIONS.q_fk_catid);
            return View(tBL_QUESTIONS);
        }

        // GET: TBL_QUESTIONS/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TBL_QUESTIONS tBL_QUESTIONS = db.TBL_QUESTIONS.Find(id);
            if (tBL_QUESTIONS == null)
            {
                return HttpNotFound();
            }
            ViewBag.q_fk_catid = new SelectList(db.tbl_categroy, "cat_id", "cat_name", tBL_QUESTIONS.q_fk_catid);
            return View(tBL_QUESTIONS);
        }

        // POST: TBL_QUESTIONS/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "QUESTION_ID,Q_TEXT,OPA,OPB,OPC,OPD,COP,q_fk_catid,Q_level")] TBL_QUESTIONS tBL_QUESTIONS)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tBL_QUESTIONS).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.q_fk_catid = new SelectList(db.tbl_categroy, "cat_id", "cat_name", tBL_QUESTIONS.q_fk_catid);
            return View(tBL_QUESTIONS);
        }

        // GET: TBL_QUESTIONS/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TBL_QUESTIONS tBL_QUESTIONS = db.TBL_QUESTIONS.Find(id);
            if (tBL_QUESTIONS == null)
            {
                return HttpNotFound();
            }
            return View(tBL_QUESTIONS);
        }

        // POST: TBL_QUESTIONS/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TBL_QUESTIONS tBL_QUESTIONS = db.TBL_QUESTIONS.Find(id);
            db.TBL_QUESTIONS.Remove(tBL_QUESTIONS);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
