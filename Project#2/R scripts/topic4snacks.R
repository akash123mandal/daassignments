#imported SNACKS.xls as SNACKS

cormat <- cor(SNACKS, method = "spearman")
print(cormat)
print(cormat*cormat)
