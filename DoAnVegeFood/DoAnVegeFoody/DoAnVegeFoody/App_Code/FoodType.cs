using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace DoAnVegeFoody.App_Code
{
    public class FoodTypes
    {
        private int _Type_Id;
        private string _Type_Name;
        private string _Type_Img;
        private int _Type_Pos;
        private int _Status;
        private string _UserName;
        private DateTime _Modified;

        public int Type_Id
        {
            get
            {
                return _Type_Id;
            }

            set
            {
                _Type_Id = value;
            }
        }

        public string Type_Name
        {
            get
            {
                return _Type_Name;
            }

            set
            {
                _Type_Name = value;
            }
        }

        public string Type_Img
        {
            get
            {
                return _Type_Img;
            }

            set
            {
                _Type_Img = value;
            }
        }

        public int Type_Pos
        {
            get
            {
                return _Type_Pos;
            }

            set
            {
                _Type_Pos = value;
            }
        }

        public int Status
        {
            get
            {
                return _Status;
            }

            set
            {
                _Status = value;
            }
        }

        public string UserName
        {
            get
            {
                return _UserName;
            }

            set
            {
                _UserName = value;
            }
        }

        public DateTime Modified
        {
            get
            {
                return _Modified;
            }

            set
            {
                _Modified = value;
            }
        }

        public bool AddFoodType()
        {
            String sQuery = "INSERT INTO [dbo].[food_type]([Type_name],[Type_pos],[Type_img],[Status],[Username],[Modified])VALUES(@Type_name,@Type_pos, @Type_img, @Status, @Username, @Modified)";

            SqlParameter[] sqlParas = {
                                     
                                     new SqlParameter("@Type_name",SqlDbType.NVarChar,50)
                                     {Value = this.Type_Name},
                                     new SqlParameter("@Type_pos",SqlDbType.Int) {Value = this.Type_Pos },
                                     new SqlParameter("@Type_img",SqlDbType.VarChar,255) {Value = this.Type_Img},
                                     new SqlParameter("@Status",SqlDbType.Int) {Value = this.Status},
                                     new SqlParameter("@Username",SqlDbType.VarChar,50) {Value = this.UserName },
                                     new SqlParameter("@Modified",SqlDbType.DateTime){Value = this.Modified}
                                     };
            return DataProvider.executeNonQuery(sQuery, sqlParas);
        }

        public FoodTypes ( String name, int pos, String img, int status, String username, DateTime modified)
        {
            
            Type_Name = name;
            Type_Pos = pos;
            Type_Img = img;
            Status = status;
            UserName = username;
            Modified = modified;
        }
        public bool UpdateFoodType()
        {
            String sQuery = "UPDATE [dbo].[food_type]SET [Type_name] = @Type_name,[Type_pos] = @Type_pos,[Type_img] = @Type_img,[Status] = @Status,[Username] = @Username,[Modified] = @Modified WHERE [Type_name] = @Type_name";

            SqlParameter[] sqlParas = {
                                    
                                     new SqlParameter("@Type_name",SqlDbType.NVarChar,50)
                                     {Value = this.Type_Name},
                                     new SqlParameter("@Type_pos",SqlDbType.Int) {Value = this.Type_Pos },
                                     new SqlParameter("@Type_img",SqlDbType.VarChar,255) {Value = this.Type_Img},
                                     new SqlParameter("@Status",SqlDbType.Int) {Value = this.Status},
                                     new SqlParameter("@Username",SqlDbType.VarChar,50) {Value = this.UserName },
                                     new SqlParameter("@Modified",SqlDbType.DateTime){Value = this.Modified}
                                     };
            return DataProvider.executeNonQuery(sQuery, sqlParas);
        }

    }
}