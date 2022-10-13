using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DTO;
using CTR;
using System.IO;

namespace WEB
{
    /// <summary>
    /// Descripción breve de ghUploadFile
    /// </summary>
    public class ghUploadFile : IHttpHandler
    {

        
        Log _Log = new Log();
        public void ProcessRequest(HttpContext context)
        {
            _Log.CustomWriteOnLog("subirVoucheEntrada", "Entro");
            try
            {
                if (context.Request.Files.Count > 0)
                {
                    CtrEntrada objCtrEntrada = new CtrEntrada();
                    _Log.CustomWriteOnLog("subirVoucheEntrada", "1");
                    string ID = context.Request.QueryString["Id"].ToString();


                    byte[] fileData = null;
                    _Log.CustomWriteOnLog("subirVoucheEntrada", " 2");
                    using (var binaryReader = new BinaryReader(context.Request.Files[0].InputStream))
                    {
                        fileData = binaryReader.ReadBytes(context.Request.Files[0].ContentLength);
                    }
                    _Log.CustomWriteOnLog("subirVoucheEntrada", "3");
                    _Log.CustomWriteOnLog("subirVoucheEntrada", "Valor de Id a actualizar es " + ID);

                    objCtrEntrada.RegistrarImgVoucherEntrada(fileData, int.Parse(ID));
                    _Log.CustomWriteOnLog("subirVoucheEntrada", "4");
                }
                _Log.CustomWriteOnLog("subirVoucheEntrada", "5");

            }
            catch (Exception ex)
            {
                _Log.CustomWriteOnLog("subirVoucheEntrada", "Error" + ex.Message);
            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}