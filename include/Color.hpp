#ifndef COLOR_H
#define COLOR_H
#include <cstdint>
#include <string>

namespace StealthColor {
    class Color {
        public:
            // Constructors
            Color() noexcept = default;
            Color(uint8_t r, uint8_t g, uint8_t b, uint8_t alpha = 255) noexcept;
            Color(uint32_t rgba) noexcept;
            // Copy the whole color in a single instruction.
            Color(const Color& other) noexcept;
            // Data
            constexpr uint32_t* data() noexcept;
            constexpr const uint32_t* data() const noexcept;
            // Data memebers
            uint8_t r, g, b, alpha;
    };
} /* StealthColor */

inline std::string to_string(const StealthColor::Color& tile) {
    return "(" + std::to_string(tile.r) + ", " + std::to_string(tile.g) + ", " + std::to_string(tile.b) + ", " + std::to_string(tile.alpha) + ")";
}

#endif
