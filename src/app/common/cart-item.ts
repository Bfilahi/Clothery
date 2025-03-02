import { Product } from "./product";
import { ProductSizes } from "./product-sizes";

export class CartItem {
    public id: number;
    public name: string;
    public description: string;
    public imgUrl: string;
    public unitPrice: number;
    public quantity: number;
    public selectedSize: string;
    public productSizes: ProductSizes[];


    constructor(product: Product){
        this.id = product.id;
        this.name = product.name;
        this.description = product.description;
        this.imgUrl = product.imgUrl;
        this.unitPrice = product.unitPrice;
        this.quantity = 1;
        this.selectedSize = product.selectedSize;
        this.productSizes = product.productSizes;
    }
}
