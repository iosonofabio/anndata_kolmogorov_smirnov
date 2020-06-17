# anndata_kolmogorov_smirnov
Kolmogorov Smirnov test on all genes between two AnnData objects

```python
import anndataks

results = anndataks.compare(adata1, adata2, log1p=2)
```

**NOTE**: This implementation is based on `scipy.stats.ks_2samp` with a few improvements:
 - the KS statistic is positive or negative depending on whether adata2 or adata1 were higher at the pivotal expression threshold, respectively
 - the expression level of the pivotal point is reported

Have fun!
