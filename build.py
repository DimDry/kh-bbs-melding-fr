#!/usr/bin/env python3
"""Génère index.html à partir de template.html + recipes.json + i18n-en.json + obtention.json.

Usage:
    python3 build.py            # écrit index.html (page autonome, ouvrable directement)
    python3 build.py --fragment out.html   # écrit un fragment sans <html>/<head>/<body>,
                                            # pratique pour republier sur un artefact Claude
"""
import sys
import json

def build_fragment():
    data = open("recipes.json", encoding="utf-8").read()
    # validate JSON early so a corrupt data file fails loudly
    json.loads(data)
    en = open("i18n-en.json", encoding="utf-8").read()
    json.loads(en)
    ob = open("obtention.json", encoding="utf-8").read()
    json.loads(ob)
    tpl = open("template.html", encoding="utf-8").read()
    safe = lambda t: t.replace("</script", "<\\/script")
    return tpl.replace("__RECIPES_JSON__", safe(data)).replace("__I18N_EN_JSON__", safe(en)).replace("__OBTENTION_JSON__", safe(ob))

def build_standalone(fragment):
    head, body = fragment.split("</style>", 1)
    return (
        "<!DOCTYPE html>\n"
        "<html lang=\"fr\">\n"
        "<head>\n"
        "<meta charset=\"UTF-8\">\n"
        "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
        "<link rel=\"icon\" type=\"image/svg+xml\" href=\"icon.svg\">\n"
        + head + "</style>\n"
        "</head>\n"
        "<body>\n"
        + body +
        "\n</body>\n</html>\n"
    )

if __name__ == "__main__":
    fragment = build_fragment()
    if "--fragment" in sys.argv:
        i = sys.argv.index("--fragment")
        out_path = sys.argv[i + 1] if i + 1 < len(sys.argv) else "fragment.html"
        open(out_path, "w", encoding="utf-8").write(fragment)
        print("Fragment écrit :", out_path)
    else:
        out = build_standalone(fragment)
        open("index.html", "w", encoding="utf-8").write(out)
        print("index.html régénéré (", len(out), "octets )")
