#include "ColorPalette.hpp"

namespace StealthColor {
    GradientColorPalette::GradientColorPalette(Color colorA, Color colorB) noexcept
        : colorA(std::move(colorA)), colorB(std::move(colorB)) { }
} /* StealthColor */
