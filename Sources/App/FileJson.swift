//
//  FileJson.swift
//  BaseProjectApp
//
//  Created by Tin Nguyen on 15/01/2024.
//  Copyright © 2024 Vulcan Labs. All rights reserved.
//

import Foundation
class FileJson {
    static var json = """
    [
        {
            "id": 1,
            "nameCategory": "Man",
            "imageCategory": "man",
            "listImage":[
               {
                 "id": 1,
                  "linkImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7vehghYrQ2EYTBCAczwZ5qXhLDSyG8aKA13Tia3NHvf6Xf3Nm"
               },
                {
                 "id": 2,
                  "linkImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaMlQw0ACRskJ2EfS0SeytZjVtdD4z4LrAkny-7zZE0wRHxuo3"
               },
    {
                 "id": 3,
                  "linkImage": "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQjILj0QinUF1HXGqqmpbVA7ss_Go_6SiM_BBuPgoMotU6brCK0"
               },
    {
                 "id": 4,
                  "linkImage": "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSNTO94K3-nWNEbuKPhAXgp0OMKhxTwp_BhsMzEiyyR-89eMBsQ"
               },
            ]
           
        },
        {
            "id": 2,
            "nameCategory": "Woman",
            "imageCategory": "woman",
            "listImage":[
               {
                 "id": 5,
                  "linkImage": "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ5AE8v1H47jLUeEz2dZxmmxFhWTmDk01B9IaTO5iSK7_j9K2GA"
               },
                {
                 "id": 6,
                  "linkImage": "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTAAr_15kE_1uQL86QVqOBH62QUFBGOnRFXF9QZYemQG7Ss1lJP"
               },
    {
                 "id": 7,
                  "linkImage": "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTNdgE1ReMp7b14YGLAyb68kHR9Gpr5f8fXgD_RFLhUj3h7Ewqs"
               },
    {
                 "id": 8,
                  "linkImage": "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSsrr0iBZo7mF6ltTPLNT1Lv8dp8eSnVnDzpw05JNwgcr77j4L8"
               },
            ]
           
        },
        {
            "id": 3,
            "nameCategory": "Landscape",
            "imageCategory": "landscape",
            "listImage":[
               {
                 "id":9,
                  "linkImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7fVMX828zMgo6g5jfqTm5r5XtyKTpKlFzLYgZHtpM94GB_HKf"
               },
                {
                 "id": 10,
                  "linkImage": "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRF1CvF6QEahQRfQHoWCGYLYs-zf9LHXoULwf9U7Vq5RY5jggMi"
               },
    {
                 "id": 11,
                  "linkImage": "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTcHZ5w8bvzUQWBNYX7eRXPmH5qvK6qc8DblD2dzKDYLer6O1Xe"
               },
    {
                 "id": 12,
                  "linkImage": "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTC5EjwVSfPDkNCOomG-FqlaPAr3wgOUihNfadHwRW6lKkuf24K"
               },
            ]
           
        },
    {
            "id": 4,
            "nameCategory": "Animal",
            "imageCategory": "animal",
            "listImage":[
               {
                 "id":13,
                  "linkImage": "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQd2kIduxa341rQDba1XvucRgq6MhwnWs5BMYTTdvT0hpZVuz_4"
               },
                {
                 "id": 14,
                  "linkImage": "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTFmp2Ocdg9cGHTx4ZsR6OQG9w8Qdz9M-JUzbH-YWLViqxHEOUo"
               },
    {
                 "id": 15,
                  "linkImage": "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQQPZK60cVqM4isaFBpf9KD2u3NiVcaslAteB88Z4f98kZZX0DR"
               },
    {
                 "id": 16,
                  "linkImage": "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcT4u7_OMXcFwJSR7zUC0GYRD-ehK9NP0JN_FAO2PmhXLfRSh4jQ"
               },
            ]
           
        },
    {
            "id": 5,
            "nameCategory": "Supper Car",
            "imageCategory": "supper_car",
            "listImage":[
               {
                 "id":17,
                  "linkImage": "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSh45FgbynZBuPqc9FylXz6PQyQwrY-StyvNNIyy_oV94MYs76q"
               },
                {
                 "id": 18,
                  "linkImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh94ezFAP_-3o8qGzQ6bTYmC37out3MPpCqkvYsbEKkrovmuvf"
               },
    {
                 "id": 19,
                  "linkImage": "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSG7fDaE6esisCLghcnCn6aboVSL080puNZAiLbjXNm-gzXdm9T"
               },
    {
                 "id": 20,
                  "linkImage": "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRZORXg90DZsLwG5GMuiD6UN1tOhzDerepnMaFZwXaOCCY2TdTu"
               },
            ]
           
        },
    {
            "id": 6,
            "nameCategory": "Mecha Robot",
            "imageCategory": "mecha_robot",
            "listImage":[
               {
                 "id":21,
                  "linkImage": "https://img.freepik.com/premium-photo/beautiful-girl-futuristic-vibes_316032-9066.jpg"
               },
                {
                 "id": 22,
                  "linkImage": "https://img.freepik.com/premium-photo/beautiful-girl-futuristic-vibes_316032-9084.jpg"
               },
    {
                 "id": 23,
                  "linkImage": "https://img.freepik.com/premium-photo/3d-render-mecha-robot-anime-girl_665569-484.jpg"
               },
    {
                 "id": 24,
                  "linkImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2W3LLwVj-hW01vLhJntrQyhZbA0RsYaPQuGIyYV3fyRyzeAr8nfiQSB622QK-XPTAtFE&usqp=CAU"
               },
            ]
           
        },
    ]
    """
}
