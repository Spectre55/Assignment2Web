using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (!IsPostBack) // If this is the 1st time the page has been called
        {
            genTableSelect();

            // yearChoice.DataSource = Enumerable.Range(2014, 3);
            // yearChoice.DataBind();

            courseChoice.DataBind();
            genreChoice.DataBind();
            platformChoice.DataBind();
            yearChoice.DataBind();

            yearChoice.Items.Insert(0, new ListItem("All Years", "-1"));
            genreChoice.Items.Insert(0, new ListItem("All Genres", "-1"));

            platformChoice.Items.Insert(0, new ListItem("All Platforms", "-1"));
            courseChoice.Items.Insert(0, new ListItem("All Courses", "-1"));


            /*        gameTableDataSource.DataBind();
                    gameTableDataSource.SelectParameters.Add("course", DbType.Int32 ,courseChoice.SelectedValue);
                 //   gameTableDataSource.SelectParameters.Add("genre", DbType.Int32, genreChoice.SelectedValue);
                    gameTableDataSource.SelectParameters.Add("platform", DbType.Decimal, platformChoice.SelectedValue);
                    gameTableDataSource.SelectParameters.Add("yr", DbType.Decimal, yearChoice.SelectedValue);
              */
      //this one gameTableDataSource.SelectCommand = genTableSelect();
        }
 
    }


    private void genTableSelect()
    {
        string s = "SELECT distinct Games.id, Games.gameName, Games.icon FROM Games inner JOIN GamePlatforms ON Games.id = GamePlatforms.gameId inner JOIN GameGenresON Games.id = GameGenres.gameId WHERE(1 = 1)"
        ; String str = "SELECT distinct Games.id, Games.gameName, Games.icon " +
            "FROM Games INNER JOIN GamePlatforms ON Games.id = GamePlatforms.gameId " +
            "INNER JOIN GameGenres ON Games.id = GameGenres.gameId WHERE (1 = 1)";
        if(courseChoice.SelectedValue.ToString() != "-1")
        {
            
            str += " AND (Games.courseId = @course)";
        }
        if (genreChoice.SelectedValue != "-1")
        {

            //gameTableDataSource.SelectParameters.Add("genreid", DbType.Decimal, genreChoice.SelectedValue);
            
            //str += (" AND (GameGenres.genreId = " + genreChoice.SelectedValue + " )" );

            //gameTableDataSource.SelectParameters.Add("genreid", DbType.Decimal, genreChoice.SelectedValue);
            str += " AND (GameGenres.genreId = @genreid)";
            //gameTableDataSource.SelectParameters.AddWithValue("@dovizkur", Convert.ToInt32(txt_DovizKuru.Text));
        }
      //  else
        //    gameTableDataSource.SelectParameters.Add("genreid", DbType.Decimal, "0");



        if (platformChoice.SelectedValue != "-1")
        {
            str += " AND (GamePlatforms.platformId = @platform)";
        }
        if (yearChoice.SelectedValue != "-1")
        {
            str += " AND (Games.yr = @yr)";
        }
        str += ";";
        gameTableDataSource.SelectCommand = str;
        //return s + ";" ;
    }

    protected void search(object sender, EventArgs e)
    {
        // DataSourceSelectArguments args = new DataSourceSelectArguments()                  //gameTableDataSource.SelectParameters;
      //gameTableDataSource.SelectCommand = genTableSelect();
       genTableSelect();
        //gameTableDataSource.Select(new DataSourceSelectArguments());
        //   gameTableDataSource.DataBind();
        //gameTable.DataBind();
    }

    protected void gameIcon_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        Response.Redirect("game.aspx?xax=" + btn.CommandArgument);
    }
}