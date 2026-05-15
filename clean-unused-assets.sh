#!/bin/bash
# clean-unused-assets.sh — delete the asset files Direction 6 no longer references.
# Run from inside the 06-editorial-standalone/ folder on your Mac.
# Files this DELETES are listed below; the 13 referenced files are preserved.

set -e
cd "$(dirname "$0")/assets/images"

# Keep only these 13 files (everything referenced by HTML/CSS):
#   Magenta.webp
#   anatomy_of_breakthrough.webp
#   cult_of_creativity.webp
#   hashtagdisrupt.webp
#   how_great_ideas.webp
#   leaf.webp
#   magenta_teaches.webp
#   mortgage.webp
#   mothers.webp
#   new-york-life.webp
#   samsung_explore1.webp
#   true_color.webp
#   wearables.webp

echo 'Removing unused images…'
rm -f "FC_006.jpg"
rm -f "FC_006.webp"
rm -f "Magenta.jpg"
rm -f "anatomy_of_breakthrough.jpg"
rm -f "chuckII.jpg"
rm -f "chuckII.png"
rm -f "chuckII.webp"
rm -f "claisse_2.jpg"
rm -f "crib.jpg"
rm -f "crib.webp"
rm -f "cult_of_creativity.jpg"
rm -f "empire_of_sum.jpg"
rm -f "empire_of_sum.webp"
rm -f "gender.jpg"
rm -f "gender.webp"
rm -f "genevieve_claisse_petit_grumeau_2.jpg"
rm -f "genevieve_claisse_petit_grumeau_2.webp"
rm -f "hashtagdisrupt.jpg"
rm -f "how_great_ideas.jpg"
rm -f "iBauhaus.jpg"
rm -f "indistractable.jpg"
rm -f "indistractable.webp"
rm -f "leaf.jpg"
rm -f "longing_for_less.jpg"
rm -f "longing_for_less.webp"
rm -f "magenta_teaches.jpg"
rm -f "mortgage_xl-l_2400x864.jpg"
rm -f "mothers.jpg"
rm -f "new-york-life.avif"
rm -f "no_compromise.jpg"
rm -f "no_compromise.webp"
rm -f "power_small.jpg"
rm -f "power_small.webp"
rm -f "samsung_explore1.jpg"
rm -f "slouch.jpg"
rm -f "slouch.webp"
rm -f "small.jpg"
rm -f "small.webp"
rm -f "syp_office.jpg"
rm -f "syp_office.webp"
rm -f "true_color.jpg"
rm -f "warhol.jpg"
rm -f "warhol.webp"
rm -f "wearables.jpg"
rm -f "wsj_03.jpg"
rm -f "wsj_04.jpg"
rm -f "wsj_04.webp"

echo 'Removing unused subdirectories…'
rm -rf "clients"
rm -rf "icons"
rm -rf "little"
rm -rf "_originals"

echo 'Done.'
ls -lh
