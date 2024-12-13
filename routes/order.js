const { findAllOrders, createOrder, findByVectorIndex, findOrderById } = require('../modules/db');

const router = require('express').Router();

router.get("/", (req, res) => {
  res.json({ message: "Success", data: "server is up and running" })
})


router.get("/allorders", async (req, res) => {
  // get all orders
  findAllOrders().then((result) => {
    res.status(200).json({ msg: "success", result });
  }).catch((err) => {
    res.status(500).json({ msg: "fail", reason: err.message });
  })
});

router.post("/create", (req, res) => {
  // create order
  // let orderObject = {
  //   name: req.body.name,
  //   quantity: req.body.quantity,

  // }
  let orderObject = req.body;

  createOrder(orderObject).then(result => {
    res.status(201).json({ msg: 'success', result });
  }).catch(err => {
    res.status(400).json({ msg: 'fail', reason: err.message });
  })
});

router.get('/vectorsearch', (req, res) => {

  findByVectorIndex().then(result => {
    res.status(200).json({ msg: "success", result });
  }).catch(err => {
    res.status(500).json({ msg: 'fail', reason: err.message });
  })
})

router.get("/getorder/:id", (req, res) => {
  const id = req.params.id;

  if (id) {
    findOrderById(id).then(result => {
      res.status(200).json({ msg: 'success', data: result });
    }).catch(err => {
      res.status(500).json({ msg: 'fail', reason: err.message });
    })
  } else res.status(400).json({ msg: "fail", reason: "ID is required" })
})


router.get('/dummy', (req, res) => {
  res.status(200).json({ msg: "success", data: "server is up" });
})

module.exports = router;