defmodule FoodTourAppWeb.Fixtures.TourJson do
  def get_tour() do
    tour1 = %{
      "tour" => %{
        "estimated_time" => 1234,
        "name" => "Sweet Thooth",
        "price" => 1700,
        "waypoints" => [
          %{
            "description" => "Delicious Hazelnut- Raspberry Cake",
            "dish_id" => 1,
            "eta" => 25,
            "image" =>
              "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/ShadesOfRed/ShadesOfRed-HazelNutRaspeberryCake.jpeg?raw=true",
            "inserted_at" => "2023-09-14T12:28:27",
            "location" => %{
              "description" => "Bulgarian Cuisine",
              "id" => 1,
              "image" =>
                "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/ShadesOfRed/ShadesOfRead-RestHeader.jpeg?raw=true",
              "inserted_at" => "2023-09-14T11:47:19",
              "lat" => 42.696558840340266,
              "long" => 23.325950390074755,
              "merchant_name" => "Shades of Red Restaurant",
              "updated_at" => "2023-09-14T11:47:19"
            },
            "location_id" => 1,
            "name" => "Hazelnut- Raspberry Cake",
            "order" => 1,
            "price" => "4000.00",
            "themes" => [
              %{
                "id" => 8,
                "image" =>
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNOzM9cWXRoP9iqbW-GVOr8ESYxR_ZJ2XTZA&usqp=CAU",
                "inserted_at" => "2023-09-14T12:24:59",
                "subtitle" => "Treat yourself with some sugary sweets ",
                "title" => "Sweet Tooth",
                "updated_at" => "2023-09-14T12:24:59"
              }
            ],
            "updated_at" => "2023-09-14T12:28:27"
          },
          %{
            "description" => "Baklava Cheesecake",
            "dish_id" => 6,
            "eta" => 15,
            "image" =>
              "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/Spaghetti-Kitchen/spaghetti-baklava.jpeg?raw=true",
            "inserted_at" => "2023-09-14T12:37:24",
            "location" => %{
              "description" => "Italian Food",
              "id" => 2,
              "image" =>
                "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/Spaghetti-Kitchen/spaghetti-kitchen.jpeg?raw=true",
              "inserted_at" => "2023-09-14T11:50:27",
              "lat" => 42.69376098265446,
              "long" => 23.330128708021284,
              "merchant_name" => "Spaghetti Kitchen",
              "updated_at" => "2023-09-14T11:50:27"
            },
            "location_id" => 2,
            "name" => "Baklava",
            "order" => 2,
            "price" => "5000.00",
            "themes" => [
              %{
                "id" => 8,
                "image" =>
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNOzM9cWXRoP9iqbW-GVOr8ESYxR_ZJ2XTZA&usqp=CAU",
                "inserted_at" => "2023-09-14T12:24:59",
                "subtitle" => "Treat yourself with some sugary sweets ",
                "title" => "Sweet Tooth",
                "updated_at" => "2023-09-14T12:24:59"
              }
            ],
            "updated_at" => "2023-09-14T12:37:24"
          },
          %{
            "description" => "Salted caramel chocolate tart",
            "dish_id" => 16,
            "eta" => 20,
            "image" =>
              "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/MadeInBlue/madeinblue-chocolatecake.jpeg?raw=true",
            "inserted_at" => "2023-09-14T13:02:44",
            "location" => %{
              "description" => "Modern European Restaurant",
              "id" => 4,
              "image" =>
                "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/MadeInBlue/madeinblue-header.jpeg?raw=true",
              "inserted_at" => "2023-09-14T11:53:26",
              "lat" => 42.69422630990759,
              "long" => 23.32570296785343,
              "merchant_name" => "Made in Blue",
              "updated_at" => "2023-09-14T11:53:26"
            },
            "location_id" => 4,
            "name" => "Salted caramel chocolate tart",
            "order" => 3,
            "price" => "5000.00",
            "themes" => [
              %{
                "id" => 8,
                "image" =>
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNOzM9cWXRoP9iqbW-GVOr8ESYxR_ZJ2XTZA&usqp=CAU",
                "inserted_at" => "2023-09-14T12:24:59",
                "subtitle" => "Treat yourself with some sugary sweets ",
                "title" => "Sweet Tooth",
                "updated_at" => "2023-09-14T12:24:59"
              }
            ],
            "updated_at" => "2023-09-14T13:02:44"
          },
          %{
            "description" => "Berries cake",
            "dish_id" => 12,
            "eta" => 20,
            "image" =>
              "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/TheLittleThings/littlethings-berriescake.jpeg?raw=true",
            "inserted_at" => "2023-09-14T12:54:27",
            "location" => %{
              "description" => "European Restaurant",
              "id" => 3,
              "image" =>
                "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/TheLittleThings/littlethings-headers.jpeg?raw=true",
              "inserted_at" => "2023-09-14T11:51:36",
              "lat" => 42.68986365345295,
              "long" => 23.328125542932177,
              "merchant_name" => "The Little Things",
              "updated_at" => "2023-09-14T11:51:36"
            },
            "location_id" => 3,
            "name" => "Berries cake",
            "order" => 3,
            "price" => "3000.00",
            "themes" => [
              %{
                "id" => 8,
                "image" =>
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNOzM9cWXRoP9iqbW-GVOr8ESYxR_ZJ2XTZA&usqp=CAU",
                "inserted_at" => "2023-09-14T12:24:59",
                "subtitle" => "Treat yourself with some sugary sweets ",
                "title" => "Sweet Tooth",
                "updated_at" => "2023-09-14T12:24:59"
              }
            ],
            "updated_at" => "2023-09-14T12:54:27"
          }
        ]
      }
    }

    tour2 = %{
      "tour" => %{
        "estimated_time" => 1234,
        "name" => "All The Meats",
        "price" => 28000,
        "waypoints" => [
          %{
            "description" => "Tagliatelle with porcini and beef fillet",
            "dish_id" => 3,
            "eta" => 25,
            "image" =>
              "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/Spaghetti-Kitchen/ShadesOfRed-OctopusSalad.jpeg?raw=true",
            "inserted_at" => "2023-09-14T12:30:57",
            "location" => %{
              "description" => "Bulgarian Cuisine",
              "id" => 1,
              "image" =>
                "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/ShadesOfRed/ShadesOfRead-RestHeader.jpeg?raw=true",
              "inserted_at" => "2023-09-14T11:47:19",
              "lat" => 42.696558840340266,
              "long" => 23.325950390074755,
              "merchant_name" => "Shades of Red Restaurant",
              "updated_at" => "2023-09-14T11:47:19"
            },
            "location_id" => 1,
            "name" => "Tagliatelle with porcini and beef fillet",
            "order" => 1,
            "price" => "10000.00",
            "themes" => [
              %{
                "id" => 7,
                "image" => "https://gruponutresa.b-cdn.net/wp-content/uploads/2022/08/pastas.jpg",
                "inserted_at" => "2023-09-13T09:26:50",
                "subtitle" => "All our favorites pastas",
                "title" => "Pastas",
                "updated_at" => "2023-09-13T09:26:50"
              }
            ],
            "updated_at" => "2023-09-14T12:30:57"
          },
          %{
            "description" => "Pizza with three types of prosciutto and rucula toppings",
            "dish_id" => 9,
            "eta" => 15,
            "image" =>
              "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/Spaghetti-Kitchen/spaghetti-pizza.jpeg?raw=true",
            "inserted_at" => "2023-09-14T12:47:46",
            "location" => %{
              "description" => "Italian Food",
              "id" => 2,
              "image" =>
                "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/Spaghetti-Kitchen/spaghetti-kitchen.jpeg?raw=true",
              "inserted_at" => "2023-09-14T11:50:27",
              "lat" => 42.69376098265446,
              "long" => 23.330128708021284,
              "merchant_name" => "Spaghetti Kitchen",
              "updated_at" => "2023-09-14T11:50:27"
            },
            "location_id" => 2,
            "name" => "Pizza Triprosciutto",
            "order" => 2,
            "price" => "8000.00",
            "themes" => [
              %{
                "id" => 5,
                "image" =>
                  "https://admin.acceleratingscience.com/food/wp-content/uploads/sites/5/2020/10/istock-694177316_varietycookedmeats-1.jpg",
                "inserted_at" => "2023-09-13T08:47:37",
                "subtitle" => "For Proteins Cravings",
                "title" => "All The Meats",
                "updated_at" => "2023-09-13T08:47:37"
              }
            ],
            "updated_at" => "2023-09-14T12:47:46"
          },
          %{
            "description" => "Slow roasted beef with parsnip purée",
            "dish_id" => 18,
            "eta" => 20,
            "image" =>
              "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/MadeInBlue/madeinblue-RoastedBeef.jpeg?raw=true",
            "inserted_at" => "2023-09-14T13:04:24",
            "location" => %{
              "description" => "Modern European Restaurant",
              "id" => 4,
              "image" =>
                "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/MadeInBlue/madeinblue-header.jpeg?raw=true",
              "inserted_at" => "2023-09-14T11:53:26",
              "lat" => 42.69422630990759,
              "long" => 23.32570296785343,
              "merchant_name" => "Made in Blue",
              "updated_at" => "2023-09-14T11:53:26"
            },
            "location_id" => 4,
            "name" => "Roasted Beef",
            "order" => 3,
            "price" => "5000.00",
            "themes" => [
              %{
                "id" => 5,
                "image" =>
                  "https://admin.acceleratingscience.com/food/wp-content/uploads/sites/5/2020/10/istock-694177316_varietycookedmeats-1.jpg",
                "inserted_at" => "2023-09-13T08:47:37",
                "subtitle" => "For Proteins Cravings",
                "title" => "All The Meats",
                "updated_at" => "2023-09-13T08:47:37"
              }
            ],
            "updated_at" => "2023-09-14T13:04:24"
          },
          %{
            "description" => "Pork fillet",
            "dish_id" => 5,
            "eta" => 20,
            "id" => 5,
            "image" =>
              "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/Spaghetti-Kitchen/ShadesOfRed-OctopusSalad.jpeg?raw=true",
            "inserted_at" => "2023-09-14T12:32:54",
            "location" => %{
              "description" => "Bulgarian Cuisine",
              "id" => 1,
              "image" =>
                "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/ShadesOfRed/ShadesOfRead-RestHeader.jpeg?raw=true",
              "inserted_at" => "2023-09-14T11:47:19",
              "lat" => 42.696558840340266,
              "long" => 23.325950390074755,
              "merchant_name" => "Shades of Red Restaurant",
              "updated_at" => "2023-09-14T11:47:19"
            },
            "location_id" => 1,
            "name" => "Pork fillet",
            "order" => 4,
            "price" => "10000.00",
            "themes" => [
              %{
                "id" => 5,
                "image" =>
                  "https://admin.acceleratingscience.com/food/wp-content/uploads/sites/5/2020/10/istock-694177316_varietycookedmeats-1.jpg",
                "inserted_at" => "2023-09-13T08:47:37",
                "subtitle" => "For Proteins Cravings",
                "title" => "All The Meats",
                "updated_at" => "2023-09-13T08:47:37"
              }
            ],
            "updated_at" => "2023-09-14T12:32:54"
          }
        ]
      }
    }

    tour3 = %{
      "tour" => %{
        "estimated_time" => 1234,
        "name" => "Flavours of the Sea",
        "price" => 20000,
        "waypoints" => [
          %{
            "description" =>
              "Mixed Green Salad featuring tender grilled octopus and a zesty capers dressing takes",
            "dish_id" => 2,
            "eta" => 25,
            "image" =>
              "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/Spaghetti-Kitchen/ShadesOfRed-OctopusSalad.jpeg?raw=true",
            "inserted_at" => "2023-09-14T12:30:14",
            "location" => %{
              "description" => "Bulgarian Cuisine",
              "id" => 1,
              "image" =>
                "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/ShadesOfRed/ShadesOfRead-RestHeader.jpeg?raw=true",
              "inserted_at" => "2023-09-14T11:47:19",
              "lat" => 42.696558840340266,
              "long" => 23.325950390074755,
              "merchant_name" => "Shades of Red Restaurant",
              "updated_at" => "2023-09-14T11:47:19"
            },
            "location_id" => 1,
            "name" => "Octopus Salad",
            "order" => 1,
            "price" => "10000.00",
            "themes" => [
              %{
                "id" => 6,
                "image" =>
                  "https://montrealnightlife.com/wp-content/uploads/2023/05/MOntreal-Seafood.jpg",
                "inserted_at" => "2023-09-13T08:51:59",
                "subtitle" => "All the fresh tastes of the Ocean",
                "title" => "Flavours of the Sea",
                "updated_at" => "2023-09-13T08:51:59"
              }
            ],
            "updated_at" => "2023-09-14T12:30:14"
          },
          %{
            "description" =>
              "norwegian salmon with spicy mango chutney, served on lemon orzo pasta",
            "dish_id" => 7,
            "eta" => 15,
            "image" =>
              "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/Spaghetti-Kitchen/spaghetti-salmon.jpeg?raw=true",
            "inserted_at" => "2023-09-14T12:38:30",
            "location" => %{
              "description" => "Italian Food",
              "id" => 2,
              "image" =>
                "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/Spaghetti-Kitchen/spaghetti-kitchen.jpeg?raw=true",
              "inserted_at" => "2023-09-14T11:50:27",
              "lat" => 42.69376098265446,
              "long" => 23.330128708021284,
              "merchant_name" => "Spaghetti Kitchen",
              "updated_at" => "2023-09-14T11:50:27"
            },
            "location_id" => 2,
            "name" => "Salmon",
            "order" => 2,
            "price" => "5000.00",
            "themes" => [
              %{
                "id" => 6,
                "image" =>
                  "https://montrealnightlife.com/wp-content/uploads/2023/05/MOntreal-Seafood.jpg",
                "inserted_at" => "2023-09-13T08:51:59",
                "subtitle" => "All the fresh tastes of the Ocean",
                "title" => "Flavours of the Sea",
                "updated_at" => "2023-09-13T08:51:59"
              }
            ],
            "updated_at" => "2023-09-14T12:38:30"
          },
          %{
            "description" => "Grilled Fish with potatoes and mayoneise salad",
            "dish_id" => 17,
            "eta" => 20,
            "image" =>
              "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/MadeInBlue/madeinblue-Fish.jpeg?raw=true",
            "inserted_at" => "2023-09-14T13:03:32",
            "location" => %{
              "description" => "Modern European Restaurant",
              "id" => 4,
              "image" =>
                "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/MadeInBlue/madeinblue-header.jpeg?raw=true",
              "inserted_at" => "2023-09-14T11:53:26",
              "lat" => 42.69422630990759,
              "long" => 23.32570296785343,
              "merchant_name" => "Made in Blue",
              "updated_at" => "2023-09-14T11:53:26"
            },
            "location_id" => 4,
            "name" => "Fish Dish",
            "order" => 3,
            "price" => "5000.00",
            "themes" => [
              %{
                "id" => 6,
                "image" =>
                  "https://montrealnightlife.com/wp-content/uploads/2023/05/MOntreal-Seafood.jpg",
                "inserted_at" => "2023-09-13T08:51:59",
                "subtitle" => "All the fresh tastes of the Ocean",
                "title" => "Flavours of the Sea",
                "updated_at" => "2023-09-13T08:51:59"
              }
            ],
            "updated_at" => "2023-09-14T13:03:32"
          },
          %{
            "description" =>
              "Sautéed squid with zucchini, cherry tomatoes, pepper, garlic, Tajasca olives, seasoned with ouzo, lemon and parsley",
            "dish_id" => 11,
            "eta" => 20,
            "image" =>
              "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/TheLittleThings/littlethings-squidsalad.jpeg?raw=true",
            "inserted_at" => "2023-09-14T12:51:29",
            "location" => %{
              "description" => "European Restaurant",
              "id" => 3,
              "image" =>
                "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/TheLittleThings/littlethings-headers.jpeg?raw=true",
              "inserted_at" => "2023-09-14T11:51:36",
              "lat" => 42.68986365345295,
              "long" => 23.328125542932177,
              "merchant_name" => "The Little Things",
              "updated_at" => "2023-09-14T11:51:36"
            },
            "location_id" => 3,
            "name" => "Squid Salad",
            "order" => 4,
            "price" => "5000.00",
            "themes" => [
              %{
                "id" => 6,
                "image" =>
                  "https://montrealnightlife.com/wp-content/uploads/2023/05/MOntreal-Seafood.jpg",
                "inserted_at" => "2023-09-13T08:51:59",
                "subtitle" => "All the fresh tastes of the Ocean",
                "title" => "Flavours of the Sea",
                "updated_at" => "2023-09-13T08:51:59"
              }
            ],
            "updated_at" => "2023-09-14T12:51:29"
          }
        ]
      }
    }

    Enum.random([tour1, tour2, tour3])
  end
end
