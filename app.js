const express = require("express");
const app = express();
const PORT = 3000;
const mysql = require("mysql2/promise");
const config = require("./config");

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const pool = mysql.createPool(config.db);

app.listen(PORT, async () => {
  const host = process.env.HOSTNAME || "http://localhost";
  console.log(`Listening on ${host}:${PORT}`);
});

app.use((req, res, next) => {
  req.user = { id: 4, name: "Kenan" }
  next()
});

app.get("/", async (req, res) => {
  try {
    const conn = await pool.getConnection();
    console.log(req.user);
    const [users] = await conn.query("SELECT * FROM users");

    conn.release();
    //console.log(users)

    res.json(users);
  } catch (err) {
    res.json({ message: "error" });
    console.error(err);
  }
});

app.get("/tags", async (req, res) => {
  try {
    const conn = await pool.getConnection();
    console.log(req.user);
    const [tags] = await conn.query("SELECT * FROM tags");

    conn.release();
    //console.log(users)

    res.json(tags);
  } catch (err) {
    res.json({ message: "error" });
    console.error(err);
  }
});

app.get("/tags/:id", async (req, res) => {
  try {
    const conn = await pool.getConnection();
    console.log(req.user);
    const [tags] = await conn.query(
      "SELECT * FROM tags WHERE tagID=" + req.params.id
    );

    conn.release();
    //console.log(users)

    if (tags.length > 0) {
      res.json(tags[0]);
    } else {
      res.status(404).json({ message: "Resource not found" });
    }
  } catch (err) {
    res.status(500).json({ message: "error" });
    console.error(err);
  }
});

// Create a new user
app.post("/tags", async (req, res) => {
  const { tagDescription } = req.body;
  try {
    const connection = await pool.getConnection();
    await connection.query("INSERT INTO tags (tagDescription) VALUES (?)", [
      tagDescription,
    ]);
    const [newTag] = await connection.query(
      "SELECT * FROM tags WHERE tagDescription=?",
      [tagDescription]
    );
    connection.release();
    res.status(201).json(newTag[0]);
  } catch (err) {
    console.error("Error creating user:", err);
    res.status(500).send("Error creating user");
  }
});

// PUT /api/v1/tags/:id
app.put("/tags/:id", async (req, res) => {
  const { tagDescription } = req.body;
  try {
    const conn = await pool.getConnection();
    console.log(req.user);

    // Check if the tag exists
    const [existingTag] = await conn.query("SELECT * FROM tags WHERE tagID = ?", [req.params.id]);
    if (existingTag.length === 0) {
      conn.release();
      return res.status(404).json({ message: "Tag not found" });
    }

    // Update the tag
    await conn.query("UPDATE tags SET tagDescription = ? WHERE tagID = ?", [tagDescription, req.params.id]);

    // Fetch the updated tag
    const [updatedTag] = await conn.query("SELECT * FROM tags WHERE tagID = ?", [req.params.id]);

    conn.release();
    res.json(updatedTag[0]);
  } catch (err) {
    console.error("Error updating tag:", err);
    res.status(500).send("Error updating tag");
  }
});

app.delete("/tags/:id", async (req, res) => {
  try {
    const conn = await pool.getConnection();
    console.log(req.user);

    // Delete the references first
    await conn.query("DELETE FROM prayerstags WHERE tagID = ?", [req.params.id]);

    // Then delete the tag
    const [result] = await conn.query("DELETE FROM tags WHERE tagID = ?", [req.params.id]);

    conn.release();

    if (result.affectedRows > 0) {
      res.json({ message: "Tag deleted successfully" });
    } else {
      res.status(404).json({ message: "Tag not found" });
    }
  } catch (err) {
    console.error("Error deleting tag:", err);
    res.status(500).send("Error deleting tag");
  }
});




// app.get("/tags/:id", async (req, res) => {
//   try {
//     const conn = await pool.getConnection();
//     console.log(req.user);
//     const [tags] = await conn.query(
//       "SELECT * FROM tags WHERE tagID=" + req.params.id
//     );

//     conn.release();
//     //console.log(users)

//     if (tags.length > 0) {
//       res.json(tags[0]);
//     } else {
//       res.status(404).json({ message: "Resource not found" });
//     }
//   } catch (err) {
//     res.status(500).json({ message: "error" });
//     console.error(err);
//   }
// });


