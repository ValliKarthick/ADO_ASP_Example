using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace ADO_ASP_Example
{
    public partial class InsertMovies : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MovieDetailsConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadMoviesUsingAdo();
            //LoadMovies();
            //LoadMoviesUsingList();
        }
        private void LoadMoviesUsingAdo()
        {
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string querystring = "Select * from MovieDetail";
            SqlCommand sqlCommand = new SqlCommand(querystring, sqlConnection);
            try
            {
                sqlConnection.Open();
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                gv_Movies.DataSource = sqlDataReader;
                gv_Movies.DataBind();
            }
            catch (SqlException sqlException)
            {
                lblConfirmation.Text = sqlException.ToString();
            }
            finally
            {
                sqlCommand.Dispose();
                sqlConnection.Close();
                sqlConnection.Dispose();
            }
        }
        private void LoadMoviesUsingList()
        {
            List<MovieModel> moviesList = new List<MovieModel>();
            MovieModel movie = new MovieModel();
            movie.MovieId = 1;
            movie.Name = "ABC";
            movie.Genre = "Humour";
            moviesList.Add(movie);
            gv_Movies.DataSource = moviesList;
            gv_Movies.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {

            SqlConnection sqlConnection = new SqlConnection(connectionString);
            string query = "INSERT INTO MovieDetail (MovieId,MovieName,Genre) VALUES(@movieID,@movieName,@genre)";

            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@movieID", txtMovieId.Text);
            sqlCommand.Parameters.AddWithValue("@movieName", txtMovieName.Text);
            sqlCommand.Parameters.AddWithValue("@genre", txtGenre.Text);

            try
            {
                sqlConnection.Open();
                sqlCommand.ExecuteNonQuery();
                lblConfirmation.Text = "Movie Added to Database Successfully..!";
                LoadMoviesUsingAdo();
            }
            catch (SqlException sqlException)
            {
                lblConfirmation.Text = sqlException.ToString();
            }
            finally
            {
                sqlCommand.Dispose();
                sqlConnection.Close();
                sqlConnection.Dispose();
            }
        }
    }
}