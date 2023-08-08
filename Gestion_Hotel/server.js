//utilisation du framework web Express.js dans l'application
const { PrismaClient } = require('@prisma/client');
const express = require("express");

//créer une instance de l'application Express
const app = express();
app.use(express.json());

//Variable d'environnemnt
require('dotenv').config({path: "./config/.env"});

//créer des pools de connexions à une base de données PostgreSQL.
const pool = require("./db");

// Autoriser toutes les origines
const cors = require("cors");
app.use(cors());


const prisma = new PrismaClient()

app.get('/province_available', async (req, res) => {
    const result = await prisma.province_available.findMany()
    res.json(result)
})

app.get('/rooms', async (req, res) => {
    const prices = await prisma.price.findMany({
        select: {
            id_room: true,
            cost_per_night: true,
            season: {
            select:{
                    times: true,
                }
            },
        }
    })
    const rooms = await prisma.room.findMany({
        select: {
            room_type: true,
            id_room: true,
            hotel: {
                select:{
                    hotel_name: true,
                    province:true
                }
            },
          },
    });

    
    let data = [];
  
    for(const room of rooms){
        const priceRoom = prices.find(item => item.id_room === room.id_room);
        data.push({...room, priceRoom})
    }
    console.log(data)
    res.json(data)
})



app.get('/price', async (req, res) => {
    const rooms = await prisma.room.findMany({
        select: {
            cost_per_night : true,
            id_room : parseInt(true),
            hotel: {
                select:{
                    hotel_name: true,
                    province:true
                }
            },
          },
    });
    res.json(rooms)
})

app.get('/recent-reservations/:clientId', async (req, res) => {
  const { clientId } = req.params;
  try {
    const recentReservations = await prisma.reservation.findMany({
      where: {
        id_client: parseInt(clientId),
      },
      orderBy: {
        date_arrived: 'desc',
      },
    });
    res.json(recentReservations);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'An error occurred' });
  }
});


app.post('/searchByProvince', async (req, res) => {
    const { provinceId, type } = req.body;
    const prices = await prisma.price.findMany({
        select: {
            id_room: true,
            cost_per_night: true,
            season: {
            select:{
                    times: true,
                }
            },
        }
    })
    const rooms = await prisma.room.findMany({
        where: {
            AND: [
                { room_type: {
                    contains: type && type !== '' ? type : undefined,
                  } 
                },
                {
                    hotel: {
                        province: {
                          id_province : provinceId && provinceId !== '' ? Number(provinceId) :undefined,
                        }
                    }
                }
            ],
            
        },
        select: {
            room_type: true,
            id_room: true,
            hotel: {
                select:{
                    hotel_name: true,
                    province:true
                }
            },
          },
    });

    let data = [];
  
    for(const room of rooms){
        const priceRoom = prices.find(item => item.id_room === room.id_room);
        data.push({...room, priceRoom})
    }
    console.log(data)
    res.json(data)
})

app.listen(process.env.PORT, () => {
    console.log(`le serveur est lancer sur le port : ${process.env.PORT}`);
})