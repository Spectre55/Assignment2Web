using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminDev : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void EditButton_Click(object sender, EventArgs e)
    {
        Debug.WriteLine("AAAACCCCCCCCCCCCCCCCCCCAAAAAAAAA");
        FileUpload FileUploadControl = (FileUpload) ListView1.EditItem.FindControl("FileUploadControl");
        if ( FileUploadControl.HasFile)
        {
            Debug.WriteLine("AAAAAAAAAAAAAAAAAAAAAAAAAA");

            Label StatusLabel = (Label)ListView1.EditItem.FindControl("StatusLabel");
            try
            {
                if (FileUploadControl.PostedFile.ContentType.ToLower() == "image/jpg" || FileUploadControl.PostedFile.ContentType.ToLower() == "image/png")
                {
                    if (FileUploadControl.PostedFile.ContentLength < 102400)
                    {
                        Debug.WriteLine("bbbbbbbbbbbbbbbbbbbbbAAAAAAAA");
                        string filename = Path.GetFileName(FileUploadControl.FileName);
                        string savePath = Server.MapPath("/images/devAvatars/") + filename;            
                        FileUploadControl.SaveAs(savePath);
                        
                        Button button = (Button)sender;

                        if (button.CommandName == "Update")
                        {
                            HiddenField picHiddenField = (HiddenField) ListView1.EditItem.FindControl("picHiddenField");
                            if (picHiddenField != null)
                                picHiddenField.Value = savePath;
                        }
                        else
                        {
                            HiddenField picHiddenField = (HiddenField)ListView1.InsertItem.FindControl("picHiddenField");
                            if(picHiddenField != null)
                                picHiddenField.Value = savePath;
                        }

                        StatusLabel.Text = "Upload status: File uploaded!";
                    }
                    else
                        StatusLabel.Text = "Upload status: The file has to be less than 100 kb!";
                }
                else
                    StatusLabel.Text = "Upload status: Only JPEG files are accepted!";
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
    }
}