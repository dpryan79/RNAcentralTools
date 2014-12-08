#!/usr/bin/env Rscript
d <- read.delim("cluster_to_id.txt", header=F)
colnames(d) <- c("ID", "Cluster", "Description", "L")
d$Description <- as.character(d$Description)

#Merge Xist
d$Cluster[7524] = 2

#SNORA17
IDX <- grep("SNORA17", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#unique(d$Description[d$Cluster %in% cur_clusters]) #Might need to merge in SNORA43
d$Cluster[d$Cluster %in% cur_clusters] <- 6312
IDX <- grep("SNORA43", d$Description)
#d[IDX,]
d$Cluster[9670] = 6312 #Merge SNORA43

#SNORA19
IDX <- grep("SNORA19", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- 6609

#SNORA20
IDX <- grep("SNORA20", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA21
IDX <- grep("SNORA21", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA26
IDX <- grep("SNORA26", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA28
IDX <- grep("SNORA28", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA29
IDX <- grep("SNORA29", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA31
IDX <- grep("SNORA31", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA32
IDX <- grep("SNORA32", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA33
IDX <- grep("SNORA33", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA35
IDX <- grep("SNORA35", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA38
IDX <- grep("SNORA38", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA4
IDX <- grep("SNORA4$", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA41
IDX <- grep("SNORA41", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA43 merges with 17
IDX <- grep("SNORA43", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA44
IDX <- grep("SNORA44", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA46
IDX <- grep("SNORA46", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA47
IDX <- grep("SNORA47", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA48
IDX <- grep("SNORA48", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA5
IDX <- grep("SNORA5$", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA51
IDX <- grep("SNORA51", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA55
IDX <- grep("SNORA55", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA57
IDX <- grep("SNORA57", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA58
IDX <- grep("SNORA58", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA61
IDX <- grep("SNORA61", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA63
IDX <- grep("SNORA63", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA65
IDX <- grep("SNORA65", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA66
IDX <- grep("SNORA66", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA67
IDX <- grep("SNORA67", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA68
IDX <- grep("SNORA68", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA69
IDX <- grep("SNORA69", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA7
IDX <- grep("SNORA7$", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA70
IDX <- grep("SNORA70", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA71
IDX <- grep("SNORA71", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA72
IDX <- grep("SNORA72", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA74
IDX <- grep("SNORA74", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA75
IDX <- grep("SNORA75", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA76 merges with 50
IDX <- grep("SNORA76", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA79
IDX <- grep("SNORA79", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA81
IDX <- grep("SNORA81", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA84
IDX <- grep("SNORA84", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA16B/SNORA16A family
IDX <- grep("SNORA16B/SNORA16A family", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA2/SNORA34 family
IDX <- grep("SNORA2/SNORA34 family", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA3/SNORA45 family
IDX <- grep("SNORA3/SNORA45 family", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA30/SNORA37 family
IDX <- grep("SNORA30/SNORA37 family", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA36 family
IDX <- grep("SNORA36 family", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA42/SNORA80 family
IDX <- grep("SNORA42/SNORA80 family", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA62/SNORA6 family
IDX <- grep("SNORA62/SNORA6 family", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA64/SNORA10 family
IDX <- grep("SNORA64/SNORA10 family", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA24
IDX <- grep("SNORA24", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORA40
IDX <- grep("SNORA40", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#mir-1937
IDX <- grep("mir-1937", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORD113/114 family
IDX <- grep("SNORD113", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORD115
IDX <- grep("SNORD115", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#SNORD116
IDX <- grep("SNORD116", d$Description)
cur_clusters <- unique(d$Cluster[IDX])
#cur_clusters
#unique(d$Description[d$Cluster %in% cur_clusters])
d$Cluster[d$Cluster %in% cur_clusters] <- d$Cluster[d$Cluster %in% cur_clusters][1]

#Recalculate the Cluster IDs
d <- d[order(d$Cluster),]
last <- length(unique(d$Cluster))
reps <- rle(d$Cluster)$lengths
d$Cluster <- rep(c(1:last), reps)

#order by ID
d <- d[order(d$ID),]

#Remove "Homo sapiens "
d$Description <- gsub("Homo sapiens ","", d$Description, ignore.case=T)
#Remove "Pan troglodytes "
d$Description <- gsub("Pan troglodytes ","", d$Description, ignore.case=T)
#Remove "Trypanosoma congolense IL3000 "
d$Description <- gsub("Trypanosoma congolense IL3000 ","", d$Description, ignore.case=T)
#Remove "domesticus "
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
