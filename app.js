const express = require('express')
const app = express()
const PORT = 3000
const mysql = require('mysql2/promise')
const config = require('./config')

app.use( express.json() )
app.use( express.urlencoded( {extended: true} ))

const pool = mysql.createPool( config.db) 

app.listen(PORT, async () => {
    console.log(`Listening on http://localhost:${PORT}`)
})

app.get('/', async (req, res)=> {
    try {
        const conn = await pool.getConnection();

        const [users, ] = await conn.query("SELECT * FROM users")
        console.log(users)

        res.json(users)
    }
    catch( err) {
        res.json( {message: "error"})
        console.error(err)
    }


    
})
