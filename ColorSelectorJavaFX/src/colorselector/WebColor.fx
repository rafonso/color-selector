/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package colorselector;

import javafx.scene.paint.Color;

/**
 * @author rafael
 */
public class WebColor {

    public-init var name: String;

    public-init var red: Integer;

    public-init var green: Integer;

    public-init var blue: Integer;

    public-init var defined: Boolean = true;

    override function toString(): String {
        name
    }

    public function getColor(): Color { Color.rgb(this.red, this.green, this.blue) }

}

// http://www.w3.org/TR/css3-color/#svg-color
public def values: WebColor[] = [
            WebColor { name: "UNDEFINED", red: 0, green: 0, blue: 0, defined: false },
            WebColor { name: "ALICEBLUE", red: 240, green: 248, blue: 255 },
            WebColor { name: "ANTIQUEWHITE", red: 250, green: 235, blue: 215 },
            WebColor { name: "AQUA", red: 0, green: 255, blue: 255 },
            WebColor { name: "AQUAMARINE", red: 127, green: 255, blue: 212 },
            WebColor { name: "AZURE", red: 240, green: 255, blue: 255 },
            WebColor { name: "BEIGE", red: 245, green: 245, blue: 220 },
            WebColor { name: "BISQUE", red: 255, green: 228, blue: 196 },
            WebColor { name: "BLACK", red: 0, green: 0, blue: 0 },
            WebColor { name: "BLANCHEDALMOND", red: 255, green: 235, blue: 205 },
            WebColor { name: "BLUE", red: 0, green: 0, blue: 255 },
            WebColor { name: "BLUEVIOLET", red: 138, green: 43, blue: 226 },
            WebColor { name: "BROWN", red: 165, green: 42, blue: 42 },
            WebColor { name: "BURLYWOOD", red: 222, green: 184, blue: 135 },
            WebColor { name: "CADETBLUE", red: 95, green: 158, blue: 160 },
            WebColor { name: "CHARTREUSE", red: 127, green: 255, blue: 0 },
            WebColor { name: "CHOCOLATE", red: 210, green: 105, blue: 30 },
            WebColor { name: "CORAL", red: 255, green: 127, blue: 80 },
            WebColor { name: "CORNFLOWERBLUE", red: 100, green: 149, blue: 237 },
            WebColor { name: "CORNSILK", red: 255, green: 248, blue: 220 },
            WebColor { name: "CRIMSON", red: 220, green: 20, blue: 60 },
            WebColor { name: "CYAN", red: 0, green: 255, blue: 255 },
            WebColor { name: "DARKBLUE", red: 0, green: 0, blue: 139 },
            WebColor { name: "DARKCYAN", red: 0, green: 139, blue: 139 },
            WebColor { name: "DARKGOLDENROD", red: 184, green: 134, blue: 11 },
            WebColor { name: "DARKGRAY", red: 169, green: 169, blue: 169 },
            WebColor { name: "DARKGREEN", red: 0, green: 100, blue: 0 },
            WebColor { name: "DARKGREY", red: 169, green: 169, blue: 169 },
            WebColor { name: "DARKKHAKI", red: 189, green: 183, blue: 107 },
            WebColor { name: "DARKMAGENTA", red: 139, green: 0, blue: 139 },
            WebColor { name: "DARKOLIVEGREEN", red: 85, green: 107, blue: 47 },
            WebColor { name: "DARKORANGE", red: 255, green: 140, blue: 0 },
            WebColor { name: "DARKORCHID", red: 153, green: 50, blue: 204 },
            WebColor { name: "DARKRED", red: 139, green: 0, blue: 0 },
            WebColor { name: "DARKSALMON", red: 233, green: 150, blue: 122 },
            WebColor { name: "DARKSEAGREEN", red: 143, green: 188, blue: 143 },
            WebColor { name: "DARKSLATEBLUE", red: 72, green: 61, blue: 139 },
            WebColor { name: "DARKSLATEGRAY", red: 47, green: 79, blue: 79 },
            WebColor { name: "DARKSLATEGREY", red: 47, green: 79, blue: 79 },
            WebColor { name: "DARKTURQUOISE", red: 0, green: 206, blue: 209 },
            WebColor { name: "DARKVIOLET", red: 148, green: 0, blue: 211 },
            WebColor { name: "DEEPPINK", red: 255, green: 20, blue: 147 },
            WebColor { name: "DEEPSKYBLUE", red: 0, green: 191, blue: 255 },
            WebColor { name: "DIMGRAY", red: 105, green: 105, blue: 105 },
            WebColor { name: "DIMGREY", red: 105, green: 105, blue: 105 },
            WebColor { name: "DODGERBLUE", red: 30, green: 144, blue: 255 },
            WebColor { name: "FIREBRICK", red: 178, green: 34, blue: 34 },
            WebColor { name: "FLORALWHITE", red: 255, green: 250, blue: 240 },
            WebColor { name: "FORESTGREEN", red: 34, green: 139, blue: 34 },
            WebColor { name: "FUCHSIA", red: 255, green: 0, blue: 255 },
            WebColor { name: "GAINSBORO", red: 220, green: 220, blue: 220 },
            WebColor { name: "GHOSTWHITE", red: 248, green: 248, blue: 255 },
            WebColor { name: "GOLD", red: 255, green: 215, blue: 0 },
            WebColor { name: "GOLDENROD", red: 218, green: 165, blue: 32 },
            WebColor { name: "GRAY", red: 128, green: 128, blue: 128 },
            WebColor { name: "GREEN", red: 0, green: 128, blue: 0 },
            WebColor { name: "GREENYELLOW", red: 173, green: 255, blue: 47 },
            WebColor { name: "GREY", red: 128, green: 128, blue: 128 },
            WebColor { name: "HONEYDEW", red: 240, green: 255, blue: 240 },
            WebColor { name: "HOTPINK", red: 255, green: 105, blue: 180 },
            WebColor { name: "INDIANRED", red: 205, green: 92, blue: 92 },
            WebColor { name: "INDIGO", red: 75, green: 0, blue: 130 },
            WebColor { name: "IVORY", red: 255, green: 255, blue: 240 },
            WebColor { name: "KHAKI", red: 240, green: 230, blue: 140 },
            WebColor { name: "LAVENDER", red: 230, green: 230, blue: 250 },
            WebColor { name: "LAVENDERBLUSH", red: 255, green: 240, blue: 245 },
            WebColor { name: "LAWNGREEN", red: 124, green: 252, blue: 0 },
            WebColor { name: "LEMONCHIFFON", red: 255, green: 250, blue: 205 },
            WebColor { name: "LIGHTBLUE", red: 173, green: 216, blue: 230 },
            WebColor { name: "LIGHTCORAL", red: 240, green: 128, blue: 128 },
            WebColor { name: "LIGHTCYAN", red: 224, green: 255, blue: 255 },
            WebColor { name: "LIGHTGOLDENRODYELLOW", red: 250, green: 250, blue: 210 },
            WebColor { name: "LIGHTGRAY", red: 211, green: 211, blue: 211 },
            WebColor { name: "LIGHTGREEN", red: 144, green: 238, blue: 144 },
            WebColor { name: "LIGHTGREY", red: 211, green: 211, blue: 211 },
            WebColor { name: "LIGHTPINK", red: 255, green: 182, blue: 193 },
            WebColor { name: "LIGHTSALMON", red: 255, green: 160, blue: 122 },
            WebColor { name: "LIGHTSEAGREEN", red: 32, green: 178, blue: 170 },
            WebColor { name: "LIGHTSKYBLUE", red: 135, green: 206, blue: 250 },
            WebColor { name: "LIGHTSLATEGRAY", red: 119, green: 136, blue: 153 },
            WebColor { name: "LIGHTSLATEGREY", red: 119, green: 136, blue: 153 },
            WebColor { name: "LIGHTSTEELBLUE", red: 176, green: 196, blue: 222 },
            WebColor { name: "LIGHTYELLOW", red: 255, green: 255, blue: 224 },
            WebColor { name: "LIME", red: 0, green: 255, blue: 0 },
            WebColor { name: "LIMEGREEN", red: 50, green: 205, blue: 50 },
            WebColor { name: "LINEN", red: 250, green: 240, blue: 230 },
            WebColor { name: "MAGENTA", red: 255, green: 0, blue: 255 },
            WebColor { name: "MAROON", red: 128, green: 0, blue: 0 },
            WebColor { name: "MEDIUMAQUAMARINE", red: 102, green: 205, blue: 170 },
            WebColor { name: "MEDIUMBLUE", red: 0, green: 0, blue: 205 },
            WebColor { name: "MEDIUMORCHID", red: 186, green: 85, blue: 211 },
            WebColor { name: "MEDIUMPURPLE", red: 147, green: 112, blue: 219 },
            WebColor { name: "MEDIUMSEAGREEN", red: 60, green: 179, blue: 113 },
            WebColor { name: "MEDIUMSLATEBLUE", red: 123, green: 104, blue: 238 },
            WebColor { name: "MEDIUMSPRINGGREEN", red: 0, green: 250, blue: 154 },
            WebColor { name: "MEDIUMTURQUOISE", red: 72, green: 209, blue: 204 },
            WebColor { name: "MEDIUMVIOLETRED", red: 199, green: 21, blue: 133 },
            WebColor { name: "MIDNIGHTBLUE", red: 25, green: 25, blue: 112 },
            WebColor { name: "MINTCREAM", red: 245, green: 255, blue: 250 },
            WebColor { name: "MISTYROSE", red: 255, green: 228, blue: 225 },
            WebColor { name: "MOCCASIN", red: 255, green: 228, blue: 181 },
            WebColor { name: "NAVAJOWHITE", red: 255, green: 222, blue: 173 },
            WebColor { name: "NAVY", red: 0, green: 0, blue: 128 },
            WebColor { name: "OLDLACE", red: 253, green: 245, blue: 230 },
            WebColor { name: "OLIVE", red: 128, green: 128, blue: 0 },
            WebColor { name: "OLIVEDRAB", red: 107, green: 142, blue: 35 },
            WebColor { name: "ORANGE", red: 255, green: 165, blue: 0 },
            WebColor { name: "ORANGERED", red: 255, green: 69, blue: 0 },
            WebColor { name: "ORCHID", red: 218, green: 112, blue: 214 },
            WebColor { name: "PALEGOLDENROD", red: 238, green: 232, blue: 170 },
            WebColor { name: "PALEGREEN", red: 152, green: 251, blue: 152 },
            WebColor { name: "PALETURQUOISE", red: 175, green: 238, blue: 238 },
            WebColor { name: "PALEVIOLETRED", red: 219, green: 112, blue: 147 },
            WebColor { name: "PAPAYAWHIP", red: 255, green: 239, blue: 213 },
            WebColor { name: "PEACHPUFF", red: 255, green: 218, blue: 185 },
            WebColor { name: "PERU", red: 205, green: 133, blue: 63 },
            WebColor { name: "PINK", red: 255, green: 192, blue: 203 },
            WebColor { name: "PLUM", red: 221, green: 160, blue: 221 },
            WebColor { name: "POWDERBLUE", red: 176, green: 224, blue: 230 },
            WebColor { name: "PURPLE", red: 128, green: 0, blue: 128 },
            WebColor { name: "RED", red: 255, green: 0, blue: 0 },
            WebColor { name: "ROSYBROWN", red: 188, green: 143, blue: 143 },
            WebColor { name: "ROYALBLUE", red: 65, green: 105, blue: 225 },
            WebColor { name: "SADDLEBROWN", red: 139, green: 69, blue: 19 },
            WebColor { name: "SALMON", red: 250, green: 128, blue: 114 },
            WebColor { name: "SANDYBROWN", red: 244, green: 164, blue: 96 },
            WebColor { name: "SEAGREEN", red: 46, green: 139, blue: 87 },
            WebColor { name: "SEASHELL", red: 255, green: 245, blue: 238 },
            WebColor { name: "SIENNA", red: 160, green: 82, blue: 45 },
            WebColor { name: "SILVER", red: 192, green: 192, blue: 192 },
            WebColor { name: "SKYBLUE", red: 135, green: 206, blue: 235 },
            WebColor { name: "SLATEBLUE", red: 106, green: 90, blue: 205 },
            WebColor { name: "SLATEGRAY", red: 112, green: 128, blue: 144 },
            WebColor { name: "SLATEGREY", red: 112, green: 128, blue: 144 },
            WebColor { name: "SNOW", red: 255, green: 250, blue: 250 },
            WebColor { name: "SPRINGGREEN", red: 0, green: 255, blue: 127 },
            WebColor { name: "STEELBLUE", red: 70, green: 130, blue: 180 },
            WebColor { name: "TAN", red: 210, green: 180, blue: 140 },
            WebColor { name: "TEAL", red: 0, green: 128, blue: 128 },
            WebColor { name: "THISTLE", red: 216, green: 191, blue: 216 },
            WebColor { name: "TOMATO", red: 255, green: 99, blue: 71 },
            WebColor { name: "TURQUOISE", red: 64, green: 224, blue: 208 },
            WebColor { name: "VIOLET", red: 238, green: 130, blue: 238 },
            WebColor { name: "WHEAT", red: 245, green: 222, blue: 179 },
            WebColor { name: "WHITE", red: 255, green: 255, blue: 255 },
            WebColor { name: "WHITESMOKE", red: 245, green: 245, blue: 245 },
            WebColor { name: "YELLOW", red: 255, green: 255, blue: 0 },
            WebColor { name: "YELLOWGREEN", red: 154, green: 205, blue: 50 }
        ];

