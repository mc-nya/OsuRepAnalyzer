# Osu Replay Analyzer

## 依赖环境

    python+matlab

## 使用方法

将要分析的replay放入replays文件夹,运行：

    cd src
    python replay.py

获得的matlab矩阵文件将保存在replays_mat中，将replay加载进matlab后，运行vis.m,可以看到可视化轨迹效果

### ps:

最近matlab用的顺手，懒得写matplotlib版本的可视化了XD
