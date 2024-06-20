; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37688 () Bool)

(assert start!37688)

(declare-fun res!141767 () Bool)

(declare-fun e!119249 () Bool)

(assert (=> start!37688 (=> (not res!141767) (not e!119249))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37688 (= res!141767 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37688 e!119249))

(assert (=> start!37688 true))

(declare-datatypes ((array!9072 0))(
  ( (array!9073 (arr!4946 (Array (_ BitVec 32) (_ BitVec 8))) (size!4016 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7170 0))(
  ( (BitStream!7171 (buf!4459 array!9072) (currentByte!8452 (_ BitVec 32)) (currentBit!8447 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7170)

(declare-fun e!119250 () Bool)

(declare-fun inv!12 (BitStream!7170) Bool)

(assert (=> start!37688 (and (inv!12 bs!64) e!119250)))

(declare-fun b!170860 () Bool)

(declare-fun res!141768 () Bool)

(assert (=> b!170860 (=> (not res!141768) (not e!119249))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170860 (= res!141768 (validate_offset_bits!1 ((_ sign_extend 32) (size!4016 (buf!4459 bs!64))) ((_ sign_extend 32) (currentByte!8452 bs!64)) ((_ sign_extend 32) (currentBit!8447 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!170861 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!7170 (_ BitVec 64)) Bool)

(assert (=> b!170861 (= e!119249 (not (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((tuple2!14674 0))(
  ( (tuple2!14675 (_1!7970 BitStream!7170) (_2!7970 Bool)) )
))
(declare-fun lt!263374 () tuple2!14674)

(declare-fun readBitPure!0 (BitStream!7170) tuple2!14674)

(assert (=> b!170861 (= lt!263374 (readBitPure!0 bs!64))))

(declare-fun lt!263375 () tuple2!14674)

(declare-fun expected!82 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!7170 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14674)

(assert (=> b!170861 (= lt!263375 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!170862 () Bool)

(declare-fun array_inv!3757 (array!9072) Bool)

(assert (=> b!170862 (= e!119250 (array_inv!3757 (buf!4459 bs!64)))))

(assert (= (and start!37688 res!141767) b!170860))

(assert (= (and b!170860 res!141768) b!170861))

(assert (= start!37688 b!170862))

(declare-fun m!270019 () Bool)

(assert (=> start!37688 m!270019))

(declare-fun m!270021 () Bool)

(assert (=> b!170860 m!270021))

(declare-fun m!270023 () Bool)

(assert (=> b!170861 m!270023))

(declare-fun m!270025 () Bool)

(assert (=> b!170861 m!270025))

(declare-fun m!270027 () Bool)

(assert (=> b!170861 m!270027))

(declare-fun m!270029 () Bool)

(assert (=> b!170862 m!270029))

(check-sat (not b!170862) (not b!170860) (not b!170861) (not start!37688))
(check-sat)
(get-model)

(declare-fun d!60371 () Bool)

(assert (=> d!60371 (= (array_inv!3757 (buf!4459 bs!64)) (bvsge (size!4016 (buf!4459 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!170862 d!60371))

(declare-fun d!60373 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!60373 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4016 (buf!4459 bs!64))) ((_ sign_extend 32) (currentByte!8452 bs!64)) ((_ sign_extend 32) (currentBit!8447 bs!64)) (bvsub nBits!283 from!235)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4016 (buf!4459 bs!64))) ((_ sign_extend 32) (currentByte!8452 bs!64)) ((_ sign_extend 32) (currentBit!8447 bs!64))) (bvsub nBits!283 from!235)))))

(declare-fun bs!15026 () Bool)

(assert (= bs!15026 d!60373))

(declare-fun m!270045 () Bool)

(assert (=> bs!15026 m!270045))

(assert (=> b!170860 d!60373))

(declare-fun d!60375 () Bool)

(declare-fun res!141783 () Bool)

(declare-fun e!119269 () Bool)

(assert (=> d!60375 (=> (not res!141783) (not e!119269))))

(assert (=> d!60375 (= res!141783 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4016 (buf!4459 bs!64)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4016 (buf!4459 bs!64)))))))))

(assert (=> d!60375 (= (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) e!119269)))

(declare-fun b!170883 () Bool)

(declare-fun lt!263396 () (_ BitVec 64))

(assert (=> b!170883 (= e!119269 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!263396) (bvsle lt!263396 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4016 (buf!4459 bs!64)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!170883 (= lt!263396 (bvadd (bitIndex!0 (size!4016 (buf!4459 bs!64)) (currentByte!8452 bs!64) (currentBit!8447 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!60375 res!141783) b!170883))

(declare-fun m!270055 () Bool)

(assert (=> b!170883 m!270055))

(assert (=> b!170861 d!60375))

(declare-fun d!60385 () Bool)

(declare-datatypes ((tuple2!14682 0))(
  ( (tuple2!14683 (_1!7974 Bool) (_2!7974 BitStream!7170)) )
))
(declare-fun lt!263404 () tuple2!14682)

(declare-fun readBit!0 (BitStream!7170) tuple2!14682)

(assert (=> d!60385 (= lt!263404 (readBit!0 bs!64))))

(assert (=> d!60385 (= (readBitPure!0 bs!64) (tuple2!14675 (_2!7974 lt!263404) (_1!7974 lt!263404)))))

(declare-fun bs!15031 () Bool)

(assert (= bs!15031 d!60385))

(declare-fun m!270061 () Bool)

(assert (=> bs!15031 m!270061))

(assert (=> b!170861 d!60385))

(declare-fun d!60391 () Bool)

(declare-fun lt!263408 () tuple2!14682)

(declare-fun checkBitsLoop!0 (BitStream!7170 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14682)

(assert (=> d!60391 (= lt!263408 (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235))))

(assert (=> d!60391 (= (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235) (tuple2!14675 (_2!7974 lt!263408) (_1!7974 lt!263408)))))

(declare-fun bs!15035 () Bool)

(assert (= bs!15035 d!60391))

(declare-fun m!270069 () Bool)

(assert (=> bs!15035 m!270069))

(assert (=> b!170861 d!60391))

(declare-fun d!60395 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60395 (= (inv!12 bs!64) (invariant!0 (currentBit!8447 bs!64) (currentByte!8452 bs!64) (size!4016 (buf!4459 bs!64))))))

(declare-fun bs!15036 () Bool)

(assert (= bs!15036 d!60395))

(declare-fun m!270071 () Bool)

(assert (=> bs!15036 m!270071))

(assert (=> start!37688 d!60395))

(check-sat (not d!60385) (not d!60373) (not d!60391) (not d!60395) (not b!170883))
(check-sat)
(get-model)

(declare-fun d!60399 () Bool)

(assert (=> d!60399 (= (invariant!0 (currentBit!8447 bs!64) (currentByte!8452 bs!64) (size!4016 (buf!4459 bs!64))) (and (bvsge (currentBit!8447 bs!64) #b00000000000000000000000000000000) (bvslt (currentBit!8447 bs!64) #b00000000000000000000000000001000) (bvsge (currentByte!8452 bs!64) #b00000000000000000000000000000000) (or (bvslt (currentByte!8452 bs!64) (size!4016 (buf!4459 bs!64))) (and (= (currentBit!8447 bs!64) #b00000000000000000000000000000000) (= (currentByte!8452 bs!64) (size!4016 (buf!4459 bs!64)))))))))

(assert (=> d!60395 d!60399))

(declare-fun d!60403 () Bool)

(assert (=> d!60403 (= (remainingBits!0 ((_ sign_extend 32) (size!4016 (buf!4459 bs!64))) ((_ sign_extend 32) (currentByte!8452 bs!64)) ((_ sign_extend 32) (currentBit!8447 bs!64))) (bvsub (bvmul ((_ sign_extend 32) (size!4016 (buf!4459 bs!64))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8452 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8447 bs!64)))))))

(assert (=> d!60373 d!60403))

(declare-fun d!60405 () Bool)

(declare-fun e!119275 () Bool)

(assert (=> d!60405 e!119275))

(declare-fun res!141794 () Bool)

(assert (=> d!60405 (=> (not res!141794) (not e!119275))))

(declare-fun lt!263441 () (_ BitVec 64))

(declare-fun lt!263440 () (_ BitVec 64))

(declare-fun lt!263444 () (_ BitVec 64))

(assert (=> d!60405 (= res!141794 (= lt!263441 (bvsub lt!263444 lt!263440)))))

(assert (=> d!60405 (or (= (bvand lt!263444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!263440 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263444 lt!263440) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60405 (= lt!263440 (remainingBits!0 ((_ sign_extend 32) (size!4016 (buf!4459 bs!64))) ((_ sign_extend 32) (currentByte!8452 bs!64)) ((_ sign_extend 32) (currentBit!8447 bs!64))))))

(declare-fun lt!263442 () (_ BitVec 64))

(declare-fun lt!263439 () (_ BitVec 64))

(assert (=> d!60405 (= lt!263444 (bvmul lt!263442 lt!263439))))

(assert (=> d!60405 (or (= lt!263442 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!263439 (bvsdiv (bvmul lt!263442 lt!263439) lt!263442)))))

(assert (=> d!60405 (= lt!263439 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60405 (= lt!263442 ((_ sign_extend 32) (size!4016 (buf!4459 bs!64))))))

(assert (=> d!60405 (= lt!263441 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8452 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8447 bs!64))))))

(assert (=> d!60405 (invariant!0 (currentBit!8447 bs!64) (currentByte!8452 bs!64) (size!4016 (buf!4459 bs!64)))))

(assert (=> d!60405 (= (bitIndex!0 (size!4016 (buf!4459 bs!64)) (currentByte!8452 bs!64) (currentBit!8447 bs!64)) lt!263441)))

(declare-fun b!170894 () Bool)

(declare-fun res!141795 () Bool)

(assert (=> b!170894 (=> (not res!141795) (not e!119275))))

(assert (=> b!170894 (= res!141795 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!263441))))

(declare-fun b!170895 () Bool)

(declare-fun lt!263443 () (_ BitVec 64))

(assert (=> b!170895 (= e!119275 (bvsle lt!263441 (bvmul lt!263443 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!170895 (or (= lt!263443 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!263443 #b0000000000000000000000000000000000000000000000000000000000001000) lt!263443)))))

(assert (=> b!170895 (= lt!263443 ((_ sign_extend 32) (size!4016 (buf!4459 bs!64))))))

(assert (= (and d!60405 res!141794) b!170894))

(assert (= (and b!170894 res!141795) b!170895))

(assert (=> d!60405 m!270045))

(assert (=> d!60405 m!270071))

(assert (=> b!170883 d!60405))

(declare-fun d!60411 () Bool)

(declare-fun e!119289 () Bool)

(assert (=> d!60411 e!119289))

(declare-fun res!141801 () Bool)

(assert (=> d!60411 (=> (not res!141801) (not e!119289))))

(declare-datatypes ((Unit!12215 0))(
  ( (Unit!12216) )
))
(declare-datatypes ((tuple2!14686 0))(
  ( (tuple2!14687 (_1!7976 Unit!12215) (_2!7976 BitStream!7170)) )
))
(declare-fun increaseBitIndex!0 (BitStream!7170) tuple2!14686)

(assert (=> d!60411 (= res!141801 (= (buf!4459 (_2!7976 (increaseBitIndex!0 bs!64))) (buf!4459 bs!64)))))

(declare-fun lt!263481 () Bool)

(assert (=> d!60411 (= lt!263481 (not (= (bvand ((_ sign_extend 24) (select (arr!4946 (buf!4459 bs!64)) (currentByte!8452 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8447 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263485 () tuple2!14682)

(assert (=> d!60411 (= lt!263485 (tuple2!14683 (not (= (bvand ((_ sign_extend 24) (select (arr!4946 (buf!4459 bs!64)) (currentByte!8452 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8447 bs!64)))) #b00000000000000000000000000000000)) (_2!7976 (increaseBitIndex!0 bs!64))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!60411 (validate_offset_bit!0 ((_ sign_extend 32) (size!4016 (buf!4459 bs!64))) ((_ sign_extend 32) (currentByte!8452 bs!64)) ((_ sign_extend 32) (currentBit!8447 bs!64)))))

(assert (=> d!60411 (= (readBit!0 bs!64) lt!263485)))

(declare-fun lt!263483 () (_ BitVec 64))

(declare-fun b!170901 () Bool)

(declare-fun lt!263482 () (_ BitVec 64))

(assert (=> b!170901 (= e!119289 (= (bitIndex!0 (size!4016 (buf!4459 (_2!7976 (increaseBitIndex!0 bs!64)))) (currentByte!8452 (_2!7976 (increaseBitIndex!0 bs!64))) (currentBit!8447 (_2!7976 (increaseBitIndex!0 bs!64)))) (bvadd lt!263482 lt!263483)))))

(assert (=> b!170901 (or (not (= (bvand lt!263482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!263483 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263482 lt!263483) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!170901 (= lt!263483 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!170901 (= lt!263482 (bitIndex!0 (size!4016 (buf!4459 bs!64)) (currentByte!8452 bs!64) (currentBit!8447 bs!64)))))

(declare-fun lt!263486 () Bool)

(assert (=> b!170901 (= lt!263486 (not (= (bvand ((_ sign_extend 24) (select (arr!4946 (buf!4459 bs!64)) (currentByte!8452 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8447 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263480 () Bool)

(assert (=> b!170901 (= lt!263480 (not (= (bvand ((_ sign_extend 24) (select (arr!4946 (buf!4459 bs!64)) (currentByte!8452 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8447 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263484 () Bool)

(assert (=> b!170901 (= lt!263484 (not (= (bvand ((_ sign_extend 24) (select (arr!4946 (buf!4459 bs!64)) (currentByte!8452 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8447 bs!64)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60411 res!141801) b!170901))

(declare-fun m!270083 () Bool)

(assert (=> d!60411 m!270083))

(declare-fun m!270085 () Bool)

(assert (=> d!60411 m!270085))

(declare-fun m!270087 () Bool)

(assert (=> d!60411 m!270087))

(declare-fun m!270089 () Bool)

(assert (=> d!60411 m!270089))

(assert (=> b!170901 m!270055))

(assert (=> b!170901 m!270083))

(assert (=> b!170901 m!270087))

(assert (=> b!170901 m!270085))

(declare-fun m!270091 () Bool)

(assert (=> b!170901 m!270091))

(assert (=> d!60385 d!60411))

(declare-fun b!170971 () Bool)

(declare-fun e!119335 () Bool)

(declare-fun e!119336 () Bool)

(assert (=> b!170971 (= e!119335 e!119336)))

(declare-fun res!141847 () Bool)

(assert (=> b!170971 (=> res!141847 e!119336)))

(declare-fun lt!263586 () tuple2!14682)

(assert (=> b!170971 (= res!141847 (or (not (_1!7974 lt!263586)) (bvsge from!235 nBits!283)))))

(declare-fun b!170972 () Bool)

(declare-fun e!119334 () tuple2!14682)

(assert (=> b!170972 (= e!119334 (tuple2!14683 true bs!64))))

(declare-fun b!170973 () Bool)

(assert (=> b!170973 (= e!119336 (= expected!82 (_2!7970 (readBitPure!0 bs!64))))))

(declare-fun b!170974 () Bool)

(declare-fun res!141843 () Bool)

(assert (=> b!170974 (=> (not res!141843) (not e!119335))))

(declare-fun e!119333 () Bool)

(assert (=> b!170974 (= res!141843 e!119333)))

(declare-fun res!141845 () Bool)

(assert (=> b!170974 (=> res!141845 e!119333)))

(assert (=> b!170974 (= res!141845 (not (_1!7974 lt!263586)))))

(declare-fun d!60415 () Bool)

(assert (=> d!60415 e!119335))

(declare-fun res!141844 () Bool)

(assert (=> d!60415 (=> (not res!141844) (not e!119335))))

(declare-fun lt!263590 () (_ BitVec 64))

(assert (=> d!60415 (= res!141844 (bvsge (bvsub lt!263590 from!235) (bitIndex!0 (size!4016 (buf!4459 (_2!7974 lt!263586))) (currentByte!8452 (_2!7974 lt!263586)) (currentBit!8447 (_2!7974 lt!263586)))))))

(assert (=> d!60415 (or (= (bvand lt!263590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263590 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!263589 () (_ BitVec 64))

(assert (=> d!60415 (= lt!263590 (bvadd lt!263589 nBits!283))))

(assert (=> d!60415 (or (not (= (bvand lt!263589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263589 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60415 (= lt!263589 (bitIndex!0 (size!4016 (buf!4459 bs!64)) (currentByte!8452 bs!64) (currentBit!8447 bs!64)))))

(assert (=> d!60415 (= lt!263586 e!119334)))

(declare-fun c!8946 () Bool)

(assert (=> d!60415 (= c!8946 (= from!235 nBits!283))))

(assert (=> d!60415 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60415 (= (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235) lt!263586)))

(declare-fun lt!263585 () tuple2!14682)

(declare-fun b!170975 () Bool)

(declare-fun lt!263587 () tuple2!14682)

(assert (=> b!170975 (= lt!263587 (checkBitsLoop!0 (_2!7974 lt!263585) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!263582 () Unit!12215)

(declare-fun lt!263591 () Unit!12215)

(assert (=> b!170975 (= lt!263582 lt!263591)))

(declare-fun lt!263583 () (_ BitVec 64))

(declare-fun lt!263592 () (_ BitVec 64))

(assert (=> b!170975 (validate_offset_bits!1 ((_ sign_extend 32) (size!4016 (buf!4459 (_2!7974 lt!263585)))) ((_ sign_extend 32) (currentByte!8452 (_2!7974 lt!263585))) ((_ sign_extend 32) (currentBit!8447 (_2!7974 lt!263585))) (bvsub lt!263583 lt!263592))))

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!7170 BitStream!7170 (_ BitVec 64) (_ BitVec 64)) Unit!12215)

(assert (=> b!170975 (= lt!263591 (validateOffsetBitsIneqLemma!0 bs!64 (_2!7974 lt!263585) lt!263583 lt!263592))))

(assert (=> b!170975 (= lt!263592 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!170975 (= lt!263583 (bvsub nBits!283 from!235))))

(declare-fun e!119332 () tuple2!14682)

(assert (=> b!170975 (= e!119332 (tuple2!14683 (_1!7974 lt!263587) (_2!7974 lt!263587)))))

(declare-fun b!170976 () Bool)

(declare-fun res!141846 () Bool)

(assert (=> b!170976 (=> (not res!141846) (not e!119335))))

(assert (=> b!170976 (= res!141846 (and (= (buf!4459 bs!64) (buf!4459 (_2!7974 lt!263586))) (or (not (= nBits!283 from!235)) (_1!7974 lt!263586))))))

(declare-fun b!170977 () Bool)

(assert (=> b!170977 (= e!119332 (tuple2!14683 false (_2!7974 lt!263585)))))

(declare-fun b!170978 () Bool)

(assert (=> b!170978 (= e!119334 e!119332)))

(assert (=> b!170978 (= lt!263585 (readBit!0 bs!64))))

(declare-fun c!8947 () Bool)

(assert (=> b!170978 (= c!8947 (not (= (_1!7974 lt!263585) expected!82)))))

(declare-fun b!170979 () Bool)

(declare-fun lt!263584 () (_ BitVec 64))

(assert (=> b!170979 (= e!119333 (= (bvsub lt!263584 from!235) (bitIndex!0 (size!4016 (buf!4459 (_2!7974 lt!263586))) (currentByte!8452 (_2!7974 lt!263586)) (currentBit!8447 (_2!7974 lt!263586)))))))

(assert (=> b!170979 (or (= (bvand lt!263584 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263584 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263584 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!263588 () (_ BitVec 64))

(assert (=> b!170979 (= lt!263584 (bvadd lt!263588 nBits!283))))

(assert (=> b!170979 (or (not (= (bvand lt!263588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263588 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!170979 (= lt!263588 (bitIndex!0 (size!4016 (buf!4459 bs!64)) (currentByte!8452 bs!64) (currentBit!8447 bs!64)))))

(assert (= (and d!60415 c!8946) b!170972))

(assert (= (and d!60415 (not c!8946)) b!170978))

(assert (= (and b!170978 c!8947) b!170977))

(assert (= (and b!170978 (not c!8947)) b!170975))

(assert (= (and d!60415 res!141844) b!170976))

(assert (= (and b!170976 res!141846) b!170974))

(assert (= (and b!170974 (not res!141845)) b!170979))

(assert (= (and b!170974 res!141843) b!170971))

(assert (= (and b!170971 (not res!141847)) b!170973))

(assert (=> b!170973 m!270025))

(declare-fun m!270101 () Bool)

(assert (=> b!170979 m!270101))

(assert (=> b!170979 m!270055))

(assert (=> b!170978 m!270061))

(assert (=> d!60415 m!270101))

(assert (=> d!60415 m!270055))

(declare-fun m!270103 () Bool)

(assert (=> b!170975 m!270103))

(declare-fun m!270105 () Bool)

(assert (=> b!170975 m!270105))

(declare-fun m!270107 () Bool)

(assert (=> b!170975 m!270107))

(assert (=> d!60391 d!60415))

(check-sat (not d!60415) (not b!170901) (not d!60405) (not d!60411) (not b!170973) (not b!170979) (not b!170975) (not b!170978))
(check-sat)
