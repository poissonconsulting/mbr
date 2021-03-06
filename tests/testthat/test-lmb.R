test_that("lmb", {

  model <- model("function() {
  nll <- 0
  log(sweight) <- log_sweight
  for(i in 1:length(weight)) {
    eweight <- bfeed[as.integer(feed[i])]
    nll <- nll - log(dnorm(weight[i], eweight[i], sweight))
  }
  nll
}",
  gen_inits = function(data) {
    inits <- list()
    inits$bfeed <- rep(1, nlevels(data$feed))
    inits$log_sweight <- 0
    inits
  })
  expect_is(model, "lmb_model")
  # analysis <- analyse(model, data = datasets::chickwts, glance = FALSE, beep = FALSE)
  #
  # expect_is(analysis, "lmb_analysis")
  # glance <- glance(analysis)
  #
  # expect_is(glance, "tbl")
  # expect_identical(colnames(glance), c("n", "K", "logLik", "IC", "converged"))
  # expect_equal(glance$logLik, -381.9374, tolerance = 0.0000001)
  # expect_identical(glance$n, 71L)
  # expect_identical(glance$K, 6L)
  #
  # coef <- coef(analysis)
  # expect_is(coef, "tbl")
  # expect_is(coef, "mb_analysis_coef")
  # expect_identical(colnames(coef), c("term", "estimate", "sd", "zscore", "lower", "upper", "pvalue"))
  #
  # expect_identical(coef$term, as_term(c("(Intercept)", "feedhorsebean", "feedlinseed",
  #                                       "feedmeatmeal", "feedsoybean", "feedsunflower")))
  #
  # mcmcr <- as.mcmcr(analysis)
  # expect_is(mcmcr, "mcmcr")
  # expect_identical(nchains(mcmcr), 1L)
  # expect_identical(niters(mcmcr), 1L)
  # expect_identical(length(mcmcr), 6L)
  # expect_identical(names(mcmcr), c(
  #   "(Intercept)", "feedhorsebean", "feedlinseed", "feedmeatmeal", "feedsoybean", "feedsunflower"))
  #
  # estimates <- estimates(analysis)
  # expect_identical(length(estimates), 6L)
  # expect_identical(names(estimates), c(
  #   "(Intercept)", "feedhorsebean", "feedlinseed", "feedmeatmeal", "feedsoybean", "feedsunflower"))
  #
  # prediction <- predict(analysis)
  # expect_identical(colnames(prediction), c("weight", "feed", "estimate", "sd", "zscore", "lower", "upper", "pvalue"))
  # expect_identical(nrow(prediction), nrow(chickwts))
  #
  # expect_equal(prediction[,colnames(chickwts)], chickwts)
  #
  # expect_identical(prediction, fitted(analysis))
  #
  # prediction <- predict(analysis, new_data = "feed")
  # expect_identical(colnames(prediction), c("weight", "feed", "estimate", "sd", "zscore", "lower", "upper", "pvalue"))
  # expect_identical(nrow(prediction), nlevels(chickwts$feed))
  #
  # prediction <- predict(analysis, new_data = character(0))
  # expect_identical(colnames(prediction), c("weight", "feed", "estimate", "sd", "zscore", "lower", "upper", "pvalue"))
  # expect_identical(nrow(prediction), 1L)
})

test_that("model", {
  # template <- "Count ~ 1"
  # code <- mb_code(template)
  # model <- model(code)
  #
  # expect_s3_class(model, "lmb_model")
  # expect_identical(template(model), template)
  #
  # expect_equal(model, model(template))
  #
  # expect_error(model(code, select_data = 1))
  # expect_s3_class(model(code, select_data = list(Count = 1L)), "lmb_model")
  # expect_s3_class(model(code, select_data = list("Count*" = 1L)), "lmb_model")
})

test_that("analyse.character", {
  # analysis <- analyse("weight ~ feed", data = datasets::chickwts,
  #                     glance = FALSE, beep = FALSE)
  # expect_is(analysis, "lmb_analysis")
})

test_that("update_model", {
  # template <- "Count ~ 1"
  # code <- mb_code(template)
  # model <- model(code)
  #
  # model2 <- update_model(model, select_data = list("Count" = 1))
  # expect_false(identical(model, model2))
  # model2 <- update_model(model2, select_data = list())
  # expect_equal(model, model2)
})

test_that("add_models", {
  # model <- model("Count ~ 1")
  # models <- add_models(model, model)
  # expect_is(models, "mb_models")
  # expect_identical(length(models), 2L)
  # models <- add_models(models, models)
  # expect_is(models, "mb_models")
  # expect_identical(length(models), 4L)
})

test_that("add_analyses", {
  # analysis <- analyse("weight ~ 1", data = datasets::chickwts, beep = FALSE, glance = FALSE)
  # analyses <- add_analyses(analysis, analysis)
  # expect_is(analyses, "mb_analyses")
  # expect_identical(length(analyses), 2L)
  # analyses <- add_analyses(analyses, analyses)
  # expect_is(analyses, "mb_analyses")
  # expect_identical(length(analyses), 4L)
})

test_that("models", {
  # model <- model("weight ~ 1")
  # model2 <- model("weight ~ feed")
  #
  # models <- models(full = model, base = model2)
  # expect_is(models, "mb_models")
  # expect_identical(length(models), 2L)
  # expect_identical(names(models), c("full", "base"))
  #
  # analyses <- analyse(models, data = datasets::chickwts, beep = FALSE, glance = FALSE)
  # expect_is(analyses, "mb_analyses")
  # coef <- coef(analyses)
  # expect_is(coef, "mb_analyses_coef")
  # expect_identical(coef$term, as_term(c("(Intercept)", "feedhorsebean", "feedlinseed",
  #                                       "feedmeatmeal", "feedsoybean", "feedsunflower")))
  # expect_identical(coef$proportion, c(1.0, rep(0.5, 5)))
  #
  # ic <- IC(analyses)
  # expect_identical(colnames(ic), c("model", "K", "IC", "DeltaIC", "ICWt"))
  # expect_identical(ic$model, c("full", "base"))
  # expect_equal(ic$IC, c(821.3269, 777.1873), tolerance = 10^-6)
})

test_that("analyse models", {
  # model <- model("weight ~ 1")
  # models <- add_models(model, model)
  # analyses <- analyse(models, data = datasets::chickwts, glance = FALSE, beep = FALSE)
  #
  # expect_is(analyses, "mb_analyses")
  # expect_identical(length(analyses), 2L)
  #
  # analyses <- analyse(models, data = list(datasets::chickwts, datasets::chickwts),
  #                     glance = FALSE, beep = FALSE)
  #
  # expect_is(analyses, "list")
  # expect_identical(length(analyses), 2L)
  # expect_is(analyses[[1]], "mb_analyses")
  # expect_identical(length(analyses[[1]]), 2L)
})
