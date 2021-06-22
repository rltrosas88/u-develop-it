const express = require('express');
const router = express.Router();
const db = require('../../db/connection');
const inputCheck = require('../../utils/inputCheck');

//perform the SELECT * FROM voters and return success or 500 status if there were errors
router.get('/voters', (req, res) => {
    //rows can be sorted on retrieval by including ORDER BY
        //if you want to sort the data in descending order, add DSC keyword (e.g., ORDER BY last_name DESC)
    const sql = `SELECT * FROM voters ORDER BY last_name`;
  
    db.query(sql, (err, rows) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json({
            message: 'success',
            data: rows,
        });
    });
});

// Get single voter
router.get('/voter/:id', (req, res) => {
    const sql = `SELECT * FROM voters WHERE id = ?`;
    const params = [req.params.id];
  
    db.query(sql, params, (err, row) => {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json({
            message: 'success',
            data: row
        });
    });
});

  module.exports = router;