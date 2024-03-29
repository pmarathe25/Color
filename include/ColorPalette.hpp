#ifndef COLOR_PALETTE
#define COLOR_PALETTE
#include "Color.hpp"
#include <Tensor3>
#include <vector>

namespace StealthColor {
    class DiscreteColorPalette : public std::vector<Color> {
        public:
            DiscreteColorPalette(const DiscreteColorPalette& other) = default;

            DiscreteColorPalette(DiscreteColorPalette&& other) noexcept = default;

            DiscreteColorPalette& operator=(DiscreteColorPalette&& other) noexcept = default;

            template <typename ScalarType>
            const Color& operator()(ScalarType val) const {
                return (val >= ScalarType(1)) ? (*this)[this -> size() - 1] : (*this)[(int) (this -> size() * val)];
            }
    };

    class GradientColorPalette {
        public:
            GradientColorPalette(Color colorA, Color colorB) noexcept;

            template <typename ScalarType>
            Color operator()(ScalarType val) const noexcept {
                ScalarType inv = ScalarType(1) - val;
                return Color{(uint8_t) (inv * colorA.r + val * colorB.r), (uint8_t) (inv * colorA.g + val * colorB.g),
                    (uint8_t) (inv * colorA.b + val * colorB.b), (uint8_t) (inv * colorA.alpha + val * colorB.alpha)};
            }
        private:
            Color colorA, colorB;
    };

    template <int width, int length, int height, typename ScalarType, typename ColorPalette>
    Stealth::Tensor::Tensor3<Color, width, length, height> applyPalette(const ColorPalette& palette,
        const Stealth::Tensor::Tensor3<ScalarType, width, length, height>& map) {
        return Stealth::Tensor::apply(palette, map);
    }
} /* StealthColor */

#endif
