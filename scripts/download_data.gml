data_stack=ds_map_create()
buffer_stack=ds_list_create()
leaderboard_state=s.download_wait
complete_size=undefined
send_payload('pull',global.selected_profile,global.leaderboard_version)

timeout=150
//show_message('download started'+'##PROFILE_SELECT: '+string(global.selected_profile)+'#VERSION: '+string(global.leaderboard_version))
