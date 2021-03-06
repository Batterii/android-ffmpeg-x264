LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE  := videokit
# These need to be in the right order
FFMPEG_LIBS := $(addprefix ffmpeg/, \
 libavdevice/libavdevice.a \
 libavformat/libavformat.a \
 libavfilter/libavfilter.a \
 libavcodec/libavcodec.a \
 libswscale/libswscale.a \
 libavutil/libavutil.a \
 libswresample/libswresample.a \
 libpostproc/libpostproc.a )
# ffmpeg uses its own deprecated functions liberally, so turn off that annoying noise
LOCAL_CFLAGS += -g -Iffmpeg -Ivideokit -Wno-deprecated-declarations 
LOCAL_LDLIBS += -llog -lz $(FFMPEG_LIBS) x264/libx264.a
LOCAL_SRC_FILES :=  ffmpeg/cmdutils.c ffmpeg/ffmpeg.c videokit/uk_co_halfninja_videokit_Videokit.c
include $(BUILD_SHARED_LIBRARY)
