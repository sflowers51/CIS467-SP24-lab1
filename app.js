const express = require('express')
const app = express()
const PORT = 3000
const mysql = require('mysql2/promise')
const config = require('./config')

app.use( express.json() )
app.use( express.urlencoded( {extended: true} ))

const pool = mysql.createPool( config.db) 

app.listen(PORT, async () => {
    const host = process.env.HOSTNAME || "http://localhost"
    console.log(`Listening on ${host}:${PORT}`)
})

app.use( (req, res, next)=> {
    req.user = {id:4, name:"Kenan"}
    next()
})

app.get('/', async (req, res)=> {
    try {
        const conn = await pool.getConnection();
        console.log(req.user)
        const [users, ] = await conn.query("SELECT * FROM users")

        conn.release()
        //console.log(users)

        res.json(users)
    }
    catch( err) {
        res.json( {message: "error"})
        console.error(err)
    }
    
})

app.get('/tags', async (req, res)=> {
    try {
        const conn = await pool.getConnection();
        console.log(req.user)
        const [users, ] = await conn.query("SELECT * FROM tags")

        conn.release()
        //console.log(users)

        res.json(users)
    }
    catch( err) {
        res.json( {message: "error"})
        console.error(err)
    }
    
})