import asyncio

from aiob2 import Client

async def main():
    async with Client(AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY) as client:
        file = await client.download_file_by_name(
            file_name='test.jpg',
            bucket_name="HackNXS",
            content_type='pdf',      
        )
        


if __name__ == '__main__':
    asyncio.run(main())