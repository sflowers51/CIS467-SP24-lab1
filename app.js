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

// GET /api/v1/prayers
app.get("/prayers", async (req, res) => {
  try {
    const conn = await pool.getConnection();

    const [prayers] = await conn.query("SELECT * FROM prayers");

    conn.release();

    res.json(prayers);
  } catch (err) {
    console.error("Error fetching prayers:", err);
    res.status(500).send("Error fetching prayers");
  }
});

// GET /api/v1/prayers/:id
app.get("/prayers/:id", async (req, res) => {
  try {
    const conn = await pool.getConnection();

    const [prayer] = await conn.query("SELECT * FROM prayers WHERE prayerID = ?", [req.params.id]);

    conn.release();

    if (prayer.length > 0) {
      res.json(prayer[0]);
    } else {
      res.status(404).json({ message: "Prayer not found" });
    }
  } catch (err) {
    console.error("Error fetching prayer:", err);
    res.status(500).send("Error fetching prayer");
  }
});

// POST /api/v1/prayers
app.post("/prayers", async (req, res) => {
  try {
    const conn = await pool.getConnection();

    // Assuming req.body contains prayer data
    const { prompt, body, coverImage, audioRecitation, aiCreator } = req.body;

    // Insert into database
    const [result] = await conn.query("INSERT INTO prayers (prompt, body, coverImage, audioRecitation, aiCreator) VALUES (?, ?, ?, ?, ?)", [prompt, body, coverImage, audioRecitation, aiCreator]);

    conn.release();

    res.json({ prayerID: result.insertId, prompt, body, coverImage, audioRecitation, aiCreator });
  } catch (err) {
    console.error("Error creating prayer:", err);
    res.status(500).send("Error creating prayer");
  }
});

// PUT /api/v1/prayers/:id
app.put("/prayers/:id", async (req, res) => {
  try {
    const conn = await pool.getConnection();

    // Assuming req.body contains updated prayer data
    const { prompt, body, coverImage, audioRecitation, aiCreator } = req.body;

    // Update prayer in the database
    const [result] = await conn.query("UPDATE prayers SET prompt=?, body=?, coverImage=?, audioRecitation=?, aiCreator=? WHERE prayerID=?", [prompt, body, coverImage, audioRecitation, aiCreator, req.params.id]);

    conn.release();

    if (result.affectedRows > 0) {
      res.json({ message: "Prayer updated successfully" });
    } else {
      res.status(404).json({ message: "Prayer not found" });
    }
  } catch (err) {
    console.error("Error updating prayer:", err);
    res.status(500).send("Error updating prayer");
  }
});

// DELETE /api/v1/prayers/:id
app.delete("/prayers/:id", async (req, res) => {
  try {
    const conn = await pool.getConnection();

    // Delete the prayer
    const [result] = await conn.query("DELETE FROM prayers WHERE prayerID = ?", [req.params.id]);

    conn.release();

    if (result.affectedRows > 0) {
      res.json({ message: "Prayer deleted successfully" });
    } else {
      res.status(404).json({ message: "Prayer not found" });
    }
  } catch (err) {
    console.error("Error deleting prayer:", err);
    res.status(500).send("Error deleting prayer");
  }
});

// GET /api/v1/prayers/:id/likes
app.get("/prayers/:id/likes", async (req, res) => {
  try {
    const conn = await pool.getConnection();

    const [likes] = await conn.query("SELECT * FROM likes WHERE prayerID=?", [req.params.id]);

    conn.release();

    res.json(likes);
  } catch (err) {
    console.error("Error fetching likes:", err);
    res.status(500).json({ message: "error" });
  }
});

// POST /api/v1/prayers/:id/likes
app.post("/prayers/:id/likes", async (req, res) => {
  try {
    const conn = await pool.getConnection();

    // Assuming req.user contains current user's ID
    const userID = req.user.id;
    const prayerID = req.params.id;

    // Check if like already exists
    const [existingLikes] = await conn.query("SELECT * FROM likes WHERE prayerID=? AND userID=?", [prayerID, userID]);
    if (existingLikes.length > 0) {
      conn.release();
      res.status(409).json({ message: "Like already exists" });
      return;
    }

    // Insert like into database
    const [result] = await conn.query("INSERT INTO likes (prayerID, userID) VALUES (?, ?)", [prayerID, userID]);

    conn.release();

    res.status(201).json({ likeID: result.insertId, prayerID, userID });
  } catch (err) {
    console.error("Error liking prayer:", err);
    res.status(500).json({ message: "error" });
  }
});

// DELETE /api/v1/prayers/:id/likes
app.delete("/prayers/:id/likes", async (req, res) => {
  try {
    const conn = await pool.getConnection();

    // Assuming req.user contains current user's ID
    const userID = req.user.id;
    const prayerID = req.params.id;

    // Delete the like
    const [result] = await conn.query("DELETE FROM likes WHERE prayerID=? AND userID=?", [prayerID, userID]);

    conn.release();

    if (result.affectedRows > 0) {
      res.status(204).send();
    } else {
      res.status(404).json({ message: "Like not found" });
    }
  } catch (err) {
    console.error("Error unliking prayer:", err);
    res.status(500).json({ message: "error" });
  }
});




