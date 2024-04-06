import asyncio

from aiob2 import Client

with open(r'C:/Users/Hari Keshav Rajesh/Desktop/Computer Projects and resources/hacknxs/api/api/test.py', 'rb') as file:
    data = file.read()

async def main():
    async with Client(AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY) as client:
        file = await client.upload_file(
            content_bytes=data,
            file_name='test.jpg',
            bucket_id='ea6c509682d8b02a8eee0012',
        )
        print(file)

if __name__ == '__main__':
    asyncio.run(main())


