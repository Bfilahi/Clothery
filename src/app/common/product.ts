import { ProductSizes } from "./product-sizes";

export class Product {
    public id: number;
    public name: string;
    public description: string;
    public unitPrice: number;
    public imgUrl: string;
    public active: boolean;
    public gender: string;
    public unitsInStock: number;
    public dateCreated: Date;
    public lastUpdated: Date;

    public selectedSize: string;
    public productSizes: ProductSizes[];

    constructor(product: Product){
        this.id = product.id;
        this.name = product.name;
        this.description = product.description;
        this.unitPrice = product.unitPrice;
        this.imgUrl = product.imgUrl;
        this.active = product.active;
        this.gender = product.gender;
        this.unitsInStock = product.unitsInStock;
        this.dateCreated = product.dateCreated;
        this.lastUpdated = product.lastUpdated;

        this.selectedSize = '';
        this.productSizes = [];
    }
}
