
const { MongoClient, ServerApiVersion } = require('mongodb');
const uri = "mongodb+srv://akumar11:test%401234@cluster0.gbeqk.mongodb.net/shoppersMart?retryWrites=true&w=majority&appName=Cluster0";

// Create a MongoClient with a MongoClientOptions object to set the Stable API version
// const client = new MongoClient(uri, {
//   serverApi: {
//     version: ServerApiVersion.v1,
//     strict: true,
//     deprecationErrors: true,
//   }
// });

const client = new MongoClient(uri);

async function run() {
  try {
    // Connect the client to the server	(optional starting in v4.7)
    await client.connect();

    db = client.db("sample_mflix");
    // Send a ping to confirm a successful connection
    let result = await client.db("orders").command({ ping: 1 });
    if (result?.ok) console.log("Successfuly pinged deployment. connected to DB.")
  } finally {
    // Ensures that the client will close when you finish/error
    // await client.close();
  }
}
run().catch(console.dir);
