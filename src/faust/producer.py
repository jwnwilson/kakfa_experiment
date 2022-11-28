import faust

from consumer import app, purchases


@app.command()
async def purchase():
    await purchases.send(value="Value sent", key="test key")


if __name__ == '__main__':
    app.main()