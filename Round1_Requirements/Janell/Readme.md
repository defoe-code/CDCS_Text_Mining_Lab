
## Project description

**Statistical Manual of Mental Disorder (DSM)**

This project looks to answer two question:

- whether there is increased reporting accuracy of mental illness symptoms against the Diagnostic and Statistical Manual of Mental Disorders (DSM) over time

- whether there is a shift in the themes of explicit bias to implicit bias towards psychological disorders.

The project is interested in the sources between 1975 to 2020 – only Times Digital Archive covers part of this (until 2009). 

Question: **Which are the terms/lexicon that will be used for detecting if an article is reporting about mental illness symptoms?**  

With the subset of articles found (that talks about DSM), the project could create a new defoe query for counting how many **explicit** and **implicit** bias terms are found per article, so then an article could be classified as explicit or implicit bias.  Therefore, two lexicons will be also needed here – one for explicit bias terms  and other form implicit bias terms.  

The project will benefit as well from creating a new sentiment analyses query to study explicit and implicit bias categories.  These tasks will be challenging, and new queries in defoe will need to be implemented. 

## Quer(ies) Parameters

Available [here](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/Round1_Requirements/Janell/Query_Inputs.md).

## Dataset used

Times Digital Archive (TDA)

## Defoe model 

[Papers](https://github.com/defoe-code/defoe/tree/master/defoe/papers)

## Defoe queries

- [Frequency query with target words](https://github.com/defoe-code/defoe/blob/master/defoe/papers/queries/target_keysearch_by_year.py)
- [Selected articles text query along with articles' metadata](https://github.com/defoe-code/defoe/blob/master/defoe/papers/queries/target_keysearch_by_year_details.py)

## Defoe queries configuration files

- [dsm_explicit_lema.yml](https://github.com/defoe-code/defoe/blob/master/queries/dsm_explicit_lema.yml)
- [dsm_implicit_lema.yml](https://github.com/defoe-code/defoe/blob/master/queries/dsm_implicit_lema.yml)
- [dsm_neutral_lema.yml](https://github.com/defoe-code/defoe/blob/master/queries/dsm_neutral_lema.yml)


## Defoe Job submission queries

They are avaible inside [Round1.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/Round1.slurm)

## Results

**Frequency Results** using different lexicons (*explict*, *neutral*, *implicit*) can be visualized [here](https://github.com/defoe-code/defoe_visualization/tree/master/Round_1/Janell_Kwork). 

**Raw Results (frequencies and articles' text)** can be found [here](https://uoe.sharepoint.com/sites/DEFOE_Results/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents%2FJanell%2Etar&parent=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents).
