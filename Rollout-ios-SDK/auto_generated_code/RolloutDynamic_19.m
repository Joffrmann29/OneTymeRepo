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

@implementation RolloutDynamic(blocks_19)


- (id)blockFor_classMethod_ObjCObjectPointer___ObjCObjectPointer___Enum___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, __rollout_enum arg1, id arg2) {
    id (*originalFunction)(id, SEL, id, __rollout_enum, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithEnum:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).enumValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_BOOL___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^BOOL(id rcv, id arg0, id arg1) {
    BOOL (*originalFunction)(id, SEL, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBool:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue)];
    }];

    return result.boolValue;
  };
}

- (id)blockFor_instanceMethod_Void___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1) {
    void (*originalFunction)(id, SEL, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___Pointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, void* arg0) {
    id (*originalFunction)(id, SEL, void*) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithPointer:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).pointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_Void___Pointer___ObjCObjectPointer___ObjCObjectPointer___BOOL_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, void* arg0, id arg1, id arg2, BOOL arg3) {
    void (*originalFunction)(id, SEL, void*, id, id, BOOL) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithBool:arg3], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).pointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[3]).boolValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_BOOL___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^BOOL(id rcv, id arg0, id arg1, id arg2) {
    BOOL (*originalFunction)(id, SEL, id, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBool:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue)];
    }];

    return result.boolValue;
  };
}

- (id)blockFor_instanceMethod_Void___ObjCObjectPointer___Enum___BlockPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, __rollout_enum arg1, id arg2) {
    void (*originalFunction)(id, SEL, id, __rollout_enum, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithEnum:arg1], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).enumValue, ((RolloutTypeWrapper*)arguments[2]).blockPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_classMethod_ObjCObjectPointer___Record_CLLocationCoordinate2D___Long___ObjCObjectPointer___Long___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, __rollout_dummy_struct__k$63xrfGHT0Pv5v_lBvIfdIQKgM arg0, long arg1, id arg2, long arg3, id arg4) {
    id (*originalFunction)(id, SEL, __rollout_dummy_struct__k$63xrfGHT0Pv5v_lBvIfdIQKgM, long, id, long, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithRecordPointer:&arg0 ofSize:sizeof(__rollout_dummy_struct__k$63xrfGHT0Pv5v_lBvIfdIQKgM) shouldBeFreedInDealloc:NO], 
     [[RolloutTypeWrapper alloc] initWithLong:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithLong:arg3], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg4], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), *(__rollout_dummy_struct__k$63xrfGHT0Pv5v_lBvIfdIQKgM*)((RolloutTypeWrapper*)arguments[0]).recordPointer, ((RolloutTypeWrapper*)arguments[1]).longValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[3]).longValue, ((RolloutTypeWrapper*)arguments[4]).objCObjectPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_classMethod_BOOL___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^BOOL(id rcv, id arg0, id arg1, id arg2) {
    BOOL (*originalFunction)(id, SEL, id, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBool:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue)];
    }];

    return result.boolValue;
  };
}

- (id)blockFor_instanceMethod_Void___ObjCObjectPointer___Long___Long___Long_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, long arg1, long arg2, long arg3) {
    void (*originalFunction)(id, SEL, id, long, long, long) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithLong:arg1], 
     [[RolloutTypeWrapper alloc] initWithLong:arg2], 
     [[RolloutTypeWrapper alloc] initWithLong:arg3], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).longValue, ((RolloutTypeWrapper*)arguments[2]).longValue, ((RolloutTypeWrapper*)arguments[3]).longValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_Void___UInt_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, unsigned int arg0) {
    void (*originalFunction)(id, SEL, unsigned int) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithUInt:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).uIntValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___Enum___Long___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, __rollout_enum arg0, long arg1, id arg2, id arg3, id arg4) {
    id (*originalFunction)(id, SEL, __rollout_enum, long, id, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithEnum:arg0], 
     [[RolloutTypeWrapper alloc] initWithLong:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg3], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg4], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).enumValue, ((RolloutTypeWrapper*)arguments[1]).longValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[3]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[4]).objCObjectPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_Void___ObjCObjectPointer___Long_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, long arg1) {
    void (*originalFunction)(id, SEL, id, long) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithLong:arg1], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).longValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_classMethod_BOOL___BlockPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^BOOL(id rcv, id arg0) {
    BOOL (*originalFunction)(id, SEL, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBool:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).blockPointerValue)];
    }];

    return result.boolValue;
  };
}

- (id)blockFor_classMethod_Enum___Char_S_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^__rollout_enum(id rcv, char arg0) {
    __rollout_enum (*originalFunction)(id, SEL, char) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithChar_S:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithEnum:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).char_SValue)];
    }];

    return result.enumValue;
  };
}

- (id)blockFor_instanceMethod_LongLong_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^long long(id rcv) {
    long long (*originalFunction)(id, SEL) = (void *) originalImplementation;
    NSArray *originalArguments = @[];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithLongLong:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector))];
    }];

    return result.longLongValue;
  };
}

- (id)blockFor_classMethod_ObjCObjectPointer___Pointer___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, void* arg0, id arg1, id arg2) {
    id (*originalFunction)(id, SEL, void*, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).pointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_classMethod_BOOL___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^BOOL(id rcv, id arg0, id arg1, id arg2, id arg3) {
    BOOL (*originalFunction)(id, SEL, id, id, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg3], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBool:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[3]).objCObjectPointerValue)];
    }];

    return result.boolValue;
  };
}

- (id)blockFor_instanceMethod_BlockPointer___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, id arg1, id arg2) {
    id (*originalFunction)(id, SEL, id, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBlockPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue)];
    }];

    return result.blockPointerValue;
  };
}

- (id)blockFor_instanceMethod_Long___Int_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^long(id rcv, int arg0) {
    long (*originalFunction)(id, SEL, int) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithInt:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithLong:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).intValue)];
    }];

    return result.longValue;
  };
}

- (id)blockFor_classMethod_Void___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___BlockPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1, id arg2, id arg3) {
    void (*originalFunction)(id, SEL, id, id, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg3], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[3]).blockPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___ULong_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, unsigned long arg0) {
    id (*originalFunction)(id, SEL, unsigned long) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithULong:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).uLongValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_classMethod_ObjCObjectPointer___BlockPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, id arg1) {
    id (*originalFunction)(id, SEL, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).blockPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}
@end
