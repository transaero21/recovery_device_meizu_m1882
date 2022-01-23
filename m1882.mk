### CONFIGS ###
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs,$(TARGET_COPY_OUT_RECOVERY)/root)

### PROPRIETARY ###
$(call inherit-product, device/meizu/m1882/proprietary/m1882-vendor.mk)