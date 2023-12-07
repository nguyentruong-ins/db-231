import express from "express";
import cors from "cors";
import Jwt from "jsonwebtoken";
import cookieParser from "cookie-parser";
import router from "./routes/index.js";
// /home/locdac/Documents/DB/db-231/authentication/routes/adminRoute.js

const app = express()
app.use(cors({
    origin: ["http://localhost:5173"],
    methods: ['GET', 'POST', 'PUT', "DELETE"],
    credentials: true
}))
app.use(express.json())
app.use(cookieParser())
app.use(express.static('public'));
app.use('/auth', router);

const verifyUser = (req, res, next) => {
    const token = req.cookies.token;
    if (token) {
        Jwt.verify(token, "jwt_secret_key", (err, decoded) => {
            if (err) return res.json({ Status: false, Error: "Wrong Token" })
            req.id = decoded.id;
            req.role = decoded.role;
            next();
        })
    } else {
        return res.json({ Status: false, Error: "Not authenticated" });
    }
}
app.get('/verify', verifyUser, (req, res) => {
    return res.json({ Status: true, role: req.role, id: req.id })
})

app.listen(3000, () => {
    console.log("Server is running at port 3000");
})
