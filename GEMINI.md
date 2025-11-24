# GEMINI.md - Project Context

## 1. Project Overview

This project is the source code for a technical book titled "챗GPT 코딩" (ChatGPT Coding). It is built using the [Quarto](https://quarto.org/) publishing system. 

The book's core philosophy is to teach a modern, professional approach to data science and AI engineering. It aims to bridge the gap between data scientists and AI engineers by teaching readers how to build **AI-Native Systems**: robust, reproducible, automated data pipelines that intelligently leverage AI components.

### Key Technologies:

*   **Content:** Quarto Markdown (`.qmd`)
*   **Core Languages:** R and Python
*   **System Automation:** Make, Shell
*   **Reproducibility:** Git, Docker, `renv` (for R), `pip` (for Python)
*   **AI Integration:** Large Language Model (LLM) APIs

### Architecture:

The project is structured as a Quarto book. 

*   `_quarto.yml` is the main configuration file, defining the book's structure, metadata, and build options.
*   Content is written in `.qmd` files, which are organized into parts and chapters within `_quarto.yml`.
*   The final output is a static HTML web book, rendered to the `docs/` directory.
*   The project includes custom R scripts (`_common.R`) to ensure consistent styling for plots and tables.
*   It has a formal testing structure in the `tests/` directory.

## 2. Building and Running

### Dependency Management

The project uses a hybrid dependency management system.

*   **R Dependencies:** Managed by `renv`. To restore the R environment, run the following command in an R console:
    ```R
    renv::restore()
    ```
*   **Python Dependencies:** Managed by `pip` and `requirements.txt`. To install Python packages, run the following command in your terminal:
    ```sh
    pip install -r requirements.txt
    ```

### Local Development

To preview the book in a local web server that auto-reloads on changes:

```sh
quarto preview
```

### Building the Book

To render the final HTML book to the `docs/` directory:

```sh
quarto render
```

### Testing

The project has a dedicated `tests/` directory for both R and Python tests.

*   **To run R tests (using `testthat`):**
    ```R
    testthat::test_dir("tests/")
    ```
*   **To run Python tests (using `pytest`):**
    ```sh
    pytest
    ```

## 3. Development Conventions

*   **Language:** All content is written in **Korean**.
*   **File Format:** Chapters must be in Quarto Markdown (`.qmd`).
*   **Book Structure:** The canonical book structure (chapter order, parts) is defined in `_quarto.yml`. All new chapters must be added there.
*   **Styling:** The project uses custom styling defined in `r2bit.scss`. R-based outputs like plots and tables have custom themes defined in `_common.R` to ensure a consistent look and feel.
*   **Core Philosophy:** All new content should align with the core philosophy outlined in `00-why.qmd`: teaching readers to build robust, reproducible, and automated AI-Native Systems.
