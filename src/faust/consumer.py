import faust

app = faust.App(
    'purchases',
    broker='kafka://localhost:9092',
    value_serializer='raw',
)

purchases_topic = app.topic('purchases')

@app.agent(purchases_topic)
async def purchases(purchases):
    async for purchase in purchases:
        print(purchase)
