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
    public partial class WebForm2 : System.Web.UI.Page
    {
        static int count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                Label1.Text = Session["email"].ToString();
            }
            // the button that lists all employees is not visible until we make sure that this is an admin profile and not a user profile...
            Button4.Visible = false;
            Label2.Visible = false;
            dtv0.Visible = false;
            Button5.Visible = false;
            Label3.Visible = false;
            TextBox1.Visible = false;
            Label4.Visible = false;
            Button6.Visible = false;
            Button7.Visible = false;
            Button8.Visible = false;
            Label5.Visible = false;
            Button9.Visible = false;
            dtv3.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            TextBox2.Visible = false;
            Button11.Visible = false;
            Button10.Visible = false;
            dtv4.Visible = false;
            Button12.Visible = false;
            Button13.Visible = false;
            Button14.Visible = false;
            dtv5.Visible = false;
            dtv6.Visible = false;
            Button15.Visible = false;
            TextBox12.Visible = false;
            TextBox13.Visible = false;
            TextBox14.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            Label10.Visible = false;
            Button16.Visible = false;
            Label11.Visible = false;
            Label12.Visible = false;
            Label13.Visible = false;
            Label14.Visible = false;
            Label15.Visible = false;
            Label16.Visible = false;
            Label17.Visible = false;
            Label18.Visible = false;
            TextBox15.Visible = false;
            TextBox16.Visible = false;
            TextBox17.Visible = false;
            TextBox18.Visible = false;
            TextBox19.Visible = false;
            TextBox20.Visible = false;
            TextBox21.Visible = false;
            TextBox22.Visible = false;
            Label19.Visible = false;
            Label20.Visible = false;
            Label21.Visible = false;
            Label22.Visible = false;
            Label23.Visible = false;
            Label24.Visible = false;
            Label25.Visible = false;
            Label26.Visible = false;
            Button17.Visible = false;
            TextBox6.Visible = false;
            TextBox7.Visible = false;
            TextBox8.Visible = false;
            TextBox9.Visible = false;
            TextBox10.Visible = false;
            TextBox11.Visible = false;
            TextBox23.Visible = false;
            TextBox24.Visible = false;
            Button18.Visible = false;
            Label27.Visible = false;
            TextBox25.Visible = false;
            Button19.Visible = false;
            dtv7.Visible = false;
            Button20.Visible = false;
            Label28.Visible = false;
            Label29.Visible = false;
            Label30.Visible = false;
            Label31.Visible = false;
            TextBox26.Visible = false;
            TextBox27.Visible = false;
            TextBox28.Visible = false;
            TextBox29.Visible = false;
            Button21.Visible = false;

            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmdS = new SqlCommand("SELECT a.ID FROM User_ u, Admin_ a WHERE u.ID = a.ID AND u.email = '" + Label1.Text + "'", conn);
            try
            {
                SqlDataReader dr = cmdS.ExecuteReader();
                if (dr.HasRows)
                {
                    Button4.Visible = true;
                    Button8.Visible = true;
                    Button9.Visible = true;

                }

            }
            catch { }
            finally { conn.Close(); }
            //if user is a faculty representative
            SqlCommand cmdS2 = new SqlCommand("SELECT f.ID FROM User_ u, Faculty_Representative f WHERE u.ID = f.ID AND u.email = '" + Label1.Text + "'", conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlDataReader dr2 = cmdS2.ExecuteReader();
            if (dr2.HasRows)
            {
                Label7.Visible = true;
                TextBox2.Visible = true;
                Button11.Visible = true;
                Button10.Visible = true;

            }
            conn.Close();
            //if user is an employer
            SqlCommand cmdS3 = new SqlCommand("SELECT e.ID FROM User_ u, Employer e WHERE u.ID = e.ID AND u.email = '" + Label1.Text + "'", conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlDataReader dr3 = cmdS3.ExecuteReader();
            if (dr3.HasRows)
            {
                Button14.Visible = true;
                Button15.Visible = true;
                TextBox12.Visible = true;
                TextBox13.Visible = true;
                TextBox14.Visible = true;
                Label8.Visible = true;
                Label9.Visible = true;
                Label10.Visible = true;
                Button16.Visible = true;
                Label11.Visible = true;
                Label12.Visible = true;
                Label13.Visible = true;
                Label14.Visible = true;
                Label15.Visible = true;
                Label16.Visible = true;
                Label17.Visible = true;
                Label18.Visible = true;
                TextBox15.Visible = true;
                TextBox16.Visible = true;
                TextBox17.Visible = true;
                TextBox18.Visible = true;
                TextBox19.Visible = true;
                TextBox20.Visible = true;
                TextBox21.Visible = true;
                TextBox22.Visible = true;
            }
            conn.Close();
            //if user is a Student
            SqlCommand cmdS4 = new SqlCommand("SELECT s.ID FROM User_ u, Student s WHERE u.ID = s.ID AND u.email = '" + Label1.Text + "'", conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlDataReader dr4 = cmdS4.ExecuteReader();
            if (dr4.HasRows)
            {
                Button17.Visible = true;
                TextBox6.Visible = true;
                TextBox7.Visible = true;
                TextBox8.Visible = true;
                TextBox9.Visible = true;
                TextBox10.Visible = true;
                TextBox11.Visible = true;
                TextBox23.Visible = true;
                TextBox24.Visible = true;
                Label19.Visible = true;
                Label20.Visible = true;
                Label21.Visible = true;
                Label22.Visible = true;
                Label23.Visible = true;
                Label24.Visible = true;
                Label25.Visible = true;
                Label26.Visible = true;
                Button18.Visible = true;
                Label27.Visible = true;
                TextBox25.Visible = true;
                Button19.Visible = true;
                Button20.Visible = true;
                Label28.Visible = true;
                Label29.Visible = true;
                Label30.Visible = true;
                Label31.Visible = true;
                TextBox26.Visible = true;
                TextBox27.Visible = true;
                TextBox28.Visible = true;
                TextBox29.Visible = true;
                Button21.Visible = true;
            }
        }
        protected void SignO(object sender, EventArgs e)
        {
            Session["email"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void ListE(object sender, EventArgs e)
        {
            TextBox1.Visible = true;
            Button5.Visible = true;
            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            try
            {
                SqlDataAdapter dat = new SqlDataAdapter("SELECT User_.ID, User_.first_name,User_.middle_name, User_.last_name FROM User_, Employer, Review_Profile WHERE User_.ID = Employer.ID AND User_.ID = Review_Profile.employer_id ", conn);
                DataTable dtb = new DataTable();
                dat.Fill(dtb);
                dtv0.DataSource = dtb;
                dtv0.DataBind();
                dtv0.Visible = true;
                Label2.Visible = true;
            }
            catch { }

        }

        protected void Uprofile(object sender, EventArgs e)
        {

            count++;
            if (count % 2 == 1)
            {
                dtv.Visible = false;
            }
            else
            {
                dtv.Visible = true;
                string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlDataAdapter dat = new SqlDataAdapter("SELECT * FROM User_ WHERE email = '" + Label1.Text + "'", conn);
                DataTable dtb = new DataTable();
                dat.Fill(dtb);
                dtv.DataSource = dtb;
                dtv.DataBind();
            }
        }

        protected void DeleteB(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            if (Session["id"] != null)
            {

                int x = (int)Session["id"];

                SqlCommand cmd = new SqlCommand("DELETE FROM User_ WHERE User_.ID = " + x + "", conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (Label1.Text != "No account !")
                    Response.Write("Your account has been deleted successfully !");
            }
            if (dtv.Visible == true)
            {
                dtv.Visible = false;
            }
            Label1.Text = "No account !";
            Button1.Visible = false;
            Button3.Visible = false;
        }

        protected void SearchB(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            try
            {
                SqlDataAdapter dat = new SqlDataAdapter("SELECT User_.ID, User_.first_name,User_.middle_name, User_.last_name FROM User_, Employer, Review_Profile WHERE User_.ID = Employer.ID AND User_.ID = Review_Profile.employer_id AND User_.ID = " + TextBox1.Text + "", conn);
                DataTable dtb = new DataTable();
                dat.Fill(dtb);
                dtv0.DataSource = dtb;
                dtv0.DataBind();
                dtv0.Visible = true;
                Label2.Visible = true;

                SqlDataAdapter dat2 = new SqlDataAdapter("SELECT Review_Profile.employer_id, Review_Profile.status_ FROM Review_Profile WHERE Review_Profile.employer_id = " + TextBox1.Text + "", conn);
                DataTable dtb2 = new DataTable();
                dat2.Fill(dtb2);
                dtv1.DataSource = dtb2;
                dtv1.DataBind();
                dtv1.Visible = true;

                Label4.Visible = true;
                Button6.Visible = true;
                Button7.Visible = true;
            }
            catch
            {
                Response.Write("Invalid ID");
            }

        }

        protected void TrueB(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("UPDATE Review_Profile SET status_ = '1' WHERE Review_Profile.employer_id = " + TextBox1.Text + "", conn);
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                Response.Write("Status is now true !");
            }
            catch
            {
                Response.Write("Status is already true !");
            }
        }

        protected void FalseB(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("UPDATE Review_Profile SET status_ = '0' WHERE Review_Profile.employer_id = " + TextBox1.Text + "", conn);
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                Response.Write("Status is now false !");
            }
            catch
            {
                Response.Write("Status is already false !");
            }
        }

        protected void ShowjobsB(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            try
            {
                SqlDataAdapter dat0 = new SqlDataAdapter("SELECT * FROM Job j", conn);
                DataTable dtb0 = new DataTable();
                dat0.Fill(dtb0);
                dtv2.DataSource = dtb0;
                dtv2.DataBind();
                dtv2.Visible = true;
            }
            catch { }
            conn.Close();
            Label5.Visible = true;
        }

        protected void facrepB(object sender, EventArgs e)
        {
            Label6.Visible = true;
            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            try
            {
                SqlDataAdapter dat0 = new SqlDataAdapter("SELECT f.ID, f.faculty, u.first_name, u.last_name FROM Faculty_Representative f, User_ u WHERE f.ID = u.ID", conn);
                DataTable dtb0 = new DataTable();
                dat0.Fill(dtb0);
                dtv3.DataSource = dtb0;
                dtv3.DataBind();
                dtv3.Visible = true;
            }
            catch { }
            conn.Close();
            dtv3.Visible = true;

        }

        protected void ShowIIB(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            try
            {
                SqlDataAdapter dat0 = new SqlDataAdapter("SELECT * FROM Industrial_Internship", conn);
                DataTable dtb0 = new DataTable();
                dat0.Fill(dtb0);
                dtv4.DataSource = dtb0;
                dtv4.DataBind();
                dtv4.Visible = true;
            }
            catch { }
            conn.Close();

            dtv4.Visible = true;
        }

        protected void SearchIIB(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            try
            {
                SqlDataAdapter dat0 = new SqlDataAdapter("SELECT * FROM Industrial_Internship i WHERE i.ID = " + TextBox2.Text + "", conn);
                DataTable dtb0 = new DataTable();
                dat0.Fill(dtb0);
                dtv4.DataSource = dtb0;
                dtv4.DataBind();
                dtv4.Visible = true;
            }
            catch
            {
                Response.Write("Invalid entry");
            }
            conn.Close();

            dtv4.Visible = true;
            Button12.Visible = true;
            Button13.Visible = true;
        }

        protected void TrueB2(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("UPDATE Industrial_Internship SET status_ = '1' WHERE Industrial_Internship.ID = '" + TextBox2.Text + "' ", conn);
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                Response.Write("Status is now true !");
            }
            catch
            {
                Response.Write("Status is already true !");
            }
        }

        protected void FalseB2(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("UPDATE Industrial_Internship SET status_ = '0' WHERE Industrial_Internship.ID = '" + TextBox2.Text + "'", conn);
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                Response.Write("Status is now false !");
            }
            catch
            {
                Response.Write("Status is already false !");
            }
        }

        protected void ShowProfileStatusB(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }


            SqlDataAdapter dat0 = new SqlDataAdapter("SELECT i.status_ FROM Review_Profile i WHERE i.employer_id = (Select u.ID from User_ u where email = '" + Label1.Text + "')", conn);
            DataTable dtb0 = new DataTable();
            dat0.Fill(dtb0);
            dtv5.DataSource = dtb0;
            dtv5.DataBind();
            dtv5.Visible = true;

            conn.Close();
        }

        protected void ShowEmployerJobs(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            try
            {
                SqlDataAdapter dat0 = new SqlDataAdapter("SELECT * FROM Job j WHERE j.employer_id = (Select u.ID from User_ u where email = '" + Label1.Text + "')", conn);
                DataTable dtb0 = new DataTable();
                dat0.Fill(dtb0);
                dtv6.DataSource = dtb0;
                dtv6.DataBind();
                dtv6.Visible = true;
            }
            catch { }
            conn.Close();
        }

        protected void UpdateB(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("UPDATE Employer SET Employer.company_name = '" + TextBox12.Text + "', Employer.address_ = '" + TextBox13.Text + "', Employer.phone_number =  '" + TextBox14.Text + "', Employer.fax = '" + TextBox15.Text + "', Employer.website = '" + TextBox16.Text + "', Employer.type_of_business = '" + TextBox17.Text + "', Employer.establishment_year = '" + TextBox18.Text + "', Employer.country_of_origin = '" + TextBox19.Text + "', Employer.industry = '" + TextBox20.Text + "', Employer.number_of_current_employees = '" + TextBox21.Text + "', Employer.products = '" + TextBox22.Text + "' WHERE Employer.ID = (Select u.ID from User_ u where email = '" + Label1.Text + "')", conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                Response.Write("Updated !");
            }
            catch
            {
                Response.Write("Wrong datatype entered !");
            }
        }

        protected void EditB(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("UPDATE Student SET Student.GIU_ID = '" + TextBox8.Text + "', Student.birth_date = '" + TextBox7.Text + "', Student.semester = '" + TextBox9.Text + "', Student.faculty = '" + TextBox23.Text + "', Student.major = '" + TextBox10.Text + "', Student.GPA = '" + TextBox11.Text + "', Student.address_ = '" + TextBox24.Text + "'  WHERE Student.ID = (Select u.ID from User_ u where email = '" + Label1.Text + "')", conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                Response.Write("Updated !");
            }
            catch
            {
                Response.Write("Wrong datatype entered !");
            }
        }

        protected void savePhone(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("Insert into Student_phoneNumber (ID,number) Values((Select u.ID from User_ u where email = '" + Label1.Text + "'),'"+TextBox6.Text+"')", conn);
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                Response.Write("Saved !");
            }
            catch
            {
                Response.Write("This phone number already exists !");
            }
        }

        protected void apply(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT j.visibility from Job j where j.ID = '" + TextBox25.Text + "' AND j.visibility = '1'", conn);
            SqlDataReader dr4 = cmd.ExecuteReader();
            if (dr4.HasRows)
            {
                conn.Close();
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd2 = new SqlCommand("INSERT INTO Apply_ (student_ID,job_ID) VALUES ((Select u.ID from User_ u where email = '" + Label1.Text + "'), '" + TextBox25.Text + "')", conn);
                SqlDataReader dr5 = cmd2.ExecuteReader();
                Response.Write("Successfully applied for the job !");
                conn.Close();
            }
            else
            {
                Response.Write("Invalid Job ID !");
            }
        }

        protected void showappStat(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlDataAdapter dat0 = new SqlDataAdapter("SELECT p.job_ID, p.application_status FROM Apply_ p WHERE p.student_ID = (Select u.ID from User_ u where email = '" + Label1.Text + "')", conn);
            DataTable dtb0 = new DataTable();
            dat0.Fill(dtb0);
            dtv7.DataSource = dtb0;
            dtv7.DataBind();
            dtv7.Visible = true;
        }

        protected void addRep(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("INSERT INTO Progress_report (student_id, date_, numeric_state, evaluation, description_) VALUES ((Select u.ID from User_ u where email = '" + Label1.Text + "'), '" + TextBox26.Text + "', '" + TextBox27.Text + "', '" + TextBox28.Text + "', '" + TextBox29.Text + "')", conn);
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                Response.Write("Saved !");
            }
            catch
            {
                Response.Write("Incorrect type entered !");
            }
        }
    }
}

