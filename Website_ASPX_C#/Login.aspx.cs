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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void homeB(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx", true);
        }

        protected void login(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if(conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
     
            String em = email.Text;
            String pass = password.Text;
            
            SqlCommand getId = new SqlCommand("getId", conn);
            getId.CommandType = CommandType.StoredProcedure;
       
            getId.Parameters.Add(new SqlParameter("@email", em));
            SqlParameter ids = getId.Parameters.Add("@id", SqlDbType.Int);
            ids.Direction = ParameterDirection.Output;
            getId.ExecuteNonQuery();

            SqlCommand cmd = new SqlCommand("select * from User_ where User_.email = '"+email.Text+"' AND User_.password_= '"+password.Text+"'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.HasRows)
            {
                while(dr.Read())
                {

                    Session["email"] = em;
                    int r = (int)ids.Value;
                    Session["id"] = r;
                    Response.Redirect("Profile.aspx", true);

                }
            }
            else
            {
                Response.Write("Invalid credentials");
                Label1.Text = "Invalid credentials";
            }

        }
        protected void Signup(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx", true);
        }
    }
}