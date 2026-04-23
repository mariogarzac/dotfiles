window.CONFIG = {

  // ── Colors ────────────────────────────────────────────────────────────────
  colors: {
    bg:      "#2D353B",
    bgDark:  "#232A2E",
    bgMid:   "#343F44",
    bgSoft:  "#3D484D",
    fg:      "#D3C6AA",
    fgMuted: "#7A8478",
    cyan:    "#83C092",   // frame border + search focus
  },

  // ── Greetings by time of day ───────────────────────────────────────────────
  // morning: 5am–12pm  |  afternoon: 12pm–5pm  |  evening: 5pm–9pm  |  night: 9pm–5am
  greetings: {
    morning:   "Good morning.",
    afternoon: "Good afternoon.",
    evening:   "Good evening.",
    night:     "Burning the midnight oil.",
  },

  // ── Bird frame ────────────────────────────────────────────────────────────
  // Get a free API key at: https://nuthatch.lastelm.software/getKey.html
  bird: {
    apiKey: "4381dda5-a1ae-4a19-b182-9f10e8209b13",
  },

  // ── Icons ─────────────────────────────────────────────────────────────────
  // true: show favicons fetched via Google's favicon API
  // false: hide icons
  favicons: true,

  // ── Bookmark sections ─────────────────────────────────────────────────────
  // accent: any hex color — used for the dot and link hover
  sections: [
    {
      name: "Code",
      accent: "#7FBBB3",
      links: [
        { label: "GitHub",    url: "https://github.com" },
        { label: "Claude",    url: "https://claude.ai" },
        { label: "Escalatro", url: "http://localhost:3030/" },
        { label: "Figma",     url: "https://www.figma.com/design/VuiSkmISTmYq9afwqgJULi/Escalatro-Web-App?node-id=0-1&p=f&t=sqLh4CF5dIiJG6EJ-0" },
      ],
    },
    {
      name: "Entertainment",
      accent: "#D699B6",
      links: [
        { label: "YouTube", url: "https://youtube.com" },
        { label: "Reddit",  url: "https://reddit.com" },
        { label: "Netflix", url: "https://netflix.com" },
      ],
    },
    {
      name: "News",
      accent: "#DBBC7F",
      links: [
        { label: "Semafor",     url: "https://www.semafor.com" },
        { label: "Hacker News", url: "https://news.ycombinator.com" },
        { label: "Telokwento",  url: "https://www.telokwento.com/" },
      ],
    },
    {
      name: "Board Games",
      accent: "#A7C080",
      links: [
        { label: "Earthborne Rangers", url: "https://thelivingvalley.earthbornegames.com/docs/category/lure-of-the-valley/" },
        { label: "D&D Beyond",         url: "https://www.dndbeyond.com/en" },
      ],
    },
  ],
};
