API doc:

    Get all free order:
        URL: /order/all
        Methods: Get
        Output:[{
            "order_id": 1,
            "from": "770 Sư Vạn Hạnh10HCM",
            "to": "61/1, Xô Viết Nghệ Tĩnh, quận Bình Thạnh",
            "cutomer_name": "Nguyễn Thu An",
            "store_name": "Toco Toco Bubble Tea"
        },
        {
            "order_id": 2,
            "from": "770 Sư Vạn Hạnh10HCM",
            "to": "652 Huỳnh Tấn Phát, quận 7",
            "cutomer_name": "Trần Quốc Vương",
            "store_name": "Toco Toco Bubble Tea"
        }]

    Get store info by store id
        Methods: Get
        URL: /store
        Header:
            Query: "store_id" (id of store)
        Output:{
            "id": 1,
            "avatar": "https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fbanhhue.jpg?alt=media&token=e6a9a1b9-314f-4a3b-822a-68fafb8eeedd",
            "city": "HCM",
            "district": "9",
            "name": "Bánh Huế",
            "phone": "",
            "revenue": "",
            "street": "175/60 Lê Văn Việt",
            "type": "Ăn Vặt",
            "user_name": ""
        }

    Update shipper info
        Method: Put
        URL: /shipper
        Body:{
            "id": 5,
            "name": "ABC",
            "status": 1,
            "avatar": "avatar",
            "username": "shipper",
            "phone": "123456"
        }

    Get shipper's info
        Method: Get
        URL: /shipper
        Header:
            Query: "shipper_id" (id of shipper)
        Output:{
            "id": 5,
            "name": "ABC",
            "status": 1,
            "avatar": "avatar",
            "username": "shipper",
            "phone": "123456"
        }

    Create order detail
        Method: Post
        URL: /order_detail
        Body:{
            "id": 31,
            "product_id": 2,
            "order_id": 3,
            "customer_id": 5,
            "price": "12000",
            "status": 0,
            "amount": 2,
            "date": "2018-10-21 11:05:22" (valid format)
        }

    Delete order detail
        Method: Delete
        URL: /order_detail
        Body:{
            "order_detail_id"
        }
        Output:{
            "message"
        }

    Update order detail
        Method: Put
        URL: /order_detail
        Body:{
            "id": 8,
            "product_id": 2,
            "order_id": 4,
            "customer_id": 6,
            "price": "12556",
            "status": 1,
            "amount": 3,
            "date": "2018-10-31 23:49:57" (valid format)
        }
        Output:{
            "id": 8,
            "product_id": 2,
            "order_id": 4,
            "customer_id": 6,
            "price": "12556",
            "status": 1,
            "amount": 3,
            "date": "2018-10-31 23:49:57"
        }

    Get order detail by id
        Method: Get
        URL: /order_detail
        Header:
            Query: "order_detail_id"
        Output:{
            "id": 2,
            "product_id": 2,
            "order_id": 2,
            "customer_id": 2,
            "price": "90000",
            "status": 1,
            "amount": 2,
            "date": "2018-10-31T23:49:57+07:00"
        }

    Delete an order
        Method: Delete
        URL: /order
        Body:{
            "order_id"
        }
        Output:{
            "message"
        }

    Update info of an order
        Method: Put
        URL: /order
        Body:{
            "id": 98,
            "customer_id": 2,
            "shipper_id": 6,
            "date": "2018-10-20 16:23:19", (valid format)
            "status": 0,
            "sum_price": "189000",
            "address_customer": "61/1, Xô Viết Nghệ Tĩnh, quận Bình Thạnh",
            "phone": "01629514200",
            "store_id": 3
        }
        Output:{
            "id": 98,
            "customer_id": 2,
            "shipper_id": 6,
            "date": "2018-10-20 16:23:19", (valid format)
            "status": 0,
            "sum_price": "189000",
            "address_customer": "61/1, Xô Viết Nghệ Tĩnh, quận Bình Thạnh",
            "phone": "01629514200",
            "store_id": 3
        }

    Create order info
        Method: Post
        URL: /order
        Body:{
            "customer_id": 2,
            "shipper_id": 6,
            "date": "2018-10-20 16:23:19", (valid format)
            "status": 0,
            "sum_price": "189000",
            "address_customer": "61/1, Xô Viết Nghệ Tĩnh, quận Bình Thạnh",
            "phone": "01629514200",
            "store_id": 3
        }
        Output:{
            "id": 98,
            "customer_id": 2,
            "shipper_id": 6,
            "date": "2018-10-20 16:23:19",
            "status": 0,
            "sum_price": "189000",
            "address_customer": "61/1, Xô Viết Nghệ Tĩnh, quận Bình Thạnh",
            "phone": "01629514200",
            "store_id": 3
        }

    Get order info by id
        Method: Get
        URL: /order
        Header:
            Query: "order_id"
        Output:{
            "id": 2,
            "customer_id": 3,
            "shipper_id": 6,
            "date": "2018-10-20T16:23:19+07:00",
            "status": 0,
            "sum_price": "189000",
            "address_customer": "61/1, Xô Viết Nghệ Tĩnh, quận Bình Thạnh",
            "phone": "01629514200",
            "store_id": 2
        }

	Get customer by id
        Method: Get
        URL: /customer
        Header:
            Query: "customer_id"
        Output:{
            "id": 3,
            "phone": "01629514200",
            "address": "61/1, Xô Viết Nghệ Tĩnh, quận Bình Thạnh",
            "name": "Nguyễn Thu An",
            "avatar": "",
            "email": "thanhtinhpas3",
            "token": ""
        }