// Set input and output folders
inputDir = "/Users/johnmunnoch/Documents/Work/4_2023-onwards/0-LTEE_continued/Pelleting\ phenotype/JPCLP\ round\ 2/Pellet\ diameter/Pellet_measuring/Scale_bar/measures/Flatten_area/";
outputDir = "/Users/johnmunnoch/Documents/Work/4_2023-onwards/0-LTEE_continued/Pelleting\ phenotype/JPCLP\ round\ 2/Pellet\ diameter/Pellet_measuring/Scale_bar/measures/Flatten_area_scale_bar/";

// Get list of image files
list = getFileList(inputDir);

for (i = 0; i < list.length; i++) {
    if (endsWith(list[i], ".tif") || endsWith(list[i], ".tif")) {
        open(inputDir + list[i]);

        // Set scale: 236 pixels = 1 mm, pixel aspect ratio 1
        run("Set Scale...", "distance=236 known=100 unit=µm global");
		run("Scale Bar...", "width=20 height=0.1 thickness=10 font=20 bold");
        
        // File name manipulation
        dot = lastIndexOf(list[i], ".");
        base = substring(list[i], 0, dot);
        ext = substring(list[i], dot);


		// Save skeletonized image
		saveAs("Tiff", outputDir + base + "_scale-bar" + ext);

        // Close image to free memory
        close();
    }
}
