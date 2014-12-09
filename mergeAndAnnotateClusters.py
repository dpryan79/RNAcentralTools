#!/usr/bin/env Rscript
d <- read.delim("cluster_to_id.txt", header=F)
colnames(d) <- c("ID", "Cluster", "Description", "L")
d$Description <- as.character(d$Description)

mergeCluster <- function(df, nme) {
    IDX <- grep(nme, df$Description)
    cur_clusters <- unique(df$Cluster[IDX])
    df$Cluster[df$Cluster %in% cur_clusters] <- df$Cluster[df$Cluster %in% cur_clusters][1]
    df
}

#N.B., mergeCluster() MUST have already been run!
mergeClustersTogether(df, nme1, nme2) {
    IDX1 <- grep(nme1, df$Description)
    targetCluster <- df$Cluster[IDX1][1]
    IDX1 <- which(df$Cluster == targetCluster)
    ID2 <- grep(nme2, df$Description)
    IDX2 <- which(df$Cluster == df$Cluster[IDX2][1])
    df$Cluster[c(IDX1, IDX2)] <- targetCluster
    df
}

#Merge Xist
d <- mergeCluster(d, "Xist")

#SNORA17 and SNORA43 can be merged together
d <- mergeCluster(d, "SNORA17")
d <- mergeCluster(d, "SNORA43")
d <- mergeClustersTogether(d, "SNORA17", "SNORA43")

#SNORA19
d <- mergeCluster(d, "SNORA19")

#SNORA20
d <- mergeCluster(d, "SNORA20")

#SNORA21
d <- mergeCluster(d, "SNORA21")

#SNORA26
d <- mergeCluster(d, "SNORA26")

#SNORA28
d <- mergeCluster(d, "SNORA28")

#SNORA29
d <- mergeCluster(d, "SNORA29")

#SNORA31
d <- mergeCluster(d, "SNORA31")

#SNORA32
d <- mergeCluster(d, "SNORA32")

#SNORA33
d <- mergeCluster(d, "SNORA33")

#SNORA35
d <- mergeCluster(d, "SNORA35")

#SNORA38
d <- mergeCluster(d, "SNORA38")

#SNORA4
d <- mergeCluster(d, "SNORA4")

#SNORA41
d <- mergeCluster(d, "SNORA41")

#SNORA43 merges with 17
d <- mergeCluster(d, "SNORA43")
d <- mergeCluster(d, "SNORA17")
d <- mergeClustersTogether(d, "SNORA43", "SNORA17")

#SNORA44
d <- mergeCluster(d, "SNORA44")

#SNORA46
d <- mergeCluster(d, "SNORA46")

#SNORA47
d <- mergeCluster(d, "SNORA47")

#SNORA48
d <- mergeCluster(d, "SNORA48")

#SNORA5
d <- mergeCluster(d, "SNORA5")

#SNORA51
d <- mergeCluster(d, "SNORA51")

#SNORA55
d <- mergeCluster(d, "SNORA55")

#SNORA57
d <- mergeCluster(d, "SNORA57")

#SNORA58
d <- mergeCluster(d, "SNORA58")

#SNORA61
d <- mergeCluster(d, "SNORA61")

#SNORA63
d <- mergeCluster(d, "SNORA63")

#SNORA65
d <- mergeCluster(d, "SNORA65")

#SNORA66
d <- mergeCluster(d, "SNORA66")

#SNORA67
d <- mergeCluster(d, "SNORA67")

#SNORA68
d <- mergeCluster(d, "SNORA68")

#SNORA69
d <- mergeCluster(d, "SNORA69")

#SNORA7
d <- mergeCluster(d, "SNORA7$")

#SNORA70
d <- mergeCluster(d, "SNORA70")

#SNORA71
d <- mergeCluster(d, "SNORA71")

#SNORA72
d <- mergeCluster(d, "SNORA72")

#SNORA74
d <- mergeCluster(d, "SNORA74")

#SNORA75
d <- mergeCluster(d, "SNORA75")

#SNORA76 merges with 50
d <- mergeCluster(d, "SNORA76")
d <- mergeCluster(d, "SNORA50")
d <- mergeClustersTogether(d, "SNORA76", "SNORA50")

#SNORA79
d <- mergeCluster(d, "SNORA29")

#SNORA81
d <- mergeCluster(d, "SNORA29")

#SNORA84
d <- mergeCluster(d, "SNORA29")

#SNORA16B/SNORA16A family
d <- mergeCluster(d, "SNORA16B/SNORA16A family")

#SNORA2/SNORA34 family
d <- mergeCluster(d, "SNORA2/SNORA34 family")

#SNORA3/SNORA45 family
d <- mergeCluster(d, "SNORA3/SNORA45")

#SNORA30/SNORA37 family
d <- mergeCluster(d, "SNORA30/SNORA37")

#SNORA36 family
d <- mergeCluster(d, "SNORA36 family")

#SNORA42/SNORA80 family
d <- mergeCluster(d, "SNORA42/SNORA80")

#SNORA62/SNORA6 family
d <- mergeCluster(d, "SNORA62/SNORA6")

#SNORA64/SNORA10 family
d <- mergeCluster(d, "SNORA64/SNORA10 family")

#SNORA24
d <- mergeCluster(d, "SNORA24")

#SNORA40
d <- mergeCluster(d, "SNORA40")

#mir-1937
d <- mergeCluster(d, "mir-1937")

#SNORD113/114 family
d <- mergeCluster(d, "SNORD113")

#SNORD115
d <- mergeCluster(d, "SNORD115")

#SNORD116
d <- mergeCluster(d, "SNORD116")

#Recalculate the Cluster IDs
d <- d[order(d$Cluster),]
last <- length(unique(d$Cluster))
reps <- rle(d$Cluster)$lengths
d$Cluster <- rep(c(1:last), reps)

#order by ID
d <- d[order(d$ID),]

#Remove some of the common species labels
d$Description <- gsub("Homo sapiens ","", d$Description, ignore.case=T)
d$Description <- gsub("Pan troglodytes ","", d$Description, ignore.case=T)
d$Description <- gsub("Trypanosoma congolense IL3000 ","", d$Description, ignore.case=T)
d$Description <- gsub("domesticus ","", d$Description, ignore.case=T)
d$Description <- gsub("Mus musculus ","", d$Description, ignore.case=T)
d$Description <- gsub("\\(house mouse) ","", d$Description, ignore.case=T)
d$Description <- gsub("\\(human) ","", d$Description, ignore.case=T)

#Write out the mappings
write.table(d[,c(1,2)], file="RNAcentral_clusters.txt", col.names=F, row.names=F, sep="\t", quote=F)

#Determine cluster length, type, name
d <- d[order(d$Cluster),]
dl <- split(d, d$Cluster)
clusters <- data.frame(ID=unique(d$Cluster))
clusters$Length <- sapply(dl, function(x) max(x$L))
clusters$Type <- sapply(dl, function(x) {
    #possible outputs: rRNA, tRNA, lncRNA, snoRNA, snRNA, piRNA, miRNA, miscRNA, Unknown
    rv="Unknown"
    if(length(grep("ribo", x$Description, ignore.case=T))>0) {
        rv = "rRNA"
    } else if(length(grep("tRNA", x$Description, ignore.case=T))>0) {
        rv = "tRNA"
    } else if(length(grep("long", x$Description, ignore.case=T))>0) {
        rv = "lncRNA"
    } else if(length(grep("lincRNA", x$Description, ignore.case=T))>0) {
        rv = "lncRNA"
    } else if(length(grep("lncRNA", x$Description, ignore.case=T))>0) {
        rv = "lncRNA"
    } else if(length(grep("Cajal body", x$Description, ignore.case=T))>0) {
        rv = "snoRNA"
    } else if(length(grep("SNOR", x$Description, ignore.case=T))>0) {
        rv = "snoRNA"
    } else if(length(grep("small nucleolar", x$Description, ignore.case=T))>0) {
        rv = "snoRNA"
    } else if(length(grep("piR", x$Description, ignore.case=T))>0) {
        rv = "piRNA"
    } else if(length(grep("miR", x$Description, ignore.case=T))>0) {
        rv = "miRNA"
    } else if(length(grep("-let-", x$Description, ignore.case=T))>0) {
        rv = "miRNA"
    } else if(length(grep("microRNA", x$Description, ignore.case=T))>0) {
        rv = "miRNA"
    } else if(length(grep("oocyte_clustered", x$Description, ignore.case=T))>0) {
        rv = "miscRNA"
    } else if(length(grep("miscellaneous", x$Description, ignore.case=T))>0) {
        rv = "miscRNA"
    } else if(length(grep("germline", x$Description, ignore.case=T))>0) { #These are categorized as miscRNA by Ensembl
        rv = "miscRNA"
    } else if(length(grep("anti", x$Description, ignore.case=T))>0) { #antisense is lncRNA
        rv = "lncRNA"
    } else if(length(grep("spacer", x$Description, ignore.case=T))>0) { #External transcribed spacers are rRNA
        rv = "rRNA"
    } else if(length(grep("Y RNA", x$Description, ignore.case=T))>0) {
        rv = "snRNA"
    } else if(length(grep("snRNA", x$Description, ignore.case=T))>0) {
        rv = "snRNA"
    } else if(length(grep("spliceosomal", x$Description, ignore.case=T))>0) {
        rv = "snRNA"
    }
    rv

}) #This still needs some work
clusters$name<- sapply(dl, function(x) x$Description[1])
write.table(clusters, file="RNAcentral_clusters_annotations.txt", col.names=F, row.names=F, sep="\t", quote=F)
