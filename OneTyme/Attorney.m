//
//  Attorney.m
//  OneTyme
//
//  Created by Joffrey Mann on 1/29/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "Attorney.h"

@implementation Attorney

<<<<<<< HEAD
@end
=======
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
        self.phone = attorney[SECONDARY_PHONE_NO];
    }
    
    return self;
}

/* Default initializer calls the new designated initializer initWithData */
-(id)init
{
    self = [self initWithAttorney:nil];
    return self;
}

@end
>>>>>>> dda2f1131eee80af04ea4b45c5588cb850f4a8ea
