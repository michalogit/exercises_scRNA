# Reynolds Dataset Analysis

This project provides a refactored and parameterized pipeline for analyzing scRNA-seq data from the Reynolds et al. dataset. It is built using the Seurat framework in R.

## Project Structure

- `Analysis.Rmd`: The primary user interface. Use this R Notebook to configure parameters and run the analysis.
- `utils.R`: Contains the underlying processing logic (data loading, preprocessing, and plotting functions).
- `Reynolds_dataset.Rproj`: RStudio project file for easy environment setup.
- `*.tsv.gz` / `*.mtx.gz`: Local copies of the 10X Genomics count matrix and metadata.


## Data

[https://zenodo.org/records/4569496]
Download: healthy.h5ad

## Prerequisites

Ensure you have R and RStudio installed, along with the following R packages:
```R
install.packages(c("Seurat", "ggplot2"))
```

## How to Run

1.  **Open the Project**: Double-click `Reynolds_dataset.Rproj` to open the project in RStudio.
2.  **Open the Notebook**: Open `Analysis.Rmd` from the file browser.
3.  **Configure Genes**: Find the `parameters` chunk and update the `target_genes` vector with the genes you wish to analyze:
    ```R
    target_genes <- c("SEMA3A", "CD3D", "CD14")
    ```
4.  **Execute**: Click **Run > Run All** (or `Cmd+Alt+R` / `Ctrl+Alt+R`) to process the data and generate the plots.

## Customization

You can modify the `grouping_var` in `Analysis.Rmd` to change how cells are grouped in the violin plots (e.g., by different clustering levels provided in `obs.tsv`).
