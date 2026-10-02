// Screen Filters: changes the look of the whole game. Pick a filter in this plugin's settings (footer plugins >
// installed > Screen Filters > settings), and how strong it is.
//
// Each filter is a set of the engine's post-process settings (colour grading, white balance, tint, bloom, vignette,
// colour fringing, film grain), put on through the host's PostProcess API; the intensity is the filter's blend weight.
// The game's own menus and the plugins' windows aren't filtered, only the world.

[Setting name="Filter" choices="No filter|Noir|Old Film|Vaporwave|Neon Night|Golden Hour|Arctic|Blockbuster|Dreamy|VHS|Matrix|Game Boy|Blood Moon|Pastel Candy|Underwater|Vivid|Cartoon" description="The look the game is seen through"]
string FilterName = "No filter";

[Setting name="Intensity" min=0 max=100 description="How strong the filter is, in percent"]
float Intensity = 100;

string applied = "";

// A colour-grading setting: red, green and blue multipliers and an overall one.
void Grade(const string &in setting, double r, double g, double b, double all = 1)
{
    PostProcess::Set(setting, r, g, b, all);
}

void Set(const string &in setting, double value)
{
    PostProcess::Set(setting, value);
}

void Colour(const string &in setting, double r, double g, double b)
{
    PostProcess::Set(setting, r, g, b, 1);
}

void Apply(const string &in name)
{
    if (name == "Noir")
    {
        Grade("ColorSaturation", 0, 0, 0);
        Grade("ColorContrast", 1.4, 1.4, 1.4);
        Set("VignetteIntensity", 1);
        Set("FilmGrainIntensity", 0.3);
    }
    else if (name == "Old Film")
    {
        Grade("ColorSaturation", 0.1, 0.1, 0.1);
        Grade("ColorGain", 1.05, 0.85, 0.6);
        Grade("ColorContrast", 0.9, 0.9, 0.9);
        Grade("ColorOffset", 0.04, 0.025, 0.0, 0);
        Set("VignetteIntensity", 0.8);
        Set("FilmGrainIntensity", 0.6);
    }
    else if (name == "Vaporwave")
    {
        Grade("ColorSaturation", 1.4, 1.4, 1.4);
        Grade("ColorGainShadows", 0.9, 0.6, 1.3);
        Grade("ColorGainMidtones", 1.25, 0.8, 1.15);
        Grade("ColorGainHighlights", 0.7, 1.15, 1.25);
        Set("BloomIntensity", 2.5);
        Set("SceneFringeIntensity", 2.5);
    }
    else if (name == "Neon Night")
    {
        Set("AutoExposureBias", -1);
        Grade("ColorSaturation", 1.5, 1.5, 1.5);
        Grade("ColorGainShadows", 0.6, 0.7, 1.4);
        Grade("ColorGainHighlights", 1.3, 0.7, 1.3);
        Set("BloomIntensity", 4);
        Set("BloomThreshold", 0.5);
    }
    else if (name == "Golden Hour")
    {
        Set("WhiteTemp", 10000);
        Colour("SceneColorTint", 1.0, 0.88, 0.7);
        Grade("ColorGain", 1.15, 0.95, 0.7);
        Grade("ColorSaturation", 1.2, 1.2, 1.2);
        Grade("ColorOffsetShadows", 0.04, 0.02, 0.0, 0);
        Set("BloomIntensity", 1.5);
    }
    else if (name == "Arctic")
    {
        Set("WhiteTemp", 4000);
        Colour("SceneColorTint", 0.85, 0.95, 1.1);
        Grade("ColorSaturation", 0.55, 0.55, 0.55);
        Grade("ColorGain", 0.85, 0.97, 1.15);
        Grade("ColorGainHighlights", 1.0, 1.08, 1.2);
        Set("BloomIntensity", 0.8);
    }
    else if (name == "Blockbuster")
    {
        Grade("ColorGainShadows", 0.75, 1.0, 1.15);
        Grade("ColorGainHighlights", 1.2, 1.0, 0.8);
        Grade("ColorContrast", 1.15, 1.15, 1.15);
        Set("VignetteIntensity", 0.5);
    }
    else if (name == "Dreamy")
    {
        Set("BloomIntensity", 4);
        Grade("ColorContrast", 0.8, 0.8, 0.8);
        Grade("ColorOffset", 0.04, 0.04, 0.05, 0);
        Grade("ColorSaturation", 0.8, 0.8, 0.8);
        Grade("ColorGainHighlights", 1.05, 1.0, 1.1);
        Set("VignetteIntensity", 0.4);
    }
    else if (name == "VHS")
    {
        Set("SceneFringeIntensity", 4);
        Grade("ColorSaturation", 0.75, 0.75, 0.75);
        Grade("ColorOffset", 0.04, 0.02, 0.05, 0);
        Colour("SceneColorTint", 1.05, 0.95, 1.05);
        Set("FilmGrainIntensity", 0.8);
    }
    else if (name == "Matrix")
    {
        Grade("ColorSaturation", 0.2, 0.2, 0.2);
        Grade("ColorGain", 0.45, 1.15, 0.45);
        Grade("ColorContrast", 1.35, 1.35, 1.35);
    }
    else if (name == "Game Boy")
    {
        Grade("ColorSaturation", 0, 0, 0);
        Grade("ColorGain", 0.62, 0.8, 0.18);
        Grade("ColorContrast", 1.35, 1.35, 1.35);
        Grade("ColorOffset", 0.04, 0.06, 0.0, 0);
        Set("FilmGrainIntensity", 0.2);
    }
    else if (name == "Blood Moon")
    {
        Colour("SceneColorTint", 1.2, 0.5, 0.45);
        Grade("ColorSaturation", 0.8, 0.8, 0.8);
        Set("AutoExposureBias", -0.5);
        Set("VignetteIntensity", 0.9);
        Colour("VignetteColor", 0.4, 0, 0);
    }
    else if (name == "Pastel Candy")
    {
        Grade("ColorGamma", 1.25, 1.25, 1.25);
        Grade("ColorContrast", 0.8, 0.8, 0.8);
        Grade("ColorSaturation", 0.8, 0.8, 0.8);
        Grade("ColorGain", 1.08, 0.95, 1.05);
        Grade("ColorGainHighlights", 1.1, 0.95, 1.05);
        Grade("ColorOffset", 0.03, 0.02, 0.03, 0);
    }
    else if (name == "Underwater")
    {
        Grade("ColorSaturation", 0.6, 0.6, 0.6);
        Grade("ColorGain", 0.45, 0.85, 0.95);
        Set("AutoExposureBias", -0.3);
        Set("SceneFringeIntensity", 2);
        Set("VignetteIntensity", 0.9);
        Colour("VignetteColor", 0, 0.05, 0.1);
        Set("BloomIntensity", 1.5);
    }
    else if (name == "Vivid")
    {
        Grade("ColorSaturation", 1.4, 1.4, 1.4);
        Grade("ColorContrast", 1.15, 1.15, 1.15);
        Set("BloomIntensity", 1.2);
    }
    else if (name == "Cartoon")
    {
        Grade("ColorSaturation", 1.8, 1.8, 1.8);
        Grade("ColorContrast", 1.4, 1.4, 1.4);
        Grade("ColorGamma", 0.9, 0.9, 0.9);
        Set("Sharpen", 5);
        Set("BloomIntensity", 0);
    }
}

void OnSettingsChanged()
{
    if (FilterName != applied)
    {
        PostProcess::Clear();
        Apply(FilterName);
        applied = FilterName;
    }
    if (FilterName != "No filter")
        PostProcess::SetWeight(Intensity / 100);
}

void Main()
{
    OnSettingsChanged();
}
