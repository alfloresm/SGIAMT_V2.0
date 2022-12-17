using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DTO;
using CTR;
using System.IO;

namespace WEB.PAG_WEB
{
    /// <summary>
    /// Descripción breve de ghUploadFileInscr
    /// </summary>
    public class ghUploadFileInscr : IHttpHandler
    {
        Log _Log = new Log();
        public void ProcessRequest(HttpContext context)
        {
            _Log.CustomWriteOnLog("subirVoucheInscripcion", "Entro");
            try
            {
                if (context.Request.Files.Count > 0)
                {
                    CtrInscripcion objCtrEins = new CtrInscripcion();
                    _Log.CustomWriteOnLog("subirVoucheInscripcion", "1");
                    string ID = context.Request.QueryString["Id"].ToString();


                    byte[] fileData = null;
                    _Log.CustomWriteOnLog("subirVoucheEntrada", " 2");
                    using (var binaryReader = new BinaryReader(context.Request.Files[0].InputStream))
                    {
                        fileData = binaryReader.ReadBytes(context.Request.Files[0].ContentLength);
                    }
                    _Log.CustomWriteOnLog("subirVoucheInscripcion", "3");
                    _Log.CustomWriteOnLog("subirVoucheInscripcion", "Valor de Id a actualizar es " + ID);

                    objCtrEins.RegistrarImgVoucherInscripcion(fileData, int.Parse(ID));
                    _Log.CustomWriteOnLog("subirVoucheInscripcion", "4");
                }
                _Log.CustomWriteOnLog("subirVoucheInscripcion", "5");

            }
            catch (Exception ex)
            {
                _Log.CustomWriteOnLog("subirVoucheInscripcion", "Error" + ex.Message);
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