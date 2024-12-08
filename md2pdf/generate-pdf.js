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
        format: 'A4',
        margin: {
            top: '20mm',
            bottom: '20mm',
        },
        displayHeaderFooter: true,
        headerTemplate: `
            <div style="font-size: 10px; text-align: center; width: 100%; margin-top: 10px;">
                Custom Header: Your Information Here
            </div>
        `,
        footerTemplate: `
            <div style="font-size: 10px; text-align: center; width: 100%; margin-bottom: 10px;">
                Page <span class="pageNumber"></span> of <span class="totalPages"></span>
            </div>
        `,
    });

    await browser.close();
    console.log(`PDF generated: ${outputFile}`);
})();
