def evaluate_model(*model_sets):
    #import within function to avoid errors
    import pandas as pd
    import numpy as np
    from sklearn.metrics import mean_squared_error, mean_absolute_error, r2_score
    #create an empty DataFrame to store the results
    evaluation_table = pd.DataFrame(columns=['Model', 'RMSE', 'MSE', 'MAE', 'R2'], index=None)
    #iterate over the model sets to calculate the evaluation metrics for each model
    for model_set in model_sets:
        #unpack the model set
        model_name, test_data, prediction_data = model_set
        #calculate the evaluation metrics
        rmse = np.sqrt(mean_squared_error(test_data, prediction_data))
        mse = mean_squared_error(test_data, prediction_data)
        mae = mean_absolute_error(test_data, prediction_data)
        r2 = r2_score(test_data, prediction_data)

        #append the results to the DataFrame using pd.concat
        result_row = pd.DataFrame({
            'Model': [model_name],
            'RMSE': [rmse],
            'MSE': [mse],
            'MAE': [mae],
            'R2': [r2]
        })
        #concatenate the result row to the evaluation table
        evaluation_table = pd.concat([evaluation_table, result_row], ignore_index=True)
    #return the evaluation table
    return evaluation_table