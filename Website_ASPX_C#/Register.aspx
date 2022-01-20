<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TryWeb.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration form</title>
    <style>
    .backimg{
        background-image:url('backgroundd.png');
        width:auto;
        height:878px;
    }
    </style>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2 {
            font-size: large;
            color: #FFC453;
        }
        .auto-style3 {
            color: #FFC453;
        }
        .auto-style4 {
            color: #FFC453;
            background-color: #000000;
        }
    </style>
</head>
<body style="background-color: #0E46B3">
    <form id="form1" runat="server">
        <div align ="center" style="height:214px">
        <div>
            <div align ="center" style="height:354px; margin-bottom: 0px;">
            <div style="height: 738px">
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span>
            <br class="auto-style3" />
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span> <span class="auto-style1"><span class="auto-style3">Registration Form:</span><br class="auto-style3" />
            </span>
            <br class="auto-style3" />
            <br class="auto-style3" />
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp; User Type*&nbsp; </span>
            <asp:DropDownList ID="DropDownList1" runat="server"  Width="165px" CssClass="auto-style4">
                <asp:ListItem Text="Student" Value="Student" />
                <asp:ListItem Text="Employer" Value="Employer" />
                <asp:ListItem Text="Admin" Value="Admin" />
                <asp:ListItem Text="Career office coordinator" Value="Career office coordinator" />
                <asp:ListItem Text="Faculty representative" Value="Faculty representative" />
            </asp:DropDownList>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Height="31px" style="color: #FFC453; background-color: #000000" OnClick="Apply" Text="Select" Width="106px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email*&nbsp;
            </span>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First Name&nbsp;
            </span>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Middle Name&nbsp;
            </span>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp; Last Name&nbsp;
            </span>
            <asp:TextBox ID="TextBox5" runat="server" CssClass="auto-style4"></asp:TextBox>
            <br class="auto-style3" />
            <br class="auto-style3" />
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Birth Date&nbsp;
            </span>
            <asp:TextBox ID="TextBox6" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GIU ID&nbsp;
            </span>
            <asp:TextBox ID="TextBox7" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Semester&nbsp;
            </span>
            <asp:TextBox ID="TextBox8" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Faculty&nbsp;
            </span>
            <asp:TextBox ID="TextBox9" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Major&nbsp;
            </span>
            <asp:TextBox ID="TextBox15" runat="server" CssClass="auto-style4"></asp:TextBox>
            <br class="auto-style3" />
            <br class="auto-style3" />
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GPA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span>
            <asp:TextBox ID="TextBox10" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Address&nbsp;
            </span>
            <asp:TextBox ID="TextBox11" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp; Company Name&nbsp;
            </span>
            <asp:TextBox ID="TextBox12" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Company Phone&nbsp;
            </span>
            <asp:TextBox ID="TextBox13" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fax&nbsp;
            </span>
            <asp:TextBox ID="TextBox14" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span>
            <br class="auto-style3" />
            <br class="auto-style3" />
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span>
            <br class="auto-style3" />
            <br class="auto-style3" />
                <span class="auto-style3">&nbsp;&nbsp; </span> <span class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Additional company details:</span><br class="auto-style3" />
            <br class="auto-style3" />
            <br class="auto-style3" />
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Company Website&nbsp; </span> <asp:TextBox ID="TextBox16" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Type of Business &nbsp;
            </span>
            <asp:TextBox ID="TextBox17" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Establishment Year&nbsp;
            </span>
            <asp:TextBox ID="TextBox18" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Origin Country&nbsp;
            </span>
            <asp:TextBox ID="TextBox19" runat="server" CssClass="auto-style4"></asp:TextBox>
&nbsp;<br class="auto-style3" />
                <br class="auto-style3" />
                <span class="auto-style3">Industry&nbsp; </span> <asp:TextBox ID="TextBox20" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; Number of Current Employees&nbsp;
            </span>
            <asp:TextBox ID="TextBox21" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Products Services&nbsp;&nbsp;
            </span>
            <asp:TextBox ID="TextBox22" runat="server" CssClass="auto-style4"></asp:TextBox>
                <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span>
            <br class="auto-style3" />
            <br class="auto-style3" />
            <br class="auto-style3" />
                <span class="auto-style3">
            <asp:Button ID="Register" runat="server" OnClick="Register_Click" Text="Register" Height="39px" Width="151px" CssClass="auto-style4" />
                </span>
            <br class="auto-style4" />
            <br class="auto-style3" />
                <span class="auto-style3">Already registered?</span><br class="auto-style3" />
            <br class="auto-style3" />
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="LoginB" style="margin-top: 0px; background-color: #000000;" Width="163px" Height="44px" CssClass="auto-style3" />
                <br class="auto-style3" />
                <br class="auto-style3" />
                <br class="auto-style3" />
                <span class="auto-style3">Note: Fields noted with * are MANDATORY</span></div>
                </div>
                    </div>
                </div>
        
    </form>
</body>
</html>
