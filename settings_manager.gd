extends Node


@onready var scaling_2d_option_button: OptionButton = %Scaling2DOptionButton
@onready var scaling_3d_option_button: OptionButton = %Scaling3DOptionButton
@onready var shadow_quality_option_button: OptionButton = %ShadowQualityOptionButton


const scaling_2d_default: int = 0
const scaling_3d_default: int = 0
const shadow_quality_default: int = 0


func _ready() -> void:
	set_scaling_2d(scaling_2d_default)
	set_scaling_3d(scaling_3d_default)
	set_shadow_quality(shadow_quality_default)
	scaling_2d_option_button.selected = scaling_2d_default
	scaling_3d_option_button.selected = scaling_3d_default
	shadow_quality_option_button.selected = shadow_quality_default


func set_scaling_2d(new_scaling_2d: int) -> void:
	match new_scaling_2d:
		0:
			get_viewport().msaa_2d = Viewport.MSAA_DISABLED
		1:
			get_viewport().msaa_2d = Viewport.MSAA_2X
		2:
			get_viewport().msaa_2d = Viewport.MSAA_4X
		3:
			get_viewport().msaa_2d = Viewport.MSAA_8X


func set_scaling_3d(new_scaling_3d: int) -> void:
	reset_scaling_3d()
	match new_scaling_3d:
		0:
			pass
		1:
			get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_FXAA
		2:
			get_viewport().msaa_3d = Viewport.MSAA_2X
		3:
			get_viewport().msaa_3d = Viewport.MSAA_4X
		4:
			get_viewport().msaa_3d = Viewport.MSAA_8X
		5:
			get_viewport().use_taa = true
		6:
			get_viewport().scaling_3d_mode = Viewport.SCALING_3D_MODE_FSR
		7:
			get_viewport().scaling_3d_mode = Viewport.SCALING_3D_MODE_FSR2
			get_viewport().scaling_3d_scale = 0.5
		8:
			get_viewport().scaling_3d_mode = Viewport.SCALING_3D_MODE_FSR2
			get_viewport().scaling_3d_scale = 1


func reset_scaling_3d() -> void:
	get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_DISABLED
	get_viewport().msaa_3d = Viewport.MSAA_DISABLED
	get_viewport().use_taa = false
	get_viewport().scaling_3d_mode = Viewport.SCALING_3D_MODE_BILINEAR


func set_shadow_quality(new_shadow_quality: int) -> void:
	match new_shadow_quality:
		0:
			RenderingServer.directional_shadow_atlas_set_size(2048, true)
		1:
			RenderingServer.directional_shadow_atlas_set_size(4096, true)
		2:
			RenderingServer.directional_shadow_atlas_set_size(8192, true)


func _on_scaling_2d_option_button_item_selected(new_scaling_2d: int) -> void:
	set_scaling_2d(new_scaling_2d)


func _on_scaling_3d_option_button_item_selected(new_scaling_3d: int) -> void:
	set_scaling_3d(new_scaling_3d)


func _on_shadow_quality_option_button_item_selected(new_shadow_quality: int) -> void:
	set_shadow_quality(new_shadow_quality)
