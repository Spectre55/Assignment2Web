using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dnd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        
        if (fileUpload.HasFile)
        {
            try
            {
              //  string filename = Path.GetFileName(fileUpload.FileName);
               // fileUpload.SaveAs(Server.MapPath("~/") + filename);
              //  StatusLabel.Text = "Upload status: File uploaded!";
            }
            catch (Exception ex)
            {
                //StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
    }
}