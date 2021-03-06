## Project Description

**Exploring the role of media in economic effects of epidemics**

The project seeks to understand the role that newspapers may have played (and are playing) in the economic effects of the epidemics: 

- Is there a correlation between the epidemic/crisis coverage and the state of the economy and business activity? 
- How important is sentiment for predicting business failure/ recovery?  

Two queries are proposed: 
-	Searches based on years and taxonomy terms relating to epidemics 
-	Searches based on years and taxonomy for economic consequences (*not covered during the project*)

Results will be compared to be if there are any correlations of results.

## Quer(ies) Parameters

Available [here](./Query_Inputs.md).

## Dataset used

Times Digital Archive (TDA)

## Defoe model 

[Papers](https://github.com/defoe-code/defoe/tree/master/defoe/papers)

## Defoe queries

- [Frequency query with target words filtered by date](https://github.com/defoe-code/defoe/blob/master/defoe/papers/queries/target_keysearch_by_year_filter_date.py)
- [Selected articles text filtered by date query along with articles' metadata](https://github.com/defoe-code/defoe/blob/master/defoe/papers/queries/target_keysearch_by_year_filter_date_details.py)

## Defoe queries configuration files

- [pandemics_norm_num_q1.yml](https://github.com/defoe-code/defoe/blob/master/queries/pandemics_norm_num_q1.yml)
- [pandemics_norm_num_q2.yml](https://github.com/defoe-code/defoe/blob/master/queries/pandemics_norm_num_q2.yml)
- [pandemics_norm_num_q3.yml](https://github.com/defoe-code/defoe/blob/master/queries/pandemics_norm_num_q3.yml)
- [pandemics_norm_num_q4.yml](https://github.com/defoe-code/defoe/blob/master/queries/pandemics_norm_num_q4.yml)
- [pandemics_norm_num_q5.yml](https://github.com/defoe-code/defoe/blob/master/queries/pandemics_norm_num_q5.yml)
- [pandemics_norm_num_q6.yml](https://github.com/defoe-code/defoe/blob/master/queries/pandemics_norm_num_q6.yml)
- [pandemics_norm_num_q7.yml](https://github.com/defoe-code/defoe/blob/master/queries/pandemics_norm_num_q7.yml)
- [pandemics_norm_num_q8.yml](https://github.com/defoe-code/defoe/blob/master/queries/pandemics_norm_num_q8.yml)

## Defoe data files

- [tda_1918_2010.txt](https://github.com/defoe-code/defoe/blob/master/others/tda_1918_2010.txt)

## Defoe Job submission queries

They are avaible inside [Round1.slurm](../../Round1.slurm)

## Results

**Frequency results** using eight different lexicons can be visualized [here](https://github.com/defoe-code/defoe_visualization/tree/master/Round_1/Galina_Andreeva).

**Raw results (frequency and articles' text)** can be found [here](https://uoe.sharepoint.com/sites/DEFOE_Results/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents%2FGalina%2Etar&parent=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents).






