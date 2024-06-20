; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45420 () Bool)

(assert start!45420)

(declare-fun b!220163 () Bool)

(declare-fun res!185468 () Bool)

(declare-fun e!149522 () Bool)

(assert (=> b!220163 (=> (not res!185468) (not e!149522))))

(declare-fun acc!113 () (_ BitVec 64))

(assert (=> b!220163 (= res!185468 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220164 () Bool)

(declare-fun res!185471 () Bool)

(assert (=> b!220164 (=> (not res!185471) (not e!149522))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220164 (= res!185471 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220165 () Bool)

(declare-fun e!149521 () Bool)

(declare-datatypes ((array!10728 0))(
  ( (array!10729 (arr!5642 (Array (_ BitVec 32) (_ BitVec 8))) (size!4712 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8532 0))(
  ( (BitStream!8533 (buf!5259 array!10728) (currentByte!9868 (_ BitVec 32)) (currentBit!9863 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8532)

(declare-fun array_inv!4453 (array!10728) Bool)

(assert (=> b!220165 (= e!149521 (array_inv!4453 (buf!5259 bs!62)))))

(declare-fun b!220166 () Bool)

(declare-fun res!185469 () Bool)

(assert (=> b!220166 (=> (not res!185469) (not e!149522))))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220166 (= res!185469 (validate_offset_bits!1 ((_ sign_extend 32) (size!4712 (buf!5259 bs!62))) ((_ sign_extend 32) (currentByte!9868 bs!62)) ((_ sign_extend 32) (currentBit!9863 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun res!185470 () Bool)

(assert (=> start!45420 (=> (not res!185470) (not e!149522))))

(assert (=> start!45420 (= res!185470 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45420 e!149522))

(assert (=> start!45420 true))

(declare-fun inv!12 (BitStream!8532) Bool)

(assert (=> start!45420 (and (inv!12 bs!62) e!149521)))

(declare-fun b!220167 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!8532 (_ BitVec 64)) Bool)

(assert (=> b!220167 (= e!149522 (not (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((tuple2!18798 0))(
  ( (tuple2!18799 (_1!10057 BitStream!8532) (_2!10057 Bool)) )
))
(declare-fun lt!347918 () tuple2!18798)

(declare-fun readBitPure!0 (BitStream!8532) tuple2!18798)

(assert (=> b!220167 (= lt!347918 (readBitPure!0 bs!62))))

(declare-datatypes ((tuple2!18800 0))(
  ( (tuple2!18801 (_1!10058 BitStream!8532) (_2!10058 (_ BitVec 64))) )
))
(declare-fun lt!347917 () tuple2!18800)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18800)

(assert (=> b!220167 (= lt!347917 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(assert (= (and start!45420 res!185470) b!220166))

(assert (= (and b!220166 res!185469) b!220164))

(assert (= (and b!220164 res!185471) b!220163))

(assert (= (and b!220163 res!185468) b!220167))

(assert (= start!45420 b!220165))

(declare-fun m!338883 () Bool)

(assert (=> b!220166 m!338883))

(declare-fun m!338885 () Bool)

(assert (=> b!220164 m!338885))

(declare-fun m!338887 () Bool)

(assert (=> b!220167 m!338887))

(declare-fun m!338889 () Bool)

(assert (=> b!220167 m!338889))

(declare-fun m!338891 () Bool)

(assert (=> b!220167 m!338891))

(declare-fun m!338893 () Bool)

(assert (=> start!45420 m!338893))

(declare-fun m!338895 () Bool)

(assert (=> b!220165 m!338895))

(check-sat (not b!220164) (not b!220166) (not b!220165) (not b!220167) (not start!45420))
(check-sat)
(get-model)

(declare-fun d!74115 () Bool)

(assert (=> d!74115 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220164 d!74115))

(declare-fun d!74119 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74119 (= (inv!12 bs!62) (invariant!0 (currentBit!9863 bs!62) (currentByte!9868 bs!62) (size!4712 (buf!5259 bs!62))))))

(declare-fun bs!18127 () Bool)

(assert (= bs!18127 d!74119))

(declare-fun m!338925 () Bool)

(assert (=> bs!18127 m!338925))

(assert (=> start!45420 d!74119))

(declare-fun d!74125 () Bool)

(declare-fun res!185492 () Bool)

(declare-fun e!149541 () Bool)

(assert (=> d!74125 (=> (not res!185492) (not e!149541))))

(assert (=> d!74125 (= res!185492 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4712 (buf!5259 bs!62)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4712 (buf!5259 bs!62)))))))))

(assert (=> d!74125 (= (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) e!149541)))

(declare-fun b!220194 () Bool)

(declare-fun lt!347945 () (_ BitVec 64))

(assert (=> b!220194 (= e!149541 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!347945) (bvsle lt!347945 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4712 (buf!5259 bs!62)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220194 (= lt!347945 (bvadd (bitIndex!0 (size!4712 (buf!5259 bs!62)) (currentByte!9868 bs!62) (currentBit!9863 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!74125 res!185492) b!220194))

(declare-fun m!338931 () Bool)

(assert (=> b!220194 m!338931))

(assert (=> b!220167 d!74125))

(declare-fun d!74133 () Bool)

(declare-datatypes ((tuple2!18814 0))(
  ( (tuple2!18815 (_1!10065 Bool) (_2!10065 BitStream!8532)) )
))
(declare-fun lt!347948 () tuple2!18814)

(declare-fun readBit!0 (BitStream!8532) tuple2!18814)

(assert (=> d!74133 (= lt!347948 (readBit!0 bs!62))))

(assert (=> d!74133 (= (readBitPure!0 bs!62) (tuple2!18799 (_2!10065 lt!347948) (_1!10065 lt!347948)))))

(declare-fun bs!18131 () Bool)

(assert (= bs!18131 d!74133))

(declare-fun m!338935 () Bool)

(assert (=> bs!18131 m!338935))

(assert (=> b!220167 d!74133))

(declare-datatypes ((tuple2!18816 0))(
  ( (tuple2!18817 (_1!10066 (_ BitVec 64)) (_2!10066 BitStream!8532)) )
))
(declare-fun lt!347951 () tuple2!18816)

(declare-fun d!74137 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18816)

(assert (=> d!74137 (= lt!347951 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74137 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18801 (_2!10066 lt!347951) (_1!10066 lt!347951)))))

(declare-fun bs!18132 () Bool)

(assert (= bs!18132 d!74137))

(declare-fun m!338937 () Bool)

(assert (=> bs!18132 m!338937))

(assert (=> b!220167 d!74137))

(declare-fun d!74139 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74139 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4712 (buf!5259 bs!62))) ((_ sign_extend 32) (currentByte!9868 bs!62)) ((_ sign_extend 32) (currentBit!9863 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4712 (buf!5259 bs!62))) ((_ sign_extend 32) (currentByte!9868 bs!62)) ((_ sign_extend 32) (currentBit!9863 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18133 () Bool)

(assert (= bs!18133 d!74139))

(declare-fun m!338939 () Bool)

(assert (=> bs!18133 m!338939))

(assert (=> b!220166 d!74139))

(declare-fun d!74141 () Bool)

(assert (=> d!74141 (= (array_inv!4453 (buf!5259 bs!62)) (bvsge (size!4712 (buf!5259 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220165 d!74141))

(check-sat (not d!74119) (not d!74137) (not b!220194) (not d!74133) (not d!74139))
(check-sat)
(get-model)

(declare-fun d!74149 () Bool)

(declare-fun e!149547 () Bool)

(assert (=> d!74149 e!149547))

(declare-fun res!185503 () Bool)

(assert (=> d!74149 (=> (not res!185503) (not e!149547))))

(declare-fun lt!347987 () (_ BitVec 64))

(declare-fun lt!347985 () (_ BitVec 64))

(declare-fun lt!347986 () (_ BitVec 64))

(assert (=> d!74149 (= res!185503 (= lt!347985 (bvsub lt!347986 lt!347987)))))

(assert (=> d!74149 (or (= (bvand lt!347986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!347987 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!347986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!347986 lt!347987) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74149 (= lt!347987 (remainingBits!0 ((_ sign_extend 32) (size!4712 (buf!5259 bs!62))) ((_ sign_extend 32) (currentByte!9868 bs!62)) ((_ sign_extend 32) (currentBit!9863 bs!62))))))

(declare-fun lt!347982 () (_ BitVec 64))

(declare-fun lt!347983 () (_ BitVec 64))

(assert (=> d!74149 (= lt!347986 (bvmul lt!347982 lt!347983))))

(assert (=> d!74149 (or (= lt!347982 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!347983 (bvsdiv (bvmul lt!347982 lt!347983) lt!347982)))))

(assert (=> d!74149 (= lt!347983 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74149 (= lt!347982 ((_ sign_extend 32) (size!4712 (buf!5259 bs!62))))))

(assert (=> d!74149 (= lt!347985 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9868 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9863 bs!62))))))

(assert (=> d!74149 (invariant!0 (currentBit!9863 bs!62) (currentByte!9868 bs!62) (size!4712 (buf!5259 bs!62)))))

(assert (=> d!74149 (= (bitIndex!0 (size!4712 (buf!5259 bs!62)) (currentByte!9868 bs!62) (currentBit!9863 bs!62)) lt!347985)))

(declare-fun b!220205 () Bool)

(declare-fun res!185504 () Bool)

(assert (=> b!220205 (=> (not res!185504) (not e!149547))))

(assert (=> b!220205 (= res!185504 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!347985))))

(declare-fun b!220206 () Bool)

(declare-fun lt!347984 () (_ BitVec 64))

(assert (=> b!220206 (= e!149547 (bvsle lt!347985 (bvmul lt!347984 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!220206 (or (= lt!347984 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!347984 #b0000000000000000000000000000000000000000000000000000000000001000) lt!347984)))))

(assert (=> b!220206 (= lt!347984 ((_ sign_extend 32) (size!4712 (buf!5259 bs!62))))))

(assert (= (and d!74149 res!185503) b!220205))

(assert (= (and b!220205 res!185504) b!220206))

(assert (=> d!74149 m!338939))

(assert (=> d!74149 m!338925))

(assert (=> b!220194 d!74149))

(declare-fun b!220252 () Bool)

(declare-fun e!149578 () tuple2!18816)

(assert (=> b!220252 (= e!149578 (tuple2!18817 acc!113 bs!62))))

(declare-fun b!220253 () Bool)

(declare-fun e!149579 () Bool)

(declare-fun lt!348054 () (_ BitVec 64))

(declare-fun lt!348055 () tuple2!18816)

(assert (=> b!220253 (= e!149579 (= (= (bvand (bvlshr (_1!10066 lt!348055) lt!348054) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10057 (readBitPure!0 bs!62))))))

(assert (=> b!220253 (and (bvsge lt!348054 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!348054 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!220253 (= lt!348054 ((_ sign_extend 32) i!541))))

(declare-fun b!220254 () Bool)

(declare-fun res!185541 () Bool)

(declare-fun e!149580 () Bool)

(assert (=> b!220254 (=> (not res!185541) (not e!149580))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220254 (= res!185541 (= (bvand (_1!10066 lt!348055) (onesLSBLong!0 nBits!265)) (_1!10066 lt!348055)))))

(declare-fun d!74157 () Bool)

(assert (=> d!74157 e!149580))

(declare-fun res!185542 () Bool)

(assert (=> d!74157 (=> (not res!185542) (not e!149580))))

(assert (=> d!74157 (= res!185542 (= (buf!5259 (_2!10066 lt!348055)) (buf!5259 bs!62)))))

(assert (=> d!74157 (= lt!348055 e!149578)))

(declare-fun c!10664 () Bool)

(assert (=> d!74157 (= c!10664 (= nBits!265 i!541))))

(assert (=> d!74157 (and (bvsle #b00000000000000000000000000000000 i!541) (bvsle i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74157 (= (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113) lt!348055)))

(declare-fun b!220255 () Bool)

(declare-fun res!185544 () Bool)

(assert (=> b!220255 (=> (not res!185544) (not e!149580))))

(declare-fun lt!348059 () (_ BitVec 64))

(declare-fun lt!348058 () (_ BitVec 64))

(assert (=> b!220255 (= res!185544 (= (bitIndex!0 (size!4712 (buf!5259 (_2!10066 lt!348055))) (currentByte!9868 (_2!10066 lt!348055)) (currentBit!9863 (_2!10066 lt!348055))) (bvadd lt!348058 lt!348059)))))

(assert (=> b!220255 (or (not (= (bvand lt!348058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348059 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348058 lt!348059) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220255 (= lt!348059 ((_ sign_extend 32) (bvsub nBits!265 i!541)))))

(assert (=> b!220255 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand i!541 #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 i!541) #b10000000000000000000000000000000)))))

(assert (=> b!220255 (= lt!348058 (bitIndex!0 (size!4712 (buf!5259 bs!62)) (currentByte!9868 bs!62) (currentBit!9863 bs!62)))))

(declare-fun b!220256 () Bool)

(assert (=> b!220256 (= e!149580 e!149579)))

(declare-fun res!185540 () Bool)

(assert (=> b!220256 (=> res!185540 e!149579)))

(assert (=> b!220256 (= res!185540 (not (bvslt i!541 nBits!265)))))

(declare-fun b!220257 () Bool)

(declare-fun lt!348056 () tuple2!18816)

(assert (=> b!220257 (= e!149578 (tuple2!18817 (_1!10066 lt!348056) (_2!10066 lt!348056)))))

(declare-fun lt!348057 () tuple2!18814)

(assert (=> b!220257 (= lt!348057 (readBit!0 bs!62))))

(assert (=> b!220257 (= lt!348056 (readNBitsLSBFirstsLoop!0 (_2!10065 lt!348057) nBits!265 (bvadd i!541 #b00000000000000000000000000000001) (bvor acc!113 (ite (_1!10065 lt!348057) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220258 () Bool)

(declare-fun res!185543 () Bool)

(assert (=> b!220258 (=> (not res!185543) (not e!149580))))

(assert (=> b!220258 (= res!185543 (= (bvand (_1!10066 lt!348055) (onesLSBLong!0 i!541)) (bvand acc!113 (onesLSBLong!0 i!541))))))

(assert (= (and d!74157 c!10664) b!220252))

(assert (= (and d!74157 (not c!10664)) b!220257))

(assert (= (and d!74157 res!185542) b!220255))

(assert (= (and b!220255 res!185544) b!220258))

(assert (= (and b!220258 res!185543) b!220254))

(assert (= (and b!220254 res!185541) b!220256))

(assert (= (and b!220256 (not res!185540)) b!220253))

(declare-fun m!338949 () Bool)

(assert (=> b!220258 m!338949))

(declare-fun m!338951 () Bool)

(assert (=> b!220255 m!338951))

(assert (=> b!220255 m!338931))

(assert (=> b!220253 m!338889))

(declare-fun m!338953 () Bool)

(assert (=> b!220254 m!338953))

(assert (=> b!220257 m!338935))

(declare-fun m!338955 () Bool)

(assert (=> b!220257 m!338955))

(assert (=> d!74137 d!74157))

(declare-fun d!74163 () Bool)

(declare-fun e!149589 () Bool)

(assert (=> d!74163 e!149589))

(declare-fun res!185549 () Bool)

(assert (=> d!74163 (=> (not res!185549) (not e!149589))))

(declare-datatypes ((Unit!15579 0))(
  ( (Unit!15580) )
))
(declare-datatypes ((tuple2!18820 0))(
  ( (tuple2!18821 (_1!10068 Unit!15579) (_2!10068 BitStream!8532)) )
))
(declare-fun increaseBitIndex!0 (BitStream!8532) tuple2!18820)

(assert (=> d!74163 (= res!185549 (= (buf!5259 (_2!10068 (increaseBitIndex!0 bs!62))) (buf!5259 bs!62)))))

(declare-fun lt!348104 () Bool)

(assert (=> d!74163 (= lt!348104 (not (= (bvand ((_ sign_extend 24) (select (arr!5642 (buf!5259 bs!62)) (currentByte!9868 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9863 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348103 () tuple2!18814)

(assert (=> d!74163 (= lt!348103 (tuple2!18815 (not (= (bvand ((_ sign_extend 24) (select (arr!5642 (buf!5259 bs!62)) (currentByte!9868 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9863 bs!62)))) #b00000000000000000000000000000000)) (_2!10068 (increaseBitIndex!0 bs!62))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!74163 (validate_offset_bit!0 ((_ sign_extend 32) (size!4712 (buf!5259 bs!62))) ((_ sign_extend 32) (currentByte!9868 bs!62)) ((_ sign_extend 32) (currentBit!9863 bs!62)))))

(assert (=> d!74163 (= (readBit!0 bs!62) lt!348103)))

(declare-fun b!220263 () Bool)

(declare-fun lt!348098 () (_ BitVec 64))

(declare-fun lt!348100 () (_ BitVec 64))

(assert (=> b!220263 (= e!149589 (= (bitIndex!0 (size!4712 (buf!5259 (_2!10068 (increaseBitIndex!0 bs!62)))) (currentByte!9868 (_2!10068 (increaseBitIndex!0 bs!62))) (currentBit!9863 (_2!10068 (increaseBitIndex!0 bs!62)))) (bvadd lt!348098 lt!348100)))))

(assert (=> b!220263 (or (not (= (bvand lt!348098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348100 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348098 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348098 lt!348100) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220263 (= lt!348100 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!220263 (= lt!348098 (bitIndex!0 (size!4712 (buf!5259 bs!62)) (currentByte!9868 bs!62) (currentBit!9863 bs!62)))))

(declare-fun lt!348102 () Bool)

(assert (=> b!220263 (= lt!348102 (not (= (bvand ((_ sign_extend 24) (select (arr!5642 (buf!5259 bs!62)) (currentByte!9868 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9863 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348099 () Bool)

(assert (=> b!220263 (= lt!348099 (not (= (bvand ((_ sign_extend 24) (select (arr!5642 (buf!5259 bs!62)) (currentByte!9868 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9863 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348101 () Bool)

(assert (=> b!220263 (= lt!348101 (not (= (bvand ((_ sign_extend 24) (select (arr!5642 (buf!5259 bs!62)) (currentByte!9868 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9863 bs!62)))) #b00000000000000000000000000000000)))))

(assert (= (and d!74163 res!185549) b!220263))

(declare-fun m!338977 () Bool)

(assert (=> d!74163 m!338977))

(declare-fun m!338979 () Bool)

(assert (=> d!74163 m!338979))

(declare-fun m!338981 () Bool)

(assert (=> d!74163 m!338981))

(declare-fun m!338983 () Bool)

(assert (=> d!74163 m!338983))

(assert (=> b!220263 m!338979))

(assert (=> b!220263 m!338931))

(assert (=> b!220263 m!338977))

(assert (=> b!220263 m!338981))

(declare-fun m!338985 () Bool)

(assert (=> b!220263 m!338985))

(assert (=> d!74133 d!74163))

(declare-fun d!74169 () Bool)

(assert (=> d!74169 (= (invariant!0 (currentBit!9863 bs!62) (currentByte!9868 bs!62) (size!4712 (buf!5259 bs!62))) (and (bvsge (currentBit!9863 bs!62) #b00000000000000000000000000000000) (bvslt (currentBit!9863 bs!62) #b00000000000000000000000000001000) (bvsge (currentByte!9868 bs!62) #b00000000000000000000000000000000) (or (bvslt (currentByte!9868 bs!62) (size!4712 (buf!5259 bs!62))) (and (= (currentBit!9863 bs!62) #b00000000000000000000000000000000) (= (currentByte!9868 bs!62) (size!4712 (buf!5259 bs!62)))))))))

(assert (=> d!74119 d!74169))

(declare-fun d!74171 () Bool)

(assert (=> d!74171 (= (remainingBits!0 ((_ sign_extend 32) (size!4712 (buf!5259 bs!62))) ((_ sign_extend 32) (currentByte!9868 bs!62)) ((_ sign_extend 32) (currentBit!9863 bs!62))) (bvsub (bvmul ((_ sign_extend 32) (size!4712 (buf!5259 bs!62))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9868 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9863 bs!62)))))))

(assert (=> d!74139 d!74171))

(check-sat (not b!220263) (not b!220254) (not d!74163) (not b!220258) (not b!220257) (not b!220253) (not d!74149) (not b!220255))
(check-sat)
