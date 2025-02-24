const puppeteer = require('puppeteer');

// Get input and output file paths from command-line arguments
const args = process.argv.slice(2); // Skip "node" and script name
if (args.length !== 2) {
    console.error('Usage: node generate.js <input.html> <output.pdf>');
    process.exit(1);
}

const [inputFile, outputFile] = args;

(async () => {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();

    // Load the input HTML file
    await page.goto(`file://${process.cwd()}/${inputFile}`, { waitUntil: 'load' });

    // Generate the PDF with custom headers and footers
    await page.pdf({
        path: outputFile,
        format: 'Letter',
        margin: {
            top: '20mm',
            bottom: '20mm',
            right: '20mm',
            left: '20mm',
        },
        displayHeaderFooter: true,
        headerTemplate: `
            <div style="width: 100%; font-size: 10px; text-align: center; padding: 5px 0;">
                My Custom Header - Document Title
            </div>
        `,
        footerTemplate: `
             <div style="width: 100%; font-size: 10px; text-align: center; padding: 5px 0;">
                Page <span class="pageNumber"></span> of <span class="totalPages"></span>
            </div>
        `,
    });

    await browser.close();
    console.log(`PDF generated: ${outputFile}`);
})();
