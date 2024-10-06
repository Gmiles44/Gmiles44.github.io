# Project Name: Mr. Smith

Type: Browser-based Crafting Game

Languages used: Python, HTML, CSS, JavaScript, SQL

Frameworks used: Flask, Jinja

# URL

https://youtu.be/0BCoM-nAeZQ

# Description

## Background

I have always grown up playing video games, from the early-ish 8- and 16-bit systems like NES and SEGA, to PC gaming and modern systems like the PS5. As my interest continued and flourished I had a growing curiosity for the inner working of games as well, and the development process thereof. Video games are one of the most modern forms of art and are finally starting to gain recognition as legitimate vessels of story-telling, one notable example being the acclaimed _The Last of Us_, developed by Naughty Dog, although there are countless other video games that tell a

While my project has nowhere near the scope of many modern games, I do not have the same resources, time, or (at least as of yet), know-how, and I have had to adjust my aims to account for that.

## The Basics

Mr. Smith is a HTML-based crafting game, powered by Python with the Flask framework, using CSS for style and a small peppering of JavaScript for dynamic page changes. In it, you are the apprentice of a blacksmith who has disappeared mysteriously, leaving you the workshop and a small amount of money. Using what you have learned from your years of training, you have to keep the business running and expand on your knowledge and increase your wealth as you slowly unravel the mystery of what has happened to your master.

Admittedly, there is some functionality and content that is not yet implemented, but in the interest of time I had to put out what I had and focus on expanding the game later on (a process not entirely unheard of in the form of DLCs, updates, etc.)

## Files

### The Engines

The two main files that drive the application are titled, simply, ```app.py``` and ```helpers.py```. ```app.py``` contains the bulk of the functionality, from the app routes to the in-game functions, where ```helpers.py``` contains some of the lower-level details and some of the bulkier (or repeated) functions that I simply wanted to move out of the main file to make it more readable as a whole.

### The Memory

```game_data.db``` is the SQL file that contains the consistent information within the game: player stats, materials, recipes, merchants, food/lodging, and the like.

### The Templates

The different menus in the game are navigated through separate HTML webpages, which route to each other using buttons contained on each page. Here's a quick guid to what each one is and what it is used for:
- ```layout.html``` - This is the layout for the app, which is used to make the in-game menu templates cleaner and easier to read. I used (from within the Flask framework) the Jinja templating language to make these "talk" to each other.
- ```index.html``` - This is the "landing page" of the app, which contains the Login and Register buttons.
- ```login.html``` - As the name implies, the login page. It is similar to the ```index.html``` template, but has fields for username and password, and a button to submit it, which sends the data to ```app.py```, compares it against the information in ```game_data.db```, and logs the user in and redirects them to ```stats.html``` if successful.
- ```register.html``` - The register page. Looks similar to the ```login.html``` page but has a second "confirm password" section, as most registry pages contain, and when a valid username and password is entered and confirmed, this page sends that data to ```app.py``` and creates a new user in the ```users``` and ```stats``` tables in ```game_data.db```.
- ```stats.html``` - Contains a small amount of information about the current player, including current experience, experience to next level, amount of gold, current and max energy, and current level.
- ```inventory.html``` - Shows all of the creations and materials that the player currently has. As I progressed with the app, I did find that this page does not have the same necessity of some of the other pages, as much of the relevant information contained herein is also displayed in the other menus in which that data is relevant, but I found it to be a nice feature so I kept it in.
- ```craft.html``` - This is really the heart of the game, the crafting page. In it, the menu displays the various recipes that the player has access to (based on their level), the amount and type of materials needed to craft them, and how much of said materials the player is in possession of. One function of this page that I was particularly proud of is that, using Jinja templating, the page will read the amounts of material that are required and possessed by the player and, if the player has enough, color the element green, otherwise red, thus giving a quick visual cue as to whether or not any particular recipe is craftable.
- ```market.html``` - The second most important page, this is where the player procures the materials needed to craft the recipes in the game, as well as where they sell said creations. There are 4 merchants on display on any given "day" who all sell different things. Later in the development of the game I implemented a level-gate for the different merchants, i.e. a merchant of level 2 will sell more valuable materials than a merchant of level 1, and will only show up to players of level 2. I also implemented a randomzation function, both in the amount of which materials the merchants have, as well as which merchants themselves will be in the market on any given day, thus simulating the effect of travelling merchants arriving in town on different days and having more (or less) materials based on different factors.
- ```tavern.html``` - This was the last of the base templates that I implemented, as it is more of a feature than part of the core mechanics. In the tavern are three sub-menus: Food, Drinks, and Lodging. I coded an energy mechanic to make things a bit more interesting; the player has a certain, limited, amount of energy based on their level, and each recipe has an amount of energy that it requries, based on its level and value. If the player does not have enough energy, they cannot craft what they want to. In the "Food" menu, the player can buy different dishes that refresh their energy by a fixed amount. In the "Drinks" section, the player can buy drinks, thereby becoming privy to various rumors as they chat with other patrons, triggering certain effects and giving them leads on discovering what has happened to their master (this, as of yet, is not very fleshed out at all, and will be a work-in-progress). In the "Lodging" section, the player can rent a room of various quality, refreshing a certain percentage of their energy and progressing the day, bringing new merchants into town and updating their inventory.


### The Style

The file ```style.css```, as the name implies, takes care of much of the design (well, that and Bootstrap). Some was left inside of the HTML, but I tried to get as much into an external file as I could (this is still an ongoing process). Other than that there are a good many files within the ```templates``` folder that are embedded into the project, from the icons that decorate buttons to the backgrounds of the game itself. Most of them are taken from open source websites on the internet (which does limit the legal use cases but for a school project it is explicitly valid), and there are 2 that I created myself using pixilart.com (an online pixel art website): ```Coin.gif```, a simple icon of a spinning gold coin, used in both the ```tavern.html``` and ```market.html``` templates, and ```BlackSmithShop.gif```, a background for the ```craft.html``` template. The latter of the two took about 15 hours to complete and, as someone who is not naturally gifted in the visual arts, I am quite proud of it.

## Future Development

While I did decide to submit the app in the state that it was in (which is still perfectly functional) it is not yet quite to the standard that I was hoping to achieve at the outset, and I do plan to continue working on it as a passion project and rerelease it in an improved state -- if not as a saleable item then at least as something my friends and family can enjoy -- much like a patch or <abbr title="Downloadable Content">DLC</abbr>.

Some features/improvements to implement:

- **More story elements:**
    - I have stated that the game is about finding out what happened to your master who mysteriously vanished, but it is not obvious from the gameplay that that is the case (short of a few vaguely arcane rumors from the tavern). This will require some JavaScript to trigger events, especially upon starting the game, that act as the "harbinger", letting the player know what is happening in the game world and implying that more info can be found in the tavern, and then expanding on the tavern rumors so that, once triggered, story-related rumors will enable more info to be gathered from other patrons, thus pushing the story forward.

- **Offload HTTP requests to JavaScript:**
    - When I first started this project, I was much more familiar and comfortable with the Python-Flask syntax needed to make a web app, but as the project progressed I have noticed that initiating an HTTP request for every game function can get pretty cumbersome and make the gameplay feel "stuttery" rather than smooth. Since then I have studied a bit more of JavaScript and feel it would make the game feel much smoother if I were to have some of the game fucntions handled by JS instead of numerous app routes through Flask. Python will still be useful for back-end, server-side verification and security but I think we can lighten its load a bit.

- **Get app running consistently on a hosted server:**
    - Sometime towards the end of my working on this project (for submission at least) I made an effort to get the app running consistently and hosted on a server, be it through the free GitHub Pages server or Heroku, which was the service I decided to explore when it came to diversifying my resources. I was, however, sorely underprepared and not knowledgeable on the process, so even with online tutorials I encountered several hurdles and could not quite get it running. Now that the deadline is less looming I can take time to experiment with app hosting (perhaps using a separate app as a prototype) and try to properly learn that process, as the goal of building a game is to have people play and enjoy it, and if it can only be run from my personal codespace it leaves no possibility for that.

- **More developer-created assets:**
    - Although it is handy, and time-efficient, to lean on open source websites to draw assets from, it severely limits the ability to make the gamespace my own: with assets that I design myself, though a time-intensive process, it will allow me to create a game that has its own look and charm. Additionally, if ever the game were in a state to bring to market then I would not likely be allowed to use many of those assets.

- **Rumor effect integration / workshop improvements:**
    - While they are fun from a world-flavor perspective, the drinks/rumors function of the ```tavern``` section is just that: flavor. What I would like to do is, as well as have them tied into the plot, have various effects that occur from hearing certain rumors -- e.g. hearing about a copper mine that recently opened up triggering a drop in copper prices for a set amount of days. Additionally, I would like to add workshop improvements -- tools and machinery, with a hefty price tag, that grant some kind of boon to the player, such as making items sell for more gold or require less energy to craft.

# Acknowledgements

While this project is still ongoing (at least for my purposes), I would like to express my gratitude for the folks that made this possible (for me and for others): EdX, David Malan, Carter, Doug, Yulia, and the rest of the team that helped put this course -- among others -- together so that becoming a programmer could become an achievable goal for those with monetary and temporal constraints. I would also like to thank my partner, who has been incredibly supportive and encouraging of me, and without whom I wouldn't be embarking on this journey either.
