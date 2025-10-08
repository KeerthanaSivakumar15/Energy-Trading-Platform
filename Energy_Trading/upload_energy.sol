// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnergyProvider {

    struct EnergyProduct {
        string providerName;
        string energyType;
        uint256 quantity; // in kWh
        uint256 pricePerKwh; // price per kWh
        uint256 startTime; // availability start time (UNIX timestamp)
        string description;
        string imageUrl; // URL or IPFS hash of the product image
    }

    mapping(uint256 => EnergyProduct) public energyProducts;
    uint256 public productCount;

    // Event to be emitted when a new product is added
    event ProductAdded(
        uint256 productId,
        string providerName,
        string energyType,
        uint256 quantity,
        uint256 pricePerKwh,
        uint256 startTime,
        string description,
        string imageUrl
    );

    // Function to add a new energy product
    function addProduct(
        string memory _providerName,
        string memory _energyType,
        uint256 _quantity,
        uint256 _pricePerKwh,
        uint256 _startTime,
        string memory _description,
        string memory _imageUrl
    ) public {
        productCount++;
        energyProducts[productCount] = EnergyProduct({
            providerName: _providerName,
            energyType: _energyType,
            quantity: _quantity,
            pricePerKwh: _pricePerKwh,
            startTime: _startTime,
            description: _description,
            imageUrl: _imageUrl
        });

        emit ProductAdded(
            productCount,
            _providerName,
            _energyType,
            _quantity,
            _pricePerKwh,
            _startTime,
            _description,
            _imageUrl
        );
    }

    // Function to get a product's details by its ID
    function getProduct(uint256 _productId) public view returns (
        string memory providerName,
        string memory energyType,
        uint256 quantity,
        uint256 pricePerKwh,
        uint256 startTime,
        string memory description,
        string memory imageUrl
    ) {
        EnergyProduct memory product = energyProducts[_productId];
        return (
            product.providerName,
            product.energyType,
            product.quantity,
            product.pricePerKwh,
            product.startTime,
            product.description,
            product.imageUrl
        );
    }
}
