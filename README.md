# exercises_scRNA

This repository contains small, focused exercises for single-cell RNA-seq analysis in R.

The current project analyzes the public Lutdge et al. dataset with Seurat. It converts
SingleCellExperiment objects into Seurat objects, combines lymph node stromal and immune
cell datasets, and generates violin plots for selected marker genes across resting and
inflamed conditions.

## Current analysis

The `Lutdge_dataset` folder includes:

- `Lutdge_Analysis.Rmd`: R notebook that loads LEC, BEC, FRC, and IMM single-cell
  datasets, merges selected cell populations, and runs the plotting workflow.
- `revision1.R`: earlier revision-style plotting code used for side-by-side
  condition comparisons and broader merged-cell-type views.
- `Lutdge_dataset_refactored.Rproj`: RStudio project file for the analysis.

## What the workflow does

1. Loads `.rds` files containing SingleCellExperiment objects for lymphatic
   endothelial cells, blood endothelial cells, fibroblastic reticular cells, and
   immune cells.
2. Converts the input objects into Seurat objects for downstream analysis.
3. Builds merged Seurat objects to compare structural and immune cell populations.
4. Lets the user choose genes of interest, such as `SEMA3A` and `PROX1`.
5. Maps gene symbols to the dataset feature names.
6. Creates violin plots comparing expression across annotated cell types and
   inflammatory states.

Large input data files and generated plot outputs are expected to stay out of the
repository so the GitHub project remains lightweight.
