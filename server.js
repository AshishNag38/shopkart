require('./config/db-helper')
const express = require("express");
const orderRoute = require("./routes/order");
const PORT = process.env.PORT || 1010;
const app = express();

app.use(express.json());

app.get('/', (req, res) => {
  res.status(200).json({ msg: "server is up and running" });
});

app.use("/orders/api", orderRoute);

app.use("*", (req, res) => {
  res.status(404).json({ msg: "Request URL not found!" })
})
app.listen(PORT, () => {
  console.log(`The server is on port ${PORT}`)
})


module.exports = app;