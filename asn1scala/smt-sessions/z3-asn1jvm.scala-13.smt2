; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!360 () Bool)

(assert start!360)

(declare-fun b!985 () Bool)

(declare-fun e!577 () Bool)

(declare-datatypes ((array!101 0))(
  ( (array!102 (arr!425 (Array (_ BitVec 32) (_ BitVec 8))) (size!38 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!60 0))(
  ( (BitStream!61 (buf!350 array!101) (currentByte!1275 (_ BitVec 32)) (currentBit!1270 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!56 0))(
  ( (tuple2!57 (_1!28 BitStream!60) (_2!28 Bool)) )
))
(declare-fun lt!535 () tuple2!56)

(declare-fun lt!533 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!985 (= e!577 (= (bitIndex!0 (size!38 (buf!350 (_1!28 lt!535))) (currentByte!1275 (_1!28 lt!535)) (currentBit!1270 (_1!28 lt!535))) lt!533))))

(declare-fun b!986 () Bool)

(declare-fun e!578 () Bool)

(declare-fun thiss!932 () BitStream!60)

(declare-fun array_inv!35 (array!101) Bool)

(assert (=> b!986 (= e!578 (array_inv!35 (buf!350 thiss!932)))))

(declare-fun b!987 () Bool)

(declare-fun res!3059 () Bool)

(declare-fun e!581 () Bool)

(assert (=> b!987 (=> (not res!3059) (not e!581))))

(declare-datatypes ((Unit!21 0))(
  ( (Unit!22) )
))
(declare-datatypes ((tuple2!58 0))(
  ( (tuple2!59 (_1!29 Unit!21) (_2!29 BitStream!60)) )
))
(declare-fun lt!536 () tuple2!58)

(declare-fun isPrefixOf!0 (BitStream!60 BitStream!60) Bool)

(assert (=> b!987 (= res!3059 (isPrefixOf!0 thiss!932 (_2!29 lt!536)))))

(declare-fun b!988 () Bool)

(declare-fun e!575 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!988 (= e!575 (invariant!0 (currentBit!1270 thiss!932) (currentByte!1275 thiss!932) (size!38 (buf!350 (_2!29 lt!536)))))))

(declare-fun b!989 () Bool)

(declare-fun res!3066 () Bool)

(assert (=> b!989 (=> res!3066 e!575)))

(assert (=> b!989 (= res!3066 (not (= (bitIndex!0 (size!38 (buf!350 (_2!29 lt!536))) (currentByte!1275 (_2!29 lt!536)) (currentBit!1270 (_2!29 lt!536))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!38 (buf!350 thiss!932)) (currentByte!1275 thiss!932) (currentBit!1270 thiss!932))))))))

(declare-fun b!990 () Bool)

(assert (=> b!990 (= e!581 e!577)))

(declare-fun res!3063 () Bool)

(assert (=> b!990 (=> (not res!3063) (not e!577))))

(assert (=> b!990 (= res!3063 (and (_2!28 lt!535) (= (_1!28 lt!535) (_2!29 lt!536))))))

(declare-fun readBitPure!0 (BitStream!60) tuple2!56)

(declare-fun readerFrom!0 (BitStream!60 (_ BitVec 32) (_ BitVec 32)) BitStream!60)

(assert (=> b!990 (= lt!535 (readBitPure!0 (readerFrom!0 (_2!29 lt!536) (currentBit!1270 thiss!932) (currentByte!1275 thiss!932))))))

(declare-fun b!992 () Bool)

(declare-fun e!576 () Bool)

(assert (=> b!992 (= e!576 e!581)))

(declare-fun res!3061 () Bool)

(assert (=> b!992 (=> (not res!3061) (not e!581))))

(declare-fun lt!534 () (_ BitVec 64))

(assert (=> b!992 (= res!3061 (= lt!533 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!534)))))

(assert (=> b!992 (= lt!533 (bitIndex!0 (size!38 (buf!350 (_2!29 lt!536))) (currentByte!1275 (_2!29 lt!536)) (currentBit!1270 (_2!29 lt!536))))))

(assert (=> b!992 (= lt!534 (bitIndex!0 (size!38 (buf!350 thiss!932)) (currentByte!1275 thiss!932) (currentBit!1270 thiss!932)))))

(declare-fun b!993 () Bool)

(declare-fun res!3062 () Bool)

(assert (=> b!993 (=> res!3062 e!575)))

(assert (=> b!993 (= res!3062 (not (invariant!0 (currentBit!1270 (_2!29 lt!536)) (currentByte!1275 (_2!29 lt!536)) (size!38 (buf!350 (_2!29 lt!536))))))))

(declare-fun b!994 () Bool)

(declare-fun res!3060 () Bool)

(assert (=> b!994 (=> res!3060 e!575)))

(assert (=> b!994 (= res!3060 (not (isPrefixOf!0 thiss!932 (_2!29 lt!536))))))

(declare-fun b!991 () Bool)

(declare-fun e!579 () Bool)

(assert (=> b!991 (= e!579 (not e!575))))

(declare-fun res!3067 () Bool)

(assert (=> b!991 (=> res!3067 e!575)))

(assert (=> b!991 (= res!3067 (not (= (size!38 (buf!350 (_2!29 lt!536))) (size!38 (buf!350 thiss!932)))))))

(assert (=> b!991 e!576))

(declare-fun res!3064 () Bool)

(assert (=> b!991 (=> (not res!3064) (not e!576))))

(assert (=> b!991 (= res!3064 (= (size!38 (buf!350 thiss!932)) (size!38 (buf!350 (_2!29 lt!536)))))))

(declare-fun appendBit!0 (BitStream!60 Bool) tuple2!58)

(assert (=> b!991 (= lt!536 (appendBit!0 thiss!932 true))))

(declare-fun res!3065 () Bool)

(assert (=> start!360 (=> (not res!3065) (not e!579))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!360 (= res!3065 (validate_offset_bit!0 ((_ sign_extend 32) (size!38 (buf!350 thiss!932))) ((_ sign_extend 32) (currentByte!1275 thiss!932)) ((_ sign_extend 32) (currentBit!1270 thiss!932))))))

(assert (=> start!360 e!579))

(declare-fun inv!12 (BitStream!60) Bool)

(assert (=> start!360 (and (inv!12 thiss!932) e!578)))

(assert (= (and start!360 res!3065) b!991))

(assert (= (and b!991 res!3064) b!992))

(assert (= (and b!992 res!3061) b!987))

(assert (= (and b!987 res!3059) b!990))

(assert (= (and b!990 res!3063) b!985))

(assert (= (and b!991 (not res!3067)) b!989))

(assert (= (and b!989 (not res!3066)) b!994))

(assert (= (and b!994 (not res!3060)) b!993))

(assert (= (and b!993 (not res!3062)) b!988))

(assert (= start!360 b!986))

(declare-fun m!649 () Bool)

(assert (=> start!360 m!649))

(declare-fun m!651 () Bool)

(assert (=> start!360 m!651))

(declare-fun m!653 () Bool)

(assert (=> b!987 m!653))

(declare-fun m!655 () Bool)

(assert (=> b!990 m!655))

(assert (=> b!990 m!655))

(declare-fun m!657 () Bool)

(assert (=> b!990 m!657))

(declare-fun m!659 () Bool)

(assert (=> b!985 m!659))

(declare-fun m!661 () Bool)

(assert (=> b!991 m!661))

(declare-fun m!663 () Bool)

(assert (=> b!989 m!663))

(declare-fun m!665 () Bool)

(assert (=> b!989 m!665))

(declare-fun m!667 () Bool)

(assert (=> b!988 m!667))

(declare-fun m!669 () Bool)

(assert (=> b!986 m!669))

(declare-fun m!671 () Bool)

(assert (=> b!993 m!671))

(assert (=> b!992 m!663))

(assert (=> b!992 m!665))

(assert (=> b!994 m!653))

(check-sat (not b!986) (not b!993) (not b!985) (not b!987) (not b!994) (not b!991) (not b!992) (not start!360) (not b!988) (not b!990) (not b!989))
(check-sat)
(get-model)

(declare-fun d!1046 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1046 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!38 (buf!350 thiss!932))) ((_ sign_extend 32) (currentByte!1275 thiss!932)) ((_ sign_extend 32) (currentBit!1270 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!38 (buf!350 thiss!932))) ((_ sign_extend 32) (currentByte!1275 thiss!932)) ((_ sign_extend 32) (currentBit!1270 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!414 () Bool)

(assert (= bs!414 d!1046))

(declare-fun m!697 () Bool)

(assert (=> bs!414 m!697))

(assert (=> start!360 d!1046))

(declare-fun d!1048 () Bool)

(assert (=> d!1048 (= (inv!12 thiss!932) (invariant!0 (currentBit!1270 thiss!932) (currentByte!1275 thiss!932) (size!38 (buf!350 thiss!932))))))

(declare-fun bs!415 () Bool)

(assert (= bs!415 d!1048))

(declare-fun m!699 () Bool)

(assert (=> bs!415 m!699))

(assert (=> start!360 d!1048))

(declare-fun d!1052 () Bool)

(declare-fun e!611 () Bool)

(assert (=> d!1052 e!611))

(declare-fun res!3109 () Bool)

(assert (=> d!1052 (=> (not res!3109) (not e!611))))

(declare-fun lt!564 () (_ BitVec 64))

(declare-fun lt!561 () (_ BitVec 64))

(declare-fun lt!562 () (_ BitVec 64))

(assert (=> d!1052 (= res!3109 (= lt!564 (bvsub lt!561 lt!562)))))

(assert (=> d!1052 (or (= (bvand lt!561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!562 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!561 lt!562) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1052 (= lt!562 (remainingBits!0 ((_ sign_extend 32) (size!38 (buf!350 (_1!28 lt!535)))) ((_ sign_extend 32) (currentByte!1275 (_1!28 lt!535))) ((_ sign_extend 32) (currentBit!1270 (_1!28 lt!535)))))))

(declare-fun lt!565 () (_ BitVec 64))

(declare-fun lt!563 () (_ BitVec 64))

(assert (=> d!1052 (= lt!561 (bvmul lt!565 lt!563))))

(assert (=> d!1052 (or (= lt!565 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!563 (bvsdiv (bvmul lt!565 lt!563) lt!565)))))

(assert (=> d!1052 (= lt!563 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1052 (= lt!565 ((_ sign_extend 32) (size!38 (buf!350 (_1!28 lt!535)))))))

(assert (=> d!1052 (= lt!564 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1275 (_1!28 lt!535))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1270 (_1!28 lt!535)))))))

(assert (=> d!1052 (invariant!0 (currentBit!1270 (_1!28 lt!535)) (currentByte!1275 (_1!28 lt!535)) (size!38 (buf!350 (_1!28 lt!535))))))

(assert (=> d!1052 (= (bitIndex!0 (size!38 (buf!350 (_1!28 lt!535))) (currentByte!1275 (_1!28 lt!535)) (currentBit!1270 (_1!28 lt!535))) lt!564)))

(declare-fun b!1038 () Bool)

(declare-fun res!3108 () Bool)

(assert (=> b!1038 (=> (not res!3108) (not e!611))))

(assert (=> b!1038 (= res!3108 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!564))))

(declare-fun b!1039 () Bool)

(declare-fun lt!566 () (_ BitVec 64))

(assert (=> b!1039 (= e!611 (bvsle lt!564 (bvmul lt!566 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1039 (or (= lt!566 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!566 #b0000000000000000000000000000000000000000000000000000000000001000) lt!566)))))

(assert (=> b!1039 (= lt!566 ((_ sign_extend 32) (size!38 (buf!350 (_1!28 lt!535)))))))

(assert (= (and d!1052 res!3109) b!1038))

(assert (= (and b!1038 res!3108) b!1039))

(declare-fun m!703 () Bool)

(assert (=> d!1052 m!703))

(declare-fun m!705 () Bool)

(assert (=> d!1052 m!705))

(assert (=> b!985 d!1052))

(declare-fun d!1066 () Bool)

(declare-datatypes ((tuple2!64 0))(
  ( (tuple2!65 (_1!32 Bool) (_2!32 BitStream!60)) )
))
(declare-fun lt!575 () tuple2!64)

(declare-fun readBit!0 (BitStream!60) tuple2!64)

(assert (=> d!1066 (= lt!575 (readBit!0 (readerFrom!0 (_2!29 lt!536) (currentBit!1270 thiss!932) (currentByte!1275 thiss!932))))))

(assert (=> d!1066 (= (readBitPure!0 (readerFrom!0 (_2!29 lt!536) (currentBit!1270 thiss!932) (currentByte!1275 thiss!932))) (tuple2!57 (_2!32 lt!575) (_1!32 lt!575)))))

(declare-fun bs!416 () Bool)

(assert (= bs!416 d!1066))

(assert (=> bs!416 m!655))

(declare-fun m!707 () Bool)

(assert (=> bs!416 m!707))

(assert (=> b!990 d!1066))

(declare-fun d!1068 () Bool)

(declare-fun e!620 () Bool)

(assert (=> d!1068 e!620))

(declare-fun res!3125 () Bool)

(assert (=> d!1068 (=> (not res!3125) (not e!620))))

(assert (=> d!1068 (= res!3125 (invariant!0 (currentBit!1270 (_2!29 lt!536)) (currentByte!1275 (_2!29 lt!536)) (size!38 (buf!350 (_2!29 lt!536)))))))

(assert (=> d!1068 (= (readerFrom!0 (_2!29 lt!536) (currentBit!1270 thiss!932) (currentByte!1275 thiss!932)) (BitStream!61 (buf!350 (_2!29 lt!536)) (currentByte!1275 thiss!932) (currentBit!1270 thiss!932)))))

(declare-fun b!1054 () Bool)

(assert (=> b!1054 (= e!620 (invariant!0 (currentBit!1270 thiss!932) (currentByte!1275 thiss!932) (size!38 (buf!350 (_2!29 lt!536)))))))

(assert (= (and d!1068 res!3125) b!1054))

(assert (=> d!1068 m!671))

(assert (=> b!1054 m!667))

(assert (=> b!990 d!1068))

(declare-fun d!1074 () Bool)

(declare-fun e!640 () Bool)

(assert (=> d!1074 e!640))

(declare-fun res!3158 () Bool)

(assert (=> d!1074 (=> (not res!3158) (not e!640))))

(declare-fun lt!638 () tuple2!58)

(assert (=> d!1074 (= res!3158 (= (size!38 (buf!350 thiss!932)) (size!38 (buf!350 (_2!29 lt!638)))))))

(declare-fun choose!16 (BitStream!60 Bool) tuple2!58)

(assert (=> d!1074 (= lt!638 (choose!16 thiss!932 true))))

(assert (=> d!1074 (validate_offset_bit!0 ((_ sign_extend 32) (size!38 (buf!350 thiss!932))) ((_ sign_extend 32) (currentByte!1275 thiss!932)) ((_ sign_extend 32) (currentBit!1270 thiss!932)))))

(assert (=> d!1074 (= (appendBit!0 thiss!932 true) lt!638)))

(declare-fun b!1085 () Bool)

(declare-fun res!3159 () Bool)

(assert (=> b!1085 (=> (not res!3159) (not e!640))))

(declare-fun lt!639 () (_ BitVec 64))

(declare-fun lt!640 () (_ BitVec 64))

(assert (=> b!1085 (= res!3159 (= (bitIndex!0 (size!38 (buf!350 (_2!29 lt!638))) (currentByte!1275 (_2!29 lt!638)) (currentBit!1270 (_2!29 lt!638))) (bvadd lt!640 lt!639)))))

(assert (=> b!1085 (or (not (= (bvand lt!640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!639 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!640 lt!639) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1085 (= lt!639 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!1085 (= lt!640 (bitIndex!0 (size!38 (buf!350 thiss!932)) (currentByte!1275 thiss!932) (currentBit!1270 thiss!932)))))

(declare-fun b!1086 () Bool)

(declare-fun res!3160 () Bool)

(assert (=> b!1086 (=> (not res!3160) (not e!640))))

(assert (=> b!1086 (= res!3160 (isPrefixOf!0 thiss!932 (_2!29 lt!638)))))

(declare-fun b!1087 () Bool)

(declare-fun e!641 () Bool)

(assert (=> b!1087 (= e!640 e!641)))

(declare-fun res!3157 () Bool)

(assert (=> b!1087 (=> (not res!3157) (not e!641))))

(declare-fun lt!641 () tuple2!56)

(assert (=> b!1087 (= res!3157 (and (= (_2!28 lt!641) true) (= (_1!28 lt!641) (_2!29 lt!638))))))

(assert (=> b!1087 (= lt!641 (readBitPure!0 (readerFrom!0 (_2!29 lt!638) (currentBit!1270 thiss!932) (currentByte!1275 thiss!932))))))

(declare-fun b!1088 () Bool)

(assert (=> b!1088 (= e!641 (= (bitIndex!0 (size!38 (buf!350 (_1!28 lt!641))) (currentByte!1275 (_1!28 lt!641)) (currentBit!1270 (_1!28 lt!641))) (bitIndex!0 (size!38 (buf!350 (_2!29 lt!638))) (currentByte!1275 (_2!29 lt!638)) (currentBit!1270 (_2!29 lt!638)))))))

(assert (= (and d!1074 res!3158) b!1085))

(assert (= (and b!1085 res!3159) b!1086))

(assert (= (and b!1086 res!3160) b!1087))

(assert (= (and b!1087 res!3157) b!1088))

(declare-fun m!731 () Bool)

(assert (=> b!1088 m!731))

(declare-fun m!733 () Bool)

(assert (=> b!1088 m!733))

(assert (=> b!1085 m!733))

(assert (=> b!1085 m!665))

(declare-fun m!735 () Bool)

(assert (=> b!1087 m!735))

(assert (=> b!1087 m!735))

(declare-fun m!737 () Bool)

(assert (=> b!1087 m!737))

(declare-fun m!739 () Bool)

(assert (=> b!1086 m!739))

(declare-fun m!741 () Bool)

(assert (=> d!1074 m!741))

(assert (=> d!1074 m!649))

(assert (=> b!991 d!1074))

(declare-fun d!1104 () Bool)

(assert (=> d!1104 (= (array_inv!35 (buf!350 thiss!932)) (bvsge (size!38 (buf!350 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!986 d!1104))

(declare-fun d!1106 () Bool)

(declare-fun res!3167 () Bool)

(declare-fun e!646 () Bool)

(assert (=> d!1106 (=> (not res!3167) (not e!646))))

(assert (=> d!1106 (= res!3167 (= (size!38 (buf!350 thiss!932)) (size!38 (buf!350 (_2!29 lt!536)))))))

(assert (=> d!1106 (= (isPrefixOf!0 thiss!932 (_2!29 lt!536)) e!646)))

(declare-fun b!1095 () Bool)

(declare-fun res!3169 () Bool)

(assert (=> b!1095 (=> (not res!3169) (not e!646))))

(assert (=> b!1095 (= res!3169 (bvsle (bitIndex!0 (size!38 (buf!350 thiss!932)) (currentByte!1275 thiss!932) (currentBit!1270 thiss!932)) (bitIndex!0 (size!38 (buf!350 (_2!29 lt!536))) (currentByte!1275 (_2!29 lt!536)) (currentBit!1270 (_2!29 lt!536)))))))

(declare-fun b!1096 () Bool)

(declare-fun e!647 () Bool)

(assert (=> b!1096 (= e!646 e!647)))

(declare-fun res!3168 () Bool)

(assert (=> b!1096 (=> res!3168 e!647)))

(assert (=> b!1096 (= res!3168 (= (size!38 (buf!350 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!1097 () Bool)

(declare-fun arrayBitRangesEq!0 (array!101 array!101 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1097 (= e!647 (arrayBitRangesEq!0 (buf!350 thiss!932) (buf!350 (_2!29 lt!536)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!38 (buf!350 thiss!932)) (currentByte!1275 thiss!932) (currentBit!1270 thiss!932))))))

(assert (= (and d!1106 res!3167) b!1095))

(assert (= (and b!1095 res!3169) b!1096))

(assert (= (and b!1096 (not res!3168)) b!1097))

(assert (=> b!1095 m!665))

(assert (=> b!1095 m!663))

(assert (=> b!1097 m!665))

(assert (=> b!1097 m!665))

(declare-fun m!743 () Bool)

(assert (=> b!1097 m!743))

(assert (=> b!987 d!1106))

(declare-fun d!1108 () Bool)

(declare-fun e!648 () Bool)

(assert (=> d!1108 e!648))

(declare-fun res!3171 () Bool)

(assert (=> d!1108 (=> (not res!3171) (not e!648))))

(declare-fun lt!647 () (_ BitVec 64))

(declare-fun lt!645 () (_ BitVec 64))

(declare-fun lt!644 () (_ BitVec 64))

(assert (=> d!1108 (= res!3171 (= lt!647 (bvsub lt!644 lt!645)))))

(assert (=> d!1108 (or (= (bvand lt!644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!645 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!644 lt!645) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1108 (= lt!645 (remainingBits!0 ((_ sign_extend 32) (size!38 (buf!350 (_2!29 lt!536)))) ((_ sign_extend 32) (currentByte!1275 (_2!29 lt!536))) ((_ sign_extend 32) (currentBit!1270 (_2!29 lt!536)))))))

(declare-fun lt!648 () (_ BitVec 64))

(declare-fun lt!646 () (_ BitVec 64))

(assert (=> d!1108 (= lt!644 (bvmul lt!648 lt!646))))

(assert (=> d!1108 (or (= lt!648 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!646 (bvsdiv (bvmul lt!648 lt!646) lt!648)))))

(assert (=> d!1108 (= lt!646 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1108 (= lt!648 ((_ sign_extend 32) (size!38 (buf!350 (_2!29 lt!536)))))))

(assert (=> d!1108 (= lt!647 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1275 (_2!29 lt!536))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1270 (_2!29 lt!536)))))))

(assert (=> d!1108 (invariant!0 (currentBit!1270 (_2!29 lt!536)) (currentByte!1275 (_2!29 lt!536)) (size!38 (buf!350 (_2!29 lt!536))))))

(assert (=> d!1108 (= (bitIndex!0 (size!38 (buf!350 (_2!29 lt!536))) (currentByte!1275 (_2!29 lt!536)) (currentBit!1270 (_2!29 lt!536))) lt!647)))

(declare-fun b!1099 () Bool)

(declare-fun res!3170 () Bool)

(assert (=> b!1099 (=> (not res!3170) (not e!648))))

(assert (=> b!1099 (= res!3170 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!647))))

(declare-fun b!1100 () Bool)

(declare-fun lt!649 () (_ BitVec 64))

(assert (=> b!1100 (= e!648 (bvsle lt!647 (bvmul lt!649 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1100 (or (= lt!649 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!649 #b0000000000000000000000000000000000000000000000000000000000001000) lt!649)))))

(assert (=> b!1100 (= lt!649 ((_ sign_extend 32) (size!38 (buf!350 (_2!29 lt!536)))))))

(assert (= (and d!1108 res!3171) b!1099))

(assert (= (and b!1099 res!3170) b!1100))

(declare-fun m!745 () Bool)

(assert (=> d!1108 m!745))

(assert (=> d!1108 m!671))

(assert (=> b!992 d!1108))

(declare-fun d!1110 () Bool)

(declare-fun e!651 () Bool)

(assert (=> d!1110 e!651))

(declare-fun res!3179 () Bool)

(assert (=> d!1110 (=> (not res!3179) (not e!651))))

(declare-fun lt!657 () (_ BitVec 64))

(declare-fun lt!656 () (_ BitVec 64))

(declare-fun lt!659 () (_ BitVec 64))

(assert (=> d!1110 (= res!3179 (= lt!659 (bvsub lt!656 lt!657)))))

(assert (=> d!1110 (or (= (bvand lt!656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!657 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!656 lt!657) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1110 (= lt!657 (remainingBits!0 ((_ sign_extend 32) (size!38 (buf!350 thiss!932))) ((_ sign_extend 32) (currentByte!1275 thiss!932)) ((_ sign_extend 32) (currentBit!1270 thiss!932))))))

(declare-fun lt!660 () (_ BitVec 64))

(declare-fun lt!658 () (_ BitVec 64))

(assert (=> d!1110 (= lt!656 (bvmul lt!660 lt!658))))

(assert (=> d!1110 (or (= lt!660 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!658 (bvsdiv (bvmul lt!660 lt!658) lt!660)))))

(assert (=> d!1110 (= lt!658 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1110 (= lt!660 ((_ sign_extend 32) (size!38 (buf!350 thiss!932))))))

(assert (=> d!1110 (= lt!659 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1275 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1270 thiss!932))))))

(assert (=> d!1110 (invariant!0 (currentBit!1270 thiss!932) (currentByte!1275 thiss!932) (size!38 (buf!350 thiss!932)))))

(assert (=> d!1110 (= (bitIndex!0 (size!38 (buf!350 thiss!932)) (currentByte!1275 thiss!932) (currentBit!1270 thiss!932)) lt!659)))

(declare-fun b!1107 () Bool)

(declare-fun res!3178 () Bool)

(assert (=> b!1107 (=> (not res!3178) (not e!651))))

(assert (=> b!1107 (= res!3178 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!659))))

(declare-fun b!1108 () Bool)

(declare-fun lt!661 () (_ BitVec 64))

(assert (=> b!1108 (= e!651 (bvsle lt!659 (bvmul lt!661 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1108 (or (= lt!661 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!661 #b0000000000000000000000000000000000000000000000000000000000001000) lt!661)))))

(assert (=> b!1108 (= lt!661 ((_ sign_extend 32) (size!38 (buf!350 thiss!932))))))

(assert (= (and d!1110 res!3179) b!1107))

(assert (= (and b!1107 res!3178) b!1108))

(assert (=> d!1110 m!697))

(assert (=> d!1110 m!699))

(assert (=> b!992 d!1110))

(declare-fun d!1112 () Bool)

(assert (=> d!1112 (= (invariant!0 (currentBit!1270 (_2!29 lt!536)) (currentByte!1275 (_2!29 lt!536)) (size!38 (buf!350 (_2!29 lt!536)))) (and (bvsge (currentBit!1270 (_2!29 lt!536)) #b00000000000000000000000000000000) (bvslt (currentBit!1270 (_2!29 lt!536)) #b00000000000000000000000000001000) (bvsge (currentByte!1275 (_2!29 lt!536)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1275 (_2!29 lt!536)) (size!38 (buf!350 (_2!29 lt!536)))) (and (= (currentBit!1270 (_2!29 lt!536)) #b00000000000000000000000000000000) (= (currentByte!1275 (_2!29 lt!536)) (size!38 (buf!350 (_2!29 lt!536))))))))))

(assert (=> b!993 d!1112))

(declare-fun d!1114 () Bool)

(assert (=> d!1114 (= (invariant!0 (currentBit!1270 thiss!932) (currentByte!1275 thiss!932) (size!38 (buf!350 (_2!29 lt!536)))) (and (bvsge (currentBit!1270 thiss!932) #b00000000000000000000000000000000) (bvslt (currentBit!1270 thiss!932) #b00000000000000000000000000001000) (bvsge (currentByte!1275 thiss!932) #b00000000000000000000000000000000) (or (bvslt (currentByte!1275 thiss!932) (size!38 (buf!350 (_2!29 lt!536)))) (and (= (currentBit!1270 thiss!932) #b00000000000000000000000000000000) (= (currentByte!1275 thiss!932) (size!38 (buf!350 (_2!29 lt!536))))))))))

(assert (=> b!988 d!1114))

(assert (=> b!989 d!1108))

(assert (=> b!989 d!1110))

(assert (=> b!994 d!1106))

(check-sat (not b!1097) (not d!1066) (not b!1095) (not d!1046) (not b!1085) (not d!1110) (not d!1052) (not b!1088) (not d!1074) (not d!1068) (not b!1087) (not d!1048) (not b!1054) (not d!1108) (not b!1086))
