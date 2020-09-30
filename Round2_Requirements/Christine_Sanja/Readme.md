

## Project Description

**Identifying Peace Agreements during 1785 -2014**


We have developed coding for peace agreements (on over 200 topics - undertaken manually), and would like to find a way to either (a) see how datamining might produce topics in the corpus that were comparable, or select information that might mirror our topics in ways that might help us code without huge manual labour in the future and/or (b) compare our topics and the language in them against news paper articles after the date of the peace agreement signing, in a way that might give us automated production of information of 'implementation' information on for example whether a ceasefire agreed held.  Finally, if neither of these things opened, we would be open to co-designing a text mining option on the historic newspapers you have had, to see if we can unearth similar 'peace agreements' historically.   

Until 1990 there was little formalised practice of signing peace agreements between states and non-state groups, however, similar types of things have been done in the past, for example the process of decolonisation where states such as the UK signed agreements with national liberation movements.  It would be interesting to see if similar issues were being discussed around 'agreement' at points in the past.

Therefore, we want to use defoe to look at the TDA newspapers and identify how the terms ‘ceasefire’, ‘peace agreements’ or ‘peace settlement’ appear in text over the entire 1785-2014 period. This would include things like:
- Frequency over time
- Most commonly used adjacent words [*not covered during the project*]
- Creating a corpus of only those articles that use the relevant terms, and then running topic models on them
- Using the results of the topic models to compare to historical conflict data or historical political data (like the historical V-Dem, which goes back to about the same time, in the late 1700s). [*not covered during the project*]
- Running a geoparser to identify locations which are mentioned in relation to peace. [*not covered during the project*]


## Quer(ies) Parameters

Available [here](./Query_Inputs.md).

## Dataset used

Times Digital Archive (TDA)

## Defoe model 

[Papers](https://github.com/defoe-code/defoe/tree/master/defoe/papers)

## Defoe queries

- [Frequency query with target words](https://github.com/defoe-code/defoe/blob/master/defoe/papers/queries/target_keysearch_by_year.py)
- [Selected articles text query along with articles' metadata](https://github.com/defoe-code/defoe/blob/master/defoe/papers/queries/target_keysearch_by_year_details.py)
- [Selected articles preprocessed text query along with articles' metadata](https://github.com/defoe-code/defoe/blob/master/defoe/papers/queries/target_keysearch_by_year_preprocessed_details.py)

## Defoe queries configuration files

- [peace_war.yml](https://github.com/defoe-code/defoe/blob/master/queries/peace_war.yml)

## Defoe Job submission queries

They are avaible inside [Round2.slurm](../../Round2.slurm)

 
## Results 

**Frequency results** can be visualized [here](https://github.com/defoe-code/defoe_visualization/tree/master/Round_2/Christine_Sanja).
**Article's text results** are available here:
- [Original text](https://uoe.sharepoint.com/sites/DEFOE_Results/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents%2FChristine%5FSanja%2Etar&parent=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents)

 - [Preprocessed text](https://uoe.sharepoint.com/sites/DEFOE_Results/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents%2FChristine%5FSanja%5F2%2Etar&parent=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents)
 

