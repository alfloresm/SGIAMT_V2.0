﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;
using DTO;

namespace CTR
{
    public class CtrUsuario
    {
        DaoUsuario objDaoUsuario;

        public CtrUsuario()
        {
            objDaoUsuario = new DaoUsuario();
        }

        public DtoUsuario Login(DtoUsuario dtoUsuario)
        {

            int persona_id = objDaoUsuario.validacionLogin(dtoUsuario.PK_VU_DNI, dtoUsuario.VU_Contrasenia);

            if (persona_id == 0)
            {
                dtoUsuario = null;
                return dtoUsuario;
            }
            else
            {
                return objDaoUsuario.datosUsuario(dtoUsuario.PK_VU_DNI);
            }
        }

        //agregado
        public int devolverCategoria(int anio)
        {
            return objDaoUsuario.ObtenerCategoria(anio);
        }
        public int validacionContrasena(string dni, string email)
        {
            return objDaoUsuario.validacionContrasena(dni, email);
        }
        public string devolverNombreCateg(int anio)
        {
            return objDaoUsuario.ObtenerNombreCategoria(anio);
        }

        public void registrarUsuario(DtoUsuario obju)
        {
            objDaoUsuario.RegistrarUsuario(obju);
        }

        public bool existeUsuario(DtoUsuario dtoUsuario)
        {
            return objDaoUsuario.SelectUsuario(dtoUsuario);
        }
        public bool existeUsuarioAca(DtoUsuario dtoUsuario)
        {
            return objDaoUsuario.SelectUsuario_Aca(dtoUsuario);
        }
        public bool existeUsuarioGen(DtoUsuario dtoUsuario, string gen)
        {
            return objDaoUsuario.SelectUsuario_Gen(dtoUsuario, gen);
        }
        public bool existeUsuarioGanador(string dni,int mod)
        {
            return objDaoUsuario.SelectUsuario_concursoParticipado(dni,mod);
        }
        //Inscribir
        public void obtenerParticipante(DtoUsuario dtoUsuario, DtoCategoria objcat)
        {
            objDaoUsuario.ObtenerParticipante(dtoUsuario, objcat);
        }
        //calificar participante
        public string devolverCodJurado(string dni)
        {
            return objDaoUsuario.ObtenerCodJurado(dni);
        }
        public DataTable listarPerfiles()
        {
            return objDaoUsuario.ListarPerfiles();
        }
        public void registrarPerfil(DtoUsuario dtoUsuario)
        {
            objDaoUsuario.RegistrarPerfil(dtoUsuario);
        }
        public void ActualizarPerfil(DtoUsuario dtoUsuario)
        {
            objDaoUsuario.ActualizarPerfil(dtoUsuario);
        }
        //public void registrarImgP(byte[] bytes, string id)
        //{
        //    objDaoUsuario.RegistrarImgUsuario(bytes, id);
        //}

    }
}
