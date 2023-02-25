import { Request, Response, NextFunction } from 'express';
import HttpResponse from 'sosise-core/build/Types/HttpResponse';
import path from 'path';

export default class IndexController {
    /**
     *
     */
    public async index(request: Request, response: Response, next: NextFunction) {
        try {
            // Prepare http response
            const httpResponse: HttpResponse = {
                code: 1000,
                message: 'INDEX',
                data: null
            };
            
            return response.sendFile(path.resolve(process.cwd() + "/../front/build/index.html"));
        
            // Send response
            return response.send(httpResponse);
        } catch (error) {
            next(error);
        }
    }
}
