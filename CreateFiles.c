//gcc -Wall -o CreateFiles CreateFiles.c
//Need to make the file names variable!
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <inttypes.h>
#define MAXENSEMBL 103000
#define MAXRNACENTRAL 0x7B9A1C+1
#define MAXGO 2001312
#define MAXCLUSTERS 52583
#define MAXLINE 1024

typedef struct {
    int32_t *GO;
    int32_t l,m;
} GOstruct;

int32_t roundup32(int32_t n) {
    n |= n >> 1;
    n |= n >> 2;
    n |= n >> 4;
    n |= n >> 8;
    n |= n >> 16;
    n++;
    return n;
}

int in(int32_t val, int32_t *list, int32_t len) {
    int32_t i;
    for(i=0; i<len; i++) {
        if(list[i] == val) return 1;
    }
    return 0;
}

GOstruct ** growStruct(GOstruct **s, int32_t l, int32_t *curMax) {
    int32_t i, newMax = roundup32(l+1);
    s = realloc(s, sizeof(GOstruct*)*newMax);
    assert(s);
    for(i=*curMax; i<newMax; i++) s[i] = calloc(1, sizeof(GOstruct));
    *curMax = newMax;
    return s;
}

int main(int argc, char *argv[]) {
    //N.B., some values tuned for the mouse genome
    int32_t ENSEMBL_l = 0, ENSEMBL_m = 103000;
    int32_t RNACENTRAL_l = 0, RNACENTRAL_m = 0x7B9A1C+1;
    int32_t CLUSTERS_l = 0, CLUSTERS_m = 52583;
//    int32_t GO_l = 0, GO_m = 2001312;
    GOstruct **ENSEMBL2GO = calloc(ENSEMBL_m, sizeof(GOstruct *));
    GOstruct **RNAcentral2Ensembl = calloc(RNACENTRAL_m, sizeof(GOstruct *));
    GOstruct **RNAcentral2GO = calloc(RNACENTRAL_m, sizeof(GOstruct *));
    GOstruct **Cluster2GO = calloc(CLUSTERS_m, sizeof(GOstruct *));
    int *piRNA = calloc(CLUSTERS_m, sizeof(int));
    char line[MAXLINE], *p;
    FILE *fp;
    int i, j, k;

    assert(ENSEMBL2GO);
    assert(RNAcentral2Ensembl);
    assert(RNAcentral2GO);

    //Initialize structs
    for(i=0; i<ENSEMBL_m; i++) {
        ENSEMBL2GO[i] = calloc(1, sizeof(GOstruct));
        assert(ENSEMBL2GO[i]);
    }
    for(i=0; i<RNACENTRAL_m; i++) {
        RNAcentral2Ensembl[i] = calloc(1, sizeof(GOstruct));
        assert(RNAcentral2Ensembl[i]);
        RNAcentral2GO[i] = calloc(1, sizeof(GOstruct));
        assert(RNAcentral2GO[i]);
    }
    for(i=0; i<CLUSTERS_m; i++) {
        Cluster2GO[i] = calloc(1, sizeof(GOstruct));
        assert(Cluster2GO[i]);
    }

    //Load the file, keeping only unique pairings
    fprintf(stderr, "Loading Ensembl2GO.txt..."); fflush(stderr);
    fp = fopen("Ensembl2GO.txt", "r");
    fgets(line, MAXLINE, fp);
    while(fgets(line, MAXLINE, fp) != NULL) {
        p=strtok(line, "\t");
        i = atoi(p+7);
        p = strtok(NULL, "\n");
        p+=3;
        j = atoi(p);
        assert(j>0);
        if(i>=ENSEMBL2GO->m) ENSEMBL2GO = growStruct(ENSEMBL2GO, i, &ENSEMBL_m);
        if(!in(j, ENSEMBL2GO[i]->GO, ENSEMBL2GO[i]->l)) {
            ENSEMBL2GO[i]->l++;
            if(ENSEMBL2GO[i]->l >= ENSEMBL2GO[i]->m) {
                ENSEMBL2GO[i]->m = roundup32(ENSEMBL2GO[i]->l);
                ENSEMBL2GO[i]->GO = realloc(ENSEMBL2GO[i]->GO, sizeof(int)*(ENSEMBL2GO[i]->m));
                assert(ENSEMBL2GO[i]->GO);
            }
            ENSEMBL2GO[i]->GO[ENSEMBL2GO[i]->l-1] = j;
        }
    }
    fclose(fp);
    fprintf(stderr, "done\n"); fflush(stderr);

    //Load the RNAcentral to Ensembl mappings
    fprintf(stderr, "Loading RNAcentral to Ensembl mappings..."); fflush(stderr);
    fp = popen("zcat merged.gz", "r");
    fgets(line, MAXLINE, fp);
    while(fgets(line, MAXLINE, fp) != NULL) {
        p = strtok(line, "\t");
        i = strtol(p+3, NULL, 16);
        p = strtok(NULL, "\n");
        j = atoi(p+7);
//Got here
        if(i>=MAXRNACENTRAL) {
            fprintf(stderr, "i %X MAXRNACENTRAL %X\n", i, MAXRNACENTRAL); fflush(stderr);
        }
        if(j>=MAXENSEMBL) {
            fprintf(stderr, "j %i MAXENSEMBL %i\n", j, MAXENSEMBL); fflush(stderr);
        }
        assert(i<MAXRNACENTRAL);
        assert(j<MAXENSEMBL);
        if(!in(j, RNAcentral2Ensembl[i]->GO, RNAcentral2Ensembl[i]->l)) {
            RNAcentral2Ensembl[i]->l++;
            if(RNAcentral2Ensembl[i]->l >= RNAcentral2Ensembl[i]->m) {
                RNAcentral2Ensembl[i]->m = roundup32(RNAcentral2Ensembl[i]->l);
                RNAcentral2Ensembl[i]->GO = realloc(RNAcentral2Ensembl[i]->GO, sizeof(int)*(RNAcentral2Ensembl[i]->m));
                assert(RNAcentral2Ensembl[i]->GO);
            }
            RNAcentral2Ensembl[i]->GO[RNAcentral2Ensembl[i]->l-1] = j;
        }
    }
    pclose(fp);
    fprintf(stderr, "done\n"); fflush(stderr);

    //Map RNAcentralID to GO
    fprintf(stderr, "Mapping RNAcentral IDs to GO IDs..."); fflush(stderr);
    for(i=0; i<MAXRNACENTRAL; i++) { //For every RNAcentral ID
        for(j=0; j<RNAcentral2Ensembl[i]->l; j++) { //For every associated Ensembl ID
            for(k=0; k<ENSEMBL2GO[RNAcentral2Ensembl[i]->GO[j]]->l; k++) { //For every associated GO id
                if(!in(ENSEMBL2GO[RNAcentral2Ensembl[i]->GO[j]]->GO[k], RNAcentral2GO[i]->GO, RNAcentral2GO[i]->l)) {
                    RNAcentral2GO[i]->l++;
                    if(RNAcentral2GO[i]->l >= RNAcentral2GO[i]->m) {
                        RNAcentral2GO[i]->m = roundup32(RNAcentral2GO[i]->l);
                        RNAcentral2GO[i]->GO = realloc(RNAcentral2GO[i]->GO, sizeof(int)*(RNAcentral2GO[i]->m));
                        assert(RNAcentral2GO[i]->GO);
                    }
                    assert(ENSEMBL2GO[RNAcentral2Ensembl[i]->GO[j]]->GO[k]<=MAXGO);
                    assert(ENSEMBL2GO[RNAcentral2Ensembl[i]->GO[j]]->GO[k]>0);
                    RNAcentral2GO[i]->GO[RNAcentral2GO[i]->l-1] = ENSEMBL2GO[RNAcentral2Ensembl[i]->GO[j]]->GO[k];
                }
            }
        }
    }
    fprintf(stderr, "done\n"); fflush(stderr);

    //Clean up ENSEMBL2GO and RNAcentral2Ensembl
    for(i=0; i<ENSEMBL_m; i++) {
        if(ENSEMBL2GO[i]->l) free(ENSEMBL2GO[i]->GO);
        free(ENSEMBL2GO[i]);
    }
    free(ENSEMBL2GO);
    for(i=0; i<RNACENTRAL_m; i++) {
        if(RNAcentral2Ensembl[i]->l) free(RNAcentral2Ensembl[i]->GO);
        free(RNAcentral2Ensembl[i]);
    }
    free(RNAcentral2Ensembl);

    //Write RNAcentral2GO.txt
    fp = fopen("RNAcentral2GO.txt", "w");
    fprintf(fp, "\"RNACentralID\"\t\"GO\"\n");
    for(i=0; i<MAXRNACENTRAL; i++) {
        if(RNAcentral2GO[i]->l) {
            for(j=0; j<RNAcentral2GO[i]->l; j++) {
                sprintf(line, "\"U%012X\"\t\"GO:%07i\"\n", i, RNAcentral2GO[i]->GO[j]);
                line[2] = 'R';
                line[3] = 'S';
                fputs(line, fp);
            }
        }
    }
    fclose(fp);

    //Note which clusters are piRNAs
    fp = fopen("/home/ryand/Documents/Misc/Mus_musculus/RNAcentral/RNAcentral_clusters_annotations.txt", "r");
    fprintf(stderr, "Marking piRNAs..."); fflush(stderr);
    while(fgets(line, 1024, fp)) {
        p = strtok(line, "\t"); //Cluster
        i = atoi(p);
        p = strtok(NULL, "\t");
        p = strtok(NULL, "\t");
        if(strcmp(p, "piRNA") == 0) piRNA[i] = 1;
    }
    fclose(fp);
    fprintf(stderr, "done\n"); fflush(stderr);

    //Cluster2GO
    fp = fopen("/home/ryand/Documents/Misc/Mus_musculus/RNAcentral/RNAcentral_clusters.txt", "r");
    fprintf(stderr, "Mapping clusters to GO..."); fflush(stderr);
    while(fgets(line, 1024, fp)) {
        p = strtok(line, "\t");
        j = strtol(p+3, NULL, 16); //RNAcentral ID
        assert(j>0);
        assert(j<MAXRNACENTRAL);
        p = strtok(NULL, "\n");
        i = atoi(p); //ClusterID
        assert(i>0);
        assert(i<MAXCLUSTERS);
        if(piRNA[i] == 0) continue;
        for(k=0; k<RNAcentral2GO[j]->l; k++) {
            if(!in(RNAcentral2GO[j]->GO[k], Cluster2GO[i]->GO, Cluster2GO[i]->l)) {
                Cluster2GO[i]->l++;
                if(Cluster2GO[i]->l >= Cluster2GO[i]->m) {
                    Cluster2GO[i]->m = roundup32(Cluster2GO[i]->l);
                    Cluster2GO[i]->GO = realloc(Cluster2GO[i]->GO, sizeof(int)*(Cluster2GO[i]->m));
                    assert(Cluster2GO[i]->GO);
                }
                Cluster2GO[i]->GO[Cluster2GO[i]->l-1] = RNAcentral2GO[j]->GO[k];
            }
        }
    }
    fclose(fp);
    fprintf(stderr, "done\n"); fflush(stderr);

    //Free RNAcentral2GO
    for(i=0; i<MAXRNACENTRAL; i++) {
        if(RNAcentral2GO[i]->l) free(RNAcentral2GO[i]->GO);
        free(RNAcentral2GO[i]);
    }
    free(RNAcentral2GO);

    //Write piRNAcluster2GO.txt
    fp = fopen("piRNAcluster2GO.txt", "w");
    fprintf(fp, "\"ClusterID\"\t\"GO\"\n");
    for(i=0; i<MAXCLUSTERS; i++) {
        if(piRNA[i]) {
            for(j=0; j<Cluster2GO[i]->l; j++) fprintf(fp, "%i\t\"GO:%07i\"\n", i, Cluster2GO[i]->GO[j]);
            if(Cluster2GO[i]->l == 0) fprintf(stderr, "Cluster %i had no mappings!\n", i);
            if(Cluster2GO[i]->l) free(Cluster2GO[i]->GO);
        }
        free(Cluster2GO[i]);
    }
    free(Cluster2GO);
    free(piRNA);
    fclose(fp);

    return 0;
}
