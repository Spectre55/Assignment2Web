using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminView : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        //HiddenField groupEditDropDownList = (HiddenField)ListView1.EditItem.FindControl("hiddenddlselect");

        // DropDownList groupEditDropDownList = (DropDownList)ListView1.FindControl("groupInsertDropDownList");
        if (!IsPostBack)
        {
            //DropDownList groupInsertDropDownList = (DropDownList)ListView1.InsertItem.FindControl("groupInsertDropDownList");

            // DropDownList courseEditDropDownList = (DropDownList)ListView1.FindControl("courseEditDropDownList");
            //    DropDownList courseInsertDropDownList = (DropDownList)ListView1.FindControl("EditDropDownList1");
            /*  if (groupEditDropDownList != null)
                  {
                      groupEditDropDownList.DataBind();
                     // ((DropDownList) groupEditDropDownList).Items.Insert(0, new ListItem("NULL", ""));
                  }
              
            if (groupInsertDropDownList != null)
            {
                groupInsertDropDownList.DataBind();
                groupInsertDropDownList.Items.Insert(0, new ListItem("NULL", ""));
            }
            /*    if (courseEditDropDownList != null)
                {
                    courseEditDropDownList.DataBind();
                    courseEditDropDownList.Items.Insert(0, new ListItem("NULL", ""));
                }
                if (courseInsertDropDownList != null)
                {
                courseInsertDropDownList.DataBind();
                courseInsertDropDownList.Items.Insert(0, new ListItem("NULL", ""));
                }

            if (!IsPostBack) // If this is the 1st time the page has been called
            {
                groupInsertDropDownList.DataBind();
                groupInsertDropDownList.Items.Insert(0, new ListItem("NULL", ""));
            }
       */
        }
    }


    protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        DropDownList courses = (DropDownList)(sender);//.Items[e.ItemIndex].FindControl("EditCheckBoxList1");
        //DropDownList courseEditDropDownList = ((DropDownList)ListView1.InsertItem.FindControl("courseEditDropDownList"));

        ///courseEditDropDownList.DataBind();
       // courseEditDropDownList.Items.Insert(0, new ListItem("NULL", ""));
        if (courses != null && !IsPostBack)
        {
            GameDataSource.UpdateParameters["courseid"].DefaultValue = courses.SelectedValue;
        }
    }

    protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        DropDownList courses = (DropDownList)(sender);//.Items[e.ItemIndex].FindControl("EditCheckBoxList1");
        DropDownList groupInsertDropDownList = ((DropDownList)ListView1.InsertItem.FindControl("groupInsertDropDownList"));

        groupInsertDropDownList.DataBind();
        groupInsertDropDownList.Items.Insert(0, new ListItem("NULL", ""));
        if (courses != null && !IsPostBack)
        {
            GameDataSource.InsertParameters["courseid"].DefaultValue = courses.SelectedValue;
        }
    }
    /*
        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)

        {
            CheckBoxList courses = (CheckBoxList)(sender);//.Items[e.ItemIndex].FindControl("EditCheckBoxList1");
            if (courses != null && !IsPostBack)
            {
                foreach (ListItem item in courses.Items) //Items.Count
                {
                    if (item.Selected)
                    {
                        YrStrList = YrStrList + "'" + listItem.Value + "'" + ",";
                    }
                }
                GameDataSource.UpdateParameters["courseid"].DefaultValue = courses.SelectedValue;
            }
            "UPDATE products SET name = @name";
        }
        */

    protected void UploadFile(object sender, EventArgs e)
    {
      //  string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
        //FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + fileName);
        Response.Redirect(Request.Url.AbsoluteUri);
    }
}