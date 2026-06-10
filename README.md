# exercises_scRNA

## Part 1,  10.06.2026 

### Coding and testing 

1. Get the data for Reynolds and Lutdge datasets (zenodo and figshare, following internal readme files)
2. Run the project, producing violing plots for specific genes from the Seurat objects
3. Move around the Seurat object, eg reading and summarizing the metadata 
4. Create Shiny app installing the data in the ShinyCell https://github.com/SGDDNB/ShinyCell

### Conceptual

5. Think of re-doing the basic functionality of the app with Shiny for python [https://shiny.posit.co/py/] or Gradio [https://gradio.app/] using python-specidfic data structures for scRNA-seq
6. Think of extending the app functionality to 2 Seurat objects (or analogous in python). Eg violin plots from 2 objects, 2 UMAPs with cell type selection. 





# Documentations for now and for the future:

### Seurat — R

- [Seurat official documentation](https://satijalab.org/seurat/)
- [Seurat installation guide](https://satijalab.org/seurat/articles/install.html)
- [Seurat guided clustering tutorial: PBMC 3k](https://satijalab.org/seurat/articles/pbmc3k_tutorial.html)
- [Seurat essential commands](https://satijalab.org/seurat/articles/essential_commands.html)
- [Seurat reference / function documentation](https://satijalab.org/seurat/reference/)
- [Seurat data integration introduction](https://satijalab.org/seurat/articles/integration_introduction.html)
- [Seurat GitHub repository](https://github.com/satijalab/seurat)

### Scanpy — Python

- [Scanpy official documentation](https://scanpy.readthedocs.io/en/stable/)
- [Scanpy installation guide](https://scanpy.readthedocs.io/en/stable/installation.html)
- [Scanpy tutorials](https://scanpy.readthedocs.io/en/stable/tutorials/index.html)
- [Scanpy preprocessing and clustering tutorial](https://scanpy.readthedocs.io/en/stable/tutorials/basics/clustering.html)
- [Scanpy API reference](https://scanpy.readthedocs.io/en/stable/api/index.html)
- [AnnData documentation](https://anndata.readthedocs.io/en/stable/)
- [Scanpy GitHub repository](https://github.com/scverse/scanpy)

### ShinyCell — Interactive Shiny Apps for Single-Cell Data

- [ShinyCell GitHub repository and main documentation](https://github.com/SGDDNB/ShinyCell)
- [ShinyCell quick start guide](https://github.com/SGDDNB/ShinyCell#quick-start-guide)
- [Tutorial: customising ShinyCell aesthetics](https://htmlpreview.github.io/?https://github.com/SGDDNB/ShinyCell/blob/master/docs/1aesthetics.html)
- [Tutorial: multiple single-cell datasets in one app](https://htmlpreview.github.io/?https://github.com/SGDDNB/ShinyCell/blob/master/docs/2multi.html)
- [Tutorial: supported file formats: h5ad, loom, Seurat, SingleCellExperiment](https://htmlpreview.github.io/?https://github.com/SGDDNB/ShinyCell/blob/master/docs/3otherformat.html)
- [Tutorial: deploying ShinyCell apps online](https://htmlpreview.github.io/?https://github.com/SGDDNB/ShinyCell/blob/master/docs/4cloud.html)

### CellChat — Cell-Cell Communication Analysis

- [CellChat GitHub repository and documentation](https://github.com/jinworks/CellChat)
- [CellChat installation instructions](https://github.com/jinworks/CellChat#installation)
- [CellChat tutorials directory](https://github.com/jinworks/CellChat/tree/master/tutorial)
- [Tutorial: CellChat analysis of a single dataset](https://htmlpreview.github.io/?https://github.com/jinworks/CellChat/blob/master/tutorial/CellChat-vignette.html)
- [Tutorial: comparison analysis of multiple datasets](https://htmlpreview.github.io/?https://github.com/jinworks/CellChat/blob/master/tutorial/Comparison_analysis_of_multiple_datasets.html)
- [Tutorial: interface with Seurat, SingleCellExperiment, and Scanpy](https://htmlpreview.github.io/?https://github.com/jinworks/CellChat/blob/master/tutorial/Interface_with_other_single-cell_analysis_toolkits.html)
- [CellChat Explorer](https://www.cellchat.org/)
