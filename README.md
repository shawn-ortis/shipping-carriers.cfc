# **shipping-carriers.cfc**

A ColdFusion/Lucee CFC to parse tracking numbers and find the shipping carriers UPS, FedEx or USPS.

## **Example:**
`getCarriers = new shipping_carriers();`  
`carrierName = getCarriers.getShipperName(trackingNumber='Your Tracking NUmber');`  
`dump(carrierName);`  
