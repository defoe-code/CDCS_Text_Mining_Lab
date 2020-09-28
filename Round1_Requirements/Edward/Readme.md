

## Project Description

**'Hype Curve’ common to many ‘scientific processes'**

This project proposes to run a target-frequency query, using different scientific processes (e.g. Artificial Intelligence, Cybernetics, Eugenics, DNA sequencing, Sonification) as target words.  

With the results, different plots will be needed to understand the shape of each “hype curve” associated with each target word. 

Results group by time and also by specialist and non-specialist literature.

## Quer(ies) Parameters

Available [here](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/Round1_Requirements/Edward/Query_Inputs.md).

## Dataset used

Times Digital Archive (TDA)

## Defoe model 

[Papers](https://github.com/defoe-code/defoe/tree/master/defoe/papers)

## Defoe queries

- [Frequency query with target words](https://github.com/defoe-code/defoe/blob/master/defoe/papers/queries/target_keysearch_by_year.py)
- [Selected articles text query along with articles' metadata](https://github.com/defoe-code/defoe/blob/master/defoe/papers/queries/target_keysearch_by_year_details.py)


## Defoe queries configuration files

- [science_lema.yml](https://github.com/defoe-code/defoe/tree/master/queries/science_lema.yml)
- [science_norm.yml](https://github.com/defoe-code/defoe/tree/master/queries/science_norm.yml)

## Defoe Job submission queries

They are avaible inside [Round1.slurm](https://github.com/defoe-code/CDCS_Text_Mining_Lab/blob/master/Round1.slurm)

## Results

**Frequency results** using different preprocessing treatments (*lemmatized*, *normalized*) can be visualized [here](https://github.com/defoe-code/defoe_visualization/tree/master/Round_1/Edward_Martin)

**Raw results (frequency and articles text)** can be found [here](https://uoe.sharepoint.com/sites/DEFOE_Results/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents%2FEdward%2Etar&parent=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents).
