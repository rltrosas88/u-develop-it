const express = require('express');
const db = require('./db/connection');
const apiRoutes = require('./routes/apiRoutes');

const PORT = process.env.PORT || 3001;
const app = express();

// Express middleware
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

//Use apiRoutes
//by adding th /aoi prefix, we can remove it from the indivdual route expressions after we move them to their new home
app.use('/api', apiRoutes);

// app.get('/', (req, res) => {
//     res.json({
//         message: 'Hello World'
//     });
// });


// db.query(sql, params, (err, result) => {
//   if (err) {
//     console.log(err);
//   }
//   console.log(result);
// });



// Default response for any other request (Not Found)
app.use((req, res) => {
    res.status(404).end();
  });

// app.listen(PORT, () => {
//     console.log(`Server running on port ${PORT}`);
//   });

// Start server after DB connection
db.connect(err => {
    if (err) throw err;
    console.log('Database connected.');
    app.listen(PORT, () => {
      console.log(`Server running on port ${PORT}`);
    });
  });