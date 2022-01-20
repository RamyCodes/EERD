using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TryWeb
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            dtv.Visible = false;
            try
            {
                SqlDataAdapter dat = new SqlDataAdapter("SELECT User_.first_name,User_.middle_name, User_.last_name FROM User_, Employer, Review_Profile WHERE User_.ID = Employer.ID AND User_.ID = Review_Profile.employer_id AND Review_Profile.status_ = '1' ORDER BY User_.first_name ASC", conn);
                DataTable dtb = new DataTable();
                dat.Fill(dtb);
                dtv.DataSource = dtb;
                dtv.DataBind();
                dtv.Visible = true;
            }
            catch { }

            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            dtv0.Visible = false;
            try
            {
                SqlDataAdapter dat0 = new SqlDataAdapter("SELECT * FROM Job j WHERE j.visibility = 1", conn);
                DataTable dtb0 = new DataTable();
                dat0.Fill(dtb0);
                dtv0.DataSource = dtb0;
                dtv0.DataBind();
                dtv0.Visible = true;
            }
            catch { }
            conn.Close();
        }

        protected void Login(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", true);
        }

        protected void SearchB(object sender, EventArgs e)
        {
            Label1.Visible = false;
            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            string tableType = DropDownList1.Text;
            dtv0.Visible = false;

            if (tableType == "Semester")
            {
                try
                {
                    SqlDataAdapter dat0 = new SqlDataAdapter("SELECT * FROM Job INNER JOIN Required_semesters ON Job.ID = Required_semesters.ID WHERE(Required_semesters.semester = " + TextBox1.Text + ") AND Job.visibility = '1'", conn);
                    DataTable dtb0 = new DataTable();
                    dat0.Fill(dtb0);
                    dtv0.DataSource = dtb0;
                    dtv0.DataBind();
                    dtv0.Visible = true;
                }
                catch
                {
                    Label1.Text = "Please enter a valid semester number !";
                    Label1.Visible = true;
                }
            }
            else if (tableType == "faculties")
            {
                try
                {
                    SqlDataAdapter dat0 = new SqlDataAdapter("SELECT * " +
                        "FROM Job INNER JOIN Allowed_faculties ON Allowed_faculties.ID = Job.ID " +
                        "WHERE(Allowed_faculties.faculty_name = '" + TextBox1.Text + "') AND Job.visibility = '1'", conn);
                    DataTable dtb0 = new DataTable();
                    dat0.Fill(dtb0);
                    dtv0.DataSource = dtb0;
                    dtv0.DataBind();
                    dtv0.Visible = true;

                }
                catch
                {
                    Label1.Text = "No jobs found for the selected faculty !";
                    Label1.Visible = true;

                }


            }
                if (dtv0.Rows.Count.Equals(0))
                {
                    Label1.Text = "No jobs found !";
                    Label1.Visible = true;
                }
        }
        protected void CancelB(object sender, EventArgs e)
        {
            dtv0.Visible = true;
            Label1.Text = "";
            TextBox1.Text = null;
        }
    }
}