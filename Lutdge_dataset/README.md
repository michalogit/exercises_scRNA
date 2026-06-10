# Lutdge et al. Dataset Analysis

This folder contains R code for analyzing the public Lutdge et al. single-cell
RNA-seq dataset and generating marker-gene violin plots across lymph node cell
types and inflammatory states.

## Structure

- `Lutdge_Analysis.Rmd`: R notebook for loading the datasets, creating merged
  Seurat objects, and running the plotting workflow.
- `revision1.R`: earlier plotting script with revision-style comparisons,
  including side-by-side resting/inflamed LEC plots and broad merged cell-type
  views.
- `Lutdge_dataset_refactored.Rproj`: RStudio project file.
- `.gitignore`: configured to ignore large data files and generated outputs.

## Usage

1. **Data setup**:
   Ensure that the `SingleCellExperiment` `.rds` files for LEC, BEC, FRC, and
   IMM are available in this folder or linked from the local data directory:

   - `LEC_sce.rds`
   - `BEC_sce.rds`
   - `FRC_sce.rds`
   - `IMM_sce.rds`

2. **Configuration**:
   Open `Lutdge_Analysis.Rmd` and modify the `symbols_to_plot` vector to include
   the gene symbols you wish to visualize:

   ```r
   symbols_to_plot <- c("SEMA3A", "PROX1", "YOUR_GENE")
   ```

3. **Running the analysis**:
   Run the notebook in RStudio. The workflow:

   - Converts input `SingleCellExperiment` objects to Seurat objects.
   - Merges LEC, BEC, FRC, and IMM datasets where needed.
   - Maps gene symbols to the dataset's internal Ensembl-symbol identifiers.
   - Generates violin plots for resting and inflamed conditions.
   - Produces revision-style comparisons for selected marker genes.

## Key Functions

- `get_feature_name(obj, symbol)`: finds the full feature ID for a gene symbol.
- `save_vln_plot(...)`: generates and saves a formatted Seurat violin plot.
- `run_plotting_suite(...)`: runs a batch of plots for a dataset and gene list.
- `run_revision_side_by_side(...)`: creates resting/inflamed LEC comparisons.
- `run_broad_merged_comparison(...)`: compares selected markers across broad
  immune and stromal cell classes.
