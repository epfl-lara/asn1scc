; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45504 () Bool)

(assert start!45504)

(declare-fun b!220360 () Bool)

(declare-fun e!149647 () Bool)

(declare-fun e!149646 () Bool)

(assert (=> b!220360 (= e!149647 e!149646)))

(declare-fun res!185626 () Bool)

(assert (=> b!220360 (=> (not res!185626) (not e!149646))))

(declare-fun i!541 () (_ BitVec 32))

(assert (=> b!220360 (= res!185626 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-datatypes ((array!10743 0))(
  ( (array!10744 (arr!5648 (Array (_ BitVec 32) (_ BitVec 8))) (size!4718 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8544 0))(
  ( (BitStream!8545 (buf!5265 array!10743) (currentByte!9886 (_ BitVec 32)) (currentBit!9881 (_ BitVec 32))) )
))
(declare-fun lt!348165 () BitStream!8544)

(declare-fun bs!62 () BitStream!8544)

(declare-fun withMovedBitIndex!0 (BitStream!8544 (_ BitVec 64)) BitStream!8544)

(assert (=> b!220360 (= lt!348165 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!18840 0))(
  ( (tuple2!18841 (_1!10078 BitStream!8544) (_2!10078 Bool)) )
))
(declare-fun lt!348166 () tuple2!18840)

(declare-fun readBitPure!0 (BitStream!8544) tuple2!18840)

(assert (=> b!220360 (= lt!348166 (readBitPure!0 bs!62))))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-datatypes ((tuple2!18842 0))(
  ( (tuple2!18843 (_1!10079 BitStream!8544) (_2!10079 (_ BitVec 64))) )
))
(declare-fun lt!348167 () tuple2!18842)

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18842)

(assert (=> b!220360 (= lt!348167 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220361 () Bool)

(declare-fun res!185630 () Bool)

(assert (=> b!220361 (=> (not res!185630) (not e!149647))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220361 (= res!185630 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220362 () Bool)

(declare-fun e!149648 () Bool)

(declare-fun array_inv!4459 (array!10743) Bool)

(assert (=> b!220362 (= e!149648 (array_inv!4459 (buf!5265 bs!62)))))

(declare-fun b!220363 () Bool)

(declare-fun res!185628 () Bool)

(assert (=> b!220363 (=> (not res!185628) (not e!149647))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220363 (= res!185628 (validate_offset_bits!1 ((_ sign_extend 32) (size!4718 (buf!5265 bs!62))) ((_ sign_extend 32) (currentByte!9886 bs!62)) ((_ sign_extend 32) (currentBit!9881 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun res!185627 () Bool)

(assert (=> start!45504 (=> (not res!185627) (not e!149647))))

(assert (=> start!45504 (= res!185627 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45504 e!149647))

(assert (=> start!45504 true))

(declare-fun inv!12 (BitStream!8544) Bool)

(assert (=> start!45504 (and (inv!12 bs!62) e!149648)))

(declare-fun b!220364 () Bool)

(declare-fun res!185629 () Bool)

(assert (=> b!220364 (=> (not res!185629) (not e!149647))))

(assert (=> b!220364 (= res!185629 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220365 () Bool)

(assert (=> b!220365 (= e!149646 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4718 (buf!5265 lt!348165))) ((_ sign_extend 32) (currentByte!9886 lt!348165)) ((_ sign_extend 32) (currentBit!9881 lt!348165)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541))))))))

(assert (= (and start!45504 res!185627) b!220363))

(assert (= (and b!220363 res!185628) b!220361))

(assert (= (and b!220361 res!185630) b!220364))

(assert (= (and b!220364 res!185629) b!220360))

(assert (= (and b!220360 res!185626) b!220365))

(assert (= start!45504 b!220362))

(declare-fun m!339053 () Bool)

(assert (=> b!220362 m!339053))

(declare-fun m!339055 () Bool)

(assert (=> b!220361 m!339055))

(declare-fun m!339057 () Bool)

(assert (=> b!220360 m!339057))

(declare-fun m!339059 () Bool)

(assert (=> b!220360 m!339059))

(declare-fun m!339061 () Bool)

(assert (=> b!220360 m!339061))

(declare-fun m!339063 () Bool)

(assert (=> start!45504 m!339063))

(declare-fun m!339065 () Bool)

(assert (=> b!220363 m!339065))

(declare-fun m!339067 () Bool)

(assert (=> b!220365 m!339067))

(check-sat (not b!220362) (not start!45504) (not b!220365) (not b!220360) (not b!220363) (not b!220361))
(check-sat)
(get-model)

(declare-fun d!74189 () Bool)

(assert (=> d!74189 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220361 d!74189))

(declare-fun d!74191 () Bool)

(declare-fun e!149667 () Bool)

(assert (=> d!74191 e!149667))

(declare-fun res!185651 () Bool)

(assert (=> d!74191 (=> (not res!185651) (not e!149667))))

(declare-fun lt!348191 () (_ BitVec 64))

(declare-fun lt!348190 () BitStream!8544)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!74191 (= res!185651 (= (bvadd lt!348191 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4718 (buf!5265 lt!348190)) (currentByte!9886 lt!348190) (currentBit!9881 lt!348190))))))

(assert (=> d!74191 (or (not (= (bvand lt!348191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348191 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74191 (= lt!348191 (bitIndex!0 (size!4718 (buf!5265 bs!62)) (currentByte!9886 bs!62) (currentBit!9881 bs!62)))))

(declare-datatypes ((Unit!15585 0))(
  ( (Unit!15586) )
))
(declare-datatypes ((tuple2!18852 0))(
  ( (tuple2!18853 (_1!10084 Unit!15585) (_2!10084 BitStream!8544)) )
))
(declare-fun moveBitIndex!0 (BitStream!8544 (_ BitVec 64)) tuple2!18852)

(assert (=> d!74191 (= lt!348190 (_2!10084 (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8544 (_ BitVec 64)) Bool)

(assert (=> d!74191 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!74191 (= (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) lt!348190)))

(declare-fun b!220389 () Bool)

(assert (=> b!220389 (= e!149667 (= (size!4718 (buf!5265 bs!62)) (size!4718 (buf!5265 lt!348190))))))

(assert (= (and d!74191 res!185651) b!220389))

(declare-fun m!339105 () Bool)

(assert (=> d!74191 m!339105))

(declare-fun m!339107 () Bool)

(assert (=> d!74191 m!339107))

(declare-fun m!339109 () Bool)

(assert (=> d!74191 m!339109))

(declare-fun m!339111 () Bool)

(assert (=> d!74191 m!339111))

(assert (=> b!220360 d!74191))

(declare-fun d!74203 () Bool)

(declare-datatypes ((tuple2!18856 0))(
  ( (tuple2!18857 (_1!10086 Bool) (_2!10086 BitStream!8544)) )
))
(declare-fun lt!348197 () tuple2!18856)

(declare-fun readBit!0 (BitStream!8544) tuple2!18856)

(assert (=> d!74203 (= lt!348197 (readBit!0 bs!62))))

(assert (=> d!74203 (= (readBitPure!0 bs!62) (tuple2!18841 (_2!10086 lt!348197) (_1!10086 lt!348197)))))

(declare-fun bs!18147 () Bool)

(assert (= bs!18147 d!74203))

(declare-fun m!339115 () Bool)

(assert (=> bs!18147 m!339115))

(assert (=> b!220360 d!74203))

(declare-datatypes ((tuple2!18858 0))(
  ( (tuple2!18859 (_1!10087 (_ BitVec 64)) (_2!10087 BitStream!8544)) )
))
(declare-fun lt!348200 () tuple2!18858)

(declare-fun d!74205 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18858)

(assert (=> d!74205 (= lt!348200 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74205 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18843 (_2!10087 lt!348200) (_1!10087 lt!348200)))))

(declare-fun bs!18148 () Bool)

(assert (= bs!18148 d!74205))

(declare-fun m!339117 () Bool)

(assert (=> bs!18148 m!339117))

(assert (=> b!220360 d!74205))

(declare-fun d!74207 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74207 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4718 (buf!5265 lt!348165))) ((_ sign_extend 32) (currentByte!9886 lt!348165)) ((_ sign_extend 32) (currentBit!9881 lt!348165)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4718 (buf!5265 lt!348165))) ((_ sign_extend 32) (currentByte!9886 lt!348165)) ((_ sign_extend 32) (currentBit!9881 lt!348165))) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun bs!18149 () Bool)

(assert (= bs!18149 d!74207))

(declare-fun m!339119 () Bool)

(assert (=> bs!18149 m!339119))

(assert (=> b!220365 d!74207))

(declare-fun d!74209 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74209 (= (inv!12 bs!62) (invariant!0 (currentBit!9881 bs!62) (currentByte!9886 bs!62) (size!4718 (buf!5265 bs!62))))))

(declare-fun bs!18150 () Bool)

(assert (= bs!18150 d!74209))

(declare-fun m!339121 () Bool)

(assert (=> bs!18150 m!339121))

(assert (=> start!45504 d!74209))

(declare-fun d!74211 () Bool)

(assert (=> d!74211 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4718 (buf!5265 bs!62))) ((_ sign_extend 32) (currentByte!9886 bs!62)) ((_ sign_extend 32) (currentBit!9881 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4718 (buf!5265 bs!62))) ((_ sign_extend 32) (currentByte!9886 bs!62)) ((_ sign_extend 32) (currentBit!9881 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18151 () Bool)

(assert (= bs!18151 d!74211))

(declare-fun m!339123 () Bool)

(assert (=> bs!18151 m!339123))

(assert (=> b!220363 d!74211))

(declare-fun d!74213 () Bool)

(assert (=> d!74213 (= (array_inv!4459 (buf!5265 bs!62)) (bvsge (size!4718 (buf!5265 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220362 d!74213))

(check-sat (not d!74203) (not d!74191) (not d!74211) (not d!74209) (not d!74207) (not d!74205))
(check-sat)
(get-model)

(declare-fun e!149677 () Bool)

(declare-fun b!220407 () Bool)

(declare-fun lt!348230 () (_ BitVec 64))

(declare-fun lt!348227 () tuple2!18858)

(assert (=> b!220407 (= e!149677 (= (= (bvand (bvlshr (_1!10087 lt!348227) lt!348230) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10078 (readBitPure!0 bs!62))))))

(assert (=> b!220407 (and (bvsge lt!348230 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!348230 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!220407 (= lt!348230 ((_ sign_extend 32) i!541))))

(declare-fun b!220408 () Bool)

(declare-fun e!149678 () tuple2!18858)

(assert (=> b!220408 (= e!149678 (tuple2!18859 acc!113 bs!62))))

(declare-fun b!220409 () Bool)

(declare-fun res!185665 () Bool)

(declare-fun e!149679 () Bool)

(assert (=> b!220409 (=> (not res!185665) (not e!149679))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220409 (= res!185665 (= (bvand (_1!10087 lt!348227) (onesLSBLong!0 nBits!265)) (_1!10087 lt!348227)))))

(declare-fun b!220410 () Bool)

(declare-fun res!185666 () Bool)

(assert (=> b!220410 (=> (not res!185666) (not e!149679))))

(declare-fun lt!348229 () (_ BitVec 64))

(declare-fun lt!348226 () (_ BitVec 64))

(assert (=> b!220410 (= res!185666 (= (bitIndex!0 (size!4718 (buf!5265 (_2!10087 lt!348227))) (currentByte!9886 (_2!10087 lt!348227)) (currentBit!9881 (_2!10087 lt!348227))) (bvadd lt!348226 lt!348229)))))

(assert (=> b!220410 (or (not (= (bvand lt!348226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348229 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348226 lt!348229) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220410 (= lt!348229 ((_ sign_extend 32) (bvsub nBits!265 i!541)))))

(assert (=> b!220410 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand i!541 #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 i!541) #b10000000000000000000000000000000)))))

(assert (=> b!220410 (= lt!348226 (bitIndex!0 (size!4718 (buf!5265 bs!62)) (currentByte!9886 bs!62) (currentBit!9881 bs!62)))))

(declare-fun b!220412 () Bool)

(declare-fun res!185669 () Bool)

(assert (=> b!220412 (=> (not res!185669) (not e!149679))))

(assert (=> b!220412 (= res!185669 (= (bvand (_1!10087 lt!348227) (onesLSBLong!0 i!541)) (bvand acc!113 (onesLSBLong!0 i!541))))))

(declare-fun b!220413 () Bool)

(declare-fun lt!348228 () tuple2!18858)

(assert (=> b!220413 (= e!149678 (tuple2!18859 (_1!10087 lt!348228) (_2!10087 lt!348228)))))

(declare-fun lt!348225 () tuple2!18856)

(assert (=> b!220413 (= lt!348225 (readBit!0 bs!62))))

(assert (=> b!220413 (= lt!348228 (readNBitsLSBFirstsLoop!0 (_2!10086 lt!348225) nBits!265 (bvadd i!541 #b00000000000000000000000000000001) (bvor acc!113 (ite (_1!10086 lt!348225) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220411 () Bool)

(assert (=> b!220411 (= e!149679 e!149677)))

(declare-fun res!185668 () Bool)

(assert (=> b!220411 (=> res!185668 e!149677)))

(assert (=> b!220411 (= res!185668 (not (bvslt i!541 nBits!265)))))

(declare-fun d!74225 () Bool)

(assert (=> d!74225 e!149679))

(declare-fun res!185667 () Bool)

(assert (=> d!74225 (=> (not res!185667) (not e!149679))))

(assert (=> d!74225 (= res!185667 (= (buf!5265 (_2!10087 lt!348227)) (buf!5265 bs!62)))))

(assert (=> d!74225 (= lt!348227 e!149678)))

(declare-fun c!10670 () Bool)

(assert (=> d!74225 (= c!10670 (= nBits!265 i!541))))

(assert (=> d!74225 (and (bvsle #b00000000000000000000000000000000 i!541) (bvsle i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74225 (= (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113) lt!348227)))

(assert (= (and d!74225 c!10670) b!220408))

(assert (= (and d!74225 (not c!10670)) b!220413))

(assert (= (and d!74225 res!185667) b!220410))

(assert (= (and b!220410 res!185666) b!220412))

(assert (= (and b!220412 res!185669) b!220409))

(assert (= (and b!220409 res!185665) b!220411))

(assert (= (and b!220411 (not res!185668)) b!220407))

(assert (=> b!220407 m!339059))

(declare-fun m!339139 () Bool)

(assert (=> b!220410 m!339139))

(assert (=> b!220410 m!339107))

(assert (=> b!220413 m!339115))

(declare-fun m!339141 () Bool)

(assert (=> b!220413 m!339141))

(declare-fun m!339143 () Bool)

(assert (=> b!220409 m!339143))

(declare-fun m!339145 () Bool)

(assert (=> b!220412 m!339145))

(assert (=> d!74205 d!74225))

(declare-fun d!74227 () Bool)

(assert (=> d!74227 (= (remainingBits!0 ((_ sign_extend 32) (size!4718 (buf!5265 bs!62))) ((_ sign_extend 32) (currentByte!9886 bs!62)) ((_ sign_extend 32) (currentBit!9881 bs!62))) (bvsub (bvmul ((_ sign_extend 32) (size!4718 (buf!5265 bs!62))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9886 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9881 bs!62)))))))

(assert (=> d!74211 d!74227))

(declare-fun d!74229 () Bool)

(assert (=> d!74229 (= (invariant!0 (currentBit!9881 bs!62) (currentByte!9886 bs!62) (size!4718 (buf!5265 bs!62))) (and (bvsge (currentBit!9881 bs!62) #b00000000000000000000000000000000) (bvslt (currentBit!9881 bs!62) #b00000000000000000000000000001000) (bvsge (currentByte!9886 bs!62) #b00000000000000000000000000000000) (or (bvslt (currentByte!9886 bs!62) (size!4718 (buf!5265 bs!62))) (and (= (currentBit!9881 bs!62) #b00000000000000000000000000000000) (= (currentByte!9886 bs!62) (size!4718 (buf!5265 bs!62)))))))))

(assert (=> d!74209 d!74229))

(declare-fun d!74231 () Bool)

(assert (=> d!74231 (= (remainingBits!0 ((_ sign_extend 32) (size!4718 (buf!5265 lt!348165))) ((_ sign_extend 32) (currentByte!9886 lt!348165)) ((_ sign_extend 32) (currentBit!9881 lt!348165))) (bvsub (bvmul ((_ sign_extend 32) (size!4718 (buf!5265 lt!348165))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9886 lt!348165)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9881 lt!348165)))))))

(assert (=> d!74207 d!74231))

(declare-fun d!74233 () Bool)

(declare-fun e!149686 () Bool)

(assert (=> d!74233 e!149686))

(declare-fun res!185672 () Bool)

(assert (=> d!74233 (=> (not res!185672) (not e!149686))))

(declare-fun increaseBitIndex!0 (BitStream!8544) tuple2!18852)

(assert (=> d!74233 (= res!185672 (= (buf!5265 (_2!10084 (increaseBitIndex!0 bs!62))) (buf!5265 bs!62)))))

(declare-fun lt!348249 () Bool)

(assert (=> d!74233 (= lt!348249 (not (= (bvand ((_ sign_extend 24) (select (arr!5648 (buf!5265 bs!62)) (currentByte!9886 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9881 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348250 () tuple2!18856)

(assert (=> d!74233 (= lt!348250 (tuple2!18857 (not (= (bvand ((_ sign_extend 24) (select (arr!5648 (buf!5265 bs!62)) (currentByte!9886 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9881 bs!62)))) #b00000000000000000000000000000000)) (_2!10084 (increaseBitIndex!0 bs!62))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!74233 (validate_offset_bit!0 ((_ sign_extend 32) (size!4718 (buf!5265 bs!62))) ((_ sign_extend 32) (currentByte!9886 bs!62)) ((_ sign_extend 32) (currentBit!9881 bs!62)))))

(assert (=> d!74233 (= (readBit!0 bs!62) lt!348250)))

(declare-fun lt!348251 () (_ BitVec 64))

(declare-fun lt!348246 () (_ BitVec 64))

(declare-fun b!220416 () Bool)

(assert (=> b!220416 (= e!149686 (= (bitIndex!0 (size!4718 (buf!5265 (_2!10084 (increaseBitIndex!0 bs!62)))) (currentByte!9886 (_2!10084 (increaseBitIndex!0 bs!62))) (currentBit!9881 (_2!10084 (increaseBitIndex!0 bs!62)))) (bvadd lt!348246 lt!348251)))))

(assert (=> b!220416 (or (not (= (bvand lt!348246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348251 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348246 lt!348251) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220416 (= lt!348251 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!220416 (= lt!348246 (bitIndex!0 (size!4718 (buf!5265 bs!62)) (currentByte!9886 bs!62) (currentBit!9881 bs!62)))))

(declare-fun lt!348247 () Bool)

(assert (=> b!220416 (= lt!348247 (not (= (bvand ((_ sign_extend 24) (select (arr!5648 (buf!5265 bs!62)) (currentByte!9886 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9881 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348245 () Bool)

(assert (=> b!220416 (= lt!348245 (not (= (bvand ((_ sign_extend 24) (select (arr!5648 (buf!5265 bs!62)) (currentByte!9886 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9881 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348248 () Bool)

(assert (=> b!220416 (= lt!348248 (not (= (bvand ((_ sign_extend 24) (select (arr!5648 (buf!5265 bs!62)) (currentByte!9886 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9881 bs!62)))) #b00000000000000000000000000000000)))))

(assert (= (and d!74233 res!185672) b!220416))

(declare-fun m!339147 () Bool)

(assert (=> d!74233 m!339147))

(declare-fun m!339149 () Bool)

(assert (=> d!74233 m!339149))

(declare-fun m!339151 () Bool)

(assert (=> d!74233 m!339151))

(declare-fun m!339153 () Bool)

(assert (=> d!74233 m!339153))

(assert (=> b!220416 m!339149))

(assert (=> b!220416 m!339147))

(declare-fun m!339155 () Bool)

(assert (=> b!220416 m!339155))

(assert (=> b!220416 m!339151))

(assert (=> b!220416 m!339107))

(assert (=> d!74203 d!74233))

(declare-fun d!74235 () Bool)

(declare-fun e!149689 () Bool)

(assert (=> d!74235 e!149689))

(declare-fun res!185677 () Bool)

(assert (=> d!74235 (=> (not res!185677) (not e!149689))))

(declare-fun lt!348266 () (_ BitVec 64))

(declare-fun lt!348265 () (_ BitVec 64))

(declare-fun lt!348264 () (_ BitVec 64))

(assert (=> d!74235 (= res!185677 (= lt!348266 (bvsub lt!348264 lt!348265)))))

(assert (=> d!74235 (or (= (bvand lt!348264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348265 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!348264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!348264 lt!348265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74235 (= lt!348265 (remainingBits!0 ((_ sign_extend 32) (size!4718 (buf!5265 lt!348190))) ((_ sign_extend 32) (currentByte!9886 lt!348190)) ((_ sign_extend 32) (currentBit!9881 lt!348190))))))

(declare-fun lt!348269 () (_ BitVec 64))

(declare-fun lt!348268 () (_ BitVec 64))

(assert (=> d!74235 (= lt!348264 (bvmul lt!348269 lt!348268))))

(assert (=> d!74235 (or (= lt!348269 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!348268 (bvsdiv (bvmul lt!348269 lt!348268) lt!348269)))))

(assert (=> d!74235 (= lt!348268 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74235 (= lt!348269 ((_ sign_extend 32) (size!4718 (buf!5265 lt!348190))))))

(assert (=> d!74235 (= lt!348266 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9886 lt!348190)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9881 lt!348190))))))

(assert (=> d!74235 (invariant!0 (currentBit!9881 lt!348190) (currentByte!9886 lt!348190) (size!4718 (buf!5265 lt!348190)))))

(assert (=> d!74235 (= (bitIndex!0 (size!4718 (buf!5265 lt!348190)) (currentByte!9886 lt!348190) (currentBit!9881 lt!348190)) lt!348266)))

(declare-fun b!220421 () Bool)

(declare-fun res!185678 () Bool)

(assert (=> b!220421 (=> (not res!185678) (not e!149689))))

(assert (=> b!220421 (= res!185678 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348266))))

(declare-fun b!220422 () Bool)

(declare-fun lt!348267 () (_ BitVec 64))

(assert (=> b!220422 (= e!149689 (bvsle lt!348266 (bvmul lt!348267 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!220422 (or (= lt!348267 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!348267 #b0000000000000000000000000000000000000000000000000000000000001000) lt!348267)))))

(assert (=> b!220422 (= lt!348267 ((_ sign_extend 32) (size!4718 (buf!5265 lt!348190))))))

(assert (= (and d!74235 res!185677) b!220421))

(assert (= (and b!220421 res!185678) b!220422))

(declare-fun m!339157 () Bool)

(assert (=> d!74235 m!339157))

(declare-fun m!339159 () Bool)

(assert (=> d!74235 m!339159))

(assert (=> d!74191 d!74235))

(declare-fun d!74237 () Bool)

(declare-fun e!149690 () Bool)

(assert (=> d!74237 e!149690))

(declare-fun res!185679 () Bool)

(assert (=> d!74237 (=> (not res!185679) (not e!149690))))

(declare-fun lt!348271 () (_ BitVec 64))

(declare-fun lt!348270 () (_ BitVec 64))

(declare-fun lt!348272 () (_ BitVec 64))

(assert (=> d!74237 (= res!185679 (= lt!348272 (bvsub lt!348270 lt!348271)))))

(assert (=> d!74237 (or (= (bvand lt!348270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348271 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!348270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!348270 lt!348271) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74237 (= lt!348271 (remainingBits!0 ((_ sign_extend 32) (size!4718 (buf!5265 bs!62))) ((_ sign_extend 32) (currentByte!9886 bs!62)) ((_ sign_extend 32) (currentBit!9881 bs!62))))))

(declare-fun lt!348275 () (_ BitVec 64))

(declare-fun lt!348274 () (_ BitVec 64))

(assert (=> d!74237 (= lt!348270 (bvmul lt!348275 lt!348274))))

(assert (=> d!74237 (or (= lt!348275 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!348274 (bvsdiv (bvmul lt!348275 lt!348274) lt!348275)))))

(assert (=> d!74237 (= lt!348274 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74237 (= lt!348275 ((_ sign_extend 32) (size!4718 (buf!5265 bs!62))))))

(assert (=> d!74237 (= lt!348272 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9886 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9881 bs!62))))))

(assert (=> d!74237 (invariant!0 (currentBit!9881 bs!62) (currentByte!9886 bs!62) (size!4718 (buf!5265 bs!62)))))

(assert (=> d!74237 (= (bitIndex!0 (size!4718 (buf!5265 bs!62)) (currentByte!9886 bs!62) (currentBit!9881 bs!62)) lt!348272)))

(declare-fun b!220423 () Bool)

(declare-fun res!185680 () Bool)

(assert (=> b!220423 (=> (not res!185680) (not e!149690))))

(assert (=> b!220423 (= res!185680 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348272))))

(declare-fun b!220424 () Bool)

(declare-fun lt!348273 () (_ BitVec 64))

(assert (=> b!220424 (= e!149690 (bvsle lt!348272 (bvmul lt!348273 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!220424 (or (= lt!348273 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!348273 #b0000000000000000000000000000000000000000000000000000000000001000) lt!348273)))))

(assert (=> b!220424 (= lt!348273 ((_ sign_extend 32) (size!4718 (buf!5265 bs!62))))))

(assert (= (and d!74237 res!185679) b!220423))

(assert (= (and b!220423 res!185680) b!220424))

(assert (=> d!74237 m!339123))

(assert (=> d!74237 m!339121))

(assert (=> d!74191 d!74237))

(declare-fun d!74239 () Bool)

(declare-fun lt!348326 () (_ BitVec 32))

(assert (=> d!74239 (= lt!348326 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!348324 () (_ BitVec 32))

(assert (=> d!74239 (= lt!348324 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!149705 () Bool)

(assert (=> d!74239 e!149705))

(declare-fun res!185692 () Bool)

(assert (=> d!74239 (=> (not res!185692) (not e!149705))))

(assert (=> d!74239 (= res!185692 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!15589 () Unit!15585)

(declare-fun Unit!15590 () Unit!15585)

(declare-fun Unit!15591 () Unit!15585)

(assert (=> d!74239 (= (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!9881 bs!62) lt!348326) #b00000000000000000000000000000000) (tuple2!18853 Unit!15589 (BitStream!8545 (buf!5265 bs!62) (bvsub (bvadd (currentByte!9886 bs!62) lt!348324) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!348326 (currentBit!9881 bs!62)))) (ite (bvsge (bvadd (currentBit!9881 bs!62) lt!348326) #b00000000000000000000000000001000) (tuple2!18853 Unit!15590 (BitStream!8545 (buf!5265 bs!62) (bvadd (currentByte!9886 bs!62) lt!348324 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9881 bs!62) lt!348326) #b00000000000000000000000000001000))) (tuple2!18853 Unit!15591 (BitStream!8545 (buf!5265 bs!62) (bvadd (currentByte!9886 bs!62) lt!348324) (bvadd (currentBit!9881 bs!62) lt!348326))))))))

(declare-fun b!220436 () Bool)

(declare-fun e!149704 () Bool)

(assert (=> b!220436 (= e!149705 e!149704)))

(declare-fun res!185693 () Bool)

(assert (=> b!220436 (=> (not res!185693) (not e!149704))))

(declare-fun lt!348321 () (_ BitVec 64))

(declare-fun lt!348323 () tuple2!18852)

(assert (=> b!220436 (= res!185693 (= (bvadd lt!348321 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4718 (buf!5265 (_2!10084 lt!348323))) (currentByte!9886 (_2!10084 lt!348323)) (currentBit!9881 (_2!10084 lt!348323)))))))

(assert (=> b!220436 (or (not (= (bvand lt!348321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348321 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220436 (= lt!348321 (bitIndex!0 (size!4718 (buf!5265 bs!62)) (currentByte!9886 bs!62) (currentBit!9881 bs!62)))))

(declare-fun lt!348325 () (_ BitVec 32))

(declare-fun lt!348322 () (_ BitVec 32))

(declare-fun Unit!15592 () Unit!15585)

(declare-fun Unit!15593 () Unit!15585)

(declare-fun Unit!15594 () Unit!15585)

(assert (=> b!220436 (= lt!348323 (ite (bvslt (bvadd (currentBit!9881 bs!62) lt!348322) #b00000000000000000000000000000000) (tuple2!18853 Unit!15592 (BitStream!8545 (buf!5265 bs!62) (bvsub (bvadd (currentByte!9886 bs!62) lt!348325) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!348322 (currentBit!9881 bs!62)))) (ite (bvsge (bvadd (currentBit!9881 bs!62) lt!348322) #b00000000000000000000000000001000) (tuple2!18853 Unit!15593 (BitStream!8545 (buf!5265 bs!62) (bvadd (currentByte!9886 bs!62) lt!348325 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9881 bs!62) lt!348322) #b00000000000000000000000000001000))) (tuple2!18853 Unit!15594 (BitStream!8545 (buf!5265 bs!62) (bvadd (currentByte!9886 bs!62) lt!348325) (bvadd (currentBit!9881 bs!62) lt!348322))))))))

(assert (=> b!220436 (= lt!348322 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!220436 (= lt!348325 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!220437 () Bool)

(assert (=> b!220437 (= e!149704 (and (= (size!4718 (buf!5265 bs!62)) (size!4718 (buf!5265 (_2!10084 lt!348323)))) (= (buf!5265 bs!62) (buf!5265 (_2!10084 lt!348323)))))))

(assert (= (and d!74239 res!185692) b!220436))

(assert (= (and b!220436 res!185693) b!220437))

(assert (=> d!74239 m!339111))

(declare-fun m!339175 () Bool)

(assert (=> b!220436 m!339175))

(assert (=> b!220436 m!339107))

(assert (=> d!74191 d!74239))

(declare-fun d!74249 () Bool)

(declare-fun res!185700 () Bool)

(declare-fun e!149710 () Bool)

(assert (=> d!74249 (=> (not res!185700) (not e!149710))))

(assert (=> d!74249 (= res!185700 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4718 (buf!5265 bs!62)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4718 (buf!5265 bs!62)))))))))

(assert (=> d!74249 (= (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) e!149710)))

(declare-fun b!220445 () Bool)

(declare-fun lt!348341 () (_ BitVec 64))

(assert (=> b!220445 (= e!149710 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348341) (bvsle lt!348341 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4718 (buf!5265 bs!62)))))))))

(assert (=> b!220445 (= lt!348341 (bvadd (bitIndex!0 (size!4718 (buf!5265 bs!62)) (currentByte!9886 bs!62) (currentBit!9881 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!74249 res!185700) b!220445))

(assert (=> b!220445 m!339107))

(assert (=> d!74191 d!74249))

(check-sat (not b!220412) (not d!74237) (not b!220409) (not d!74233) (not b!220445) (not b!220436) (not b!220416) (not b!220413) (not b!220407) (not b!220410) (not d!74235) (not d!74239))
(check-sat)
