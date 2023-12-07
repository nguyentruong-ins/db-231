import express from "express";
import mssql from "mssql";
import jwt from "jsonwebtoken";
// import bcrypt from "bcrypt";
// import multer from "multer";
// import path from "path";
import pool from "../config/db.js";

const router = express.Router();

router.post("/admin/login", async (req, res) => {
    const sql = `
        SELECT * 
        FROM accounts a
        WHERE a.username IN (
            SELECT ea.username
            FROM employee_accounts ea
            WHERE ea.account_type = 'MANAGER' and ea.username = @username
        ) and a.password = @password;
    `;

    await pool.request()
        .input('username', mssql.NVarChar, req.body.username)
        .input('password', mssql.NVarChar, req.body.password)
        .query(sql)
        .then(result => {
            if (result.recordset.length > 0) {
                const username = result.recordset[0].username;
                const token = jwt.sign(
                    { role: "admin", username: username, id: result.recordset[0].id },
                    "jwt_secret_key",
                    { expiresIn: "1d" }
                );
                res.cookie('token', token);
                return res.json({ loginStatus: true });
            } else {
                return res.json({ loginStatus: false, Error: "Wrong username or password" });
            }
        })
        .catch(error => console.log(error))
});

router.post("/employee/login", async (req, res) => {
    const sql = `
        SELECT * 
        FROM accounts a
        WHERE a.username IN (
            SELECT ea.username
            FROM employee_accounts ea
            WHERE ea.account_type <> 'MANAGER' and ea.username = @username
        ) and a.password = @password;
    `;

    await pool.request()
        .input('username', mssql.NVarChar, req.body.username)
        .input('password', mssql.NVarChar, req.body.password)
        .query(sql)
        .then(result => {
            if (result.recordset.length > 0) {
                const username = result.recordset[0].username;
                const token = jwt.sign(
                    { role: "employee", username: username, id: result.recordset[0].id },
                    "jwt_secret_key",
                    { expiresIn: "1d" }
                );
                res.cookie('token', token);
                return res.json({ loginStatus: true, id: result.recordset[0].id });
            } else {
                return res.json({ loginStatus: false, Error: "Wrong username or password" });
            }
        })
        .catch(error => console.log(error))
});

router.get('/logout', (req, res) => {
    res.clearCookie('token')
    return res.json({ Status: true })
})

export default router;