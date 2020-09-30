
## Project Description

**What counts as culture? Reporting and criticism in The Times 1785-2000**


How have arts and culture been reported? what counts as quality? how have cultural hierarchies changed over time. There has been some work looking at this from a cross European perspective, working from the 1980s-2010s, but nothing with the scope and reach of this sort of archive. 

The project will need to run queries to filter:
- Articles/text regarding with Music genres
- Articles/text regarding with British Museum 

And then run a sentiment analysis with those (outside defoe). 


## Quer(ies) Parameters

Available [here](./Round1_Requirements/Dave/Query_Inputs.md).

## Dataset used

Times Digital Archive (TDA)

## Defoe model 

[Papers](https://github.com/defoe-code/defoe/tree/master/defoe/papers)

## Defoe queries

- [Frequency query without target words](https://github.com/defoe-code/defoe/blob/master/defoe/papers/queries/keysearch_by_year.py)
- [Frequency query with target words](https://github.com/defoe-code/defoe/blob/master/defoe/papers/queries/target_keysearch_by_year.py)
- [Selected articles text query along with articles' metadata](https://github.com/defoe-code/defoe/blob/master/defoe/papers/queries/target_keysearch_by_year_details.py)

## Defoe queries configuration files

- [music_excluding_norm.yml](https://github.com/defoe-code/defoe/tree/master/queries/music_excluding_norm.yml)
- [music_including_norm.yml](https://github.com/defoe-code/defoe/tree/master/queries/music_including_norm.yml)
- [music_norm.yml](https://github.com/defoe-code/defoe/tree/master/queries/music_norm.yml)

## Defoe Job submission queries

They are avaible inside [Round1.slurm](./Round1.slurm)

## Results 
**Frequency results** regrding with Music genres can be visualized [here](https://github.com/defoe-code/defoe_visualization/tree/master/Round_1/Dave_OBrien)

**Articles text** about music (*including music word*) can be found [here](https://uoe.sharepoint.com/sites/DEFOE_Results/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents%2Fresults%5Fmusic%5Ffull%5Fdetails%2Etar&parent=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents).

**Articles text** about music (*excluding music word*) can be found [here](https://uoe.sharepoint.com/sites/DEFOE_Results/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents%2Fresults%5Fmusic%5Ftypes%5Fexcluding%5Fmusic%5Fdetails%2Etar&parent=%2Fsites%2FDEFOE%5FResults%2FShared%20Documents)



