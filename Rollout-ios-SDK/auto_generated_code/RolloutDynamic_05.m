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

@implementation RolloutDynamic(blocks_5)


- (id)blockFor_classMethod_ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, id arg1) {
    id (*originalFunction)(id, SEL, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_Void___Record_struct_RolloutSpace_CGSize_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, __rollout_dummy_struct__Kg1pzEDSP8Yex63EDkMoKFRb_h4 arg0) {
    void (*originalFunction)(id, SEL, __rollout_dummy_struct__Kg1pzEDSP8Yex63EDkMoKFRb_h4) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithRecordPointer:&arg0 ofSize:sizeof(__rollout_dummy_struct__Kg1pzEDSP8Yex63EDkMoKFRb_h4) shouldBeFreedInDealloc:NO], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), *(__rollout_dummy_struct__Kg1pzEDSP8Yex63EDkMoKFRb_h4*)((RolloutTypeWrapper*)arguments[0]).recordPointer); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_Long___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^long(id rcv, id arg0) {
    long (*originalFunction)(id, SEL, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithLong:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue)];
    }];

    return result.longValue;
  };
}

- (id)blockFor_instanceMethod_Enum___UInt_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^__rollout_enum(id rcv, unsigned int arg0) {
    __rollout_enum (*originalFunction)(id, SEL, unsigned int) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithUInt:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithEnum:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).uIntValue)];
    }];

    return result.enumValue;
  };
}

- (id)blockFor_classMethod_ObjCObjectPointer___ObjCObjectPointer___Pointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, void* arg1) {
    id (*originalFunction)(id, SEL, id, void*) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg1], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).pointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_classMethod_BOOL___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
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

- (id)blockFor_classMethod_Void___ObjCObjectPointer___Pointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, void* arg1) {
    void (*originalFunction)(id, SEL, id, void*) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg1], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).pointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_ObjCObjectPointer___ObjCObjectPointer___BOOL___BlockPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, BOOL arg1, id arg2) {
    id (*originalFunction)(id, SEL, id, BOOL, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithBool:arg1], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).boolValue, ((RolloutTypeWrapper*)arguments[2]).blockPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_Void___ObjCObjectPointer___BlockPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1, id arg2) {
    void (*originalFunction)(id, SEL, id, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithBlockPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).blockPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_classMethod_Void___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1, id arg2) {
    void (*originalFunction)(id, SEL, id, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}

- (id)blockFor_instanceMethod_ULong___ObjCObjectPointer___Pointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^unsigned long(id rcv, id arg0, void* arg1) {
    unsigned long (*originalFunction)(id, SEL, id, void*) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithPointer:arg1], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithULong:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).pointerValue)];
    }];

    return result.uLongValue;
  };
}

- (id)blockFor_classMethod_ObjCObjectPointer___ObjCObjectPointer___Enum___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, __rollout_enum arg1, id arg2, id arg3, id arg4, id arg5) {
    id (*originalFunction)(id, SEL, id, __rollout_enum, id, id, id, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithEnum:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg3], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg4], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg5], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).enumValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[3]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[4]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[5]).objCObjectPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_BOOL___Long_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^BOOL(id rcv, long arg0) {
    BOOL (*originalFunction)(id, SEL, long) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithLong:arg0], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithBool:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).longValue)];
    }];

    return result.boolValue;
  };
}

- (id)blockFor_classMethod_ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___ObjCObjectPointer___Long___Long___ObjCObjectPointer___BOOL___ObjCObjectPointer_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^id(id rcv, id arg0, id arg1, id arg2, id arg3, id arg4, long arg5, long arg6, id arg7, BOOL arg8, id arg9) {
    id (*originalFunction)(id, SEL, id, id, id, id, id, long, long, id, BOOL, id) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg2], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg3], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg4], 
     [[RolloutTypeWrapper alloc] initWithLong:arg5], 
     [[RolloutTypeWrapper alloc] initWithLong:arg6], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg7], 
     [[RolloutTypeWrapper alloc] initWithBool:arg8], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg9], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        return [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[3]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[4]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[5]).longValue, ((RolloutTypeWrapper*)arguments[6]).longValue, ((RolloutTypeWrapper*)arguments[7]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[8]).boolValue, ((RolloutTypeWrapper*)arguments[9]).objCObjectPointerValue)];
    }];

    return result.objCObjectPointerValue;
  };
}

- (id)blockFor_instanceMethod_Void___ObjCObjectPointer___ObjCObjectPointer___Enum_withOriginalImplementation:(IMP)originalImplementation tweakId:(RolloutTweakId *)tweakId
{
  return ^void(id rcv, id arg0, id arg1, __rollout_enum arg2) {
    void (*originalFunction)(id, SEL, id, id, __rollout_enum) = (void *) originalImplementation;
    NSArray *originalArguments = @[     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg0], 
     [[RolloutTypeWrapper alloc] initWithObjCObjectPointer:arg1], 
     [[RolloutTypeWrapper alloc] initWithEnum:arg2], 
];
    
    RolloutTypeWrapper *result __attribute__((unused)) = [self->_invocation invokeWithTweakId:tweakId originalArguments:originalArguments originalMethodWrapper:^RolloutTypeWrapper *(NSArray *arguments) {
        originalFunction(rcv, NSSelectorFromString(tweakId.methodId.selector), ((RolloutTypeWrapper*)arguments[0]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[1]).objCObjectPointerValue, ((RolloutTypeWrapper*)arguments[2]).enumValue); return [[RolloutTypeWrapper alloc] initWithVoid];
    }];

    
  };
}
@end
