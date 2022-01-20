<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TryWeb.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
    .backimg{
        background-image:url('backgroundd.png');
        width:auto;
        height:3800px;
    }
    </style>
    <style type="text/css">
        .newStyle1 {
            font-family: "open Sans";
        }
        .newStyle2 {
            font-family: "Open Sans";
        }
        .newStyle3 {
            font-family: "Open Sans";
        }
        .auto-style2 {
            font-family: "Open Sans";
            color: #FFC453;
            font-size: x-large;
        }
        .auto-style3 {
            color: #FFC453;
            font-size: x-large;
        }
        .auto-style4 {
            color: #FFC453;
            background-color: #000000;
        }
    </style>
</head>
<body style="width: 2100px; height: 1039px">
    <form id="form1" runat="server">
        <div align ="center" style="height:654px">
            <div class =" backimg">
                <div style="width: auto; margin: 0px auto;">
        <asp:Panel ID="Panel1" runat="server" Height="654px" style="margin-bottom: 499px">
            <br />
            <br />
            &nbsp;<span class="newStyle3"><br /> &nbsp; &nbsp;<span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Currently logged in as :&nbsp; </span></span>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style2" Text="No account !"></asp:Label>
            <span class="newStyle3">
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;<asp:Button ID="Button15" runat="server" OnClick="ShowEmployerJobs" style="color: #FFC453; background-color: #000000" Text="Show Employer Jobs" />
            &nbsp;
            <asp:Button ID="Button14" runat="server" OnClick="ShowProfileStatusB" style="color: #FFC453; background-color: #000000" Text="Show Profile Status" />
            &nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" OnClick="ListE" style="color: #FFC453; background-color: #000000" Text="List employers" />
            &nbsp;&nbsp;&nbsp; </span>
            <asp:Button ID="Button1" runat="server" OnClick="Uprofile" Text="Show Profile" style="color: #FFC453; background-color: #000000" />
            <span class="newStyle3">&nbsp;&nbsp;&nbsp;&nbsp; </span>
            <asp:Button ID="Button2" runat="server" Onclick="SignO" Text="Sign out" style="color: #FFC453; background-color: #000000" />
            <span class="newStyle3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
            <asp:Button ID="Button3" runat="server" Onclick="DeleteB" Text="Delete account" style="color: #FFC453; background-color: #000000" />
            <span class="newStyle3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button8" runat="server" style="color: #FFC453; background-color: #000000" Text="Show jobs" OnClick="ShowjobsB" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button9" runat="server" Text="Show faculty representatives" OnClick="facrepB" style="color: #FFC453; background-color: #000000" Width="227px" />
            &nbsp;&nbsp;&nbsp;<br />
            <br />
            <asp:Button ID="Button11" runat="server" OnClick="ShowIIB" style="color: #FFC453; background-color: #000000" Text="Show industrial internships" Width="221px" />
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label7" runat="server" style="font-size: x-large; color: #FFC453" Text="Search industrial internship by id"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Button ID="Button10" runat="server" OnClick="SearchIIB" style="color: #EFB84E; background-color: #000000" Text="Search" />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
            <asp:Panel ID="Panel2" runat="server" Height="532px" style="margin-left: 49px">
            <asp:GridView ID="dtv" runat="server" AutoGenerateColumns="false" Height="255px" style="text-align: center; color: #FFC453; background-color: #0E46B3;" Width="586px">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="first_name" HeaderText="First name" />
                    <asp:BoundField DataField="middle_name" HeaderText="Middle name" />
                    <asp:BoundField DataField="last_name" HeaderText="Last name" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="password_" HeaderText="Password" />
                </Columns>
            </asp:GridView>
                <br />
                <asp:GridView ID="dtv4" runat="server" AutoGenerateColumns="True" CssClass="newStyle2" Height="131px" style="color: #FFC453; background-color: #0E40A7; font-size: medium;" Width="1345px">
                </asp:GridView>
                <br />
                <br />
                <asp:Button ID="Button12" runat="server" Height="30px" OnClick="TrueB2" style="color: #FFC453; background-color: #000000" Text="True" Width="94px" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button13" runat="server" Height="30px" OnClick="FalseB2" style="color: #FFC453; background-color: #000000" Text="False" Width="94px" />
                <br />
                <asp:Label ID="Label2" runat="server" style="font-size: x-large; color: #FFC453" Text="List of all employers"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" style="font-size: x-large; color: #FFC453" Text="Search by id"></asp:Label>
                &nbsp;
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <span class="newStyle3">
                <asp:Button ID="Button5" runat="server" OnClick="SearchB" style="color: #EFB84E; background-color: #000000" Text="Search" />
                <br />
                </span>
                <br />
                <br />
                <asp:GridView ID="dtv0" runat="server" AutoGenerateColumns="False" CssClass="newStyle2" Height="204px" style="text-align: center; color: #FFC453; background-color: #0E40A7;" Width="476px">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="first_name" HeaderText="First name" />
                        <asp:BoundField DataField="middle_name" HeaderText="Middle name" />
                        <asp:BoundField DataField="last_name" HeaderText="Last name" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <asp:GridView ID="dtv1" runat="server" AutoGenerateColumns="False" CssClass="newStyle2" Height="204px" style="text-align: center; color: #FFC453; background-color: #0E40A7;" Width="476px">
                    <Columns>
                        <asp:BoundField DataField="employer_id" HeaderText="employer_id" />
                        <asp:BoundField DataField="status_" HeaderText="status" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" style="font-size: x-large; color: #FFC453" Text="Set status:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button6" runat="server" style="color: #FFC453; background-color: #000000" Text="True" Height="30px" OnClick="TrueB" Width="94px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button7" runat="server" style="color: #FFC453; background-color: #000000" Text="False" Height="30px" OnClick="FalseB" Width="77px" />
                <br />
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" style="font-size: x-large; color: #FFC453" Text="List of all faculty representatives"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="dtv3" runat="server" AutoGenerateColumns="True" CssClass="newStyle2" Height="131px" style="color: #FFC453; background-color: #0E40A7; font-size: medium;" Width="1345px">
                </asp:GridView>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" style="font-size: x-large; color: #FFC453" Text="List of all the jobs"></asp:Label>
                <br />
                <br />
                <br />
                <asp:GridView ID="dtv2" runat="server" AutoGenerateColumns="True" CssClass="newStyle2" Height="131px" style="color: #FFC453; background-color: #0E40A7; font-size: medium;" Width="1345px">
                </asp:GridView>
                <br />
                <br />
                <br />
                <asp:GridView ID="dtv5" runat="server" AutoGenerateColumns="True" CssClass="newStyle2" Height="131px" style="color: #FFC453; background-color: #0E40A7; font-size: medium;" Width="1345px">
                </asp:GridView>
                <br />
                <asp:Panel ID="Panel3" runat="server" Height="816px">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label19" runat="server" CssClass="auto-style2" Text="Add phone number(s)"></asp:Label>
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="auto-style4"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label20" runat="server" CssClass="auto-style2" Text="Birthdate"></asp:Label>
                    <asp:TextBox ID="TextBox7" runat="server" CssClass="auto-style4"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label21" runat="server" CssClass="auto-style2" Text="GIU ID"></asp:Label>
                    <asp:TextBox ID="TextBox8" runat="server" CssClass="auto-style4"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label22" runat="server" CssClass="auto-style2" Text="Semester"></asp:Label>
                    <asp:TextBox ID="TextBox9" runat="server" CssClass="auto-style4"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label23" runat="server" CssClass="auto-style2" Text="Faculty"></asp:Label>
                    <asp:TextBox ID="TextBox23" runat="server" CssClass="auto-style4"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label24" runat="server" CssClass="auto-style2" Text="Major"></asp:Label>
                    <asp:TextBox ID="TextBox10" runat="server" CssClass="auto-style4"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;<br />
                    <br />
&nbsp;<asp:Label ID="Label25" runat="server" CssClass="auto-style2" Text="GPA"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TextBox11" runat="server" CssClass="auto-style4"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label26" runat="server" CssClass="auto-style2" Text="Address"></asp:Label>
                    <asp:TextBox ID="TextBox24" runat="server" CssClass="auto-style4"></asp:TextBox>
                    &nbsp;<br /> <br />
                    <br />
                    <asp:Button ID="Button18" runat="server" Height="30px" OnClick="savePhone" style="color: #FFC453; background-color: #000000" Text="Save phone" Width="94px" />
                    &nbsp;
                    <asp:Button ID="Button17" runat="server" Height="30px" OnClick="EditB" style="color: #FFC453; background-color: #000000" Text="Edit" Width="94px" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label27" runat="server" CssClass="auto-style2" Text="Apply for a job by id"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TextBox25" runat="server" CssClass="auto-style4"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="Button19" runat="server" Height="30px" OnClick="apply" style="color: #FFC453; background-color: #000000" Text="Apply" Width="94px" />
                    &nbsp;&nbsp;
                    <asp:Button ID="Button20" runat="server" Height="30px" OnClick="showappStat" style="color: #FFC453; background-color: #000000" Text="Show application status" Width="186px" />
                    <br />
                    <br />
                    <asp:GridView ID="dtv7" runat="server" AutoGenerateColumns="True" CssClass="newStyle2" Height="131px" style="color: #FFC453; background-color: #0E40A7; font-size: medium;" Width="1345px">
                    </asp:GridView>
                    <br />
                    <br />
                    <asp:Label ID="Label28" runat="server" CssClass="auto-style2" Text="Date"></asp:Label>
                    &nbsp;
                    <asp:TextBox ID="TextBox26" runat="server" CssClass="auto-style4"></asp:TextBox>
                    &nbsp;
                    <asp:Label ID="Label29" runat="server" CssClass="auto-style2" Text="numeric_state"></asp:Label>
                    &nbsp;
                    <asp:TextBox ID="TextBox27" runat="server" CssClass="auto-style4"></asp:TextBox>
                    &nbsp;<asp:Label ID="Label30" runat="server" CssClass="auto-style2" Text="evaluation"></asp:Label>
                    &nbsp;<asp:TextBox ID="TextBox28" runat="server" CssClass="auto-style4"></asp:TextBox>
                    &nbsp;<br />
                    <br />
                    &nbsp;
                    <asp:Label ID="Label31" runat="server" CssClass="auto-style2" Text="description"></asp:Label>
                    &nbsp;<asp:TextBox ID="TextBox29" runat="server" CssClass="auto-style4"></asp:TextBox>
                    &nbsp;&nbsp; &nbsp;<br />
                    <br />
                    <br />
                    <asp:Button ID="Button21" runat="server" Height="30px" OnClick="addRep" style="color: #FFC453; background-color: #000000" Text="Add report" Width="94px" />
                </asp:Panel>
                <br />
                <br />
                <asp:GridView ID="dtv6" runat="server" AutoGenerateColumns="True" CssClass="newStyle2" Height="131px" style="color: #FFC453; background-color: #0E40A7; font-size: medium;" Width="1345px">
                </asp:GridView>
                <br />
                <br />
                <br />
                <asp:Label ID="Label8" runat="server" CssClass="auto-style2" Text="Company Name"></asp:Label>
                &nbsp;&nbsp;<asp:TextBox ID="TextBox12" runat="server" CssClass="auto-style4"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label9" runat="server" CssClass="auto-style2" Text="Address"></asp:Label>
                &nbsp;&nbsp;<asp:TextBox ID="TextBox13" runat="server" CssClass="auto-style4"></asp:TextBox>
                &nbsp; &nbsp;<asp:Label ID="Label10" runat="server" CssClass="auto-style2" Text="Phone"></asp:Label>
&nbsp;
                <asp:TextBox ID="TextBox14" runat="server" CssClass="auto-style4"></asp:TextBox>
                <br />
                <br />
                &nbsp;<asp:Label ID="Label11" runat="server" CssClass="auto-style2" Text="Fax"></asp:Label>
                &nbsp;
                <asp:TextBox ID="TextBox15" runat="server" CssClass="auto-style4"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label12" runat="server" CssClass="auto-style2" Text="Website"></asp:Label>
                &nbsp;
                <asp:TextBox ID="TextBox16" runat="server" CssClass="auto-style4"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:Label ID="Label13" runat="server" CssClass="auto-style2" Text="Type of business"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox17" runat="server" CssClass="auto-style4"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label14" runat="server" CssClass="auto-style2" Text="Establishment year"></asp:Label>
                &nbsp;
                <asp:TextBox ID="TextBox18" runat="server" CssClass="auto-style4"></asp:TextBox>
                &nbsp;
                <asp:Label ID="Label15" runat="server" CssClass="auto-style2" Text="Country"></asp:Label>
                &nbsp;
                <asp:TextBox ID="TextBox19" runat="server" CssClass="auto-style4"></asp:TextBox>
                &nbsp;
                <asp:Label ID="Label16" runat="server" CssClass="auto-style2" Text="Industry"></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="TextBox20" runat="server" CssClass="auto-style4"></asp:TextBox>
                &nbsp;<asp:Label ID="Label17" runat="server" CssClass="auto-style2" Text="Number of current employees"></asp:Label>
                &nbsp;
                <asp:TextBox ID="TextBox21" runat="server" CssClass="auto-style4"></asp:TextBox>
                &nbsp;<br />
                <br />
                <asp:Label ID="Label18" runat="server" CssClass="auto-style2" Text="Products"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox22" runat="server" CssClass="auto-style4"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button16" runat="server" Height="30px" OnClick="UpdateB" style="color: #FFC453; background-color: #000000" Text="Update" Width="77px" />
            </asp:Panel>
        </asp:Panel>
         </div>
      </div>
    </div>
    </form>
</body>
</html>
