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

  // ── Bookmark sections ─────────────────────────────────────────────────────
  // accent: any hex color — used for the dot, icon tint, and link hover
  // icon: any character or emoji shown next to each link
  sections: [
    {
      name: "Code",
      accent: "#7FBBB3",
      links: [
        { label: "GitHub",           icon: "⌥",  url: "https://github.com" },
        { label: "Claude",           icon: "◆",  url: "https://claude.ai" },
        { label: "Apple Dev Docs",   icon: "⌘",  url: "https://developer.apple.com/documentation" },
        { label: "Hacker News",      icon: "▲",  url: "https://news.ycombinator.com" },
      ],
    },
    {
      name: "Entertainment",
      accent: "#D699B6",
      links: [
        { label: "YouTube",  icon: "▶",  url: "https://youtube.com" },
        { label: "Reddit",   icon: "○",  url: "https://reddit.com" },
        { label: "Netflix",  icon: "N",  url: "https://netflix.com" },
        { label: "Spotify",  icon: "♪",  url: "https://open.spotify.com" },
      ],
    },
    {
      name: "News",
      accent: "#DBBC7F",
      links: [
        { label: "Semafor",     icon: "◉",  url: "https://www.semafor.com" },
        { label: "Hacker News", icon: "▲",  url: "https://news.ycombinator.com" },
        { label: "404 Media",   icon: "⚡", url: "https://www.404media.co" },
        { label: "The Verge",   icon: "V",  url: "https://www.theverge.com" },
      ],
    },
    {
      name: "Board Games",
      accent: "#A7C080",
      links: [
        { label: "BoardGameGeek",      icon: "⬡",  url: "https://boardgamegeek.com" },
        { label: "Board Game Arena",   icon: "♟",  url: "https://boardgamearena.com" },
        { label: "r/boardgames",       icon: "○",  url: "https://www.reddit.com/r/boardgames" },
        { label: "Shut Up & Sit Down", icon: "★",  url: "https://www.shutupandsitdown.com" },
      ],
    },
  ],
};
