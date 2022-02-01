component {

    /**
     * Name of the shipper USPS, UPS or FedEx
     * @trackingNumber the tracking number you wish to find the shipper name of
     */
    public function getShipperName(required string trackingNumber) {

        if ( isUSPS(trackingNumber=arguments.trackingNumber).success ) {

            return {
                'success': true,
                'data': isUSPS(trackingNumber=arguments.trackingNumber).data,
                'msg': isUSPS(trackingNumber=arguments.trackingNumber).msg
                };


        } else if ( isUPS(trackingNumber=arguments.trackingNumber).success ) {

            return {
                'success': true,
                'data': isUPS(trackingNumber=arguments.trackingNumber).data,
                'msg': isUPS(trackingNumber=arguments.trackingNumber).msg
                };


        } else if ( isFedEX(trackingNumber=arguments.trackingNumber).success ) {

            return {
                'success': true,
                'data': isFedEX(trackingNumber=arguments.trackingNumber).data,
                'msg': isFedEX(trackingNumber=arguments.trackingNumber).msg
                };


        } else {

            return {
                'success': false
                };

        }

    }

    /**
     * Check if tracking number is USPS
     * @trackingNumber the tracking number you wish to find the shipper name of
     */
    public function isUSPS(required string trackingNumber) {

        if ( reFindNoCase('^(94|93|92|94|95)[0-9]{20}$|^(94|93|92|94|95)[0-9]{22}$|^(70|14|23|03)[0-9]{14}$|^(M0|82)[0-9]{8}$|^([A-Z]{2})[0-9]{9}([A-Z]{2})$',arguments.trackingNumber,'true') ) {

            return {
                'success': true,
                'data': 'USPS',
                'msg': 'This is a USPS tracking number.'
                };


        } else {

            return {
                'success': false
                };


        }

    }

    /**
     * Check if tracking number is UPS
     * @trackingNumber the tracking number you wish to find the shipper name of
     */
    public function isUPS(required string trackingNumber) {

        if ( reFindNoCase('^(1Z)[0-9A-Z]{16}$|^(T)+[0-9A-Z]{10}$|^[0-9]{9}$|^[0-9]{26}$',arguments.trackingNumber,'true') ) {

            return {
                'success': true,
                'data': 'UPS',
                'msg': 'This is a UPS tracking number.'
                };


        } else {

            return {
                'success': false
                };

        }

    }    

    /**
     * Check if tracking number is FedEx
     * @trackingNumber the tracking number you wish to find the shipper name of
     */
    public function isFedEX(required string trackingNumber) {

        if ( reFindNoCase('^[0-9]{15}$|^[0-9]{12}$',arguments.trackingNumber,'true') ) {

            return {
                'success': true,
                'data': 'FedEx',
                'msg': 'This is a FedEx tracking Number.'
                };


        } else {

            return {
                'success': false
                };

        }

    }


}