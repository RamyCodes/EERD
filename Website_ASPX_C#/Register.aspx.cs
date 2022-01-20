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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox3.Visible = true; TextBox4.Visible = true; TextBox5.Visible = true;
            TextBox6.Visible = false; TextBox7.Visible = false; TextBox8.Visible = false;
            TextBox9.Visible = false; TextBox10.Visible = false; TextBox11.Visible = false;
            TextBox12.Visible = false; TextBox13.Visible = false; TextBox14.Visible = false;
            TextBox15.Visible = false; TextBox16.Visible = false; TextBox17.Visible = false;
            TextBox18.Visible = false; TextBox19.Visible = false; TextBox20.Visible = false;
            TextBox21.Visible = false; TextBox22.Visible = false;

        }

        protected void Apply(object sender, EventArgs e)
        {
            if (DropDownList1.Text == "Student")
            {
                TextBox3.Visible = true; TextBox4.Visible = true; TextBox5.Visible = true;
                TextBox6.Visible = true; TextBox7.Visible = true; TextBox8.Visible = true;
                TextBox9.Visible = true; TextBox10.Visible = true; TextBox11.Visible = true;
                TextBox15.Visible = true;

            }

            if (DropDownList1.Text == "Employer")
            {
                TextBox12.Visible = true; TextBox11.Visible = true; TextBox14.Visible = true;
                TextBox17.Visible = true; TextBox18.Visible = true; TextBox20.Visible = true;
                TextBox21.Visible = true; TextBox22.Visible = true;

            }

        }

        protected void LoginB(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", true);
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            int result = 1;
            Boolean isValid = false;
            if(TextBox2.Text != "")
            {
                isValid = true;
            }

            if (isValid == true)
            {
                string tableType = DropDownList1.Text;
                string connStr = WebConfigurationManager.ConnectionStrings["Testhere"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
            ;
                //Generates a random password
                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                var stringChars = new char[8];
                var random = new Random();

                for (int i = 0; i < stringChars.Length; i++)
                {
                    stringChars[i] = chars[random.Next(chars.Length)];
                }

                var finalString = new String(stringChars);

                using (var command = new SqlCommand("ReSeed", conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    command.ExecuteNonQuery();
                }

                SqlCommand isUnique = new SqlCommand("isUnique", conn);
                isUnique.CommandType = CommandType.StoredProcedure;
                string email2 = TextBox2.Text;
                isUnique.Parameters.Add(new SqlParameter("@email", email2));
                SqlParameter uni = isUnique.Parameters.Add("@bit", SqlDbType.Int);
                uni.Direction = ParameterDirection.Output;
                isUnique.ExecuteNonQuery();
                int uniQ = (int)uni.Value;

                if (uniQ == 0)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO User_ VALUES(@first_name, @middle_name, @last_name, @email, @password)", conn);
                    cmd.Parameters.AddWithValue("@first_name", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@middle_name", TextBox4.Text);
                    cmd.Parameters.AddWithValue("@last_name", TextBox5.Text);
                    cmd.Parameters.AddWithValue("@email", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@password", finalString);

                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch
                    {
                        Response.Write("This email is already registered, try to log in !");
                    }

                    SqlCommand getId = new SqlCommand("getId", conn);
                    getId.CommandType = CommandType.StoredProcedure;
                    string email = TextBox2.Text;
                    getId.Parameters.Add(new SqlParameter("@email", email));
                    SqlParameter ids = getId.Parameters.Add("@id", SqlDbType.Int);
                    ids.Direction = ParameterDirection.Output;
                    getId.ExecuteNonQuery();
                    int r = (int)ids.Value;
                    
                    //User has 2 options either you fill in all the required student info OR only the email during registration
                    // NOTE that you can always edit the information later on so it is not a problem !

                    if (tableType == "Student")
                    {


                        SqlCommand cmd1 = new SqlCommand("INSERT INTO Student(ID, GIU_ID,first_name,middle_name,last_name,birth_date,semester,faculty,major,GPA,address_) VALUES ("+r+", @GIU_id, @first_name, @middle_name, @last_name, @birth_date, @semester, @faculty, @major, @gpa, @adress)", conn);
                        cmd1.Parameters.AddWithValue("@first_name", TextBox3.Text);
                        cmd1.Parameters.AddWithValue("@middle_name", TextBox4.Text);
                        cmd1.Parameters.AddWithValue("@last_name", TextBox5.Text);
                        cmd1.Parameters.AddWithValue("@user_id", r);
                        cmd1.Parameters.AddWithValue("@GIU_id", TextBox7.Text);
                        cmd1.Parameters.AddWithValue("@birth_date", TextBox6.Text);
                        cmd1.Parameters.AddWithValue("@semester", TextBox8.Text);
                        cmd1.Parameters.AddWithValue("@faculty", TextBox9.Text);
                        cmd1.Parameters.AddWithValue("@major", TextBox15.Text);
                        cmd1.Parameters.AddWithValue("@gpa", TextBox10.Text);
                        cmd1.Parameters.AddWithValue("@adress", TextBox11.Text);



                        try
                        {
                            cmd1.ExecuteNonQuery();
                        }
                        catch
                        {
                            SqlCommand cmdS = new SqlCommand("Insert into Student(ID) Values (@user_id)", conn);
                            cmdS.Parameters.AddWithValue("@user_id", r);

                            cmdS.ExecuteNonQuery();
                        }
                    }

                    if (tableType == "Employer")
                    {
                        SqlCommand cmd2 = new SqlCommand("INSERT INTO Employer(company_name, address_, fax, type_of_business, establishment_year, industry,number_of_current_employees, products) VALUES (@company_name,@adress,@fax,@type_of_business,@establishment_year,@industry,@n_current_employees,@products_services)", conn);
                        cmd2.Parameters.AddWithValue("@user_id", r);
                        cmd2.Parameters.AddWithValue("@company_name", TextBox12.Text);
                        cmd2.Parameters.AddWithValue("@adress", TextBox11.Text);
                        cmd2.Parameters.AddWithValue("@fax", TextBox14.Text);
                        cmd2.Parameters.AddWithValue("@type_of_business", TextBox17.Text);
                        cmd2.Parameters.AddWithValue("@establishment_year", TextBox18.Text);
                        cmd2.Parameters.AddWithValue("@industry", TextBox20.Text);
                        cmd2.Parameters.AddWithValue("@n_current_employees", TextBox21.Text);
                        cmd2.Parameters.AddWithValue("@products_services", TextBox22.Text);

                        SqlCommand cmdS = new SqlCommand("Insert into Employer(ID) Values (@user_id)", conn);
                        cmdS.Parameters.AddWithValue("@user_id", r);
                        cmdS.ExecuteNonQuery();

                        try
                        {
                            cmd2.ExecuteNonQuery();
                        }
                        catch
                        {

                        }
                    }
                    if (tableType == "Admin")
                    {
                        SqlCommand cmd3 = new SqlCommand("INSERT INTO Admin_ VALUES (@user_id)", conn);
                        cmd3.Parameters.AddWithValue("@user_id", r);

                        cmd3.ExecuteNonQuery();

                    }
                    if (tableType == "Career office coordinator")
                    {
                        SqlCommand cmd4 = new SqlCommand("INSERT INTO Career_Office_Coordinator VALUES (@user_id)", conn);
                        cmd4.Parameters.AddWithValue("@user_id", r);

                        cmd4.ExecuteNonQuery();

                    }
                    if (tableType == "Faculty representative")
                    {
                        SqlCommand cmd5 = new SqlCommand("INSERT INTO Faculty_representative (ID) VALUES (@user_id)", conn);
                        cmd5.Parameters.AddWithValue("@user_id", r);

                        cmd5.ExecuteNonQuery();
                    }

                    result++;
                    conn.Close();

                    Response.Write("Registered successfully !  " + "Your password is: " + finalString);
                    Session["id"] = r;
                    Session["email"] = TextBox2.Text;
                    Response.Redirect("Profile.aspx", true);

                }
                
                else
                {
                    Response.Write("This email is already registered, try to log in !");
                }

            }
            else
            {
                Response.Write("Please enter the information marked with *");
            }
        }
    }
}