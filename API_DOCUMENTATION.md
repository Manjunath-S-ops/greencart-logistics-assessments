# 🚛 GreenCart Logistics API Documentation

## Overview

The GreenCart Logistics API provides comprehensive endpoints for managing delivery operations, running simulations, and tracking KPIs. This RESTful API is built with Node.js, Express.js, and MongoDB.

## Base URL

- **Development**: `http://localhost:5000/api`
- **Production**: `https://your-backend-domain.com/api`

## Authentication

All protected endpoints require JWT authentication. Include the token in the Authorization header:

```
Authorization: Bearer <your-jwt-token>
```

## Response Format

All API responses follow this format:

```json
{
  "success": true|false,
  "message": "Response message",
  "data": {}, // Response data (if applicable)
  "error": "Error message" // Only present on errors
}
```

---

## 🔐 Authentication Endpoints

### POST /auth/login

Login with email and password.

**Request Body:**
```json
{
  "email": "user@greencart.com",
  "password": "password123"
}
```

**Response:**
```json
{
  "success": true,
  "message": "Login successful",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "_id": "64a1b2c3d4e5f6789012345",
    "name": "John Doe",
    "email": "user@greencart.com",
    "role": "manager"
  }
}
```

### POST /auth/register

Register a new user (Admin only).

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "john@greencart.com",
  "password": "password123",
  "role": "manager"
}
```

### GET /auth/profile

Get current user profile.

**Headers:**
```
Authorization: Bearer <token>
```

**Response:**
```json
{
  "success": true,
  "user": {
    "_id": "64a1b2c3d4e5f6789012345",
    "name": "John Doe",
    "email": "user@greencart.com",
    "role": "manager",
    "createdAt": "2023-07-01T10:00:00.000Z"
  }
}
```

---

## 👥 Driver Management

### GET /drivers

Get all drivers with pagination and filtering.

**Query Parameters:**
- `page` (number): Page number (default: 1)
- `limit` (number): Items per page (default: 10)
- `status` (string): Filter by status (active, inactive, on-leave)
- `search` (string): Search by name

**Response:**
```json
{
  "success": true,
  "drivers": [
    {
      "_id": "64a1b2c3d4e5f6789012345",
      "name": "Amit Kumar",
      "shiftHours": 8,
      "pastWeekHours": [8, 8, 8, 8, 8, 8, 8],
      "status": "active",
      "isFatigued": false,
      "createdAt": "2023-07-01T10:00:00.000Z"
    }
  ],
  "pagination": {
    "currentPage": 1,
    "totalPages": 5,
    "totalDrivers": 50,
    "hasNextPage": true,
    "hasPrevPage": false
  }
}
```

### POST /drivers

Create a new driver.

**Request Body:**
```json
{
  "name": "Priya Sharma",
  "shiftHours": 8,
  "pastWeekHours": "8|8|8|8|8|8|8",
  "status": "active"
}
```

**Response:**
```json
{
  "success": true,
  "message": "Driver created successfully",
  "driver": {
    "_id": "64a1b2c3d4e5f6789012346",
    "name": "Priya Sharma",
    "shiftHours": 8,
    "pastWeekHours": [8, 8, 8, 8, 8, 8, 8],
    "status": "active",
    "isFatigued": false
  }
}
```

### GET /drivers/:id

Get a specific driver by ID.

**Response:**
```json
{
  "success": true,
  "driver": {
    "_id": "64a1b2c3d4e5f6789012345",
    "name": "Amit Kumar",
    "shiftHours": 8,
    "pastWeekHours": [8, 8, 8, 8, 8, 8, 8],
    "status": "active",
    "isFatigued": false,
    "createdAt": "2023-07-01T10:00:00.000Z",
    "updatedAt": "2023-07-01T10:00:00.000Z"
  }
}
```

### PUT /drivers/:id

Update a driver.

**Request Body:**
```json
{
  "name": "Amit Kumar Updated",
  "shiftHours": 10,
  "status": "active"
}
```

### DELETE /drivers/:id

Delete a driver.

**Response:**
```json
{
  "success": true,
  "message": "Driver deleted successfully"
}
```

---

## 🛣️ Route Management

### GET /routes

Get all routes with pagination and filtering.

**Query Parameters:**
- `page` (number): Page number (default: 1)
- `limit` (number): Items per page (default: 10)
- `trafficLevel` (string): Filter by traffic level (Low, Medium, High)
- `search` (string): Search by name

**Response:**
```json
{
  "success": true,
  "routes": [
    {
      "_id": "64a1b2c3d4e5f6789012347",
      "routeId": 1,
      "name": "Downtown Route",
      "distance": 15,
      "trafficLevel": "Medium",
      "baseTime": 45,
      "description": "Main downtown delivery route",
      "createdAt": "2023-07-01T10:00:00.000Z"
    }
  ],
  "pagination": {
    "currentPage": 1,
    "totalPages": 3,
    "totalRoutes": 25,
    "hasNextPage": true,
    "hasPrevPage": false
  }
}
```

### POST /routes

Create a new route.

**Request Body:**
```json
{
  "name": "Suburban Route",
  "distance": 20,
  "trafficLevel": "Low",
  "baseTime": 60,
  "description": "Suburban area delivery route"
}
```

### GET /routes/:id

Get a specific route by ID.

### PUT /routes/:id

Update a route.

### DELETE /routes/:id

Delete a route.

---

## 📦 Order Management

### GET /orders

Get all orders with pagination and filtering.

**Query Parameters:**
- `page` (number): Page number (default: 1)
- `limit` (number): Items per page (default: 10)
- `status` (string): Filter by status (pending, assigned, in-transit, delivered, cancelled)
- `priority` (string): Filter by priority (Low, Medium, High, Urgent)
- `search` (string): Search by order ID or customer name

**Response:**
```json
{
  "success": true,
  "orders": [
    {
      "_id": "64a1b2c3d4e5f6789012348",
      "orderId": "ORD-001",
      "value": 1500,
      "assignedRoute": {
        "_id": "64a1b2c3d4e5f6789012347",
        "name": "Downtown Route",
        "distance": 15,
        "trafficLevel": "Medium"
      },
      "assignedDriver": {
        "_id": "64a1b2c3d4e5f6789012345",
        "name": "Amit Kumar"
      },
      "status": "pending",
      "priority": "High",
      "customerName": "John Smith",
      "customerPhone": "+91 9876543210",
      "deliveryAddress": "123 Main St, Downtown",
      "estimatedDeliveryTime": "2023-07-01T14:00:00.000Z",
      "createdAt": "2023-07-01T10:00:00.000Z"
    }
  ],
  "pagination": {
    "currentPage": 1,
    "totalPages": 10,
    "totalOrders": 100,
    "hasNextPage": true,
    "hasPrevPage": false
  }
}
```

### POST /orders

Create a new order.

**Request Body:**
```json
{
  "orderId": "ORD-002",
  "value": 2000,
  "assignedRoute": "64a1b2c3d4e5f6789012347",
  "assignedDriver": "64a1b2c3d4e5f6789012345",
  "status": "pending",
  "priority": "Medium",
  "customerName": "Jane Doe",
  "customerPhone": "+91 9876543211",
  "deliveryAddress": "456 Oak Ave, Suburbs",
  "estimatedDeliveryTime": "2023-07-01T16:00:00.000Z"
}
```

### GET /orders/:id

Get a specific order by ID.

### PUT /orders/:id

Update an order.

### DELETE /orders/:id

Delete an order.

---

## 🎯 Simulation Endpoints

### POST /simulation/run

Run a delivery simulation with specified parameters.

**Request Body:**
```json
{
  "availableDrivers": 5,
  "routeStartTime": "08:00",
  "maxHoursPerDriver": 8
}
```

**Response:**
```json
{
  "success": true,
  "message": "Simulation completed successfully",
  "simulationId": "SIM_1688208000000_ABC12",
  "results": {
    "totalProfit": 12500,
    "efficiencyScore": 85,
    "onTimeDeliveries": 17,
    "lateDeliveries": 3,
    "totalDeliveries": 20,
    "fuelCost": 1200,
    "penalties": 150,
    "bonuses": 800,
    "totalOrderValue": 15000,
    "averageDeliveryTime": 45,
    "driverUtilization": 75,
    "driverAssignments": [
      {
        "driverId": "64a1b2c3d4e5f6789012345",
        "driverName": "Amit Kumar",
        "ordersAssigned": 4,
        "totalHours": 6.5,
        "totalEarnings": 3200,
        "efficiency": 100
      }
    ],
    "routeAnalysis": [
      {
        "routeId": "64a1b2c3d4e5f6789012347",
        "routeName": "Downtown Route",
        "distance": 15,
        "trafficLevel": "Medium",
        "baseTime": 45,
        "actualDeliveryTime": 180,
        "fuelCost": 300,
        "ordersDelivered": 4
      }
    ]
  },
  "executionTime": 1250
}
```

### POST /simulation/create

Create a named simulation with description.

**Request Body:**
```json
{
  "name": "Morning Peak Simulation",
  "description": "Simulation for morning peak hours with 5 drivers",
  "parameters": {
    "availableDrivers": 5,
    "routeStartTime": "08:00",
    "maxHoursPerDriver": 8
  }
}
```

### GET /simulation/history

Get simulation history for the authenticated user.

**Query Parameters:**
- `limit` (number): Number of simulations to return (default: 10)
- `page` (number): Page number (default: 1)

**Response:**
```json
{
  "success": true,
  "simulations": [
    {
      "_id": "64a1b2c3d4e5f6789012349",
      "simulationId": "SIM_1688208000000_ABC12",
      "name": "Morning Peak Simulation",
      "description": "Simulation for morning peak hours",
      "parameters": {
        "availableDrivers": 5,
        "routeStartTime": "08:00",
        "maxHoursPerDriver": 8
      },
      "results": {
        "totalProfit": 12500,
        "efficiencyScore": 85,
        "totalDeliveries": 20
      },
      "status": "completed",
      "createdAt": "2023-07-01T10:00:00.000Z"
    }
  ],
  "pagination": {
    "currentPage": 1,
    "totalSimulations": 25,
    "hasNextPage": true,
    "hasPrevPage": false
  }
}
```

### GET /simulation/:simulationId

Get detailed simulation results by ID.

**Response:**
```json
{
  "success": true,
  "simulation": {
    "_id": "64a1b2c3d4e5f6789012349",
    "simulationId": "SIM_1688208000000_ABC12",
    "name": "Morning Peak Simulation",
    "description": "Simulation for morning peak hours",
    "parameters": {
      "availableDrivers": 5,
      "routeStartTime": "08:00",
      "maxHoursPerDriver": 8
    },
    "results": {
      // Complete simulation results object
    },
    "executionTime": 1250,
    "status": "completed",
    "createdBy": {
      "_id": "64a1b2c3d4e5f6789012345",
      "name": "John Doe",
      "email": "john@greencart.com"
    },
    "createdAt": "2023-07-01T10:00:00.000Z"
  }
}
```

### DELETE /simulation/:simulationId

Delete a simulation.

### GET /simulation/analytics/overview

Get simulation analytics overview.

**Query Parameters:**
- `days` (number): Number of days to analyze (default: 30)

**Response:**
```json
{
  "success": true,
  "analytics": {
    "totalSimulations": 15,
    "averageEfficiency": 82,
    "averageProfit": 11500,
    "totalProfit": 172500,
    "bestSimulation": {
      "id": "SIM_1688208000000_ABC12",
      "name": "Morning Peak Simulation",
      "efficiency": 95,
      "profit": 15000,
      "date": "2023-07-01T10:00:00.000Z"
    },
    "trends": [
      {
        "date": "2023-06-25",
        "efficiency": 80,
        "simulations": 2
      }
    ]
  }
}
```

### GET /simulation/analytics/comparison

Compare multiple simulations.

**Query Parameters:**
- `simulationIds` (array): Array of simulation IDs to compare

**Response:**
```json
{
  "success": true,
  "comparison": [
    {
      "id": "SIM_1688208000000_ABC12",
      "name": "Morning Peak Simulation",
      "date": "2023-07-01T10:00:00.000Z",
      "parameters": {
        "availableDrivers": 5,
        "routeStartTime": "08:00",
        "maxHoursPerDriver": 8
      },
      "results": {
        "efficiency": 85,
        "profit": 12500,
        "onTimeDeliveries": 17,
        "lateDeliveries": 3,
        "fuelCost": 1200,
        "penalties": 150,
        "bonuses": 800,
        "driverUtilization": 75
      }
    }
  ]
}
```

---

## 📊 Dashboard Endpoints

### GET /dashboard/overview

Get dashboard overview with KPIs and metrics.

**Response:**
```json
{
  "success": true,
  "today": {
    "totalProfit": 25000,
    "efficiencyScore": 88,
    "profitGrowth": 12,
    "efficiencyGrowth": 5
  },
  "counts": {
    "totalDrivers": 25,
    "activeDrivers": 20,
    "totalOrders": 150,
    "pendingOrders": 15,
    "totalRoutes": 10
  },
  "recentSimulations": [
    {
      "simulationId": "SIM_1688208000000_ABC12",
      "name": "Morning Peak Simulation",
      "efficiencyScore": 85,
      "createdAt": "2023-07-01T10:00:00.000Z"
    }
  ]
}
```

### GET /dashboard/delivery-performance

Get delivery performance data for charts.

**Response:**
```json
{
  "success": true,
  "periods": [
    {
      "period": "2023-06-25",
      "onTimeCount": 15,
      "lateCount": 3,
      "totalCount": 18
    }
  ]
}
```

### GET /dashboard/fuel-costs

Get fuel cost breakdown by traffic level.

**Response:**
```json
{
  "success": true,
  "breakdown": [
    {
      "trafficLevel": "Low",
      "totalCost": 5000,
      "routeCount": 5,
      "averageCost": 1000
    },
    {
      "trafficLevel": "Medium",
      "totalCost": 8000,
      "routeCount": 8,
      "averageCost": 1000
    },
    {
      "trafficLevel": "High",
      "totalCost": 12000,
      "routeCount": 6,
      "averageCost": 2000
    }
  ]
}
```

---

## 🚨 Error Responses

### 400 Bad Request
```json
{
  "success": false,
  "message": "Validation error",
  "errors": [
    {
      "field": "email",
      "message": "Email is required"
    }
  ]
}
```

### 401 Unauthorized
```json
{
  "success": false,
  "message": "Access denied. No token provided."
}
```

### 403 Forbidden
```json
{
  "success": false,
  "message": "Insufficient permissions"
}
```

### 404 Not Found
```json
{
  "success": false,
  "message": "Resource not found"
}
```

### 500 Internal Server Error
```json
{
  "success": false,
  "message": "Internal server error"
}
```

---

## 📋 Business Rules Implementation

The simulation engine implements the following business rules:

### 1. Late Delivery Penalty
- **Rule**: ₹50 penalty if delivery time > (base route time + 10 minutes)
- **Implementation**: Applied during simulation execution with configurable grace period

### 2. Driver Fatigue Rule
- **Rule**: If driver works >8 hours in a day, speed decreases by 30% next day
- **Implementation**: Automatic fatigue detection and speed adjustment in route calculations

### 3. High-Value Bonus
- **Rule**: 10% bonus to order profit if order value > ₹1000 AND delivered on time
- **Implementation**: Bonus calculation during simulation with real-time validation

### 4. Fuel Cost Calculation
- **Rule**: Base ₹5/km, +₹2/km surcharge if traffic is "High"
- **Implementation**: Dynamic fuel cost calculation based on route traffic levels

### 5. Overall Profit Calculation
- **Formula**: Sum of (order value + bonus – penalties – fuel cost)
- **Implementation**: Real-time profit calculation with detailed breakdown

### 6. Efficiency Score
- **Formula**: (On-Time Deliveries / Total Deliveries) × 100
- **Implementation**: Continuous efficiency tracking with historical data

---

## 🔧 Rate Limiting

The API implements rate limiting to prevent abuse:

- **Window**: 15 minutes
- **Limit**: 100 requests per IP
- **Headers**: Rate limit information is included in response headers

---

## 📝 Data Models

### User Model
```javascript
{
  _id: ObjectId,
  name: String,
  email: String (unique),
  password: String (hashed),
  role: String (admin|manager),
  createdAt: Date,
  updatedAt: Date
}
```

### Driver Model
```javascript
{
  _id: ObjectId,
  name: String,
  shiftHours: Number,
  pastWeekHours: [Number],
  status: String (active|inactive|on-leave),
  isFatigued: Boolean,
  createdAt: Date,
  updatedAt: Date
}
```

### Route Model
```javascript
{
  _id: ObjectId,
  routeId: Number,
  name: String,
  distance: Number,
  trafficLevel: String (Low|Medium|High),
  baseTime: Number,
  description: String,
  createdAt: Date,
  updatedAt: Date
}
```

### Order Model
```javascript
{
  _id: ObjectId,
  orderId: String,
  value: Number,
  assignedRoute: ObjectId (ref: Route),
  assignedDriver: ObjectId (ref: Driver),
  status: String (pending|assigned|in-transit|delivered|cancelled),
  priority: String (Low|Medium|High|Urgent),
  customerName: String,
  customerPhone: String,
  deliveryAddress: String,
  estimatedDeliveryTime: Date,
  createdAt: Date,
  updatedAt: Date
}
```

### Simulation Model
```javascript
{
  _id: ObjectId,
  simulationId: String,
  name: String,
  description: String,
  parameters: {
    availableDrivers: Number,
    routeStartTime: String,
    maxHoursPerDriver: Number
  },
  results: Object,
  executionTime: Number,
  status: String,
  createdBy: ObjectId (ref: User),
  createdAt: Date,
  updatedAt: Date
}
```

---

## 🚀 Getting Started

1. **Install Dependencies**
   ```bash
   npm install
   ```

2. **Set Environment Variables**
   ```bash
   cp env.example .env
   # Edit .env with your configuration
   ```

3. **Start Development Server**
   ```bash
   npm run dev
   ```

4. **Run Tests**
   ```bash
   npm test
   ```

5. **Seed Database**
   ```bash
   npm run seed
   ```

---

## 📞 Support

For API support and questions:
- Check the error responses for detailed error information
- Review the business rules implementation
- Test with the provided sample data

---

**API Version**: 1.0.0  
**Last Updated**: July 2023
