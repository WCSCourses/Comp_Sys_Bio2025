# ---
# title: "Analysis of gradient inhibition simulation"
# author: "Arnau Montagud, arnau.montagud@gmail.com"
# date: "December 2025"
# ---

# Note: All the scripts and data can be downloaded from https://github.com/ArnauMontagud/PROFILE_v2

# rm(list = ls(all = TRUE))

# import and load packages ----
if (!require("pacman"))
  install.packages("pacman")
list.of.packages <-
  c("tidyverse",
    "magrittr")
pacman::p_load(list.of.packages, character.only = TRUE)
options(scipen = 999)

# load data ----
load("drugs_double.RData")

# Plotting WT ----
WT_pheno %<>% mutate(activ = replace(activ, is.na(activ) == T, "rand")) %<>%
  mutate(RNA = replace(RNA, is.na(RNA) == T, "PC20191203")) %<>%
  mutate(RNA = replace(RNA, RNA == "mutRNA", "LNCAP")) %>%
  rename(WT = RNA)

dropcol <- c("Time", "drug", "dose", "RNA", "TH")
WT_pheno_large <- WT_pheno  %>% select(-one_of(dropcol)) %>% 
  gather(., key = Phenotype, value, -c(WT, activ))
WT_pheno_large %<>% mutate(activ = replace(activ, activ == "AR", "Androgen")) %>% 
  mutate(activ = replace(activ, activ == "AR_EGF", "Androgen_EGF"))

WT_pheno_large$activ <- factor(WT_pheno_large$activ, 
                               levels = c("rand", "00", "EGF", "Androgen_EGF", "Androgen"))

# phenos <- c("Proliferation","Invasion","Metastasis","Migration","DNA_Repair","Apoptosis")
# WT_pheno_large %<>% filter(Phenotype %in% phenos)

#Save Figure S27
# png(
#   filename = "FigS27_WT_pheno.png",
#   units = "px",
#   width = 1000,
#   height = 900,
#   res = 100
# )
ggplot(WT_pheno_large, aes(factor(0), activ)) +
  geom_tile(aes(fill = value), colour = "black") +
  facet_grid(WT ~ Phenotype) +
  scale_y_discrete(expand = c(0, 0)) +
  scale_fill_gradient(low = "white",
                      high = "firebrick",
                      limits = c(0, 1)) +
  labs(title = "WT phenotypes' probabilities",
       x = "Phenotype",
       y = "Growth additive",
       fill = "Cell line\nscore") +
  theme(
    axis.ticks = element_blank(),
    panel.background = element_blank(),
    strip.background = element_rect(fill = NA),
    axis.text.x = element_blank()
  )
# dev.off()

# Plotting double drugs ----

# tot<-single_large %>% filter(activ =="EGF") %>% mutate(drug1=drug) %>% 
#   rename(drug2=drug) %>% mutate(dose1=dose/10) %>% rename(dose2=dose) %>% 
#   mutate(dose2=dose2/10) %>% 
#   select(drug1,drug2,dose1,dose2,RNA,activ,Phenotype,value,value2)
# tot <- rbind(tot, double_large %>% filter(activ =="EGF"))

tot <- double_large

double_drugs <- double_large
drugnames <-
  c(double_drugs %>% .$drug1, double_drugs %>% .$drug2) %>% unique()
# pdf("Double drugs.pdf", onefile = T)
for (j in 1:length(drugnames)) {
  for (k in 1:length(drugnames)) {
    if (k > j) {
      print(paste0(drugnames[j], " ", drugnames[k]))
      print(
        ggplot(
          double_drugs %>% filter(drug1 == drugnames[j], drug2 == drugnames[k]),
          aes(dose1, dose2)
        ) +
          geom_tile(aes(fill = value), colour = "black") +
          facet_grid(activ ~ Phenotype) +
          scale_fill_gradient2(
            low = "blue",
            high = "firebrick",
            mid = "white",
            limits = c(-1, 1)
          ) +
          labs(
            title = paste0(
              "Phenotype variations upon ",
              drugnames[j],
              " and ",
              drugnames[k],
              " inhibition"
            ),
            x = paste0(drugnames[j], " inhibition"),
            y = paste0(drugnames[k], " inhibition"),
            fill = "mutant -\ncell line\nscore"
          ) +
          theme(
            axis.ticks = element_blank(),
            panel.background = element_blank(),
            strip.background = element_rect(fill = NA),
            plot.title = element_text(hjust = 0.5)
          )
      )
    }
  }
}
# dev.off()


ggplot(double_drugs %>% filter(drug1 == "HSPs", drug2 == "PI3K") %>% filter(Phenotype == "Proliferation"),
  aes(dose1, dose2)) +
  geom_tile(aes(fill = value), colour = "black") +
  # facet_grid(activ ~ Phenotype) +
  scale_fill_gradient2(
    low = "blue",
    high = "firebrick",
    mid = "white",
    limits = c(-1, 1)
  ) +
  labs(
    title = paste0(
      "Phenotype variations upon ",
      "HSPs",
      " and ",
      "PI3K",
      " inhibition"
    ),
    x = paste0("HSPs", " inhibition"),
    y = paste0(drugnames[k], " inhibition"),
    fill = "mutant -\ncell line\nscore"
  ) +
  theme(
    axis.ticks = element_blank(),
    panel.background = element_blank(),
    strip.background = element_rect(fill = NA),
    plot.title = element_text(hjust = 0.5)
  )

