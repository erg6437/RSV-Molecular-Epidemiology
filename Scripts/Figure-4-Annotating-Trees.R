#Note that this code was used for all ggtree-generated figures (all of Fig.4)
#Tree Visualization

library("treeio")
library("ggtree")
library("ape")
library(ggtreeExtra)
library(ggplot2)
library(RColorBrewer)

#note this is for newick files, if you need nexus, find it elsewhere
#Redoing but with RSVB NMH sequences
time_tree <- read.tree('041923-RSVB-NMH-newick')
Global_Metadata <- read.csv("RSVB-NMH-metadata.csv")
TreeData<-as.data.frame(time_tree$tip.label)

#Redoing but with RSVA NMH sequences
time_tree <- read.tree('RSVA-NMH-newick')
Global_Metadata <- read.csv("041923-RSVA-NMH-Metadata.csv")
TreeData<-as.data.frame(time_tree$tip.label)

#Redoing but with RSVB USA sequences
time_tree <- read.tree('RSVA-NMH-USA-newick')
Global_Metadata <- read.csv("041223-RSVA-USA-NMH-metadata.csv")
TreeData<-as.data.frame(time_tree$tip.label)

#Redoing but with RSVB USA sequences
time_tree <- read.tree('RSVB-NMH-USA-newick')
Global_Metadata <- read.csv("042023-RSVB-USA-metadata.csv")
TreeData<-as.data.frame(time_tree$tip.label)

names(TreeData)[1]<-"name"

Global_Metadata_Tree<-merge(TreeData,Global_Metadata,by="name",sort = F)

rownames(Global_Metadata_Tree) <- Global_Metadata_Tree$name
Global_Metadata_Tree_Clades<-as.data.frame(Global_Metadata_Tree%>%dplyr::select(season))

ggtree(time_tree,mrsd = "2023-01-1",as.Date = T)
p<-ggtree(time_tree,layout = "circular",)%<+% Global_Metadata_Tree +
  geom_tippoint(size=8) 
  + geom_treescale(x=0.006, y =0.9)
p 

colourCount <- length(unique(Global_Metadata_Tree$pandemic))
palette <- brewer.pal(colourCount, "Paired")


a <- p + geom_fruit(
  geom = geom_tile,
  mapping = aes(fill = pandemic),
  width = 0.002, offset = 0.2, show.legend = TRUE) +
  scale_fill_manual(values = palette) + theme(text = element_text(family = "Helvetica"))

a

colourCount <- length(unique(Global_Metadata_Tree$G_clade))
colourCount <- 14L
palette <- brewer.pal(colourCount, "Set2")

palette1 <- brewer.pal(3, "Set1")
palette2 <- brewer.pal(11, "PuOr")

palette <- c(palette1, palette2)

b <- a + geom_fruit(
  geom = geom_tile,
  mapping = aes(fill = G_Clade),
  width = 0.002, offset = 0.3, show.legend = TRUE) +
  scale_fill_manual(values = palette) + geom_tippoint() + theme(text = element_text(family = "Helvetica"))

b

# Create a plot
b <- ggplot(b, aes(x = wt, y = mpg)) +
  geom_point()

ggsave("RSVB-NMH-getting-scale.eps", plot = b, width = 40 , height = 32, dpi = 1200, family = "Helvetica")


