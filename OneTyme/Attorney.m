//
//  Attorney.m
//  OneTyme
//
//  Created by Joffrey Mann on 1/29/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "Attorney.h"

@implementation Attorney

/* Designated Initializer */
-(id)initWithAttorney:(NSDictionary *)attorney
{
    /* Designated Initializer must call the super classes initialization method */
    self = [super init];
    
    /* Setup the object with values from the NSDictionary */
    if (self){
        self.name = attorney[NAME];
        self.address = attorney[ADDRESS];
        self.city = attorney[CITY];
        self.state = attorney[STATE];
        self.zipCode = attorney[ZIP_CODE];
        self.phone = attorney[PHONE_NO];
        self.secondaryPhone = attorney[SECONDARY_PHONE_NO];
        self.email = attorney[EMAIL];
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
    self = [self initWithAttorney:nil];
    return self;
}

@end