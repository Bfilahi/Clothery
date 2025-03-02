import { Product } from "./product";
import { ProductSizes } from "./product-sizes";

export class WishlistItem {

    public id: number;
    public imgUrl: string;
    public description: string;
    public price: number;

    public productSizes: ProductSizes[];

    constructor(product: Product){
        this.id = product.id;
        this.imgUrl = product.imgUrl;
        this.description = product.description;
        this.price = product.unitPrice;
        
        this.productSizes = product.productSizes;
    }
}
