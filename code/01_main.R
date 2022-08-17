library('data.table')
library('haven')

dataDir = 'data'

dOrig = setDT(read_dta(file.path(dataDir, 'master.dta')))
d = copy(dOrig)

# for (j in c('operation_frac_correct', 'place_value_correct', 'average_level')) {
#   d[, col := col / sd(col[treatment == 0], na.rm = TRUE), env = list(col = j)]}

# running linear regression on some binary outcomes, just go with it
# lm automatically removes missing values
fit = lm(place_value_correct ~ factor(treat_pool) + tarl_prev, data = d)

# fit2 = glm(
#   place_value_correct ~ factor(treat_pool) + tarl_prev,
#   data = d, family = 'binomial')
