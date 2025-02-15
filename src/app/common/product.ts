export class Product {
    constructor(
        public id: number,
        public name: string,
        public description: string,
        public unitPrice: number,
        public imgUrl: string,
        public active: boolean,
        public gender: string,
        public unitsInStock: number,
        public dateCreated: Date,
        public lastUpdated: Date
    ){}
}
