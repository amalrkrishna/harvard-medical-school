# Harvard Gene-tissue heat-map and gene-correlation network-graph.

The source code for this report is split into two folders.
heat-map - 
        gene_tissue_heatmap.html -  The main html file to view the heat-map. 
                                    The javascript functionality is build within the html file.
        clustering.R -  R script which generates the clustered_data.csv. The headers from this file are used
                        to order the heat map based on hirearchical clustering.
        test_gene_cell_dataset.csv -    The original source data set
        clustered_data.csv -    Clustered data set

correlation-network-graph -
        gene_network_graph.html -   The main html file to view the correlation-network-graph.
        correlation-graph.js -  The js file which implements the correlation network graph.
        draw-pictogram-table.js - The js which implements the pictogram table with the highly correlated edges.
        jLouvian.js -   The implementation for the community detection algorithm.
        style.css - CSS style file for ene_network_graph.html
        cor_subset.csv - The original source data set

## Graph descriptions -

## heat-map

1.  Run python3 -m http.server 8080 in the source directory. 
    http://0.0.0.0:8080/gene_tissue_heatmap.html will be loaded with the D3.js graph
2.  Tissues are set-up on the columns and genes are set-up on the rows.
3.  The data is processed in an array of JSON objects format :
        {
            "row" : row index,
            "col" : column index,
            "value" : correlation value
        }
    This is feeded onto the D3.js to create components and generate the heat-map.
4. Ordering options -
                * heirarchical clustering - order using the heirarchical clustering rows and columns that was generated earlier
                * genes and tissues - order based on both rows and columns (here genes and tissues)
                * genes - order based only on rows/genes
                * tissues - order based only on columns.tissues
                * log2ratio - order based on individual columns or rows
    Default is set to heirarchical clustering.
    genes and tissues option will set the heat-map at the same order as that of the original dataset.
5.  The darker the Red, the higher the value of the data point on the cell.

## correlation-network-graph

1.  Run python3 -m http.server 8080 in the source directory. 
    http://0.0.0.0:8080/gene_network_graph.html will be loaded with the D3.js graph
2.  The network map is loaded onto a 3000x3000 large canvas. Could get laggy due to the large number of edges and 500 active nodes.
3.  Nodes and Edges are created as an array of JSON objects with the following format - 
    nodes : {
        "id" : index
        "name" : gene name
    }
    edges : {
        "source" : source gene
        "target" : target gene
        "weight" : correlation weight
    }
    Duplicate edges and edges to the same nodes are removed for efficient processing.
4.  The slider can be used to filter out the lowly correlated edges from the graph.
5.  Each community correlation is denoted by the color of the edge. Highly correlated communities are grouped closer by varying 
    the edge line width.
6.  The intensity of the correlation between two nodes is denoted by the thickness of the edge line. As the slider is moved
    towards the right, only highly correlated edges will be displayed from each community.
7.  Clicking on each gene will highlight the strong links it poses based on the slider position.
8.  The pictogram at the bottom shows the highly correlated connections within the network.

These two D3.js graphs was developed using open souce templates from https://github.com/d3/d3/wiki/Gallery and by applying custom modifications and algorithms. It was intented to access maximum information from these data-sets with the limited time constraints.
