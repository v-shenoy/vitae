# vitae

Clean and simple CV template using [Typst](https://typst.app/) with data-loading from YAML. You can find a sample CV [here](./cv.pdf).

## Usage

> **Note:** This template requires the [typst CLI](https://github.com/typst/typst) to be installed.

1. Copy all your assets to the appropriate folder under `./assets`.
2. Update your information in the `data.yaml` file.
3. Run `$ typst compile vitae.typ cv.pdf --font-path ./assets/fonts`.
