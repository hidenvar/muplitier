# User Guide

## Debian-Based Systems

### Making the Simulation Executable
For each module, make the simulation script executable using the following command:

```sh
chmod +x modname_simulate.sh
```

### Running the Simulation
Execute the simulation with:

```sh
./modname_simulate.sh
```

### Generating Statistical Data
To analyze the generated statistical data:
1. Run the simulation script.
2. Execute the corresponding Python script to see the results.

### Requirements
You may need to install some Python libraries. Ensure you have the following dependencies installed:

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
```

To install these dependencies, use:

```sh
pip install pandas numpy matplotlib seaborn
```

