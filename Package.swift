// swift-tools-version:5.7
import PackageDescription

let package = Package(
  name: "MaterialComponents",
  platforms: [
    .iOS(.v11)
  ],
  products: [
    .library(name: "MDCTextFields", targets: ["TextFields"]),
    .library(name: "MDCTextFieldsColorThemer", targets: ["TextFieldsColorThemer"]),
    .library(name: "MDCTextFieldsTheming", targets: ["TextFieldsTheming"]),
    .library(name: "MDCActivityIndicator", targets: ["ActivityIndicator"]),
  ],
  dependencies: [
    .package(url: "https://github.com/homersoft/material-internationalization-ios", revision: "f767f351139a1f097352e206e8962755f0efb55e"),
    .package(url: "https://github.com/homersoft/material-text-accessibility-ios", revision: "8584fcc35eacfe7859e8ae8d35a4c31a234b29e6"),
    .package(url: "https://github.com/homersoft/motion-animator-objc", revision: "87804cb6f141e0c923c2d653aec207397a71073b"),
    .package(url: "https://github.com/homersoft/motion-interchange-objc", revision: "331347547cc5a42273ce17620630c3df5cf9ff82"),
  ],
  targets: [
    .target(
      name: "TextFields",
      dependencies: [
        "AnimationTiming",
        "Buttons",
        "Elevation",
        "Palettes",
        "Typography",
        "PrivateMath",
        "SchemesContainer",
        .product(name: "MDFInternationalization", package: "material-internationalization-ios"),
      ],
      path: "components/TextFields/src",
      exclude: [
        "ColorThemer",
        "Theming",
        "MaterialTextFields.bundle",
      ],
      publicHeadersPath: "."
    ),
    .target(
      name: "TextFieldsColorThemer",
      dependencies: ["TextFields", "Themes"],
      path: "components/TextFields/src/ColorThemer",
      publicHeadersPath: "."
    ),
    .target(
      name: "TextFieldsTheming",
      dependencies: ["TextFields", "TextFieldsColorThemer", "SchemesContainer"],
      path: "components/TextFields/src/Theming",
      publicHeadersPath: "."
    ),
    .target(
      name: "ActivityIndicator",
      dependencies: [
        "MinimumOS",
        "Palettes",
        "PrivateApplication",
        .product(name: "MDFInternationalization", package: "material-internationalization-ios"),
        .product(name: "MotionAnimator", package: "motion-animator-objc"),
        .product(name: "MotionInterchange", package: "motion-interchange-objc"),
      ],
      path: "components/ActivityIndicator/src",
      exclude: [
        "MaterialActivityIndicator.bundle",
      ],
      publicHeadersPath: "."
    ),

    .target(
      name: "AnimationTiming",
      dependencies: ["MinimumOS"],
      path: "components/AnimationTiming/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "MinimumOS",
      path: "components/MinimumOS/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "Availability",
      path: "components/Availability/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "Buttons",
      dependencies: [
        .product(name: "MDFInternationalization", package: "material-internationalization-ios"),
        .product(name: "MDFTextAccessibility", package: "material-text-accessibility-ios"),
        "Elevation",
        "Ink",
        "Ripple",
        "Shadow",
        "ShadowElevations",
        "ShadowLayer",
        "ShapeLibrary",
        "Shapes",
        "Typography",
        "PrivateMath",
        "SchemesColor",
        "SchemesShape",
        "SchemesTypography",
        "SchemesContainer",
      ],
      path: "components/Buttons/src",
      exclude: [
        "ButtonThemer",
        "ColorThemer",
        "PerformantShadowMigration",
        "ShapeThemer",
        "Theming",
        "TypographyThemer",
      ],
      publicHeadersPath: "."
    ),
    .target(
      name: "Elevation",
      dependencies: ["Availability", "Color", "PrivateColor", "PrivateMath"],
      path: "components/Elevation/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "Color",
      path: "components/Color/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "Ink",
      dependencies: ["Availability", "PrivateColor", "PrivateMath"],
      path: "components/Ink/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "Ripple",
      dependencies: ["AnimationTiming", "Availability", "PrivateColor", "PrivateMath"],
      path: "components/Ripple/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "Shadow",
      dependencies: ["Availability"],
      path: "components/Shadow/src",
      exclude: ["Animations"],
      publicHeadersPath: "."
    ),
    .target(
      name: "ShadowElevations",
      path: "components/ShadowElevations/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "ShadowLayer",
      dependencies: ["ShadowElevations"],
      path: "components/ShadowLayer/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "ShapeLibrary",
      dependencies: ["Shapes", "PrivateMath"],
      path: "components/ShapeLibrary/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "Shapes",
      dependencies: ["ShadowLayer", "PrivateColor", "PrivateMath"],
      path: "components/Shapes/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "Typography",
      dependencies: [
        "PrivateApplication",
        "PrivateMath",
        .product(name: "MDFTextAccessibility", package: "material-text-accessibility-ios"),
      ],
      path: "components/Typography/src",
      exclude: ["FontLoader"],
      publicHeadersPath: "."
    ),
    .target(
      name: "Palettes",
      path: "components/Palettes/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "Themes",
      dependencies: ["SchemesColor", "SchemesTypography"],
      path: "components/Themes/src",
      publicHeadersPath: "."
    ),

    .target(
      name: "SchemesColor",
      dependencies: ["Availability", "PrivateColor"],
      path: "components/schemes/Color/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "SchemesContainer",
      dependencies: ["SchemesColor", "SchemesTypography", "SchemesShape"],
      path: "components/schemes/Container/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "SchemesShape",
      dependencies: ["ShapeLibrary", "Shapes"],
      path: "components/schemes/Shape/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "SchemesTypography",
      dependencies: ["Typography", "SchemesTypographyBasicFontScheme", "SchemesTypographyScheming"],
      path: "components/schemes/Typography/src",
      exclude: ["BasicFontScheme", "Scheming"],
      publicHeadersPath: ".",
      cSettings: [
        .headerSearchPath("../../../Typography/src/FontScaler")
      ]
    ),
    .target(
      name: "SchemesTypographyBasicFontScheme",
      path: "components/schemes/Typography/src/BasicFontScheme",
      publicHeadersPath: "."
    ),
    .target(
      name: "SchemesTypographyScheming",
      path: "components/schemes/Typography/src/Scheming",
      publicHeadersPath: "."
    ),

    .target(
      name: "PrivateApplication",
      path: "components/private/Application/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "PrivateColor",
      dependencies: ["Availability"],
      path: "components/private/Color/src",
      publicHeadersPath: "."
    ),
    .target(
      name: "PrivateMath",
      path: "components/private/Math/src",
      publicHeadersPath: "."
    ),
  ]
)
