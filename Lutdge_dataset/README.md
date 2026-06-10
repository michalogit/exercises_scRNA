# Lutdge et al. Dataset Analysis (Dataset Refactored)

This folder contains refactored R code for analyzing and plotting violin plots from the Lutdge et al. public dataset.

## Structure
- `utils.R`: Contains core helper functions for data conversion and standardized plotting.
- `Lutdge_Analysis.Rmd`: R Notebook for running the analysis and generating plots.
- `.gitignore`: Configured to ignore large data files (.rds) and generated outputs (.pdf, .png).

## Usage
1. **Data Setup**: 
   Ensure that the `SingleCellExperiment` (.rds) files for LEC, BEC, FRC, and IMM are available. In the local environment, these are symlinked to the `Marina_public_data` directory.
   
2. **Configuration**:
   Open `Lutdge_Analysis.Rmd` and modify the `symbols_to_plot` vector to include the gene symbols you wish to visualize:
   ```r
   symbols_to_plot <- c("SEMA3A", "PROX1", "YOUR_GENE")
   ```

3. **Running the Analysis**:
   Run the notebook in RStudio. The code will automatically:
   - Map gene symbols to the dataset's internal Ensembl-Symbol identifiers.
   - Generate violin plots for "Inflamed" and "Resting" conditions.
   - Save outputs systematically in both **PDF** and **PNG** formats.

## Key Functions
- `get_feature_name(obj, symbol)`: Safely finds the full feature ID using regex matching on the gene symbol.
- `save_vln_plot(...)`: Generates and saves a formatted Seurat violin plot to multiple formats.
- `run_plotting_suite(...)`: A wrapper to execute a batch of plots for a specific dataset.
