// This file is auto generated by Rollout.io SDK during application build process, it should be committed to you repository as part of your code. For more info please checkout the FAQ at http://support.rollout.io

#import <Rollout/private/RolloutDynamic.h>
#import <Rollout/private/RolloutInvocation.h>
#import <Rollout/private/RolloutTypeWrapper.h>
#import <Rollout/private/RolloutInvocationsListFactory.h>
#import <Rollout/private/RolloutErrors.h>
#import <Rollout/private/RolloutMethodId.h>
#import <Rollout/private/RolloutTweakId.h>
#import <Rollout/private/RolloutConfiguration.h>
#import <objc/objc.h>

#import "RolloutDynamic_structs.h"

@implementation RolloutDynamic(blocks_11)


- (id)blockFor_instanceMethod_ULongLong_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^unsigned long long(id rcv) {
    unsigned long long (*originalFunction)(id, SEL) = (void *) originalImplementation;
    NSArray *originalArguments = @[];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithULongLong:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector))];
    }];

    return result.uLongLongValue;
  };
}

- (id)blockFor_instanceMethod_Long___Pointer___ULong_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^long(id rcv, void* arg0, unsigned long arg1) {
    long (*originalFunction)(id, SEL, void*, unsigned long) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithULong:arg1], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithLong:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).pointerValue, ((RolloutTypeWrapper*)arguments[1]).uLongValue)];
    }];

    return result.longValue;
  };
}

- (id)blockFor_instanceMethod_Void___ULong_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, unsigned long arg0) {
    void (*originalFunction)(id, SEL, unsigned long) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithULong:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).uLongValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_Float_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^float(id rcv) {
    float (*originalFunction)(id, SEL) = (void *) originalImplementation;
    NSArray *originalArguments = @[];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithFloat:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector))];
    }];

    return result.floatValue;
  };
}

- (id)blockFor_instanceMethod_Long___ObjCObjectPointer___Long_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^long(id rcv, id arg0, long arg1) {
    long (*originalFunction)(id, SEL, id, long) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithLong:arg1], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithLong:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).longValue)];
    }];

    return result.longValue;
  };
}

- (id)blockFor_instanceMethod_Void___Pointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, void* arg0, id arg1) {
    void (*originalFunction)(id, SEL, void*, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).pointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_Void___Double_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, double arg0) {
    void (*originalFunction)(id, SEL, double) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithDouble:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).doubleValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_UShort___Pointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^unsigned short(id rcv, void* arg0) {
    unsigned short (*originalFunction)(id, SEL, void*) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithPointer:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithUShort:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).pointerValue)];
    }];

    return result.uShortValue;
  };
}

- (id)blockFor_instanceMethod_Void___ULong___Double___Long_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, unsigned long arg0, double arg1, long arg2) {
    void (*originalFunction)(id, SEL, unsigned long, double, long) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithULong:arg0], 
     [[RolloutTypeWrapper alloc] initWithDouble:arg1], 
     [[RolloutTypeWrapper alloc] initWithLong:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).uLongValue, ((RolloutTypeWrapper*)arguments[1]).doubleValue, ((RolloutTypeWrapper*)arguments[2]).longValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_classMethod_Void___ObjCObjectPointer___BlockPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1) {
    void (*originalFunction)(id, SEL, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg1], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).blockPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_classMethod_Void___BlockPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0) {
    void (*originalFunction)(id, SEL, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).blockPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_classMethod_BOOL___ObjCObjectPointer___ObjCObjectPointer___Pointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^BOOL(id rcv, id arg0, id arg1, void* arg2) {
    BOOL (*originalFunction)(id, SEL, id, id, void*) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBool:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).pointerValue)];
    }];

    return result.boolValue;
  };
}

- (id)blockFor_instanceMethod_Void___BlockPointer___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1, id arg2, id arg3) {
    void (*originalFunction)(id, SEL, id, id, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg3], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).blockPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[3]).objCObjectPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___ObjCObjectPointer___Pointer___Long_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, void* arg1, long arg2) {
    id (*originalFunction)(id, SEL, id, void*, long) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithLong:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).pointerValue, ((RolloutTypeWrapper*)arguments[2]).longValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_classMethod_ULong___Pointer___ULong___Pointer___ULong___Pointer___BOOL_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^unsigned long(id rcv, void* arg0, unsigned long arg1, void* arg2, unsigned long arg3, void* arg4, BOOL arg5) {
    unsigned long (*originalFunction)(id, SEL, void*, unsigned long, void*, unsigned long, void*, BOOL) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithULong:arg1], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithULong:arg3], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg4], 
     [[RolloutTypeWrapper alloc] initWithBool:arg5], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithULong:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).pointerValue, ((RolloutTypeWrapper*)arguments[1]).uLongValue, ((RolloutTypeWrapper*)arguments[2]).pointerValue, ((RolloutTypeWrapper*)arguments[3]).uLongValue, ((RolloutTypeWrapper*)arguments[4]).pointerValue, ((RolloutTypeWrapper*)arguments[5]).boolValue)];
    }];

    return result.uLongValue;
  };
}

- (id)blockFor_instanceMethod_BOOL___ObjCObjectPointer___ObjCObjectPointer___Pointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^BOOL(id rcv, id arg0, id arg1, void* arg2) {
    BOOL (*originalFunction)(id, SEL, id, id, void*) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBool:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).pointerValue)];
    }];

    return result.boolValue;
  };
}

- (id)blockFor_classMethod_ObjCObjectPointer___BOOL_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, BOOL arg0) {
    id (*originalFunction)(id, SEL, BOOL) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithBool:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).boolValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_classMethod_Void___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___BlockPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1, id arg2, id arg3, id arg4, id arg5) {
    void (*originalFunction)(id, SEL, id, id, id, id, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg3], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg4], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg5], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[3]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[4]).blockPointerValue, ((RolloutTypeWrapper*)arguments[5]).objCObjectPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_Int___Enum___BOOL___BOOL___ULong_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^int(id rcv, __rollout_enum arg0, BOOL arg1, BOOL arg2, unsigned long arg3) {
    int (*originalFunction)(id, SEL, __rollout_enum, BOOL, BOOL, unsigned long) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithEnum:arg0], 
     [[RolloutTypeWrapper alloc] initWithBool:arg1], 
     [[RolloutTypeWrapper alloc] initWithBool:arg2], 
     [[RolloutTypeWrapper alloc] initWithULong:arg3], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithInt:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).enumValue, ((RolloutTypeWrapper*)arguments[1]).boolValue, ((RolloutTypeWrapper*)arguments[2]).boolValue, ((RolloutTypeWrapper*)arguments[3]).uLongValue)];
    }];

    return result.intValue;
  };
}

- (id)blockFor_classMethod_Void___ObjCObjectPointer___Enum___BOOL___BOOL_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, __rollout_enum arg1, BOOL arg2, BOOL arg3) {
    void (*originalFunction)(id, SEL, id, __rollout_enum, BOOL, BOOL) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithEnum:arg1], 
     [[RolloutTypeWrapper alloc] initWithBool:arg2], 
     [[RolloutTypeWrapper alloc] initWithBool:arg3], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).enumValue, ((RolloutTypeWrapper*)arguments[2]).boolValue, ((RolloutTypeWrapper*)arguments[3]).boolValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_Void___Pointer___Record_struct_RolloutSpace_CGRect___Float_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, void* arg0, __rollout_dummy_struct__W9ipxW$ytjq$Lh2qB_boMyv6Chc arg1, float arg2) {
    void (*originalFunction)(id, SEL, void*, __rollout_dummy_struct__W9ipxW$ytjq$Lh2qB_boMyv6Chc, float) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithRecordPointer:&arg1 ofSize:sizeof(__rollout_dummy_struct__W9ipxW$ytjq$Lh2qB_boMyv6Chc) shouldBeFreedInDealloc:NO], 
     [[RolloutTypeWrapper alloc] initWithFloat:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).pointerValue, *(__rollout_dummy_struct__W9ipxW$ytjq$Lh2qB_boMyv6Chc*)((RolloutTypeWrapper*)arguments[1]).recordPointer, ((RolloutTypeWrapper*)arguments[2]).floatValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___Long_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, long arg0) {
    id (*originalFunction)(id, SEL, long) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithLong:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).longValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_Void___Pointer___Pointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, void* arg0, void* arg1) {
    void (*originalFunction)(id, SEL, void*, void*) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg1], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).pointerValue, ((RolloutTypeWrapper*)arguments[1]).pointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}
@end
