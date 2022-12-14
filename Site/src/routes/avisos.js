var express = require("express");
var router = express.Router();

var avisoController = require("../controllers/avisoController");

router.get("/", function (req, res) {
    avisoController.testar(req, res);
});

router.get("/listar", function (req, res) {
    avisoController.listar(req, res);
});

router.get("/listar/:idUsuario", function (req, res) {
    avisoController.listarPorUsuario(req, res);
});

router.get("/pesquisar/:descricao", function (req, res) {
    avisoController.pesquisarDescricao(req, res);
});

router.post("/publicar/:idUsuario", function (req, res) {
    avisoController.publicar(req, res);
});

router.put("/editar/:idCmt", function (req, res) {
    avisoController.editar(req, res);
});

router.delete("/deletar/:idCmt", function (req, res) {
    avisoController.deletar(req, res);
});

router.get("/DC", function (req, res) {
    avisoController.DC(req, res);
});

router.get("/JD", function (req, res) {
    avisoController.JD(req, res);
});



module.exports = router;