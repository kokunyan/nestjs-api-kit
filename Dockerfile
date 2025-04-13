FROM node:18-alpine AS development

# Создаем директорию приложения
WORKDIR /usr/src/app

# Копируем package.json и yarn.lock
COPY package.json yarn.lock ./

# Устанавливаем зависимости
RUN yarn install

# Копируем исходный код
COPY . .

# Генерируем Prisma клиент
RUN npx prisma generate

# Собираем приложение
RUN yarn build

FROM node:18-alpine AS production


# Аргумент для окружения (development/production)
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

# Создаем директорию приложения
WORKDIR /usr/src/app

# Копируем package.json и yarn.lock
COPY package.json yarn.lock ./

# Устанавливаем только production зависимости
RUN yarn install --production

# Копируем необходимые файлы из development stage
COPY --from=development /usr/src/app/dist ./dist
COPY --from=development /usr/src/app/node_modules/.prisma ./node_modules/.prisma
COPY --from=development /usr/src/app/prisma ./prisma

# Устанавливаем необходимые зависимости для bcrypt
RUN apk add --no-cache make gcc g++ python3

# Запускаем приложение
CMD ["node", "dist/main"]