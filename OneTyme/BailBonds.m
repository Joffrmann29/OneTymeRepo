//
//  BailBonds.m
//  OneTyme
//
//  Created by Nutech Systems on 1/29/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "BailBonds.h"

@implementation BailBonds

/* Designated Initializer */
-(id)initWithBailBonds:(NSDictionary *)bailBonds
{
    /* Designated Initializer must call the super classes initialization method */
    self = [super init];
    
    /* Setup the object with values from the NSDictionary */
    if (self){
        self.name = bailBonds[NAME];
        self.address = bailBonds[ADDRESS];
        self.city = bailBonds[CITY];
        self.state = bailBonds[STATE];
        self.zipCode = bailBonds[ZIP_CODE];
        self.phone = bailBonds[PHONE_NO];
        self.secondaryPhone = bailBonds[SECONDARY_PHONE_NO];
        self.email = bailBonds[EMAIL];
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self)
    {
        self.name = [aDecoder decodeObjectForKey:NAME];
        self.address = [aDecoder decodeObjectForKey:ADDRESS];
        self.city = [aDecoder decodeObjectForKey:CITY];
        self.state = [aDecoder decodeObjectForKey:STATE];
        self.zipCode = [aDecoder decodeObjectForKey:ZIP_CODE];
        self.phone = [aDecoder decodeObjectForKey:PHONE_NO];
        self.secondaryPhone = [aDecoder decodeObjectForKey:SECONDARY_PHONE_NO];
        self.email = [aDecoder decodeObjectForKey:EMAIL];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:NAME];
    [aCoder encodeObject:self.address forKey:ADDRESS];
    [aCoder encodeObject:self.city forKey:CITY];
    [aCoder encodeObject:self.state forKey:STATE];
    [aCoder encodeObject:self.zipCode forKey:ZIP_CODE];
    [aCoder encodeObject:self.phone forKey:PHONE_NO];
    [aCoder encodeObject:self.secondaryPhone forKey:SECONDARY_PHONE_NO];
    [aCoder encodeObject:self.email forKey:EMAIL];
}

/* Default initializer calls the new designated initializer initWithData */
-(id)init
{
    self = [self initWithBailBonds:nil];
    return self;
}

@end