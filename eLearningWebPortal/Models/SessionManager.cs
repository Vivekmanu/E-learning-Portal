using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eLearningWebPortal.Models
{
    public static class SessionManager
    {
        public static string Role()
        {
            if(HttpContext.Current.Session["User"] != null)
            {
                var session = (Member)HttpContext.Current.Session["User"];
                return session.RoleName;
            }
            return "";
        }

        public static string Name()
        {
            if (HttpContext.Current.Session["User"] != null)
            {
                var session = (Member)HttpContext.Current.Session["User"];
                return session.Name;
            }
            return "";
        }

        public static string Email()
        {
            if (HttpContext.Current.Session["User"] != null)
            {
                var session = (Member)HttpContext.Current.Session["User"];
                return session.Email;
            }
            return "";
        }

        public static int UserId()
        {
            if (HttpContext.Current.Session["User"] != null)
            {
                var session = (Member)HttpContext.Current.Session["User"];
                return session.Id;
            }
            return 0;
        }

        public static int CourseId()
        {
            if (HttpContext.Current.Session["User"] != null)
            {
                var session = (Member)HttpContext.Current.Session["User"];
                return session.FkCourseId;
            }
            return 0;
        }
    }
}