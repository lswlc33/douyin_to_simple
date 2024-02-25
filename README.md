# 抖音清理

shell 脚本，清理抖音占用空间

# 说明

本脚本通过 `对目录清空` 和 `禁止写入权限` 来控制抖音体积  
部分目录可能会导致功能异常，但最基本的刷视频功能将保证  
通过对 `dyts.sh` 文件的编辑可以实现一些功能，比如 还原修改

```shell
# 模式 1为清理 2为还原
mode=1

# 要处理的目录 取消在前面加“#”即可
list=(
    "/data/data/com.ss.android.ugc.aweme/files/offlineX"
    # "/data/data/com.ss.android.ugc.aweme/files/offlineX"
    ...
)
```
# 下载

[进入这里](https://github.com/lswlc33/douyin_to_simple/blob/master/dyts.sh) 进去如图选 `Download`

![image](https://github.com/lswlc33/douyin_to_simple/assets/86835895/8ac953c8-636c-4c0d-bc7c-146444029fd0)
