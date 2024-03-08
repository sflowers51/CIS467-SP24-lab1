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

app.get("/api/v1/tags", async (req, res) => {
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

app.get("/api/v1/tags/:id", async (req, res) => {
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
app.post("/api/v1/tags", async (req, res) => {
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
app.put("/api/v1/tags/:id", async (req, res) => {
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

//DELETE
app.delete("/api/v1/tags/:id", async (req, res) => {
  try {
    const conn = await pool.getConnection();
    console.log(req.user);

    // Delete the references first
    await conn.query("DELETE FROM prayerstags WHERE tagID = ?", [req.params.id]);

    // Then delete the tag
    const [result] = await conn.query("DELETE FROM tags WHERE tagID = ?", [req.params.id]);

    conn.release();

    if (result.affectedRows > 0) {
      res.status(204)
      console.log({ message: "Tag deleted successfully" });
    } else {
      res.status(404).json({ message: "Tag not found" });
    }
  } catch (err) {
    console.error("Error deleting tag:", err);
    res.status(500).send("Error deleting tag");
  }
});

// GET /api/v1/prayers
app.get("/api/v1/prayers", async (req, res) => {
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
app.get("/api/v1/prayers/:id", async (req, res) => {
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
app.post("/api/v1/prayers", async (req, res) => {
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
app.put("/api/v1/prayers/:id", async (req, res) => {
  try {
    const conn = await pool.getConnection();

    // Assuming req.body contains updated prayer data
    const { prompt, body, coverImage, audioRecitation, aiCreator } = req.body;

    // Update prayer in the database
    const [result] = await conn.query("UPDATE prayers SET prompt=?, body=?, coverImage=?, audioRecitation=?, aiCreator=? WHERE prayerID=?", [prompt, body, coverImage, audioRecitation, aiCreator, req.params.id]);

    conn.release();

    if (result.affectedRows > 0) {
      res.json({ message: "Prayer updated successfully",  prompt: prompt, body: body, coverImage: coverImage, audioRecitation: audioRecitation, aiCreator: aiCreator, prayerID: req.params.id});
    } else {
      res.status(404).json({ message: "Prayer not found" });
    }
  } catch (err) {
    console.error("Error updating prayer:", err);
    res.status(500).send("Error updating prayer");
  }
});

// DELETE /api/v1/prayers/:id
app.delete("/api/v1/prayers/:id", async (req, res) => {
  const conn = await pool.getConnection();
  try {
    const { id } = req.params;

    
    // Begin a transaction
    await conn.beginTransaction();

    // Delete related rows in the prayerstags table
    await conn.query("DELETE FROM prayerstags WHERE prayerID = ?", [id]);

    // Delete related rows in the prayersscriptures table
    await conn.query("DELETE FROM prayersscriptures WHERE prayerID = ?", [id]);

    // Delete related rows in the likes table
    await conn.query("DELETE FROM likes WHERE prayerID = ?", [id]);

    await conn.query("DELETE FROM saves WHERE prayerID = ?", [id])

    // Delete the prayer
    const [result] = await conn.query("DELETE FROM prayers WHERE prayerID = ?", [id]);

    // Commit the transaction
    await conn.commit();
    conn.release();

    if (result.affectedRows > 0) {
      res.status(204).json({ message: "Prayer deleted successfully" });
      console.log("Prayer deleted successfully")
    } else {
      res.status(404).json({ message: "Prayer not found" });
    }
  } catch (err) {
    // Rollback the transaction in case of error
    await conn.rollback();
    conn.release();
    console.error("Error deleting prayer:", err);
    res.status(500).send("Error deleting prayer");
  }
});

// Get all likes for a prayer
app.get('/api/v1/prayers/:id/likes', async (req, res) => {
  const { id: prayerID } = req.params;

  try {
    const conn = await pool.getConnection();

    // Check if the prayer exists
    const [existingPrayer] = await conn.query("SELECT * FROM prayers WHERE prayerID = ?", [prayerID]);
    if (existingPrayer.length === 0) {
      conn.release();
      return res.status(404).json({ message: "Prayer not found" });
    }

    // Fetch all likes for the prayer
    const [likes] = await conn.query("SELECT * FROM likes WHERE prayerID = ?", [prayerID]);

    conn.release();
    res.json(likes);
  } catch (err) {
    console.error("Error fetching likes:", err);
    res.status(500).send("Error fetching likes");
  }
});

// Like a prayer
app.post("/api/v1/prayers/:id/likes", async (req, res) => {
  const { id } = req.params;
  const { user } = req;
  
  // Check if the user ID is 4
  if (user.id !== 4) {
    res.status(403).send("Forbidden");
    return;
  }

  try {
    const connection = await pool.getConnection();
    const [existingPrayer] = await connection.query("SELECT * FROM prayers WHERE prayerID=?", [id]);
    connection.release();
    if (existingPrayer.length === 0) {
      res.status(404).send("Prayer not found");
      return;
    }
    const [existingLike] = await pool.query("SELECT * FROM likes WHERE userID=? AND prayerID=?", [user.id, id]);
    if (existingLike.length > 0) {
      res.status(409).send("Already Liked");
      return;
    }
    const now = new Date();
    const formattedDateTime = now.toISOString().replace('T', ' ').split('.')[0];
    await pool.query("INSERT INTO likes (userID, prayerID, likedTime) VALUES (?, ?, ?)", [user.id, id, formattedDateTime]);
    res.status(201).send("Successfully Liked Prayer");
  } catch (err) {
    console.error("Error liking prayer:", err.message);
    res.status(500).send("Error liking prayer");
  }
});

// Unlike a prayer
app.delete("/api/v1/prayers/:id/likes", async (req, res) => {
  const { id } = req.params;
  const { user } = req;
  
  // Check if the user ID is 4
  if (user.id !== 4) {
    res.status(403).send("Forbidden");
    return;
  }

  try {
    const connection = await pool.getConnection();
    const [existingPrayer] = await connection.query("SELECT * FROM prayers WHERE prayerID=?", [id]);
    if (existingPrayer.length === 0) {
      res.status(404).send("Prayer not found");
      connection.release();
      return;
    }
    
    const [existingLike] = await connection.query("SELECT * FROM likes WHERE userID=? AND prayerID=?", [user.id, id]);
    if (existingLike.length === 0) {
      res.status(404).send("Cannot unlike what is not yet liked");
      connection.release();
      return;
    }
    
    await connection.query("DELETE FROM likes WHERE userID=? AND prayerID=?", [user.id, id]);
    connection.release();
    
    res.status(204).send("Successfully unliked");
    console.log("Successfully unliked");
  } catch (err) {
    console.error("Error unliking prayer:", err.message);
    res.status(500).send("Error unliking prayer");
  }
});


// GET all saves of prayer with given id (by all users)
app.get("/api/v1/prayers/:id/saves", async (req, res) => {
  const { id } = req.params;
  try {
    const [existingPrayer] = await pool.query("SELECT * FROM prayers WHERE prayerID=?", [id]);
    if (existingPrayer.length === 0) {
      res.status(404).send("Prayer not found");
      return;
    }
    const saves = await pool.query("SELECT * FROM saves WHERE prayerID=?", [id]);
    res.json(saves);
  } catch (err) {
    console.error("Error getting saves:", err.message);
    res.status(500).send("Error getting saves");
  }
});

// Save a prayer
app.post("/api/v1/prayers/:id/saves", async (req, res) => {
  const { id } = req.params;
  const { user } = req;
  
  // Check if the user ID is 4
  if (user.id !== 4) {
    res.status(403).send("Forbidden");
    return;
  }

  try {
    const connection = await pool.getConnection();
    const [existingPrayer] = await connection.query("SELECT * FROM prayers WHERE prayerID=?", [id]);
    connection.release();
    if (existingPrayer.length === 0) {
      res.status(404).send("Prayer not found");
      return;
    }
    const [existingSave] = await pool.query("SELECT * FROM saves WHERE userID=? AND prayerID=?", [user.id, id]);
    if (existingSave.length > 0) {
      res.status(409).send("Already Saved");
      return;
    }
    const now = new Date();
    const formattedDateTime = now.toISOString().replace('T', ' ').split('.')[0];
    await pool.query("INSERT INTO saves (userID, prayerID, savedTime) VALUES (?, ?, ?)", [user.id, id, formattedDateTime]);
    res.status(201).send("Successfully Saved Prayer");
  } catch (err) {
    console.error("Error saving prayer:", err.message);
    res.status(500).send("Error saving prayer");
  }
});

// Unlike a prayer
app.delete("/api/v1/prayers/:id/saves", async (req, res) => {
  const { id } = req.params;
  const { user } = req;
  
  // Check if the user ID is 4
  if (user.id !== 4) {
    res.status(403).send("Forbidden");
    return;
  }

  try {
    const connection = await pool.getConnection();
    const [existingPrayer] = await connection.query("SELECT * FROM prayers WHERE prayerID=?", [id]);
    connection.release();
    if (existingPrayer.length === 0) {
      res.status(404).send("Prayer not found");
      return;
    }
    const [existingSave] = await pool.query("SELECT * FROM saves WHERE userID=? AND prayerID=?", [user.id, id]);
    if (existingSave.length === 0) {
      res.status(404).send("Cannot unsave what is not yet saved");
      return;
    }
    await pool.query("DELETE FROM saves WHERE userID=? AND prayerID=?", [user.id, id]);
    res.status(204).send("Successfully Unsaved");
    console.log("Successfully Unsaved");
  } catch (err) {
    console.error("Error deleting save:", err.message);
    res.status(500).send("Error deleting save");
  }
});
