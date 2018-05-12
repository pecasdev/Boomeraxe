data_stack=ds_map_create()
leaderboard_state=s.download_wait
send_payload('pull',global.selected_profile,global.leaderboard_version)

timeout=50
show_debug_message('download started')
