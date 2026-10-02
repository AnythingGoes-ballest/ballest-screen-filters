# Screen Filters

A plugin for the [Ballest plugin manager](https://github.com/AnythingGoes-ballest/ballest-plugin-manager): changes the
look of the whole game. Pick a filter and how strong it is in the plugin's settings (footer **plugins** >
**installed** > Screen Filters > **settings**). The world is filtered; the game's menus and the plugins' windows
aren't.

| Filter | The look |
|---|---|
| No filter | The game as it is |
| Noir | Black and white, deep shadows, a dark vignette |
| Old Film | A faded sepia photo with grain |
| Vaporwave | Pink and cyan 80s colours, glow and colour fringing |
| Neon Night | Dark, saturated and glowing |
| Golden Hour | A warm sunset glow |
| Arctic | Cold, blue and icy |
| Blockbuster | A teal-and-orange movie grade |
| Dreamy | Soft, hazy and glowing |
| VHS | A worn 90s tape: fringing, grain and faded colour |
| Matrix | Green, with crushed blacks |
| Game Boy | The old handheld's pea-green screen |
| Blood Moon | An ominous red |
| Pastel Candy | Bright, soft and pink |
| Underwater | A murky blue-green |
| Vivid | The same game with more punch |
| Cartoon | Bold, saturated colour with sharp edges |

**Intensity** (0 to 100%) blends the chosen filter in: 100 is the full look, lower softens it.

## Install

In the game: footer **plugins** > **browse** > Screen Filters > **install**. Needs the plugin manager host 0.21.0 or
newer.

## How it works

Each filter is a set of the engine's post-process settings (colour grading, white balance, tint, bloom, vignette,
colour fringing and film grain), put on through the host's `PostProcess` API. The intensity is the filter's blend
weight. The filter is chosen from a dropdown: a `string` setting with `choices`.

## License

MIT
