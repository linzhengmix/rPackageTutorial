test_that("contents() return a data frame", {
    df <- readRDS(test_path("df.rds"))
    expect_equal(contents(happiness), df)
})
