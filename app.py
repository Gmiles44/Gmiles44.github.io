from cs50 import SQL
from flask import Flask, flash, redirect, render_template, request

app = Flask(__name__)
app.secret_key = 'testing12345thesecret67890key'
db = SQL("sqlite:///game_data.db")


@app.route("/")
def index():
    stats = db.execute("SELECT * FROM stats")
    return render_template("index.html", stats=stats)


@app.route("/craft", methods=["GET", "POST"])
def craft():
    if request.method == "GET":
        recipes = db.execute("""SELECT c.name, c.base_price, ci.amount AS owned, m1.name AS m1_name, m1_amt, i1.amount AS i1_amt,
                                m2.name AS m2_name, m2_amt, i2.amount AS i2_amt,
                                m3.name AS m3_name, m3_amt, i3.amount AS i3_amt, c.id
                                FROM recipes
                                LEFT JOIN materials AS m1 ON recipes.m1_id = m1.id
                                LEFT JOIN materials_inventory AS i1 ON recipes.m1_id = i1.mat_id
                                LEFT JOIN materials AS m2 ON recipes.m2_id = m2.id
                                LEFT JOIN materials_inventory AS i2 ON recipes.m2_id = i2.mat_id
                                LEFT JOIN materials AS m3 ON recipes.m3_id = m3.id
                                LEFT JOIN materials_inventory AS i3 ON recipes.m3_id = i3.mat_id
                                JOIN creations c ON recipes.creation_id = c.id
                                JOIN creations_inventory ci ON recipes.creation_id = ci.creation_id ORDER BY c.base_price""")
        return render_template("craft.html", recipes=recipes)
    if request.method == "POST":
        id = request.form.get("id")
        materials = db.execute("""SELECT m1_id, m1_amt, m2_id, m2_amt, m3_id, m3_amt
                               FROM recipes WHERE creation_id = ?""", id)
        name = db.execute("SELECT name FROM creations WHERE id = ?", id)[0]['name']
        inventory = db.execute("""SELECT i1.amount AS mat1_amount,
                               i2.amount AS mat2_amount,
                               i3.amount AS mat3_amount
                               FROM recipes r
                               LEFT JOIN materials_inventory AS i1 ON i1.mat_id = r.m1_id
                               LEFT JOIN materials_inventory AS i2 ON i2.mat_id = r.m2_id
                               LEFT JOIN materials_inventory AS i3 ON i3.mat_id = r.m3_id
                               WHERE r.creation_id = ?""", id)
        db.execute("UPDATE creations_inventory SET amount = amount + 1 WHERE creation_id = ?", id)
        if inventory[0]['mat1_amount'] > materials[0]['m1_amt']:
            if inventory[0]['mat2_amount'] and materials[0]['m2_amt'] and inventory[0]['mat2_amount'] > materials[0]['m2_amt']:
                if inventory[0]['mat2_amount'] and materials[0]['m2_amt'] and inventory[0]['mat2_amount'] > materials[0]['m2_amt']:
                    ids = []
                    amounts = []
                    for key, value in materials[0].items():
                        if not value == None:
                            if key.endswith('_id'):
                                ids.append(value)
                            else:
                                amounts.append(value)
                    for index, _id in enumerate(ids):
                        db.execute("UPDATE materials_inventory SET amount = amount - ? WHERE mat_id = ?", amounts[index], _id)
        else:
            flash("Not enough materials!")
            return redirect("/craft")

        recipes = db.execute("""SELECT c.name, c.base_price, ci.amount AS owned, m1.name AS m1_name, m1_amt, i1.amount AS i1_amt,
                        m2.name AS m2_name, m2_amt, i2.amount AS i2_amt,
                        m3.name AS m3_name, m3_amt, i3.amount AS i3_amt, c.id
                        FROM recipes r
                        LEFT JOIN materials AS m1 ON r.m1_id = m1.id
                        LEFT JOIN materials_inventory AS i1 ON r.m1_id = i1.mat_id
                        LEFT JOIN materials AS m2 ON r.m2_id = m2.id
                        LEFT JOIN materials_inventory AS i2 ON r.m2_id = i2.mat_id
                        LEFT JOIN materials AS m3 ON r.m3_id = m3.id
                        LEFT JOIN materials_inventory AS i3 ON r.m3_id = i3.mat_id
                        JOIN creations c ON r.creation_id = c.id
                        JOIN creations_inventory ci ON r.creation_id = ci.creation_id ORDER BY c.base_price""")
        flash(f"Crafted {name}!")
        return render_template("craft.html", recipes=recipes)


@app.route("/inventory", methods=["GET", "POST"])
def inventory():
    stats = db.execute("SELECT * FROM stats WHERE player_id = 1")
    inventory = db.execute("""SELECT name, mi.amount, base_price
                           FROM materials m
                           JOIN materials_inventory mi
                           ON m.id = mi.mat_id""")
    c_inventory = db.execute("""SELECT name, ci.amount, base_price
                             FROM creations c
                             JOIN creations_inventory ci
                             ON c.id = ci.creation_id""")
    return render_template("inventory.html", inventory=inventory, stats=stats, c_inventory=c_inventory)

@app.route("/market", methods=["GET", "POST"])
def market():
    merchants = db.execute("""SELECT m.id, m.name, m1.name AS m1_name, m1.base_price AS m1_base_price, inv_1_amt,
                           m2.name AS m2_name, m2.base_price AS m2_base_price, inv_2_amt,
                           m3.name AS m3_name, m3.base_price AS m3_base_price, inv_3_amt,
                           m4.name AS m4_name, m4.base_price AS m4_base_price, inv_4_amt,
                           m5.name AS m5_name, m5.base_price AS m5_base_price, inv_5_amt
                           FROM merchants m
                           LEFT JOIN materials m1 ON m1.id = m.inv_1
                           LEFT JOIN materials m2 ON m2.id = m.inv_2
                           LEFT JOIN materials m3 ON m3.id = m.inv_3
                           LEFT JOIN materials m4 ON m4.id = m.inv_4
                           LEFT JOIN materials m5 ON m5.id = m.inv_5""")
    return render_template("market.html", merchants=merchants)
