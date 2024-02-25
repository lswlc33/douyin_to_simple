# 模式 1为清理 2为还原
mode=1

# 要处理的目录 取消在前面加“#”即可
list=(
    "/data/data/com.ss.android.ugc.aweme/cache/"
    "/data/data/com.ss.android.ugc.aweme/files/offlineX"
    "/data/data/com.ss.android.ugc.aweme/files/plugins"
    "/data/data/com.ss.android.ugc.aweme/files/luckycat_gecko_root_dir/"
    "/data/data/com.ss.android.ugc.aweme/files/.patchs/"
    # 同设置-清理资源占用-资源文件
    "/data/data/com.ss.android.ugc.aweme/app_assets/"
    # 同设置-清理资源占用-临时文件
    "/storage/emulated/0/Android/data/com.ss.android.ugc.aweme/cache/"
    # 错误日志（例如特效下载失败）
    "/data/data/com.ss.android.ugc.aweme/files/logs/"
    # 编辑-视频特效
    "/data/data/com.ss.android.ugc.aweme/files/effectmodel/"
    "/data/data/com.ss.android.ugc.aweme/files/effect/"
    # 编辑-音乐
    "/data/data/com.ss.android.ugc.aweme/files/music_stream_edit/"
    # 貌似是 草稿箱
    # "/data/data/com.ss.android.ugc.aweme/files/tmp_video/"
    # 貌似是 贴纸素材等
    "/data/data/com.ss.android.ugc.aweme/files/preset/"
    # 貌似是 云控配置
    "/data/data/com.ss.android.ugc.aweme/files/SettingsRecorder/"
)

# 版本号
version=3

# 判断用户权限
if [ "$(whoami)" != 'root' ]; then
    echo "请使用root权限运行！"
    exit 1
fi

# 清理函数
clean() {
    if [ ! -e "$1" ]; then
        echo "文件没找到，跳过"
    else
        size=$(du -sh "$1" | cut -f1)
        if [ $size == "3.5K" ]; then
            echo "不用清理"
        else
            echo "可清理 $size"
        fi

        rm -rf $1 # 清理文件
        mkdir $1
        chmod 000 $1 # 设置权限

        echo 处理完成
    fi
    echo
}

# 还原函数
recover() {
    if [ ! -e "$1" ]; then
        echo "文件没找到，跳过"
    else
        chmod 700 $1
        echo 还原成功
    fi
}

echo "抖音空间清理V${version} By 雪中明月"
echo 仓库地址: https://github.com/lswlc33/douyin_to_simple

if [ $mode == 1 ]; then
    echo 当前模式：清理模式
    echo
    for i in ${list[*]}; do
        clean $i
    done

elif [ $mode == 2 ]; then
    echo 当前模式：恢复模式
    echo
    for i in ${list[*]}; do
        recover $i
    done

else
    echo mode模式配置错误
    exit 1
fi

echo 完成
