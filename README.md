# DescriptiveTumor

## All Checkpoints Link
```bash
https://drive.google.com/drive/folders/1v0TyqVyXjoALSFaTt4l3u4eh0k4jO_V5?usp=drive_link

## Steps

1. **Replace Files**
    - Replace the following in `Difftumor/STEP3`:
      - `main.py`
      - `hg.sh`
      - `cross_eval` folder

2. **Update Data Path**
    - Modify the data path in `hg.sh` to point to your dataset.

3. **Train Specific Fold**
    - Set `fold=0` for training.

4. **Return Checkpoints**
    - Three checkpoints will be generated for:
      - `difftumor-liver`
      - `difftumor-pancreas`
      - `difftumor-kidney`

5. **Future Checkpoint Updates**
    - Subsequent checkpoints will use `descriptivetumor1`, `descriptivetumor2`, and `descriptivetumor3` for liver, pancreas, and kidney.
    - Train across 5 folds and return checkpoints sequentially.
