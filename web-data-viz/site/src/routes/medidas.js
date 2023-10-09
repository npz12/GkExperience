var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.get("/usuarios" , function (req, res) {
    medidaController.usuarioqtd(req, res);
})

router.get("/chart" , function (req, res) {
    medidaController.chart(req, res);
})

router.post("/chart2" , function (req, res) {
    medidaController.chart2(req, res);
})

module.exports = router;