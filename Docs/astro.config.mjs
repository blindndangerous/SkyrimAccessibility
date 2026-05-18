// @ts-check
import { defineConfig } from "astro/config";
import starlight from "@astrojs/starlight";
import starlightLinksValidator from "starlight-links-validator";
import starlightKbd from "starlight-kbd";
import starlightImageZoom from "starlight-image-zoom";
// todo: add versions back in once it works with Astro 6
// import starlightVersions from "starlight-versions";

// https://astro.build/config
export default defineConfig({
	integrations: [
		starlight({
			title: "Skyrim Accessibility Docs",
			plugins: [
				starlightLinksValidator(),
				starlightKbd({
					types: [
						{
							id: "windows",
							label: "Windows",
							detector: "windows",
							default: true,
						},
						{
							id: "controller",
							label: "Controller",
						},
					],
				}),
				starlightImageZoom(),
				/*
				starlightVersions({
					versions: [
						{
							slug: "0.11",
						},
					],
				}),
				*/
			],
			social: [
				{
					icon: "github",
					label: "GitHub",
					href: "https://github.com/DioKyrie-Git/SkyrimAccessibility",
				},
			],
			sidebar: [],
		}),
	],
});
