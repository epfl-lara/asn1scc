; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45418 () Bool)

(assert start!45418)

(declare-fun b!220148 () Bool)

(declare-fun e!149512 () Bool)

(declare-datatypes ((array!10726 0))(
  ( (array!10727 (arr!5641 (Array (_ BitVec 32) (_ BitVec 8))) (size!4711 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8530 0))(
  ( (BitStream!8531 (buf!5258 array!10726) (currentByte!9867 (_ BitVec 32)) (currentBit!9862 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8530)

(declare-fun moveBitIndexPrecond!0 (BitStream!8530 (_ BitVec 64)) Bool)

(assert (=> b!220148 (= e!149512 (not (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((tuple2!18794 0))(
  ( (tuple2!18795 (_1!10055 BitStream!8530) (_2!10055 Bool)) )
))
(declare-fun lt!347911 () tuple2!18794)

(declare-fun readBitPure!0 (BitStream!8530) tuple2!18794)

(assert (=> b!220148 (= lt!347911 (readBitPure!0 bs!62))))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-datatypes ((tuple2!18796 0))(
  ( (tuple2!18797 (_1!10056 BitStream!8530) (_2!10056 (_ BitVec 64))) )
))
(declare-fun lt!347912 () tuple2!18796)

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18796)

(assert (=> b!220148 (= lt!347912 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220149 () Bool)

(declare-fun e!149513 () Bool)

(declare-fun array_inv!4452 (array!10726) Bool)

(assert (=> b!220149 (= e!149513 (array_inv!4452 (buf!5258 bs!62)))))

(declare-fun b!220150 () Bool)

(declare-fun res!185459 () Bool)

(assert (=> b!220150 (=> (not res!185459) (not e!149512))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220150 (= res!185459 (validate_offset_bits!1 ((_ sign_extend 32) (size!4711 (buf!5258 bs!62))) ((_ sign_extend 32) (currentByte!9867 bs!62)) ((_ sign_extend 32) (currentBit!9862 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220151 () Bool)

(declare-fun res!185457 () Bool)

(assert (=> b!220151 (=> (not res!185457) (not e!149512))))

(assert (=> b!220151 (= res!185457 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220152 () Bool)

(declare-fun res!185456 () Bool)

(assert (=> b!220152 (=> (not res!185456) (not e!149512))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220152 (= res!185456 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!185458 () Bool)

(assert (=> start!45418 (=> (not res!185458) (not e!149512))))

(assert (=> start!45418 (= res!185458 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45418 e!149512))

(assert (=> start!45418 true))

(declare-fun inv!12 (BitStream!8530) Bool)

(assert (=> start!45418 (and (inv!12 bs!62) e!149513)))

(assert (= (and start!45418 res!185458) b!220150))

(assert (= (and b!220150 res!185459) b!220152))

(assert (= (and b!220152 res!185456) b!220151))

(assert (= (and b!220151 res!185457) b!220148))

(assert (= start!45418 b!220149))

(declare-fun m!338869 () Bool)

(assert (=> b!220149 m!338869))

(declare-fun m!338871 () Bool)

(assert (=> b!220152 m!338871))

(declare-fun m!338873 () Bool)

(assert (=> start!45418 m!338873))

(declare-fun m!338875 () Bool)

(assert (=> b!220150 m!338875))

(declare-fun m!338877 () Bool)

(assert (=> b!220148 m!338877))

(declare-fun m!338879 () Bool)

(assert (=> b!220148 m!338879))

(declare-fun m!338881 () Bool)

(assert (=> b!220148 m!338881))

(push 1)

(assert (not b!220148))

(assert (not b!220152))

(assert (not b!220149))

(assert (not b!220150))

(assert (not start!45418))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74101 () Bool)

(assert (=> d!74101 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220152 d!74101))

(declare-fun d!74103 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74103 (= (inv!12 bs!62) (invariant!0 (currentBit!9862 bs!62) (currentByte!9867 bs!62) (size!4711 (buf!5258 bs!62))))))

(declare-fun bs!18122 () Bool)

(assert (= bs!18122 d!74103))

(declare-fun m!338911 () Bool)

(assert (=> bs!18122 m!338911))

(assert (=> start!45418 d!74103))

(declare-fun d!74105 () Bool)

(declare-fun res!185486 () Bool)

(declare-fun e!149535 () Bool)

(assert (=> d!74105 (=> (not res!185486) (not e!149535))))

(assert (=> d!74105 (= res!185486 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4711 (buf!5258 bs!62)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4711 (buf!5258 bs!62)))))))))

(assert (=> d!74105 (= (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) e!149535)))

(declare-fun b!220186 () Bool)

(declare-fun lt!347927 () (_ BitVec 64))

(assert (=> b!220186 (= e!149535 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!347927) (bvsle lt!347927 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4711 (buf!5258 bs!62)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220186 (= lt!347927 (bvadd (bitIndex!0 (size!4711 (buf!5258 bs!62)) (currentByte!9867 bs!62) (currentBit!9862 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!74105 res!185486) b!220186))

(declare-fun m!338915 () Bool)

(assert (=> b!220186 m!338915))

(assert (=> b!220148 d!74105))

(declare-fun d!74111 () Bool)

(declare-datatypes ((tuple2!18806 0))(
  ( (tuple2!18807 (_1!10061 Bool) (_2!10061 BitStream!8530)) )
))
(declare-fun lt!347930 () tuple2!18806)

(declare-fun readBit!0 (BitStream!8530) tuple2!18806)

(assert (=> d!74111 (= lt!347930 (readBit!0 bs!62))))

(assert (=> d!74111 (= (readBitPure!0 bs!62) (tuple2!18795 (_2!10061 lt!347930) (_1!10061 lt!347930)))))

(declare-fun bs!18124 () Bool)

(assert (= bs!18124 d!74111))

(declare-fun m!338917 () Bool)

(assert (=> bs!18124 m!338917))

(assert (=> b!220148 d!74111))

(declare-fun d!74113 () Bool)

(declare-datatypes ((tuple2!18808 0))(
  ( (tuple2!18809 (_1!10062 (_ BitVec 64)) (_2!10062 BitStream!8530)) )
))
(declare-fun lt!347935 () tuple2!18808)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18808)

(assert (=> d!74113 (= lt!347935 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74113 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18797 (_2!10062 lt!347935) (_1!10062 lt!347935)))))

(declare-fun bs!18125 () Bool)

(assert (= bs!18125 d!74113))

(declare-fun m!338919 () Bool)

(assert (=> bs!18125 m!338919))

(assert (=> b!220148 d!74113))

(declare-fun d!74117 () Bool)

(assert (=> d!74117 (= (array_inv!4452 (buf!5258 bs!62)) (bvsge (size!4711 (buf!5258 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220149 d!74117))

(declare-fun d!74121 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74121 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4711 (buf!5258 bs!62))) ((_ sign_extend 32) (currentByte!9867 bs!62)) ((_ sign_extend 32) (currentBit!9862 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4711 (buf!5258 bs!62))) ((_ sign_extend 32) (currentByte!9867 bs!62)) ((_ sign_extend 32) (currentBit!9862 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18126 () Bool)

(assert (= bs!18126 d!74121))

(declare-fun m!338923 () Bool)

(assert (=> bs!18126 m!338923))

(assert (=> b!220150 d!74121))

(push 1)

(assert (not b!220186))

(assert (not d!74121))

(assert (not d!74103))

(assert (not d!74111))

(assert (not d!74113))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74143 () Bool)

(assert (=> d!74143 (= (invariant!0 (currentBit!9862 bs!62) (currentByte!9867 bs!62) (size!4711 (buf!5258 bs!62))) (and (bvsge (currentBit!9862 bs!62) #b00000000000000000000000000000000) (bvslt (currentBit!9862 bs!62) #b00000000000000000000000000001000) (bvsge (currentByte!9867 bs!62) #b00000000000000000000000000000000) (or (bvslt (currentByte!9867 bs!62) (size!4711 (buf!5258 bs!62))) (and (= (currentBit!9862 bs!62) #b00000000000000000000000000000000) (= (currentByte!9867 bs!62) (size!4711 (buf!5258 bs!62)))))))))

(assert (=> d!74103 d!74143))

(declare-fun d!74145 () Bool)

(declare-fun e!149544 () Bool)

(assert (=> d!74145 e!149544))

(declare-fun res!185497 () Bool)

(assert (=> d!74145 (=> (not res!185497) (not e!149544))))

(declare-fun lt!347966 () (_ BitVec 64))

(declare-fun lt!347964 () (_ BitVec 64))

(declare-fun lt!347969 () (_ BitVec 64))

(assert (=> d!74145 (= res!185497 (= lt!347966 (bvsub lt!347964 lt!347969)))))

(assert (=> d!74145 (or (= (bvand lt!347964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!347969 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!347964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!347964 lt!347969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74145 (= lt!347969 (remainingBits!0 ((_ sign_extend 32) (size!4711 (buf!5258 bs!62))) ((_ sign_extend 32) (currentByte!9867 bs!62)) ((_ sign_extend 32) (currentBit!9862 bs!62))))))

(declare-fun lt!347967 () (_ BitVec 64))

(declare-fun lt!347965 () (_ BitVec 64))

(assert (=> d!74145 (= lt!347964 (bvmul lt!347967 lt!347965))))

(assert (=> d!74145 (or (= lt!347967 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!347965 (bvsdiv (bvmul lt!347967 lt!347965) lt!347967)))))

(assert (=> d!74145 (= lt!347965 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74145 (= lt!347967 ((_ sign_extend 32) (size!4711 (buf!5258 bs!62))))))

(assert (=> d!74145 (= lt!347966 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9867 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9862 bs!62))))))

(assert (=> d!74145 (invariant!0 (currentBit!9862 bs!62) (currentByte!9867 bs!62) (size!4711 (buf!5258 bs!62)))))

(assert (=> d!74145 (= (bitIndex!0 (size!4711 (buf!5258 bs!62)) (currentByte!9867 bs!62) (currentBit!9862 bs!62)) lt!347966)))

(declare-fun b!220199 () Bool)

(declare-fun res!185498 () Bool)

(assert (=> b!220199 (=> (not res!185498) (not e!149544))))

(assert (=> b!220199 (= res!185498 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!347966))))

(declare-fun b!220200 () Bool)

(declare-fun lt!347968 () (_ BitVec 64))

(assert (=> b!220200 (= e!149544 (bvsle lt!347966 (bvmul lt!347968 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!220200 (or (= lt!347968 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!347968 #b0000000000000000000000000000000000000000000000000000000000001000) lt!347968)))))

(assert (=> b!220200 (= lt!347968 ((_ sign_extend 32) (size!4711 (buf!5258 bs!62))))))

(assert (= (and d!74145 res!185497) b!220199))

(assert (= (and b!220199 res!185498) b!220200))

(assert (=> d!74145 m!338923))

(assert (=> d!74145 m!338911))

(assert (=> b!220186 d!74145))

(declare-fun b!220225 () Bool)

(declare-fun res!185522 () Bool)

(declare-fun e!149556 () Bool)

(assert (=> b!220225 (=> (not res!185522) (not e!149556))))

(declare-fun lt!348013 () tuple2!18808)

(declare-fun lt!348014 () (_ BitVec 64))

(declare-fun lt!348015 () (_ BitVec 64))

(assert (=> b!220225 (= res!185522 (= (bitIndex!0 (size!4711 (buf!5258 (_2!10062 lt!348013))) (currentByte!9867 (_2!10062 lt!348013)) (currentBit!9862 (_2!10062 lt!348013))) (bvadd lt!348015 lt!348014)))))

(assert (=> b!220225 (or (not (= (bvand lt!348015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348014 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348015 lt!348014) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220225 (= lt!348014 ((_ sign_extend 32) (bvsub nBits!265 i!541)))))

(assert (=> b!220225 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand i!541 #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 i!541) #b10000000000000000000000000000000)))))

(assert (=> b!220225 (= lt!348015 (bitIndex!0 (size!4711 (buf!5258 bs!62)) (currentByte!9867 bs!62) (currentBit!9862 bs!62)))))

(declare-fun b!220226 () Bool)

(declare-fun e!149557 () tuple2!18808)

(assert (=> b!220226 (= e!149557 (tuple2!18809 acc!113 bs!62))))

(declare-fun b!220227 () Bool)

(declare-fun e!149558 () Bool)

(declare-fun lt!348017 () (_ BitVec 64))

(assert (=> b!220227 (= e!149558 (= (= (bvand (bvlshr (_1!10062 lt!348013) lt!348017) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10055 (readBitPure!0 bs!62))))))

(assert (=> b!220227 (and (bvsge lt!348017 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!348017 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!220227 (= lt!348017 ((_ sign_extend 32) i!541))))

(declare-fun b!220228 () Bool)

(declare-fun res!185520 () Bool)

(assert (=> b!220228 (=> (not res!185520) (not e!149556))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220228 (= res!185520 (= (bvand (_1!10062 lt!348013) (onesLSBLong!0 nBits!265)) (_1!10062 lt!348013)))))

(declare-fun d!74147 () Bool)

(assert (=> d!74147 e!149556))

(declare-fun res!185523 () Bool)

(assert (=> d!74147 (=> (not res!185523) (not e!149556))))

(assert (=> d!74147 (= res!185523 (= (buf!5258 (_2!10062 lt!348013)) (buf!5258 bs!62)))))

(assert (=> d!74147 (= lt!348013 e!149557)))

(declare-fun c!10661 () Bool)

(assert (=> d!74147 (= c!10661 (= nBits!265 i!541))))

(assert (=> d!74147 (and (bvsle #b00000000000000000000000000000000 i!541) (bvsle i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74147 (= (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113) lt!348013)))

(declare-fun b!220229 () Bool)

(declare-fun res!185521 () Bool)

(assert (=> b!220229 (=> (not res!185521) (not e!149556))))

(assert (=> b!220229 (= res!185521 (= (bvand (_1!10062 lt!348013) (onesLSBLong!0 i!541)) (bvand acc!113 (onesLSBLong!0 i!541))))))

(declare-fun b!220230 () Bool)

(declare-fun lt!348016 () tuple2!18808)

(assert (=> b!220230 (= e!149557 (tuple2!18809 (_1!10062 lt!348016) (_2!10062 lt!348016)))))

(declare-fun lt!348012 () tuple2!18806)

(assert (=> b!220230 (= lt!348012 (readBit!0 bs!62))))

(assert (=> b!220230 (= lt!348016 (readNBitsLSBFirstsLoop!0 (_2!10061 lt!348012) nBits!265 (bvadd i!541 #b00000000000000000000000000000001) (bvor acc!113 (ite (_1!10061 lt!348012) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220231 () Bool)

(assert (=> b!220231 (= e!149556 e!149558)))

(declare-fun res!185519 () Bool)

(assert (=> b!220231 (=> res!185519 e!149558)))

(assert (=> b!220231 (= res!185519 (not (bvslt i!541 nBits!265)))))

(assert (= (and d!74147 c!10661) b!220226))

(assert (= (and d!74147 (not c!10661)) b!220230))

(assert (= (and d!74147 res!185523) b!220225))

(assert (= (and b!220225 res!185522) b!220229))

(assert (= (and b!220229 res!185521) b!220228))

(assert (= (and b!220228 res!185520) b!220231))

(assert (= (and b!220231 (not res!185519)) b!220227))

(declare-fun m!338941 () Bool)

(assert (=> b!220228 m!338941))

(declare-fun m!338943 () Bool)

(assert (=> b!220229 m!338943))

(assert (=> b!220230 m!338917))

(declare-fun m!338945 () Bool)

(assert (=> b!220230 m!338945))

(declare-fun m!338947 () Bool)

(assert (=> b!220225 m!338947))

(assert (=> b!220225 m!338915))

(assert (=> b!220227 m!338879))

(assert (=> d!74113 d!74147))

(declare-fun d!74159 () Bool)

(declare-fun e!149582 () Bool)

(assert (=> d!74159 e!149582))

(declare-fun res!185546 () Bool)

(assert (=> d!74159 (=> (not res!185546) (not e!149582))))

(declare-datatypes ((Unit!15577 0))(
  ( (Unit!15578) )
))
(declare-datatypes ((tuple2!18818 0))(
  ( (tuple2!18819 (_1!10067 Unit!15577) (_2!10067 BitStream!8530)) )
))
(declare-fun increaseBitIndex!0 (BitStream!8530) tuple2!18818)

(assert (=> d!74159 (= res!185546 (= (buf!5258 (_2!10067 (increaseBitIndex!0 bs!62))) (buf!5258 bs!62)))))

(declare-fun lt!348080 () Bool)

(assert (=> d!74159 (= lt!348080 (not (= (bvand ((_ sign_extend 24) (select (arr!5641 (buf!5258 bs!62)) (currentByte!9867 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9862 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348079 () tuple2!18806)

(assert (=> d!74159 (= lt!348079 (tuple2!18807 (not (= (bvand ((_ sign_extend 24) (select (arr!5641 (buf!5258 bs!62)) (currentByte!9867 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9862 bs!62)))) #b00000000000000000000000000000000)) (_2!10067 (increaseBitIndex!0 bs!62))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!74159 (validate_offset_bit!0 ((_ sign_extend 32) (size!4711 (buf!5258 bs!62))) ((_ sign_extend 32) (currentByte!9867 bs!62)) ((_ sign_extend 32) (currentBit!9862 bs!62)))))

(assert (=> d!74159 (= (readBit!0 bs!62) lt!348079)))

(declare-fun lt!348077 () (_ BitVec 64))

(declare-fun lt!348081 () (_ BitVec 64))

(declare-fun b!220260 () Bool)

(assert (=> b!220260 (= e!149582 (= (bitIndex!0 (size!4711 (buf!5258 (_2!10067 (increaseBitIndex!0 bs!62)))) (currentByte!9867 (_2!10067 (increaseBitIndex!0 bs!62))) (currentBit!9862 (_2!10067 (increaseBitIndex!0 bs!62)))) (bvadd lt!348077 lt!348081)))))

(assert (=> b!220260 (or (not (= (bvand lt!348077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348081 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348077 lt!348081) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220260 (= lt!348081 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!220260 (= lt!348077 (bitIndex!0 (size!4711 (buf!5258 bs!62)) (currentByte!9867 bs!62) (currentBit!9862 bs!62)))))

(declare-fun lt!348078 () Bool)

(assert (=> b!220260 (= lt!348078 (not (= (bvand ((_ sign_extend 24) (select (arr!5641 (buf!5258 bs!62)) (currentByte!9867 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9862 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348083 () Bool)

(assert (=> b!220260 (= lt!348083 (not (= (bvand ((_ sign_extend 24) (select (arr!5641 (buf!5258 bs!62)) (currentByte!9867 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9862 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348082 () Bool)

(assert (=> b!220260 (= lt!348082 (not (= (bvand ((_ sign_extend 24) (select (arr!5641 (buf!5258 bs!62)) (currentByte!9867 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9862 bs!62)))) #b00000000000000000000000000000000)))))

(assert (= (and d!74159 res!185546) b!220260))

(declare-fun m!338967 () Bool)

(assert (=> d!74159 m!338967))

(declare-fun m!338969 () Bool)

(assert (=> d!74159 m!338969))

(declare-fun m!338971 () Bool)

(assert (=> d!74159 m!338971))

(declare-fun m!338973 () Bool)

(assert (=> d!74159 m!338973))

(assert (=> b!220260 m!338971))

(assert (=> b!220260 m!338915))

(declare-fun m!338975 () Bool)

(assert (=> b!220260 m!338975))

(assert (=> b!220260 m!338969))

(assert (=> b!220260 m!338967))

(assert (=> d!74111 d!74159))

(declare-fun d!74167 () Bool)

(assert (=> d!74167 (= (remainingBits!0 ((_ sign_extend 32) (size!4711 (buf!5258 bs!62))) ((_ sign_extend 32) (currentByte!9867 bs!62)) ((_ sign_extend 32) (currentBit!9862 bs!62))) (bvsub (bvmul ((_ sign_extend 32) (size!4711 (buf!5258 bs!62))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9867 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9862 bs!62)))))))

(assert (=> d!74121 d!74167))

(push 1)

(assert (not d!74159))

(assert (not d!74145))

(assert (not b!220229))

(assert (not b!220227))

(assert (not b!220225))

(assert (not b!220260))

(assert (not b!220228))

(assert (not b!220230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

