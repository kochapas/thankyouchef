# 📚 Thankyouchef

Hire your own personal Gordon Ramsay, without the yelling.

![image](https://user-images.githubusercontent.com/79894200/132184516-facae8a1-b478-4b69-ac29-4edd43dd5518.png)
<br>
App home: https://thankyouchef.herokuapp.com/
   

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=***
MAPBOX_API_KEY=***
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 6](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
Inspired by Jane Mount's [Bibliophile](https://www.amazon.com/Bibliophile-Illustrated-Miscellany-Jane-Mount/dp/1452167230) and a story my father once told me: "Why do we keep books? ... We keep books because they remind us of the new perspectives and lessons we learned".

## Team Members
- [Kandanai Leenutaphong](https://www.linkedin.com/in/kandanai/)
- [kochapas Santibut](https://www.linkedin.com/in/kochapas-santibut-a768701a7/)
- [Kyle Bailey](https://www.linkedin.com/in/kyle-alexander-bailey/)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
