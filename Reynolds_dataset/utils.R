library(Seurat)
library(ggplot2)

#' Load Reynolds Dataset
#' @param data_dir Path to the directory containing 10X files and obs.tsv
#' @return A Seurat object
load_reynolds_data <- function(data_dir) {
  # Read 10X data
  counts <- Read10X(data.dir = data_dir)
  
  # Fix python production (transpose if necessary, as per original script)
  # Note: Read10X usually returns Genes x Cells. 
  # If the original script did t(counts), it might be because the source was unusual.
  counts <- t(counts)
  
  # Read metadata
  obs_path <- file.path(data_dir, "obs.tsv")
  if (!file.exists(obs_path)) {
    stop("Metadata file obs.tsv not found in ", data_dir)
  }
  obs <- read.table(obs_path, sep="\t", header=TRUE)
  
  # Create Seurat object
  seu <- CreateSeuratObject(counts = counts, project = "ReynoldsDataset", meta.data = obs)
  
  return(seu)
}

#' Standard Preprocessing Pipeline
#' @param seu Seurat object
#' @return Preprocessed Seurat object
preprocess_seurat <- function(seu) {
  seu <- NormalizeData(seu)
  seu <- FindVariableFeatures(seu, selection.method = "vst", nfeatures = 2000)
  seu <- ScaleData(seu, features = rownames(seu))
  seu <- RunPCA(seu, features = VariableFeatures(seu))
  seu <- FindNeighbors(seu, dims = 1:20)
  seu <- FindClusters(seu, resolution = 0.5)
  
  # UMAP
  seu <- RunUMAP(seu, dims = 1:20)
  
  # Jitter fix for PCA embeddings as seen in original script
  pca_embed <- Embeddings(seu, "pca") 
  set.seed(123)
  pca_embed_jitter <- pca_embed + matrix(rnorm(length(pca_embed), 0, 1e-6), nrow = nrow(pca_embed))
  seu@reductions$pca@cell.embeddings <- pca_embed_jitter
  
  # tSNE
  seu <- RunTSNE(seu, dims = 1:20)
  
  return(seu)
}

#' Plot Gene Expression
#' @param seu Seurat object
#' @param gene Gene name to plot
#' @param group_by Metadata column to group by
#' @return A ggplot object (Violin Plot)
plot_gene_expression <- function(seu, gene, group_by = "full_clustering") {
  if (!(gene %in% rownames(seu))) {
    warning(paste("Gene", gene, "not found in dataset."))
    return(NULL)
  }
  
  p <- VlnPlot(
    object = seu,
    features = gene,               
    group.by = group_by,    
    pt.size = 0,                  
    cols = NULL, 
    raster = FALSE, 
    alpha = 0          
  ) + 
    theme(
      axis.text.x = element_text(angle = 45, hjust = 1),
      legend.position = "none"
    ) +
    labs(title = paste("Expression of", gene))
  
  return(p)
}

#' Plot Dimensionality Reduction
#' @param seu Seurat object
#' @param reduction Reduction type ("umap" or "tsne")
#' @return A DimPlot
plot_dim_red <- function(seu, reduction = "umap") {
  DimPlot(seu, reduction = reduction) + labs(title = toupper(reduction))
}
