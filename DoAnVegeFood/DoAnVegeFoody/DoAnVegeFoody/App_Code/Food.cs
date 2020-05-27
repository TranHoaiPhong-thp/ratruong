using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace DoAnVegeFoody.App_Code
{
    public class Food
    {
        private int _Id;
        private string _Name;
        private string _Description;
        private int _Price;
        private int _Price_promo;
        private string _Thumb;
        private string _Img;
        private string _Unit;
        private int _Precent_Promo;
        private int _Rating;
        private int _Sold;
        private int _Point;
        private int _Type;
        private int _Status;
        private string _Username;
        private DateTime _Modified;

        public int Id{ get {   return _Id; } set{_Id = value;}}
        public string Name { get {return _Name; } set{ _Name = value; }}
        public string Description {get{ return _Description; }set{  _Description = value;}}
        public int Price { get { return _Price; } set {  _Price = value; }}
        public int Price_promo {  get{return _Price_promo; }set{ _Price_promo = value;}}
        public string Thumb{    get{  return _Thumb; } set {_Thumb = value; }}
        public string Img{ get {    return _Img;} set { _Img = value;}}
        public string Unit{ get{return _Unit;} set{_Unit = value;}}
        public int Precent_Promo {   get{return _Precent_Promo;} set{ _Precent_Promo = value;}}
        public int Rating { get { return _Rating;}  set{_Rating = value;}}
        public int Sold {get{   return _Sold;} set{ _Sold = value;}}
        public int Point { get{ return _Point;} set{_Point = value;}}
        public int Type{   get{  return _Type; }set { _Type = value;}}
        public int Status{  get{return _Status; }  set{_Status = value;}}
        public string Username{   get{return _Username;}  set{_Username = value;}}
        public DateTime Modified {  get{return _Modified; }   set{_Modified = value;}}

        public bool AddFood()
        {
            String sQuery = "INSERT INTO[dbo].[food] ([name],[description],[price],[price_promo],[thumb],[img],[unit],[percent_promo],[,[sold],[type],[status],[username],[modified]) VALUES(@name,@description,@price,@price_promo,@thumb,@img,@unit,@percent_promo,@rating, @sold, @point, @type, @status,@username, @modified)";

            SqlParameter[] sqlParas =
            {

                new SqlParameter("@name",SqlDbType.NVarChar,50){Value = this.Name},
                new SqlParameter("@description",SqlDbType.Text){Value = this.Description},
                new SqlParameter("@price",SqlDbType.Int){Value = this.Price},
                new SqlParameter("@price_promo",SqlDbType.Int){Value = this.Price_promo},
                new SqlParameter("@thumb",SqlDbType.VarChar,255){Value = this.Thumb},
                new SqlParameter("@img",SqlDbType.VarChar,255){Value = this.Img},
                new SqlParameter("@unit",SqlDbType.NVarChar,10){Value = this.Unit},
                new SqlParameter("@percent_promo",SqlDbType.Int){Value = this.Precent_Promo},
                new SqlParameter("@rating",SqlDbType.Int){Value = this.Rating},
                new SqlParameter("@sold",SqlDbType.Int){Value = this.Sold},
                new SqlParameter("@point",SqlDbType.Int){Value = this.Point},
                new SqlParameter("@type",SqlDbType.Int){Value = this.Type},
                new SqlParameter("@status",SqlDbType.Int){Value = this.Status},
                new SqlParameter("@username",SqlDbType.VarChar,50){Value = this.Username},
                new SqlParameter("@modified",SqlDbType.DateTime){Value = this.Modified} 
            };
                

                return DataProvider.executeNonQuery(sQuery, sqlParas);

        }
        public bool AddFoods()
        {
            string sQuery = "INSERT INTO [dbo].[food]([name],[description],[price],[price_promo],[thumb],[img],[unit],[percent_promo],[rating],[sold],[point],[type],[status],[username],[modified]) VALUES(@name,@description,@price,@price_promo,@thumb,@img,@unit,@percent_promo,@rating,@sold,@point,@type,@status,@username,GETDATE())";
            SqlParameter[] pars =
            {
                new SqlParameter("@name",SqlDbType.NVarChar,50){Value=this.Name},
                new SqlParameter("@description",SqlDbType.Text){Value=this.Description},
                new SqlParameter("@price",SqlDbType.Int){Value=this.Price},
                new SqlParameter("@price_promo",SqlDbType.Int){Value=this.Price_promo},
                new SqlParameter("@thumb",SqlDbType.VarChar,255){Value=this.Thumb},
                new SqlParameter("@img",SqlDbType.VarChar,255){Value=this.Img},
                new SqlParameter("@unit",SqlDbType.NVarChar,10){Value=this.Unit},
                new SqlParameter("@percent_promo",SqlDbType.Int){Value=this.Precent_Promo},
                new SqlParameter("@rating",SqlDbType.Int){Value=this.Rating},
                new SqlParameter("@sold",SqlDbType.Int){Value=this.Sold},
                new SqlParameter("@point",SqlDbType.Int){Value=this.Point},
                new SqlParameter("@type",SqlDbType.Int){Value=this.Type},
                new SqlParameter("@status",SqlDbType.Int){Value=this.Status},
                new SqlParameter("@username",SqlDbType.VarChar,50){Value=this.Username},
            };
            return DataProvider.executeNonQuery(sQuery, pars);
        }
        public bool UpdateFood()
        {
            String sQuery = "UPDATE [dbo].[food]SET [name] = @name,[description] = @description,[price] = @price ,[price_promo] = price_promo ,[thumb] = @thumb ,[img] = @img ,[unit] = @unit ,[percent_promo] = @percent_promo ,[rating] = @rating ,[sold] = @sold ,[point] = @point ,[type] = @type ,[status] = @status ,[username] = @username ,[modified] = @modified WHERE [name] = @name";

            SqlParameter[] sqlParas =
            {

                new SqlParameter("@name",SqlDbType.NVarChar,50){Value = this.Name},
                new SqlParameter("@description",SqlDbType.Text){Value = this.Description},
                new SqlParameter("@price",SqlDbType.Int){Value = this.Price},
                new SqlParameter("@price_promo",SqlDbType.Int){Value = this.Price_promo},
                new SqlParameter("@thumb",SqlDbType.VarChar,255){Value = this.Thumb},
                new SqlParameter("@img",SqlDbType.VarChar,255){Value = this.Img},
                new SqlParameter("@unit",SqlDbType.NVarChar,10){Value = this.Unit},
                new SqlParameter("@percent_promo",SqlDbType.Int){Value = this.Precent_Promo},
                new SqlParameter("@rating",SqlDbType.Int){Value = this.Rating},
                new SqlParameter("@sold",SqlDbType.Int){Value = this.Sold},
                new SqlParameter("@point",SqlDbType.Int){Value = this.Point},
                new SqlParameter("@type",SqlDbType.Int){Value = this.Type},
                new SqlParameter("@status",SqlDbType.Int){Value = this.Status},
                new SqlParameter("@username",SqlDbType.VarChar,50){Value = this.Username},
                new SqlParameter("@modified",SqlDbType.DateTime){Value = this.Modified} };


            return DataProvider.executeNonQuery(sQuery, sqlParas);
        }
        public Food(String name, String dec, int pri, int pri_promo, String thu, String im, String uni, int per_promo, int rat, int sol, int poin, int typ, int stt, String user, DateTime modified) 
        {
                Name = name;
                Description = dec;
                Price = pri;
                Price_promo = pri_promo;
                Thumb = thu;
                Img = im;
                Unit = uni;
                Precent_Promo = per_promo;
                Rating = rat;
                Point = poin;
                Type = typ;
                Status = stt;
                Username = user;
                Modified = modified;
        }
    }
}
