import "jasmine";
import puppeteer, { Browser } from "puppeteer";

describe("WordPress Plugin", () => {
  let browser: Browser;

  beforeAll(async () => {
    browser = await puppeteer.launch();
  });

  afterAll(async () => {
    browser.close();
  });

  it("should greet me.", async () => {
    const page = await browser.newPage();
    await page.goto("http://localhost:8080");
    const greeting = await page.$eval("h1#greeting", (el) => {
      return el.textContent.trim();
    });
    expect(greeting).toEqual("Hello there.");
  });
});
