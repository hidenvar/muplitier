import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

def main():
    # Load CSV files into dataframes
    exact_results_df = pd.read_csv('exact_4x4.csv')
    approx_results_df = pd.read_csv('approx_4x4.csv')
    
    # Merge data on columns 'A' and 'B'
    merged_results_df = pd.merge(exact_results_df, approx_results_df, 
                                 on=['A', 'B'], 
                                 suffixes=('_exact', '_approx'))
    
    # Calculate error metrics
    merged_results_df['absolute_error'] = np.abs(
        merged_results_df['P_approx'] - merged_results_df['P_exact']
    )
    merged_results_df['relative_error'] = np.where(
        merged_results_df['P_exact'] != 0,
        merged_results_df['absolute_error'] / merged_results_df['P_exact'],
        0
    )
    
    # Compute statistics and error distribution
    error_distribution = merged_results_df['absolute_error'].value_counts().sort_index()
    total_cases = len(merged_results_df)
    correct_cases = (merged_results_df['absolute_error'] == 0).sum()
    mean_absolute_error = merged_results_df['absolute_error'].mean()
    mean_squared_error = (merged_results_df['absolute_error'] ** 2).mean()
    max_absolute_error = merged_results_df['absolute_error'].max()
    mean_relative_error_pct = merged_results_df.loc[
        merged_results_df['P_exact'] != 0, 'relative_error'
    ].mean() * 100

    accuracy_statistics = {
        "Total Cases": total_cases,
        "Correct Cases": correct_cases,
        "MAE": mean_absolute_error,
        "MSE": mean_squared_error,
        "Max Absolute Error": max_absolute_error,
        "Mean Relative Error (%)": mean_relative_error_pct,
        "Error Distribution": error_distribution
    }
    
    # Print accuracy statistics
    print("Accuracy Statistics:")
    for stat_name, stat_value in accuracy_statistics.items():
        if stat_name != "Error Distribution":
            print(f"{stat_name}: {stat_value:.4f}" if isinstance(stat_value, float) 
                  else f"{stat_name}: {stat_value}")
    
    # Generate and save the error heatmap
    error_heatmap_data = merged_results_df.pivot(index='A', columns='B', 
                                                 values='absolute_error')
    plt.figure(figsize=(10, 8))
    sns.heatmap(error_heatmap_data, annot=True, fmt="d", cmap="YlOrRd",
                cbar_kws={'label': 'Absolute Error'})
    plt.title("Absolute Error Heatmap (A vs B Input Combinations)")
    plt.xlabel("B Input")
    plt.ylabel("A Input")
    plt.savefig('error_heatmap.png', dpi=300, bbox_inches='tight')
    plt.clf()  # Clear the current figure

    # Generate and save the error distribution plot
    plt.figure(figsize=(10, 6))
    error_distribution.plot(kind='bar')
    plt.title("Absolute Error Distribution")
    plt.xlabel("Absolute Error")
    plt.ylabel("Frequency")
    plt.savefig('error_distribution.png', dpi=300, bbox_inches='tight')
    plt.clf()

    # Write statistics to a text file
    with open("accuracy_report.txt", "w") as report_file:
        report_file.write("4-bit Multiplier Accuracy Report\n")
        report_file.write("================================\n")
        for stat_name, stat_value in accuracy_statistics.items():
            if stat_name != "Error Distribution":
                report_file.write(f"{stat_name}: {stat_value}\n")
        report_file.write("\nError Distribution:\n")
        report_file.write(error_distribution.to_string())
    
    print("Analysis complete. Results saved to:")
    print("- error_heatmap.png")
    print("- error_distribution.png")
    print("- accuracy_report.txt")

if __name__ == '__main__':
    main()
