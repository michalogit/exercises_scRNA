
dataset <- "LEC"

subset_objIN <- subset(seurat_obj_LEC, subset = cond %in% c("activated", "chronic"))

label2 <- as.vector(subset_objIN@meta.data$label)
idx <- which(label2== "SCScLEC")
label2[idx] <- "SCS ceiling LEC I"
idx <- which(label2== "MedCapsLEC")
label2[idx] <- "Medullary capsule LEC I"
idx <- which(label2== "SCSfLEC")
label2[idx] <- "SCS floor LEC I"

idx <- which(label2== "MedSinusLEC")
label2[idx] <- "Medullary sinus LEC I"
idx <- which(label2== "ParacortLEC")
label2[idx] <- "Paracortical LEC I"
idx <- which(label2== "ValveLEC")
label2[idx] <- "Valve LEC I"

subset_objIN@meta.data$label <- label2

subset_objQ <- subset(seurat_obj_LEC, subset = cond %in% c("resting"))

label2 <- as.vector(subset_objQ@meta.data$label)
idx <- which(label2== "SCScLEC")
label2[idx] <- "SCS ceiling LEC C"
idx <- which(label2== "MedCapsLEC")
label2[idx] <- "Medullary capsule LEC C"
idx <- which(label2== "SCSfLEC")
label2[idx] <- "SCS floor LEC C"

idx <- which(label2== "MedSinusLEC")
label2[idx] <- "Medullary sinus LEC C"
idx <- which(label2== "ParacortLEC")
label2[idx] <- "Paracortical LEC C"
idx <- which(label2== "ValveLEC")
label2[idx] <- "Valve LEC C"

subset_objQ@meta.data$label <- label2

seu_merged2 <- merge(subset_objIN, y = subset_objQ, add.cell.ids = c("infl","quies"))



seu_merged2 <- subset(
  seu_merged2,
  subset = label %in% c("SCS ceiling LEC C", "SCS ceiling LEC I", 
                        "Medullary capsule LEC C", "Medullary capsule LEC I",
                        "SCS floor LEC C", "SCS floor LEC I",
                       "Medullary sinus LEC C", "Medullary sinus LEC I", 
                       "Paracortical LEC C", "Paracortical LEC I",
                       "Valve LEC C", "Valve LEC I")
)

#  "#0072B2", # blue

base_cols <- c(

  "#D55E00", # vermillion
  "#009E73", # green
  "#CC79A7", # purple
  "#E69F00", # orange
  "#56B4E9", # sky blue
  "#F0E442", # yellow
  "#999999", # grey
  "#000000"  # black
)

cols <- c("#0072B2", rep(base_cols, each = 2))


dataset =""
p <- VlnPlot(
  seu_merged2,
  features = "ENSG00000075213.SEMA3A",
  group.by = "label",
  pt.size = 0,
  cols = cols
) + 
  theme(
    axis.text.x = element_text(size = 9,angle = 45, hjust = 1), 
    plot.margin = margin(l = 40)
  )+ 
   theme(axis.title.x = element_blank())+
  labs(title=paste0(dataset, "SEMA3A (Lütge et al. 2025)"))+
  NoLegend()
p

## merge of Seurat objects for LEC, BEC, FRC, IMM

seu_merged <- merge(seurat_obj_LEC, y = seurat_obj_BEC, add.cell.ids = c("LEC","BEC"))
seu_merged2 <- merge(seu_merged, y = seurat_obj_FRC, add.cell.ids = c("LB","FRC"))
seu_merged3 <- merge(seu_merged2, y = seurat_obj_IMM, add.cell.ids = c("LBF","IMM"))

label2 <- as.vector(seu_merged3@meta.data$label)
rr <- rownames(seu_merged3@meta.data)

## new naming

idx <- which(label2=="preB")
label2[idx] <- "B cells"
idx <- which(label2=="naiveB")
label2[idx] <- "B cells"
idx <- which(label2=="GCB")
label2[idx] <- "B cells"
idx <- which(label2=="MBC")
label2[idx] <- "B cells"
idx <- which(label2=="plasmaCell")
label2[idx] <- "B cells"
idx <- which(label2=="naiveCD4-1")
label2[idx] <- "CD4 T cells"
idx <- which(label2=="naiveCD4-2")
label2[idx] <- "CD4 T cells"
idx <- which(label2=="naiveCD4-3")
label2[idx] <- "CD4 T cells"
idx <- which(label2=="Treg")
label2[idx] <- "Tregs"
idx <- which(label2=="CD8Tcm")
label2[idx] <- "CD8 T cells"
idx <- which(label2=="CTL/NKcell")
label2[idx] <- "CD8 T cells"
idx <- which(label2=="pDC-1")
label2[idx] <- "Plasmacytoid DCs"
idx <- which(label2=="pDC-2")
label2[idx] <- "Plasmacytoid DCs"
idx <- which(label2=="Mph/DC-1")
label2[idx] <- "Macrophages"
idx <- which(label2=="Mph/DC-2")
label2[idx] <- "Macrophages"

idx <- which(startsWith(rr, "LBF_LB_LEC")) 
label2[idx] <- "LEC LN"
idx <- which(startsWith(rr, "LBF_LB_BEC")) 
label2[idx] <- "BEC LN"
idx <- which(startsWith(rr, "LBF_FRC"))
label2[idx] <- "FRC-SMC LN"

seu_merged3@meta.data$label <- label2

ooo <- c(
  "B cells", "CD4 T cells", "Tregs", "CD8 T cells", "Plasmacytoid DCs", "Macrophages",
  "LEC LN", "BEC LN", "FRC-SMC LN"
)

## old naming, without grouping
idx <- which(label2=="preB")
label2[idx] <- "preB cell"
idx <- which(label2=="naiveB")
label2[idx] <- "naïve B cell"
idx <- which(label2=="GCB")
label2[idx] <- "Germinal center B cell"
idx <- which(label2=="MBC")
label2[idx] <- "MBC"
idx <- which(label2=="plasmaCell")
label2[idx] <- "Plasma cell"
idx <- which(label2=="naiveCD4-1")
label2[idx] <- "Naïve CD4 + Tcell-1"
idx <- which(label2=="naiveCD4-2")
label2[idx] <- "Naïve CD4 + Tcell-2"
idx <- which(label2=="naiveCD4-3")
label2[idx] <- "Naïve CD4 + Tcell-3"
idx <- which(label2=="Treg")
label2[idx] <- "Treg"
idx <- which(label2=="CD8Tcm")
label2[idx] <- "Central memory CD8+ Tcell"
idx <- which(label2=="CTL/NKcell")
label2[idx] <- "Cytotoxic T/NK cell"
idx <- which(label2=="pDC-1")
label2[idx] <- "Plasmacytoid DC1"
idx <- which(label2=="pDC-2")
label2[idx] <- "Plasmacytoid DC2"
idx <- which(label2=="Mph/DC-1")
label2[idx] <- "Macrophage/DC1"
idx <- which(label2=="Mph/DC-2")
label2[idx] <- "Macrophage/DC2"

idx <- which(startsWith(rr, "LBF_LB_LEC")) 
label2[idx] <- "LEC LN"
idx <- which(startsWith(rr, "LBF_LB_BEC")) 
label2[idx] <- "BEC LN"
idx <- which(startsWith(rr, "LBF_FRC"))
label2[idx] <- "FRC LN"


seu_merged3@meta.data$label <- label2


ooo <- c(
  "preB cell", "Naïve B cell", "Germinal center B cell", "MBC", "Plasma cell",
  "Naïve CD4 + Tcell-1", "Naïve CD4 + Tcell-2", "Naïve CD4 + Tcell-3",
  "Treg", "Central memory CD8+ Tcell", "Cytotoxic T/NK cell",
  "Plasmacytoid DC1", "Plasmacytoid DC2", "Macrophage/DC1", "Macrophage/DC2",
  "LEC LN", "BEC LN", "FRC LN"
)

seu_merged3 <- subset(
  seu_merged3,
  subset = label %in% ooo
)

seu_merged3$label <- factor(seu_merged3$label, levels = ooo)


dataset =""
p <- VlnPlot(
  seu_merged3,
  features = "ENSG00000075213.SEMA3A",
  group.by = "label",
  pt.size = 0
) + 
  theme(
    axis.text.x = element_text(size = 9,angle = 45, hjust = 1), 
    plot.margin = margin(l = 40)
  )+ 
  theme(axis.title.x = element_blank())+
  labs(title=paste0(dataset, "SEMA3A (Lütge et al. 2025)"))+
  NoLegend()
p


