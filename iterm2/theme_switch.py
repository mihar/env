#!/usr/bin/env python3

import iterm2

async def set_theme(connection, theme):
	# Themes have space-delimited attributes, one of which will be light or dark.
	parts = theme.split(" ")
	if "dark" in parts:
		preset = await iterm2.ColorPreset.async_get(connection, "Tango Dark")
	else:
		preset = await iterm2.ColorPreset.async_get(connection, "Tango Light")

	# Update the list of all profiles and iterate over them.
	profiles = await iterm2.PartialProfile.async_get(connection)
	for profile in profiles:
		await profile.async_set_color_preset(preset)


async def main(connection):
	app = await iterm2.async_get_app(connection)
	theme = await app.async_get_variable("effectiveTheme")
	await set_theme(connection, theme)
	async with iterm2.VariableMonitor(connection, iterm2.VariableScopes.APP, "effectiveTheme", None) as mon:
		while True:
			# Block until theme changes
			theme = await mon.async_get()
			await set_theme(connection, theme)

iterm2.run_forever(main)
