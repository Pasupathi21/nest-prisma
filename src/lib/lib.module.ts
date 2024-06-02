import { Global, Module } from '@nestjs/common';
import { UtilsService } from './utils/utils.service'

@Global()
@Module({
    providers: [UtilsService],
    exports: [UtilsService]
})
export class LibModule {}
