# Use nginx to serve static files
FROM nginx:stable-alpine
# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*
# Copy the existing build files
COPY dist/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

