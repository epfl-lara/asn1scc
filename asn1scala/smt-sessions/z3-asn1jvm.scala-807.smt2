; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23566 () Bool)

(assert start!23566)

(declare-fun res!98940 () Bool)

(declare-fun e!78312 () Bool)

(assert (=> start!23566 (=> (not res!98940) (not e!78312))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!23566 (= res!98940 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23566 e!78312))

(assert (=> start!23566 true))

(declare-datatypes ((array!5341 0))(
  ( (array!5342 (arr!3013 (Array (_ BitVec 32) (_ BitVec 8))) (size!2420 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4314 0))(
  ( (BitStream!4315 (buf!2845 array!5341) (currentByte!5512 (_ BitVec 32)) (currentBit!5507 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4314)

(declare-fun e!78317 () Bool)

(declare-fun inv!12 (BitStream!4314) Bool)

(assert (=> start!23566 (and (inv!12 thiss!1305) e!78317)))

(declare-fun b!119515 () Bool)

(declare-fun e!78319 () Bool)

(declare-fun e!78320 () Bool)

(assert (=> b!119515 (= e!78319 e!78320)))

(declare-fun res!98934 () Bool)

(assert (=> b!119515 (=> (not res!98934) (not e!78320))))

(declare-datatypes ((tuple2!10020 0))(
  ( (tuple2!10021 (_1!5275 BitStream!4314) (_2!5275 Bool)) )
))
(declare-fun lt!184994 () tuple2!10020)

(declare-datatypes ((Unit!7359 0))(
  ( (Unit!7360) )
))
(declare-datatypes ((tuple2!10022 0))(
  ( (tuple2!10023 (_1!5276 Unit!7359) (_2!5276 BitStream!4314)) )
))
(declare-fun lt!184991 () tuple2!10022)

(declare-fun lt!184990 () Bool)

(assert (=> b!119515 (= res!98934 (and (= (_2!5275 lt!184994) lt!184990) (= (_1!5275 lt!184994) (_2!5276 lt!184991))))))

(declare-fun readBitPure!0 (BitStream!4314) tuple2!10020)

(declare-fun readerFrom!0 (BitStream!4314 (_ BitVec 32) (_ BitVec 32)) BitStream!4314)

(assert (=> b!119515 (= lt!184994 (readBitPure!0 (readerFrom!0 (_2!5276 lt!184991) (currentBit!5507 thiss!1305) (currentByte!5512 thiss!1305))))))

(declare-fun e!78315 () Bool)

(declare-fun lt!184981 () (_ BitVec 64))

(declare-fun lt!184992 () (_ BitVec 64))

(declare-fun lt!184976 () (_ BitVec 64))

(declare-fun b!119516 () Bool)

(assert (=> b!119516 (= e!78315 (or (= lt!184981 (bvand lt!184976 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!184981 (bvand (bvsub lt!184992 lt!184976) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!119516 (= lt!184981 (bvand lt!184992 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119516 (= lt!184992 (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184991))) (currentByte!5512 (_2!5276 lt!184991)) (currentBit!5507 (_2!5276 lt!184991))))))

(declare-datatypes ((tuple2!10024 0))(
  ( (tuple2!10025 (_1!5277 BitStream!4314) (_2!5277 BitStream!4314)) )
))
(declare-fun lt!184986 () tuple2!10024)

(declare-fun lt!184977 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4314 (_ BitVec 64)) BitStream!4314)

(assert (=> b!119516 (= (_1!5277 lt!184986) (withMovedBitIndex!0 (_2!5277 lt!184986) (bvsub lt!184977 lt!184976)))))

(declare-fun lt!184975 () tuple2!10022)

(assert (=> b!119516 (= lt!184976 (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184975))) (currentByte!5512 (_2!5276 lt!184975)) (currentBit!5507 (_2!5276 lt!184975))))))

(assert (=> b!119516 (= lt!184977 (bitIndex!0 (size!2420 (buf!2845 thiss!1305)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305)))))

(declare-datatypes ((tuple2!10026 0))(
  ( (tuple2!10027 (_1!5278 BitStream!4314) (_2!5278 (_ BitVec 64))) )
))
(declare-fun lt!184972 () tuple2!10026)

(declare-fun lt!184974 () tuple2!10026)

(assert (=> b!119516 (and (= (_2!5278 lt!184972) (_2!5278 lt!184974)) (= (_1!5278 lt!184972) (_1!5278 lt!184974)))))

(declare-fun lt!184971 () (_ BitVec 64))

(declare-fun lt!184998 () Unit!7359)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7359)

(assert (=> b!119516 (= lt!184998 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5277 lt!184986) nBits!396 i!615 lt!184971))))

(declare-fun lt!184996 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10026)

(assert (=> b!119516 (= lt!184974 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5277 lt!184986) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184996))))

(declare-fun b!119517 () Bool)

(declare-fun e!78313 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!119517 (= e!78313 (invariant!0 (currentBit!5507 thiss!1305) (currentByte!5512 thiss!1305) (size!2420 (buf!2845 (_2!5276 lt!184975)))))))

(declare-fun b!119518 () Bool)

(declare-fun lt!184984 () (_ BitVec 64))

(assert (=> b!119518 (= e!78320 (= (bitIndex!0 (size!2420 (buf!2845 (_1!5275 lt!184994))) (currentByte!5512 (_1!5275 lt!184994)) (currentBit!5507 (_1!5275 lt!184994))) lt!184984))))

(declare-fun b!119519 () Bool)

(declare-fun res!98937 () Bool)

(declare-fun e!78318 () Bool)

(assert (=> b!119519 (=> (not res!98937) (not e!78318))))

(assert (=> b!119519 (= res!98937 (bvslt i!615 nBits!396))))

(declare-fun b!119520 () Bool)

(declare-fun res!98936 () Bool)

(assert (=> b!119520 (=> (not res!98936) (not e!78313))))

(assert (=> b!119520 (= res!98936 (invariant!0 (currentBit!5507 thiss!1305) (currentByte!5512 thiss!1305) (size!2420 (buf!2845 (_2!5276 lt!184991)))))))

(declare-fun b!119521 () Bool)

(assert (=> b!119521 (= e!78312 e!78318)))

(declare-fun res!98939 () Bool)

(assert (=> b!119521 (=> (not res!98939) (not e!78318))))

(declare-fun lt!184993 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!119521 (= res!98939 (validate_offset_bits!1 ((_ sign_extend 32) (size!2420 (buf!2845 thiss!1305))) ((_ sign_extend 32) (currentByte!5512 thiss!1305)) ((_ sign_extend 32) (currentBit!5507 thiss!1305)) lt!184993))))

(assert (=> b!119521 (= lt!184993 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!119522 () Bool)

(declare-fun e!78314 () Bool)

(declare-fun lt!184980 () tuple2!10020)

(declare-fun lt!184997 () tuple2!10020)

(assert (=> b!119522 (= e!78314 (= (_2!5275 lt!184980) (_2!5275 lt!184997)))))

(declare-fun b!119523 () Bool)

(assert (=> b!119523 (= e!78318 (not e!78315))))

(declare-fun res!98933 () Bool)

(assert (=> b!119523 (=> res!98933 e!78315)))

(declare-fun lt!184983 () tuple2!10024)

(assert (=> b!119523 (= res!98933 (not (= (_1!5278 (readNLeastSignificantBitsLoopPure!0 (_1!5277 lt!184983) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184996)) (_2!5277 lt!184983))))))

(declare-fun lt!184978 () (_ BitVec 64))

(assert (=> b!119523 (validate_offset_bits!1 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184975)))) ((_ sign_extend 32) (currentByte!5512 (_2!5276 lt!184991))) ((_ sign_extend 32) (currentBit!5507 (_2!5276 lt!184991))) lt!184978)))

(declare-fun lt!184989 () Unit!7359)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4314 array!5341 (_ BitVec 64)) Unit!7359)

(assert (=> b!119523 (= lt!184989 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5276 lt!184991) (buf!2845 (_2!5276 lt!184975)) lt!184978))))

(assert (=> b!119523 (= lt!184978 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!184979 () tuple2!10020)

(declare-fun lt!184995 () (_ BitVec 64))

(assert (=> b!119523 (= lt!184996 (bvor lt!184971 (ite (_2!5275 lt!184979) lt!184995 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119523 (= lt!184972 (readNLeastSignificantBitsLoopPure!0 (_1!5277 lt!184986) nBits!396 i!615 lt!184971))))

(assert (=> b!119523 (validate_offset_bits!1 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184975)))) ((_ sign_extend 32) (currentByte!5512 thiss!1305)) ((_ sign_extend 32) (currentBit!5507 thiss!1305)) lt!184993)))

(declare-fun lt!184973 () Unit!7359)

(assert (=> b!119523 (= lt!184973 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2845 (_2!5276 lt!184975)) lt!184993))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119523 (= lt!184971 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!119523 (= (_2!5275 lt!184979) lt!184990)))

(assert (=> b!119523 (= lt!184979 (readBitPure!0 (_1!5277 lt!184986)))))

(declare-fun reader!0 (BitStream!4314 BitStream!4314) tuple2!10024)

(assert (=> b!119523 (= lt!184983 (reader!0 (_2!5276 lt!184991) (_2!5276 lt!184975)))))

(assert (=> b!119523 (= lt!184986 (reader!0 thiss!1305 (_2!5276 lt!184975)))))

(assert (=> b!119523 e!78314))

(declare-fun res!98932 () Bool)

(assert (=> b!119523 (=> (not res!98932) (not e!78314))))

(assert (=> b!119523 (= res!98932 (= (bitIndex!0 (size!2420 (buf!2845 (_1!5275 lt!184980))) (currentByte!5512 (_1!5275 lt!184980)) (currentBit!5507 (_1!5275 lt!184980))) (bitIndex!0 (size!2420 (buf!2845 (_1!5275 lt!184997))) (currentByte!5512 (_1!5275 lt!184997)) (currentBit!5507 (_1!5275 lt!184997)))))))

(declare-fun lt!184985 () Unit!7359)

(declare-fun lt!184987 () BitStream!4314)

(declare-fun readBitPrefixLemma!0 (BitStream!4314 BitStream!4314) Unit!7359)

(assert (=> b!119523 (= lt!184985 (readBitPrefixLemma!0 lt!184987 (_2!5276 lt!184975)))))

(assert (=> b!119523 (= lt!184997 (readBitPure!0 (BitStream!4315 (buf!2845 (_2!5276 lt!184975)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305))))))

(assert (=> b!119523 (= lt!184980 (readBitPure!0 lt!184987))))

(assert (=> b!119523 (= lt!184987 (BitStream!4315 (buf!2845 (_2!5276 lt!184991)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305)))))

(assert (=> b!119523 e!78313))

(declare-fun res!98929 () Bool)

(assert (=> b!119523 (=> (not res!98929) (not e!78313))))

(declare-fun isPrefixOf!0 (BitStream!4314 BitStream!4314) Bool)

(assert (=> b!119523 (= res!98929 (isPrefixOf!0 thiss!1305 (_2!5276 lt!184975)))))

(declare-fun lt!184982 () Unit!7359)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4314 BitStream!4314 BitStream!4314) Unit!7359)

(assert (=> b!119523 (= lt!184982 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5276 lt!184991) (_2!5276 lt!184975)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4314 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10022)

(assert (=> b!119523 (= lt!184975 (appendNLeastSignificantBitsLoop!0 (_2!5276 lt!184991) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!78316 () Bool)

(assert (=> b!119523 e!78316))

(declare-fun res!98931 () Bool)

(assert (=> b!119523 (=> (not res!98931) (not e!78316))))

(assert (=> b!119523 (= res!98931 (= (size!2420 (buf!2845 thiss!1305)) (size!2420 (buf!2845 (_2!5276 lt!184991)))))))

(declare-fun appendBit!0 (BitStream!4314 Bool) tuple2!10022)

(assert (=> b!119523 (= lt!184991 (appendBit!0 thiss!1305 lt!184990))))

(assert (=> b!119523 (= lt!184990 (not (= (bvand v!199 lt!184995) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119523 (= lt!184995 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!119524 () Bool)

(declare-fun array_inv!2222 (array!5341) Bool)

(assert (=> b!119524 (= e!78317 (array_inv!2222 (buf!2845 thiss!1305)))))

(declare-fun b!119525 () Bool)

(declare-fun res!98930 () Bool)

(assert (=> b!119525 (=> (not res!98930) (not e!78318))))

(assert (=> b!119525 (= res!98930 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!119526 () Bool)

(declare-fun res!98935 () Bool)

(assert (=> b!119526 (=> (not res!98935) (not e!78319))))

(assert (=> b!119526 (= res!98935 (isPrefixOf!0 thiss!1305 (_2!5276 lt!184991)))))

(declare-fun b!119527 () Bool)

(assert (=> b!119527 (= e!78316 e!78319)))

(declare-fun res!98938 () Bool)

(assert (=> b!119527 (=> (not res!98938) (not e!78319))))

(declare-fun lt!184988 () (_ BitVec 64))

(assert (=> b!119527 (= res!98938 (= lt!184984 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!184988)))))

(assert (=> b!119527 (= lt!184984 (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184991))) (currentByte!5512 (_2!5276 lt!184991)) (currentBit!5507 (_2!5276 lt!184991))))))

(assert (=> b!119527 (= lt!184988 (bitIndex!0 (size!2420 (buf!2845 thiss!1305)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305)))))

(assert (= (and start!23566 res!98940) b!119521))

(assert (= (and b!119521 res!98939) b!119525))

(assert (= (and b!119525 res!98930) b!119519))

(assert (= (and b!119519 res!98937) b!119523))

(assert (= (and b!119523 res!98931) b!119527))

(assert (= (and b!119527 res!98938) b!119526))

(assert (= (and b!119526 res!98935) b!119515))

(assert (= (and b!119515 res!98934) b!119518))

(assert (= (and b!119523 res!98929) b!119520))

(assert (= (and b!119520 res!98936) b!119517))

(assert (= (and b!119523 res!98932) b!119522))

(assert (= (and b!119523 (not res!98933)) b!119516))

(assert (= start!23566 b!119524))

(declare-fun m!180047 () Bool)

(assert (=> start!23566 m!180047))

(declare-fun m!180049 () Bool)

(assert (=> b!119520 m!180049))

(declare-fun m!180051 () Bool)

(assert (=> b!119516 m!180051))

(declare-fun m!180053 () Bool)

(assert (=> b!119516 m!180053))

(declare-fun m!180055 () Bool)

(assert (=> b!119516 m!180055))

(declare-fun m!180057 () Bool)

(assert (=> b!119516 m!180057))

(declare-fun m!180059 () Bool)

(assert (=> b!119516 m!180059))

(declare-fun m!180061 () Bool)

(assert (=> b!119516 m!180061))

(declare-fun m!180063 () Bool)

(assert (=> b!119516 m!180063))

(assert (=> b!119516 m!180051))

(declare-fun m!180065 () Bool)

(assert (=> b!119518 m!180065))

(declare-fun m!180067 () Bool)

(assert (=> b!119515 m!180067))

(assert (=> b!119515 m!180067))

(declare-fun m!180069 () Bool)

(assert (=> b!119515 m!180069))

(declare-fun m!180071 () Bool)

(assert (=> b!119523 m!180071))

(declare-fun m!180073 () Bool)

(assert (=> b!119523 m!180073))

(declare-fun m!180075 () Bool)

(assert (=> b!119523 m!180075))

(declare-fun m!180077 () Bool)

(assert (=> b!119523 m!180077))

(declare-fun m!180079 () Bool)

(assert (=> b!119523 m!180079))

(declare-fun m!180081 () Bool)

(assert (=> b!119523 m!180081))

(declare-fun m!180083 () Bool)

(assert (=> b!119523 m!180083))

(declare-fun m!180085 () Bool)

(assert (=> b!119523 m!180085))

(declare-fun m!180087 () Bool)

(assert (=> b!119523 m!180087))

(declare-fun m!180089 () Bool)

(assert (=> b!119523 m!180089))

(declare-fun m!180091 () Bool)

(assert (=> b!119523 m!180091))

(declare-fun m!180093 () Bool)

(assert (=> b!119523 m!180093))

(declare-fun m!180095 () Bool)

(assert (=> b!119523 m!180095))

(declare-fun m!180097 () Bool)

(assert (=> b!119523 m!180097))

(declare-fun m!180099 () Bool)

(assert (=> b!119523 m!180099))

(declare-fun m!180101 () Bool)

(assert (=> b!119523 m!180101))

(declare-fun m!180103 () Bool)

(assert (=> b!119523 m!180103))

(declare-fun m!180105 () Bool)

(assert (=> b!119523 m!180105))

(declare-fun m!180107 () Bool)

(assert (=> b!119523 m!180107))

(declare-fun m!180109 () Bool)

(assert (=> b!119524 m!180109))

(declare-fun m!180111 () Bool)

(assert (=> b!119517 m!180111))

(declare-fun m!180113 () Bool)

(assert (=> b!119521 m!180113))

(declare-fun m!180115 () Bool)

(assert (=> b!119525 m!180115))

(declare-fun m!180117 () Bool)

(assert (=> b!119526 m!180117))

(assert (=> b!119527 m!180055))

(assert (=> b!119527 m!180059))

(check-sat (not b!119516) (not b!119521) (not b!119515) (not b!119518) (not b!119517) (not start!23566) (not b!119524) (not b!119525) (not b!119523) (not b!119520) (not b!119527) (not b!119526))
(check-sat)
(get-model)

(declare-fun d!38332 () Bool)

(declare-fun e!78354 () Bool)

(assert (=> d!38332 e!78354))

(declare-fun res!98979 () Bool)

(assert (=> d!38332 (=> (not res!98979) (not e!78354))))

(declare-fun lt!185088 () (_ BitVec 64))

(declare-fun lt!185087 () BitStream!4314)

(assert (=> d!38332 (= res!98979 (= (bvadd lt!185088 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2420 (buf!2845 lt!185087)) (currentByte!5512 lt!185087) (currentBit!5507 lt!185087))))))

(assert (=> d!38332 (or (not (= (bvand lt!185088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!185088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!185088 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38332 (= lt!185088 (bitIndex!0 (size!2420 (buf!2845 (_1!5277 lt!184986))) (currentByte!5512 (_1!5277 lt!184986)) (currentBit!5507 (_1!5277 lt!184986))))))

(declare-fun moveBitIndex!0 (BitStream!4314 (_ BitVec 64)) tuple2!10022)

(assert (=> d!38332 (= lt!185087 (_2!5276 (moveBitIndex!0 (_1!5277 lt!184986) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4314 (_ BitVec 64)) Bool)

(assert (=> d!38332 (moveBitIndexPrecond!0 (_1!5277 lt!184986) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!38332 (= (withMovedBitIndex!0 (_1!5277 lt!184986) #b0000000000000000000000000000000000000000000000000000000000000001) lt!185087)))

(declare-fun b!119569 () Bool)

(assert (=> b!119569 (= e!78354 (= (size!2420 (buf!2845 (_1!5277 lt!184986))) (size!2420 (buf!2845 lt!185087))))))

(assert (= (and d!38332 res!98979) b!119569))

(declare-fun m!180191 () Bool)

(assert (=> d!38332 m!180191))

(declare-fun m!180193 () Bool)

(assert (=> d!38332 m!180193))

(declare-fun m!180195 () Bool)

(assert (=> d!38332 m!180195))

(declare-fun m!180197 () Bool)

(assert (=> d!38332 m!180197))

(assert (=> b!119516 d!38332))

(declare-fun d!38334 () Bool)

(declare-fun e!78357 () Bool)

(assert (=> d!38334 e!78357))

(declare-fun res!98985 () Bool)

(assert (=> d!38334 (=> (not res!98985) (not e!78357))))

(declare-fun lt!185102 () (_ BitVec 64))

(declare-fun lt!185106 () (_ BitVec 64))

(declare-fun lt!185101 () (_ BitVec 64))

(assert (=> d!38334 (= res!98985 (= lt!185106 (bvsub lt!185101 lt!185102)))))

(assert (=> d!38334 (or (= (bvand lt!185101 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185102 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185101 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185101 lt!185102) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!38334 (= lt!185102 (remainingBits!0 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184975)))) ((_ sign_extend 32) (currentByte!5512 (_2!5276 lt!184975))) ((_ sign_extend 32) (currentBit!5507 (_2!5276 lt!184975)))))))

(declare-fun lt!185104 () (_ BitVec 64))

(declare-fun lt!185103 () (_ BitVec 64))

(assert (=> d!38334 (= lt!185101 (bvmul lt!185104 lt!185103))))

(assert (=> d!38334 (or (= lt!185104 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!185103 (bvsdiv (bvmul lt!185104 lt!185103) lt!185104)))))

(assert (=> d!38334 (= lt!185103 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38334 (= lt!185104 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184975)))))))

(assert (=> d!38334 (= lt!185106 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5512 (_2!5276 lt!184975))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5507 (_2!5276 lt!184975)))))))

(assert (=> d!38334 (invariant!0 (currentBit!5507 (_2!5276 lt!184975)) (currentByte!5512 (_2!5276 lt!184975)) (size!2420 (buf!2845 (_2!5276 lt!184975))))))

(assert (=> d!38334 (= (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184975))) (currentByte!5512 (_2!5276 lt!184975)) (currentBit!5507 (_2!5276 lt!184975))) lt!185106)))

(declare-fun b!119574 () Bool)

(declare-fun res!98984 () Bool)

(assert (=> b!119574 (=> (not res!98984) (not e!78357))))

(assert (=> b!119574 (= res!98984 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!185106))))

(declare-fun b!119575 () Bool)

(declare-fun lt!185105 () (_ BitVec 64))

(assert (=> b!119575 (= e!78357 (bvsle lt!185106 (bvmul lt!185105 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119575 (or (= lt!185105 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!185105 #b0000000000000000000000000000000000000000000000000000000000001000) lt!185105)))))

(assert (=> b!119575 (= lt!185105 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184975)))))))

(assert (= (and d!38334 res!98985) b!119574))

(assert (= (and b!119574 res!98984) b!119575))

(declare-fun m!180199 () Bool)

(assert (=> d!38334 m!180199))

(declare-fun m!180201 () Bool)

(assert (=> d!38334 m!180201))

(assert (=> b!119516 d!38334))

(declare-fun d!38336 () Bool)

(declare-fun e!78358 () Bool)

(assert (=> d!38336 e!78358))

(declare-fun res!98986 () Bool)

(assert (=> d!38336 (=> (not res!98986) (not e!78358))))

(declare-fun lt!185108 () (_ BitVec 64))

(declare-fun lt!185107 () BitStream!4314)

(assert (=> d!38336 (= res!98986 (= (bvadd lt!185108 (bvsub lt!184977 lt!184976)) (bitIndex!0 (size!2420 (buf!2845 lt!185107)) (currentByte!5512 lt!185107) (currentBit!5507 lt!185107))))))

(assert (=> d!38336 (or (not (= (bvand lt!185108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184977 lt!184976) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!185108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!185108 (bvsub lt!184977 lt!184976)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38336 (= lt!185108 (bitIndex!0 (size!2420 (buf!2845 (_2!5277 lt!184986))) (currentByte!5512 (_2!5277 lt!184986)) (currentBit!5507 (_2!5277 lt!184986))))))

(assert (=> d!38336 (= lt!185107 (_2!5276 (moveBitIndex!0 (_2!5277 lt!184986) (bvsub lt!184977 lt!184976))))))

(assert (=> d!38336 (moveBitIndexPrecond!0 (_2!5277 lt!184986) (bvsub lt!184977 lt!184976))))

(assert (=> d!38336 (= (withMovedBitIndex!0 (_2!5277 lt!184986) (bvsub lt!184977 lt!184976)) lt!185107)))

(declare-fun b!119576 () Bool)

(assert (=> b!119576 (= e!78358 (= (size!2420 (buf!2845 (_2!5277 lt!184986))) (size!2420 (buf!2845 lt!185107))))))

(assert (= (and d!38336 res!98986) b!119576))

(declare-fun m!180203 () Bool)

(assert (=> d!38336 m!180203))

(declare-fun m!180205 () Bool)

(assert (=> d!38336 m!180205))

(declare-fun m!180207 () Bool)

(assert (=> d!38336 m!180207))

(declare-fun m!180209 () Bool)

(assert (=> d!38336 m!180209))

(assert (=> b!119516 d!38336))

(declare-fun d!38338 () Bool)

(declare-datatypes ((tuple2!10036 0))(
  ( (tuple2!10037 (_1!5283 (_ BitVec 64)) (_2!5283 BitStream!4314)) )
))
(declare-fun lt!185111 () tuple2!10036)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10036)

(assert (=> d!38338 (= lt!185111 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5277 lt!184986) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184996))))

(assert (=> d!38338 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5277 lt!184986) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184996) (tuple2!10027 (_2!5283 lt!185111) (_1!5283 lt!185111)))))

(declare-fun bs!9278 () Bool)

(assert (= bs!9278 d!38338))

(assert (=> bs!9278 m!180051))

(declare-fun m!180211 () Bool)

(assert (=> bs!9278 m!180211))

(assert (=> b!119516 d!38338))

(declare-fun d!38340 () Bool)

(declare-fun e!78359 () Bool)

(assert (=> d!38340 e!78359))

(declare-fun res!98988 () Bool)

(assert (=> d!38340 (=> (not res!98988) (not e!78359))))

(declare-fun lt!185117 () (_ BitVec 64))

(declare-fun lt!185113 () (_ BitVec 64))

(declare-fun lt!185112 () (_ BitVec 64))

(assert (=> d!38340 (= res!98988 (= lt!185117 (bvsub lt!185112 lt!185113)))))

(assert (=> d!38340 (or (= (bvand lt!185112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185113 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185112 lt!185113) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38340 (= lt!185113 (remainingBits!0 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184991)))) ((_ sign_extend 32) (currentByte!5512 (_2!5276 lt!184991))) ((_ sign_extend 32) (currentBit!5507 (_2!5276 lt!184991)))))))

(declare-fun lt!185115 () (_ BitVec 64))

(declare-fun lt!185114 () (_ BitVec 64))

(assert (=> d!38340 (= lt!185112 (bvmul lt!185115 lt!185114))))

(assert (=> d!38340 (or (= lt!185115 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!185114 (bvsdiv (bvmul lt!185115 lt!185114) lt!185115)))))

(assert (=> d!38340 (= lt!185114 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38340 (= lt!185115 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184991)))))))

(assert (=> d!38340 (= lt!185117 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5512 (_2!5276 lt!184991))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5507 (_2!5276 lt!184991)))))))

(assert (=> d!38340 (invariant!0 (currentBit!5507 (_2!5276 lt!184991)) (currentByte!5512 (_2!5276 lt!184991)) (size!2420 (buf!2845 (_2!5276 lt!184991))))))

(assert (=> d!38340 (= (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184991))) (currentByte!5512 (_2!5276 lt!184991)) (currentBit!5507 (_2!5276 lt!184991))) lt!185117)))

(declare-fun b!119577 () Bool)

(declare-fun res!98987 () Bool)

(assert (=> b!119577 (=> (not res!98987) (not e!78359))))

(assert (=> b!119577 (= res!98987 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!185117))))

(declare-fun b!119578 () Bool)

(declare-fun lt!185116 () (_ BitVec 64))

(assert (=> b!119578 (= e!78359 (bvsle lt!185117 (bvmul lt!185116 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119578 (or (= lt!185116 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!185116 #b0000000000000000000000000000000000000000000000000000000000001000) lt!185116)))))

(assert (=> b!119578 (= lt!185116 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184991)))))))

(assert (= (and d!38340 res!98988) b!119577))

(assert (= (and b!119577 res!98987) b!119578))

(declare-fun m!180213 () Bool)

(assert (=> d!38340 m!180213))

(declare-fun m!180215 () Bool)

(assert (=> d!38340 m!180215))

(assert (=> b!119516 d!38340))

(declare-fun d!38342 () Bool)

(declare-fun lt!185133 () tuple2!10026)

(declare-fun lt!185130 () tuple2!10026)

(assert (=> d!38342 (and (= (_2!5278 lt!185133) (_2!5278 lt!185130)) (= (_1!5278 lt!185133) (_1!5278 lt!185130)))))

(declare-fun lt!185132 () Bool)

(declare-fun lt!185131 () (_ BitVec 64))

(declare-fun lt!185134 () BitStream!4314)

(declare-fun lt!185135 () Unit!7359)

(declare-fun choose!45 (BitStream!4314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10026 tuple2!10026 BitStream!4314 (_ BitVec 64) Bool BitStream!4314 (_ BitVec 64) tuple2!10026 tuple2!10026 BitStream!4314 (_ BitVec 64)) Unit!7359)

(assert (=> d!38342 (= lt!185135 (choose!45 (_1!5277 lt!184986) nBits!396 i!615 lt!184971 lt!185133 (tuple2!10027 (_1!5278 lt!185133) (_2!5278 lt!185133)) (_1!5278 lt!185133) (_2!5278 lt!185133) lt!185132 lt!185134 lt!185131 lt!185130 (tuple2!10027 (_1!5278 lt!185130) (_2!5278 lt!185130)) (_1!5278 lt!185130) (_2!5278 lt!185130)))))

(assert (=> d!38342 (= lt!185130 (readNLeastSignificantBitsLoopPure!0 lt!185134 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!185131))))

(assert (=> d!38342 (= lt!185131 (bvor lt!184971 (ite lt!185132 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38342 (= lt!185134 (withMovedBitIndex!0 (_1!5277 lt!184986) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!38342 (= lt!185132 (_2!5275 (readBitPure!0 (_1!5277 lt!184986))))))

(assert (=> d!38342 (= lt!185133 (readNLeastSignificantBitsLoopPure!0 (_1!5277 lt!184986) nBits!396 i!615 lt!184971))))

(assert (=> d!38342 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5277 lt!184986) nBits!396 i!615 lt!184971) lt!185135)))

(declare-fun bs!9280 () Bool)

(assert (= bs!9280 d!38342))

(assert (=> bs!9280 m!180089))

(assert (=> bs!9280 m!180075))

(declare-fun m!180217 () Bool)

(assert (=> bs!9280 m!180217))

(declare-fun m!180219 () Bool)

(assert (=> bs!9280 m!180219))

(assert (=> bs!9280 m!180051))

(assert (=> b!119516 d!38342))

(declare-fun d!38344 () Bool)

(declare-fun e!78360 () Bool)

(assert (=> d!38344 e!78360))

(declare-fun res!98990 () Bool)

(assert (=> d!38344 (=> (not res!98990) (not e!78360))))

(declare-fun lt!185136 () (_ BitVec 64))

(declare-fun lt!185137 () (_ BitVec 64))

(declare-fun lt!185141 () (_ BitVec 64))

(assert (=> d!38344 (= res!98990 (= lt!185141 (bvsub lt!185136 lt!185137)))))

(assert (=> d!38344 (or (= (bvand lt!185136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185137 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185136 lt!185137) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38344 (= lt!185137 (remainingBits!0 ((_ sign_extend 32) (size!2420 (buf!2845 thiss!1305))) ((_ sign_extend 32) (currentByte!5512 thiss!1305)) ((_ sign_extend 32) (currentBit!5507 thiss!1305))))))

(declare-fun lt!185139 () (_ BitVec 64))

(declare-fun lt!185138 () (_ BitVec 64))

(assert (=> d!38344 (= lt!185136 (bvmul lt!185139 lt!185138))))

(assert (=> d!38344 (or (= lt!185139 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!185138 (bvsdiv (bvmul lt!185139 lt!185138) lt!185139)))))

(assert (=> d!38344 (= lt!185138 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38344 (= lt!185139 ((_ sign_extend 32) (size!2420 (buf!2845 thiss!1305))))))

(assert (=> d!38344 (= lt!185141 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5512 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5507 thiss!1305))))))

(assert (=> d!38344 (invariant!0 (currentBit!5507 thiss!1305) (currentByte!5512 thiss!1305) (size!2420 (buf!2845 thiss!1305)))))

(assert (=> d!38344 (= (bitIndex!0 (size!2420 (buf!2845 thiss!1305)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305)) lt!185141)))

(declare-fun b!119579 () Bool)

(declare-fun res!98989 () Bool)

(assert (=> b!119579 (=> (not res!98989) (not e!78360))))

(assert (=> b!119579 (= res!98989 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!185141))))

(declare-fun b!119580 () Bool)

(declare-fun lt!185140 () (_ BitVec 64))

(assert (=> b!119580 (= e!78360 (bvsle lt!185141 (bvmul lt!185140 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119580 (or (= lt!185140 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!185140 #b0000000000000000000000000000000000000000000000000000000000001000) lt!185140)))))

(assert (=> b!119580 (= lt!185140 ((_ sign_extend 32) (size!2420 (buf!2845 thiss!1305))))))

(assert (= (and d!38344 res!98990) b!119579))

(assert (= (and b!119579 res!98989) b!119580))

(declare-fun m!180221 () Bool)

(assert (=> d!38344 m!180221))

(declare-fun m!180223 () Bool)

(assert (=> d!38344 m!180223))

(assert (=> b!119516 d!38344))

(declare-fun d!38346 () Bool)

(declare-datatypes ((tuple2!10038 0))(
  ( (tuple2!10039 (_1!5284 Bool) (_2!5284 BitStream!4314)) )
))
(declare-fun lt!185144 () tuple2!10038)

(declare-fun readBit!0 (BitStream!4314) tuple2!10038)

(assert (=> d!38346 (= lt!185144 (readBit!0 (readerFrom!0 (_2!5276 lt!184991) (currentBit!5507 thiss!1305) (currentByte!5512 thiss!1305))))))

(assert (=> d!38346 (= (readBitPure!0 (readerFrom!0 (_2!5276 lt!184991) (currentBit!5507 thiss!1305) (currentByte!5512 thiss!1305))) (tuple2!10021 (_2!5284 lt!185144) (_1!5284 lt!185144)))))

(declare-fun bs!9281 () Bool)

(assert (= bs!9281 d!38346))

(assert (=> bs!9281 m!180067))

(declare-fun m!180225 () Bool)

(assert (=> bs!9281 m!180225))

(assert (=> b!119515 d!38346))

(declare-fun d!38348 () Bool)

(declare-fun e!78363 () Bool)

(assert (=> d!38348 e!78363))

(declare-fun res!98994 () Bool)

(assert (=> d!38348 (=> (not res!98994) (not e!78363))))

(assert (=> d!38348 (= res!98994 (invariant!0 (currentBit!5507 (_2!5276 lt!184991)) (currentByte!5512 (_2!5276 lt!184991)) (size!2420 (buf!2845 (_2!5276 lt!184991)))))))

(assert (=> d!38348 (= (readerFrom!0 (_2!5276 lt!184991) (currentBit!5507 thiss!1305) (currentByte!5512 thiss!1305)) (BitStream!4315 (buf!2845 (_2!5276 lt!184991)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305)))))

(declare-fun b!119583 () Bool)

(assert (=> b!119583 (= e!78363 (invariant!0 (currentBit!5507 thiss!1305) (currentByte!5512 thiss!1305) (size!2420 (buf!2845 (_2!5276 lt!184991)))))))

(assert (= (and d!38348 res!98994) b!119583))

(assert (=> d!38348 m!180215))

(assert (=> b!119583 m!180049))

(assert (=> b!119515 d!38348))

(declare-fun d!38350 () Bool)

(declare-fun res!99003 () Bool)

(declare-fun e!78368 () Bool)

(assert (=> d!38350 (=> (not res!99003) (not e!78368))))

(assert (=> d!38350 (= res!99003 (= (size!2420 (buf!2845 thiss!1305)) (size!2420 (buf!2845 (_2!5276 lt!184991)))))))

(assert (=> d!38350 (= (isPrefixOf!0 thiss!1305 (_2!5276 lt!184991)) e!78368)))

(declare-fun b!119590 () Bool)

(declare-fun res!99001 () Bool)

(assert (=> b!119590 (=> (not res!99001) (not e!78368))))

(assert (=> b!119590 (= res!99001 (bvsle (bitIndex!0 (size!2420 (buf!2845 thiss!1305)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305)) (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184991))) (currentByte!5512 (_2!5276 lt!184991)) (currentBit!5507 (_2!5276 lt!184991)))))))

(declare-fun b!119591 () Bool)

(declare-fun e!78369 () Bool)

(assert (=> b!119591 (= e!78368 e!78369)))

(declare-fun res!99002 () Bool)

(assert (=> b!119591 (=> res!99002 e!78369)))

(assert (=> b!119591 (= res!99002 (= (size!2420 (buf!2845 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!119592 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5341 array!5341 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!119592 (= e!78369 (arrayBitRangesEq!0 (buf!2845 thiss!1305) (buf!2845 (_2!5276 lt!184991)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2420 (buf!2845 thiss!1305)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305))))))

(assert (= (and d!38350 res!99003) b!119590))

(assert (= (and b!119590 res!99001) b!119591))

(assert (= (and b!119591 (not res!99002)) b!119592))

(assert (=> b!119590 m!180059))

(assert (=> b!119590 m!180055))

(assert (=> b!119592 m!180059))

(assert (=> b!119592 m!180059))

(declare-fun m!180227 () Bool)

(assert (=> b!119592 m!180227))

(assert (=> b!119526 d!38350))

(declare-fun d!38352 () Bool)

(assert (=> d!38352 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!119525 d!38352))

(declare-fun d!38354 () Bool)

(assert (=> d!38354 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5507 thiss!1305) (currentByte!5512 thiss!1305) (size!2420 (buf!2845 thiss!1305))))))

(declare-fun bs!9282 () Bool)

(assert (= bs!9282 d!38354))

(assert (=> bs!9282 m!180223))

(assert (=> start!23566 d!38354))

(declare-fun d!38356 () Bool)

(declare-fun e!78370 () Bool)

(assert (=> d!38356 e!78370))

(declare-fun res!99005 () Bool)

(assert (=> d!38356 (=> (not res!99005) (not e!78370))))

(declare-fun lt!185145 () (_ BitVec 64))

(declare-fun lt!185146 () (_ BitVec 64))

(declare-fun lt!185150 () (_ BitVec 64))

(assert (=> d!38356 (= res!99005 (= lt!185150 (bvsub lt!185145 lt!185146)))))

(assert (=> d!38356 (or (= (bvand lt!185145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185146 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185145 lt!185146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38356 (= lt!185146 (remainingBits!0 ((_ sign_extend 32) (size!2420 (buf!2845 (_1!5275 lt!184994)))) ((_ sign_extend 32) (currentByte!5512 (_1!5275 lt!184994))) ((_ sign_extend 32) (currentBit!5507 (_1!5275 lt!184994)))))))

(declare-fun lt!185148 () (_ BitVec 64))

(declare-fun lt!185147 () (_ BitVec 64))

(assert (=> d!38356 (= lt!185145 (bvmul lt!185148 lt!185147))))

(assert (=> d!38356 (or (= lt!185148 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!185147 (bvsdiv (bvmul lt!185148 lt!185147) lt!185148)))))

(assert (=> d!38356 (= lt!185147 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38356 (= lt!185148 ((_ sign_extend 32) (size!2420 (buf!2845 (_1!5275 lt!184994)))))))

(assert (=> d!38356 (= lt!185150 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5512 (_1!5275 lt!184994))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5507 (_1!5275 lt!184994)))))))

(assert (=> d!38356 (invariant!0 (currentBit!5507 (_1!5275 lt!184994)) (currentByte!5512 (_1!5275 lt!184994)) (size!2420 (buf!2845 (_1!5275 lt!184994))))))

(assert (=> d!38356 (= (bitIndex!0 (size!2420 (buf!2845 (_1!5275 lt!184994))) (currentByte!5512 (_1!5275 lt!184994)) (currentBit!5507 (_1!5275 lt!184994))) lt!185150)))

(declare-fun b!119593 () Bool)

(declare-fun res!99004 () Bool)

(assert (=> b!119593 (=> (not res!99004) (not e!78370))))

(assert (=> b!119593 (= res!99004 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!185150))))

(declare-fun b!119594 () Bool)

(declare-fun lt!185149 () (_ BitVec 64))

(assert (=> b!119594 (= e!78370 (bvsle lt!185150 (bvmul lt!185149 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119594 (or (= lt!185149 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!185149 #b0000000000000000000000000000000000000000000000000000000000001000) lt!185149)))))

(assert (=> b!119594 (= lt!185149 ((_ sign_extend 32) (size!2420 (buf!2845 (_1!5275 lt!184994)))))))

(assert (= (and d!38356 res!99005) b!119593))

(assert (= (and b!119593 res!99004) b!119594))

(declare-fun m!180229 () Bool)

(assert (=> d!38356 m!180229))

(declare-fun m!180231 () Bool)

(assert (=> d!38356 m!180231))

(assert (=> b!119518 d!38356))

(declare-fun d!38358 () Bool)

(assert (=> d!38358 (= (invariant!0 (currentBit!5507 thiss!1305) (currentByte!5512 thiss!1305) (size!2420 (buf!2845 (_2!5276 lt!184975)))) (and (bvsge (currentBit!5507 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5507 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5512 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5512 thiss!1305) (size!2420 (buf!2845 (_2!5276 lt!184975)))) (and (= (currentBit!5507 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5512 thiss!1305) (size!2420 (buf!2845 (_2!5276 lt!184975))))))))))

(assert (=> b!119517 d!38358))

(assert (=> b!119527 d!38340))

(assert (=> b!119527 d!38344))

(declare-fun d!38360 () Bool)

(assert (=> d!38360 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2420 (buf!2845 thiss!1305))) ((_ sign_extend 32) (currentByte!5512 thiss!1305)) ((_ sign_extend 32) (currentBit!5507 thiss!1305)) lt!184993) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2420 (buf!2845 thiss!1305))) ((_ sign_extend 32) (currentByte!5512 thiss!1305)) ((_ sign_extend 32) (currentBit!5507 thiss!1305))) lt!184993))))

(declare-fun bs!9283 () Bool)

(assert (= bs!9283 d!38360))

(assert (=> bs!9283 m!180221))

(assert (=> b!119521 d!38360))

(declare-fun d!38362 () Bool)

(assert (=> d!38362 (= (invariant!0 (currentBit!5507 thiss!1305) (currentByte!5512 thiss!1305) (size!2420 (buf!2845 (_2!5276 lt!184991)))) (and (bvsge (currentBit!5507 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5507 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5512 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5512 thiss!1305) (size!2420 (buf!2845 (_2!5276 lt!184991)))) (and (= (currentBit!5507 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5512 thiss!1305) (size!2420 (buf!2845 (_2!5276 lt!184991))))))))))

(assert (=> b!119520 d!38362))

(declare-fun d!38364 () Bool)

(assert (=> d!38364 (= (array_inv!2222 (buf!2845 thiss!1305)) (bvsge (size!2420 (buf!2845 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!119524 d!38364))

(declare-fun d!38366 () Bool)

(assert (=> d!38366 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!119523 d!38366))

(declare-fun lt!185151 () tuple2!10036)

(declare-fun d!38368 () Bool)

(assert (=> d!38368 (= lt!185151 (readNLeastSignificantBitsLoop!0 (_1!5277 lt!184983) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184996))))

(assert (=> d!38368 (= (readNLeastSignificantBitsLoopPure!0 (_1!5277 lt!184983) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184996) (tuple2!10027 (_2!5283 lt!185151) (_1!5283 lt!185151)))))

(declare-fun bs!9284 () Bool)

(assert (= bs!9284 d!38368))

(declare-fun m!180233 () Bool)

(assert (=> bs!9284 m!180233))

(assert (=> b!119523 d!38368))

(declare-fun b!119606 () Bool)

(declare-fun e!78376 () Bool)

(declare-fun e!78375 () Bool)

(assert (=> b!119606 (= e!78376 e!78375)))

(declare-fun res!99014 () Bool)

(assert (=> b!119606 (=> (not res!99014) (not e!78375))))

(declare-fun lt!185161 () tuple2!10022)

(declare-fun lt!185163 () tuple2!10020)

(assert (=> b!119606 (= res!99014 (and (= (_2!5275 lt!185163) lt!184990) (= (_1!5275 lt!185163) (_2!5276 lt!185161))))))

(assert (=> b!119606 (= lt!185163 (readBitPure!0 (readerFrom!0 (_2!5276 lt!185161) (currentBit!5507 thiss!1305) (currentByte!5512 thiss!1305))))))

(declare-fun b!119604 () Bool)

(declare-fun res!99017 () Bool)

(assert (=> b!119604 (=> (not res!99017) (not e!78376))))

(declare-fun lt!185160 () (_ BitVec 64))

(declare-fun lt!185162 () (_ BitVec 64))

(assert (=> b!119604 (= res!99017 (= (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!185161))) (currentByte!5512 (_2!5276 lt!185161)) (currentBit!5507 (_2!5276 lt!185161))) (bvadd lt!185162 lt!185160)))))

(assert (=> b!119604 (or (not (= (bvand lt!185162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185160 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!185162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!185162 lt!185160) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119604 (= lt!185160 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!119604 (= lt!185162 (bitIndex!0 (size!2420 (buf!2845 thiss!1305)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305)))))

(declare-fun b!119607 () Bool)

(assert (=> b!119607 (= e!78375 (= (bitIndex!0 (size!2420 (buf!2845 (_1!5275 lt!185163))) (currentByte!5512 (_1!5275 lt!185163)) (currentBit!5507 (_1!5275 lt!185163))) (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!185161))) (currentByte!5512 (_2!5276 lt!185161)) (currentBit!5507 (_2!5276 lt!185161)))))))

(declare-fun b!119605 () Bool)

(declare-fun res!99016 () Bool)

(assert (=> b!119605 (=> (not res!99016) (not e!78376))))

(assert (=> b!119605 (= res!99016 (isPrefixOf!0 thiss!1305 (_2!5276 lt!185161)))))

(declare-fun d!38370 () Bool)

(assert (=> d!38370 e!78376))

(declare-fun res!99015 () Bool)

(assert (=> d!38370 (=> (not res!99015) (not e!78376))))

(assert (=> d!38370 (= res!99015 (= (size!2420 (buf!2845 thiss!1305)) (size!2420 (buf!2845 (_2!5276 lt!185161)))))))

(declare-fun choose!16 (BitStream!4314 Bool) tuple2!10022)

(assert (=> d!38370 (= lt!185161 (choose!16 thiss!1305 lt!184990))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!38370 (validate_offset_bit!0 ((_ sign_extend 32) (size!2420 (buf!2845 thiss!1305))) ((_ sign_extend 32) (currentByte!5512 thiss!1305)) ((_ sign_extend 32) (currentBit!5507 thiss!1305)))))

(assert (=> d!38370 (= (appendBit!0 thiss!1305 lt!184990) lt!185161)))

(assert (= (and d!38370 res!99015) b!119604))

(assert (= (and b!119604 res!99017) b!119605))

(assert (= (and b!119605 res!99016) b!119606))

(assert (= (and b!119606 res!99014) b!119607))

(declare-fun m!180235 () Bool)

(assert (=> b!119605 m!180235))

(declare-fun m!180237 () Bool)

(assert (=> b!119607 m!180237))

(declare-fun m!180239 () Bool)

(assert (=> b!119607 m!180239))

(declare-fun m!180241 () Bool)

(assert (=> d!38370 m!180241))

(declare-fun m!180243 () Bool)

(assert (=> d!38370 m!180243))

(declare-fun m!180245 () Bool)

(assert (=> b!119606 m!180245))

(assert (=> b!119606 m!180245))

(declare-fun m!180247 () Bool)

(assert (=> b!119606 m!180247))

(assert (=> b!119604 m!180239))

(assert (=> b!119604 m!180059))

(assert (=> b!119523 d!38370))

(declare-fun d!38372 () Bool)

(assert (=> d!38372 (validate_offset_bits!1 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184975)))) ((_ sign_extend 32) (currentByte!5512 (_2!5276 lt!184991))) ((_ sign_extend 32) (currentBit!5507 (_2!5276 lt!184991))) lt!184978)))

(declare-fun lt!185166 () Unit!7359)

(declare-fun choose!9 (BitStream!4314 array!5341 (_ BitVec 64) BitStream!4314) Unit!7359)

(assert (=> d!38372 (= lt!185166 (choose!9 (_2!5276 lt!184991) (buf!2845 (_2!5276 lt!184975)) lt!184978 (BitStream!4315 (buf!2845 (_2!5276 lt!184975)) (currentByte!5512 (_2!5276 lt!184991)) (currentBit!5507 (_2!5276 lt!184991)))))))

(assert (=> d!38372 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5276 lt!184991) (buf!2845 (_2!5276 lt!184975)) lt!184978) lt!185166)))

(declare-fun bs!9285 () Bool)

(assert (= bs!9285 d!38372))

(assert (=> bs!9285 m!180073))

(declare-fun m!180249 () Bool)

(assert (=> bs!9285 m!180249))

(assert (=> b!119523 d!38372))

(declare-fun d!38374 () Bool)

(assert (=> d!38374 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184975)))) ((_ sign_extend 32) (currentByte!5512 thiss!1305)) ((_ sign_extend 32) (currentBit!5507 thiss!1305)) lt!184993) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184975)))) ((_ sign_extend 32) (currentByte!5512 thiss!1305)) ((_ sign_extend 32) (currentBit!5507 thiss!1305))) lt!184993))))

(declare-fun bs!9286 () Bool)

(assert (= bs!9286 d!38374))

(declare-fun m!180251 () Bool)

(assert (=> bs!9286 m!180251))

(assert (=> b!119523 d!38374))

(declare-fun d!38376 () Bool)

(assert (=> d!38376 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184975)))) ((_ sign_extend 32) (currentByte!5512 (_2!5276 lt!184991))) ((_ sign_extend 32) (currentBit!5507 (_2!5276 lt!184991))) lt!184978) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184975)))) ((_ sign_extend 32) (currentByte!5512 (_2!5276 lt!184991))) ((_ sign_extend 32) (currentBit!5507 (_2!5276 lt!184991)))) lt!184978))))

(declare-fun bs!9287 () Bool)

(assert (= bs!9287 d!38376))

(declare-fun m!180253 () Bool)

(assert (=> bs!9287 m!180253))

(assert (=> b!119523 d!38376))

(declare-fun b!119621 () Bool)

(declare-fun res!99028 () Bool)

(declare-fun e!78384 () Bool)

(assert (=> b!119621 (=> (not res!99028) (not e!78384))))

(declare-fun lt!185220 () tuple2!10024)

(assert (=> b!119621 (= res!99028 (isPrefixOf!0 (_2!5277 lt!185220) (_2!5276 lt!184975)))))

(declare-fun b!119622 () Bool)

(declare-fun e!78385 () Unit!7359)

(declare-fun Unit!7363 () Unit!7359)

(assert (=> b!119622 (= e!78385 Unit!7363)))

(declare-fun b!119623 () Bool)

(declare-fun lt!185216 () (_ BitVec 64))

(declare-fun lt!185212 () (_ BitVec 64))

(assert (=> b!119623 (= e!78384 (= (_1!5277 lt!185220) (withMovedBitIndex!0 (_2!5277 lt!185220) (bvsub lt!185216 lt!185212))))))

(assert (=> b!119623 (or (= (bvand lt!185216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185212 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185216 lt!185212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119623 (= lt!185212 (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184975))) (currentByte!5512 (_2!5276 lt!184975)) (currentBit!5507 (_2!5276 lt!184975))))))

(assert (=> b!119623 (= lt!185216 (bitIndex!0 (size!2420 (buf!2845 thiss!1305)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305)))))

(declare-fun b!119624 () Bool)

(declare-fun lt!185215 () Unit!7359)

(assert (=> b!119624 (= e!78385 lt!185215)))

(declare-fun lt!185229 () (_ BitVec 64))

(assert (=> b!119624 (= lt!185229 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185219 () (_ BitVec 64))

(assert (=> b!119624 (= lt!185219 (bitIndex!0 (size!2420 (buf!2845 thiss!1305)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5341 array!5341 (_ BitVec 64) (_ BitVec 64)) Unit!7359)

(assert (=> b!119624 (= lt!185215 (arrayBitRangesEqSymmetric!0 (buf!2845 thiss!1305) (buf!2845 (_2!5276 lt!184975)) lt!185229 lt!185219))))

(assert (=> b!119624 (arrayBitRangesEq!0 (buf!2845 (_2!5276 lt!184975)) (buf!2845 thiss!1305) lt!185229 lt!185219)))

(declare-fun b!119625 () Bool)

(declare-fun res!99030 () Bool)

(assert (=> b!119625 (=> (not res!99030) (not e!78384))))

(assert (=> b!119625 (= res!99030 (isPrefixOf!0 (_1!5277 lt!185220) thiss!1305))))

(declare-fun d!38378 () Bool)

(assert (=> d!38378 e!78384))

(declare-fun res!99029 () Bool)

(assert (=> d!38378 (=> (not res!99029) (not e!78384))))

(assert (=> d!38378 (= res!99029 (isPrefixOf!0 (_1!5277 lt!185220) (_2!5277 lt!185220)))))

(declare-fun lt!185221 () BitStream!4314)

(assert (=> d!38378 (= lt!185220 (tuple2!10025 lt!185221 (_2!5276 lt!184975)))))

(declare-fun lt!185227 () Unit!7359)

(declare-fun lt!185225 () Unit!7359)

(assert (=> d!38378 (= lt!185227 lt!185225)))

(assert (=> d!38378 (isPrefixOf!0 lt!185221 (_2!5276 lt!184975))))

(assert (=> d!38378 (= lt!185225 (lemmaIsPrefixTransitive!0 lt!185221 (_2!5276 lt!184975) (_2!5276 lt!184975)))))

(declare-fun lt!185226 () Unit!7359)

(declare-fun lt!185223 () Unit!7359)

(assert (=> d!38378 (= lt!185226 lt!185223)))

(assert (=> d!38378 (isPrefixOf!0 lt!185221 (_2!5276 lt!184975))))

(assert (=> d!38378 (= lt!185223 (lemmaIsPrefixTransitive!0 lt!185221 thiss!1305 (_2!5276 lt!184975)))))

(declare-fun lt!185211 () Unit!7359)

(assert (=> d!38378 (= lt!185211 e!78385)))

(declare-fun c!7183 () Bool)

(assert (=> d!38378 (= c!7183 (not (= (size!2420 (buf!2845 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!185222 () Unit!7359)

(declare-fun lt!185214 () Unit!7359)

(assert (=> d!38378 (= lt!185222 lt!185214)))

(assert (=> d!38378 (isPrefixOf!0 (_2!5276 lt!184975) (_2!5276 lt!184975))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4314) Unit!7359)

(assert (=> d!38378 (= lt!185214 (lemmaIsPrefixRefl!0 (_2!5276 lt!184975)))))

(declare-fun lt!185210 () Unit!7359)

(declare-fun lt!185218 () Unit!7359)

(assert (=> d!38378 (= lt!185210 lt!185218)))

(assert (=> d!38378 (= lt!185218 (lemmaIsPrefixRefl!0 (_2!5276 lt!184975)))))

(declare-fun lt!185224 () Unit!7359)

(declare-fun lt!185213 () Unit!7359)

(assert (=> d!38378 (= lt!185224 lt!185213)))

(assert (=> d!38378 (isPrefixOf!0 lt!185221 lt!185221)))

(assert (=> d!38378 (= lt!185213 (lemmaIsPrefixRefl!0 lt!185221))))

(declare-fun lt!185228 () Unit!7359)

(declare-fun lt!185217 () Unit!7359)

(assert (=> d!38378 (= lt!185228 lt!185217)))

(assert (=> d!38378 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!38378 (= lt!185217 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!38378 (= lt!185221 (BitStream!4315 (buf!2845 (_2!5276 lt!184975)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305)))))

(assert (=> d!38378 (isPrefixOf!0 thiss!1305 (_2!5276 lt!184975))))

(assert (=> d!38378 (= (reader!0 thiss!1305 (_2!5276 lt!184975)) lt!185220)))

(assert (= (and d!38378 c!7183) b!119624))

(assert (= (and d!38378 (not c!7183)) b!119622))

(assert (= (and d!38378 res!99029) b!119625))

(assert (= (and b!119625 res!99030) b!119621))

(assert (= (and b!119621 res!99028) b!119623))

(assert (=> b!119624 m!180059))

(declare-fun m!180263 () Bool)

(assert (=> b!119624 m!180263))

(declare-fun m!180265 () Bool)

(assert (=> b!119624 m!180265))

(declare-fun m!180267 () Bool)

(assert (=> b!119625 m!180267))

(declare-fun m!180269 () Bool)

(assert (=> b!119621 m!180269))

(declare-fun m!180271 () Bool)

(assert (=> b!119623 m!180271))

(assert (=> b!119623 m!180061))

(assert (=> b!119623 m!180059))

(declare-fun m!180273 () Bool)

(assert (=> d!38378 m!180273))

(declare-fun m!180275 () Bool)

(assert (=> d!38378 m!180275))

(assert (=> d!38378 m!180095))

(declare-fun m!180277 () Bool)

(assert (=> d!38378 m!180277))

(declare-fun m!180279 () Bool)

(assert (=> d!38378 m!180279))

(declare-fun m!180281 () Bool)

(assert (=> d!38378 m!180281))

(declare-fun m!180283 () Bool)

(assert (=> d!38378 m!180283))

(declare-fun m!180285 () Bool)

(assert (=> d!38378 m!180285))

(declare-fun m!180287 () Bool)

(assert (=> d!38378 m!180287))

(declare-fun m!180289 () Bool)

(assert (=> d!38378 m!180289))

(declare-fun m!180291 () Bool)

(assert (=> d!38378 m!180291))

(assert (=> b!119523 d!38378))

(declare-fun d!38400 () Bool)

(declare-fun e!78386 () Bool)

(assert (=> d!38400 e!78386))

(declare-fun res!99032 () Bool)

(assert (=> d!38400 (=> (not res!99032) (not e!78386))))

(declare-fun lt!185231 () (_ BitVec 64))

(declare-fun lt!185230 () (_ BitVec 64))

(declare-fun lt!185235 () (_ BitVec 64))

(assert (=> d!38400 (= res!99032 (= lt!185235 (bvsub lt!185230 lt!185231)))))

(assert (=> d!38400 (or (= (bvand lt!185230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185231 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185230 lt!185231) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38400 (= lt!185231 (remainingBits!0 ((_ sign_extend 32) (size!2420 (buf!2845 (_1!5275 lt!184997)))) ((_ sign_extend 32) (currentByte!5512 (_1!5275 lt!184997))) ((_ sign_extend 32) (currentBit!5507 (_1!5275 lt!184997)))))))

(declare-fun lt!185233 () (_ BitVec 64))

(declare-fun lt!185232 () (_ BitVec 64))

(assert (=> d!38400 (= lt!185230 (bvmul lt!185233 lt!185232))))

(assert (=> d!38400 (or (= lt!185233 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!185232 (bvsdiv (bvmul lt!185233 lt!185232) lt!185233)))))

(assert (=> d!38400 (= lt!185232 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38400 (= lt!185233 ((_ sign_extend 32) (size!2420 (buf!2845 (_1!5275 lt!184997)))))))

(assert (=> d!38400 (= lt!185235 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5512 (_1!5275 lt!184997))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5507 (_1!5275 lt!184997)))))))

(assert (=> d!38400 (invariant!0 (currentBit!5507 (_1!5275 lt!184997)) (currentByte!5512 (_1!5275 lt!184997)) (size!2420 (buf!2845 (_1!5275 lt!184997))))))

(assert (=> d!38400 (= (bitIndex!0 (size!2420 (buf!2845 (_1!5275 lt!184997))) (currentByte!5512 (_1!5275 lt!184997)) (currentBit!5507 (_1!5275 lt!184997))) lt!185235)))

(declare-fun b!119626 () Bool)

(declare-fun res!99031 () Bool)

(assert (=> b!119626 (=> (not res!99031) (not e!78386))))

(assert (=> b!119626 (= res!99031 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!185235))))

(declare-fun b!119627 () Bool)

(declare-fun lt!185234 () (_ BitVec 64))

(assert (=> b!119627 (= e!78386 (bvsle lt!185235 (bvmul lt!185234 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119627 (or (= lt!185234 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!185234 #b0000000000000000000000000000000000000000000000000000000000001000) lt!185234)))))

(assert (=> b!119627 (= lt!185234 ((_ sign_extend 32) (size!2420 (buf!2845 (_1!5275 lt!184997)))))))

(assert (= (and d!38400 res!99032) b!119626))

(assert (= (and b!119626 res!99031) b!119627))

(declare-fun m!180293 () Bool)

(assert (=> d!38400 m!180293))

(declare-fun m!180295 () Bool)

(assert (=> d!38400 m!180295))

(assert (=> b!119523 d!38400))

(declare-fun b!119628 () Bool)

(declare-fun res!99033 () Bool)

(declare-fun e!78387 () Bool)

(assert (=> b!119628 (=> (not res!99033) (not e!78387))))

(declare-fun lt!185246 () tuple2!10024)

(assert (=> b!119628 (= res!99033 (isPrefixOf!0 (_2!5277 lt!185246) (_2!5276 lt!184975)))))

(declare-fun b!119629 () Bool)

(declare-fun e!78388 () Unit!7359)

(declare-fun Unit!7364 () Unit!7359)

(assert (=> b!119629 (= e!78388 Unit!7364)))

(declare-fun lt!185238 () (_ BitVec 64))

(declare-fun lt!185242 () (_ BitVec 64))

(declare-fun b!119630 () Bool)

(assert (=> b!119630 (= e!78387 (= (_1!5277 lt!185246) (withMovedBitIndex!0 (_2!5277 lt!185246) (bvsub lt!185242 lt!185238))))))

(assert (=> b!119630 (or (= (bvand lt!185242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185238 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185242 lt!185238) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119630 (= lt!185238 (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184975))) (currentByte!5512 (_2!5276 lt!184975)) (currentBit!5507 (_2!5276 lt!184975))))))

(assert (=> b!119630 (= lt!185242 (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184991))) (currentByte!5512 (_2!5276 lt!184991)) (currentBit!5507 (_2!5276 lt!184991))))))

(declare-fun b!119631 () Bool)

(declare-fun lt!185241 () Unit!7359)

(assert (=> b!119631 (= e!78388 lt!185241)))

(declare-fun lt!185255 () (_ BitVec 64))

(assert (=> b!119631 (= lt!185255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185245 () (_ BitVec 64))

(assert (=> b!119631 (= lt!185245 (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184991))) (currentByte!5512 (_2!5276 lt!184991)) (currentBit!5507 (_2!5276 lt!184991))))))

(assert (=> b!119631 (= lt!185241 (arrayBitRangesEqSymmetric!0 (buf!2845 (_2!5276 lt!184991)) (buf!2845 (_2!5276 lt!184975)) lt!185255 lt!185245))))

(assert (=> b!119631 (arrayBitRangesEq!0 (buf!2845 (_2!5276 lt!184975)) (buf!2845 (_2!5276 lt!184991)) lt!185255 lt!185245)))

(declare-fun b!119632 () Bool)

(declare-fun res!99035 () Bool)

(assert (=> b!119632 (=> (not res!99035) (not e!78387))))

(assert (=> b!119632 (= res!99035 (isPrefixOf!0 (_1!5277 lt!185246) (_2!5276 lt!184991)))))

(declare-fun d!38402 () Bool)

(assert (=> d!38402 e!78387))

(declare-fun res!99034 () Bool)

(assert (=> d!38402 (=> (not res!99034) (not e!78387))))

(assert (=> d!38402 (= res!99034 (isPrefixOf!0 (_1!5277 lt!185246) (_2!5277 lt!185246)))))

(declare-fun lt!185247 () BitStream!4314)

(assert (=> d!38402 (= lt!185246 (tuple2!10025 lt!185247 (_2!5276 lt!184975)))))

(declare-fun lt!185253 () Unit!7359)

(declare-fun lt!185251 () Unit!7359)

(assert (=> d!38402 (= lt!185253 lt!185251)))

(assert (=> d!38402 (isPrefixOf!0 lt!185247 (_2!5276 lt!184975))))

(assert (=> d!38402 (= lt!185251 (lemmaIsPrefixTransitive!0 lt!185247 (_2!5276 lt!184975) (_2!5276 lt!184975)))))

(declare-fun lt!185252 () Unit!7359)

(declare-fun lt!185249 () Unit!7359)

(assert (=> d!38402 (= lt!185252 lt!185249)))

(assert (=> d!38402 (isPrefixOf!0 lt!185247 (_2!5276 lt!184975))))

(assert (=> d!38402 (= lt!185249 (lemmaIsPrefixTransitive!0 lt!185247 (_2!5276 lt!184991) (_2!5276 lt!184975)))))

(declare-fun lt!185237 () Unit!7359)

(assert (=> d!38402 (= lt!185237 e!78388)))

(declare-fun c!7184 () Bool)

(assert (=> d!38402 (= c!7184 (not (= (size!2420 (buf!2845 (_2!5276 lt!184991))) #b00000000000000000000000000000000)))))

(declare-fun lt!185248 () Unit!7359)

(declare-fun lt!185240 () Unit!7359)

(assert (=> d!38402 (= lt!185248 lt!185240)))

(assert (=> d!38402 (isPrefixOf!0 (_2!5276 lt!184975) (_2!5276 lt!184975))))

(assert (=> d!38402 (= lt!185240 (lemmaIsPrefixRefl!0 (_2!5276 lt!184975)))))

(declare-fun lt!185236 () Unit!7359)

(declare-fun lt!185244 () Unit!7359)

(assert (=> d!38402 (= lt!185236 lt!185244)))

(assert (=> d!38402 (= lt!185244 (lemmaIsPrefixRefl!0 (_2!5276 lt!184975)))))

(declare-fun lt!185250 () Unit!7359)

(declare-fun lt!185239 () Unit!7359)

(assert (=> d!38402 (= lt!185250 lt!185239)))

(assert (=> d!38402 (isPrefixOf!0 lt!185247 lt!185247)))

(assert (=> d!38402 (= lt!185239 (lemmaIsPrefixRefl!0 lt!185247))))

(declare-fun lt!185254 () Unit!7359)

(declare-fun lt!185243 () Unit!7359)

(assert (=> d!38402 (= lt!185254 lt!185243)))

(assert (=> d!38402 (isPrefixOf!0 (_2!5276 lt!184991) (_2!5276 lt!184991))))

(assert (=> d!38402 (= lt!185243 (lemmaIsPrefixRefl!0 (_2!5276 lt!184991)))))

(assert (=> d!38402 (= lt!185247 (BitStream!4315 (buf!2845 (_2!5276 lt!184975)) (currentByte!5512 (_2!5276 lt!184991)) (currentBit!5507 (_2!5276 lt!184991))))))

(assert (=> d!38402 (isPrefixOf!0 (_2!5276 lt!184991) (_2!5276 lt!184975))))

(assert (=> d!38402 (= (reader!0 (_2!5276 lt!184991) (_2!5276 lt!184975)) lt!185246)))

(assert (= (and d!38402 c!7184) b!119631))

(assert (= (and d!38402 (not c!7184)) b!119629))

(assert (= (and d!38402 res!99034) b!119632))

(assert (= (and b!119632 res!99035) b!119628))

(assert (= (and b!119628 res!99033) b!119630))

(assert (=> b!119631 m!180055))

(declare-fun m!180297 () Bool)

(assert (=> b!119631 m!180297))

(declare-fun m!180299 () Bool)

(assert (=> b!119631 m!180299))

(declare-fun m!180301 () Bool)

(assert (=> b!119632 m!180301))

(declare-fun m!180303 () Bool)

(assert (=> b!119628 m!180303))

(declare-fun m!180305 () Bool)

(assert (=> b!119630 m!180305))

(assert (=> b!119630 m!180061))

(assert (=> b!119630 m!180055))

(assert (=> d!38402 m!180273))

(declare-fun m!180307 () Bool)

(assert (=> d!38402 m!180307))

(declare-fun m!180309 () Bool)

(assert (=> d!38402 m!180309))

(declare-fun m!180311 () Bool)

(assert (=> d!38402 m!180311))

(declare-fun m!180313 () Bool)

(assert (=> d!38402 m!180313))

(declare-fun m!180315 () Bool)

(assert (=> d!38402 m!180315))

(declare-fun m!180317 () Bool)

(assert (=> d!38402 m!180317))

(declare-fun m!180319 () Bool)

(assert (=> d!38402 m!180319))

(declare-fun m!180321 () Bool)

(assert (=> d!38402 m!180321))

(declare-fun m!180323 () Bool)

(assert (=> d!38402 m!180323))

(assert (=> d!38402 m!180291))

(assert (=> b!119523 d!38402))

(declare-fun d!38404 () Bool)

(declare-fun lt!185256 () tuple2!10038)

(assert (=> d!38404 (= lt!185256 (readBit!0 (BitStream!4315 (buf!2845 (_2!5276 lt!184975)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305))))))

(assert (=> d!38404 (= (readBitPure!0 (BitStream!4315 (buf!2845 (_2!5276 lt!184975)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305))) (tuple2!10021 (_2!5284 lt!185256) (_1!5284 lt!185256)))))

(declare-fun bs!9291 () Bool)

(assert (= bs!9291 d!38404))

(declare-fun m!180325 () Bool)

(assert (=> bs!9291 m!180325))

(assert (=> b!119523 d!38404))

(declare-fun d!38406 () Bool)

(declare-fun res!99038 () Bool)

(declare-fun e!78389 () Bool)

(assert (=> d!38406 (=> (not res!99038) (not e!78389))))

(assert (=> d!38406 (= res!99038 (= (size!2420 (buf!2845 thiss!1305)) (size!2420 (buf!2845 (_2!5276 lt!184975)))))))

(assert (=> d!38406 (= (isPrefixOf!0 thiss!1305 (_2!5276 lt!184975)) e!78389)))

(declare-fun b!119633 () Bool)

(declare-fun res!99036 () Bool)

(assert (=> b!119633 (=> (not res!99036) (not e!78389))))

(assert (=> b!119633 (= res!99036 (bvsle (bitIndex!0 (size!2420 (buf!2845 thiss!1305)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305)) (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184975))) (currentByte!5512 (_2!5276 lt!184975)) (currentBit!5507 (_2!5276 lt!184975)))))))

(declare-fun b!119634 () Bool)

(declare-fun e!78390 () Bool)

(assert (=> b!119634 (= e!78389 e!78390)))

(declare-fun res!99037 () Bool)

(assert (=> b!119634 (=> res!99037 e!78390)))

(assert (=> b!119634 (= res!99037 (= (size!2420 (buf!2845 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!119635 () Bool)

(assert (=> b!119635 (= e!78390 (arrayBitRangesEq!0 (buf!2845 thiss!1305) (buf!2845 (_2!5276 lt!184975)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2420 (buf!2845 thiss!1305)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305))))))

(assert (= (and d!38406 res!99038) b!119633))

(assert (= (and b!119633 res!99036) b!119634))

(assert (= (and b!119634 (not res!99037)) b!119635))

(assert (=> b!119633 m!180059))

(assert (=> b!119633 m!180061))

(assert (=> b!119635 m!180059))

(assert (=> b!119635 m!180059))

(declare-fun m!180327 () Bool)

(assert (=> b!119635 m!180327))

(assert (=> b!119523 d!38406))

(declare-fun d!38408 () Bool)

(declare-fun e!78391 () Bool)

(assert (=> d!38408 e!78391))

(declare-fun res!99040 () Bool)

(assert (=> d!38408 (=> (not res!99040) (not e!78391))))

(declare-fun lt!185265 () (_ BitVec 64))

(declare-fun lt!185260 () (_ BitVec 64))

(declare-fun lt!185261 () (_ BitVec 64))

(assert (=> d!38408 (= res!99040 (= lt!185265 (bvsub lt!185260 lt!185261)))))

(assert (=> d!38408 (or (= (bvand lt!185260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185261 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185260 lt!185261) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38408 (= lt!185261 (remainingBits!0 ((_ sign_extend 32) (size!2420 (buf!2845 (_1!5275 lt!184980)))) ((_ sign_extend 32) (currentByte!5512 (_1!5275 lt!184980))) ((_ sign_extend 32) (currentBit!5507 (_1!5275 lt!184980)))))))

(declare-fun lt!185263 () (_ BitVec 64))

(declare-fun lt!185262 () (_ BitVec 64))

(assert (=> d!38408 (= lt!185260 (bvmul lt!185263 lt!185262))))

(assert (=> d!38408 (or (= lt!185263 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!185262 (bvsdiv (bvmul lt!185263 lt!185262) lt!185263)))))

(assert (=> d!38408 (= lt!185262 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38408 (= lt!185263 ((_ sign_extend 32) (size!2420 (buf!2845 (_1!5275 lt!184980)))))))

(assert (=> d!38408 (= lt!185265 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5512 (_1!5275 lt!184980))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5507 (_1!5275 lt!184980)))))))

(assert (=> d!38408 (invariant!0 (currentBit!5507 (_1!5275 lt!184980)) (currentByte!5512 (_1!5275 lt!184980)) (size!2420 (buf!2845 (_1!5275 lt!184980))))))

(assert (=> d!38408 (= (bitIndex!0 (size!2420 (buf!2845 (_1!5275 lt!184980))) (currentByte!5512 (_1!5275 lt!184980)) (currentBit!5507 (_1!5275 lt!184980))) lt!185265)))

(declare-fun b!119636 () Bool)

(declare-fun res!99039 () Bool)

(assert (=> b!119636 (=> (not res!99039) (not e!78391))))

(assert (=> b!119636 (= res!99039 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!185265))))

(declare-fun b!119637 () Bool)

(declare-fun lt!185264 () (_ BitVec 64))

(assert (=> b!119637 (= e!78391 (bvsle lt!185265 (bvmul lt!185264 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119637 (or (= lt!185264 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!185264 #b0000000000000000000000000000000000000000000000000000000000001000) lt!185264)))))

(assert (=> b!119637 (= lt!185264 ((_ sign_extend 32) (size!2420 (buf!2845 (_1!5275 lt!184980)))))))

(assert (= (and d!38408 res!99040) b!119636))

(assert (= (and b!119636 res!99039) b!119637))

(declare-fun m!180331 () Bool)

(assert (=> d!38408 m!180331))

(declare-fun m!180333 () Bool)

(assert (=> d!38408 m!180333))

(assert (=> b!119523 d!38408))

(declare-fun d!38412 () Bool)

(declare-fun e!78394 () Bool)

(assert (=> d!38412 e!78394))

(declare-fun res!99043 () Bool)

(assert (=> d!38412 (=> (not res!99043) (not e!78394))))

(declare-fun lt!185281 () tuple2!10020)

(declare-fun lt!185278 () tuple2!10020)

(assert (=> d!38412 (= res!99043 (= (bitIndex!0 (size!2420 (buf!2845 (_1!5275 lt!185281))) (currentByte!5512 (_1!5275 lt!185281)) (currentBit!5507 (_1!5275 lt!185281))) (bitIndex!0 (size!2420 (buf!2845 (_1!5275 lt!185278))) (currentByte!5512 (_1!5275 lt!185278)) (currentBit!5507 (_1!5275 lt!185278)))))))

(declare-fun lt!185279 () Unit!7359)

(declare-fun lt!185280 () BitStream!4314)

(declare-fun choose!50 (BitStream!4314 BitStream!4314 BitStream!4314 tuple2!10020 tuple2!10020 BitStream!4314 Bool tuple2!10020 tuple2!10020 BitStream!4314 Bool) Unit!7359)

(assert (=> d!38412 (= lt!185279 (choose!50 lt!184987 (_2!5276 lt!184975) lt!185280 lt!185281 (tuple2!10021 (_1!5275 lt!185281) (_2!5275 lt!185281)) (_1!5275 lt!185281) (_2!5275 lt!185281) lt!185278 (tuple2!10021 (_1!5275 lt!185278) (_2!5275 lt!185278)) (_1!5275 lt!185278) (_2!5275 lt!185278)))))

(assert (=> d!38412 (= lt!185278 (readBitPure!0 lt!185280))))

(assert (=> d!38412 (= lt!185281 (readBitPure!0 lt!184987))))

(assert (=> d!38412 (= lt!185280 (BitStream!4315 (buf!2845 (_2!5276 lt!184975)) (currentByte!5512 lt!184987) (currentBit!5507 lt!184987)))))

(assert (=> d!38412 (invariant!0 (currentBit!5507 lt!184987) (currentByte!5512 lt!184987) (size!2420 (buf!2845 (_2!5276 lt!184975))))))

(assert (=> d!38412 (= (readBitPrefixLemma!0 lt!184987 (_2!5276 lt!184975)) lt!185279)))

(declare-fun b!119640 () Bool)

(assert (=> b!119640 (= e!78394 (= (_2!5275 lt!185281) (_2!5275 lt!185278)))))

(assert (= (and d!38412 res!99043) b!119640))

(declare-fun m!180341 () Bool)

(assert (=> d!38412 m!180341))

(declare-fun m!180343 () Bool)

(assert (=> d!38412 m!180343))

(declare-fun m!180345 () Bool)

(assert (=> d!38412 m!180345))

(declare-fun m!180347 () Bool)

(assert (=> d!38412 m!180347))

(assert (=> d!38412 m!180093))

(declare-fun m!180349 () Bool)

(assert (=> d!38412 m!180349))

(assert (=> b!119523 d!38412))

(declare-fun d!38420 () Bool)

(declare-fun lt!185282 () tuple2!10038)

(assert (=> d!38420 (= lt!185282 (readBit!0 lt!184987))))

(assert (=> d!38420 (= (readBitPure!0 lt!184987) (tuple2!10021 (_2!5284 lt!185282) (_1!5284 lt!185282)))))

(declare-fun bs!9296 () Bool)

(assert (= bs!9296 d!38420))

(declare-fun m!180351 () Bool)

(assert (=> bs!9296 m!180351))

(assert (=> b!119523 d!38420))

(declare-fun d!38422 () Bool)

(declare-fun lt!185283 () tuple2!10038)

(assert (=> d!38422 (= lt!185283 (readBit!0 (_1!5277 lt!184986)))))

(assert (=> d!38422 (= (readBitPure!0 (_1!5277 lt!184986)) (tuple2!10021 (_2!5284 lt!185283) (_1!5284 lt!185283)))))

(declare-fun bs!9297 () Bool)

(assert (= bs!9297 d!38422))

(declare-fun m!180353 () Bool)

(assert (=> bs!9297 m!180353))

(assert (=> b!119523 d!38422))

(declare-fun lt!185284 () tuple2!10036)

(declare-fun d!38424 () Bool)

(assert (=> d!38424 (= lt!185284 (readNLeastSignificantBitsLoop!0 (_1!5277 lt!184986) nBits!396 i!615 lt!184971))))

(assert (=> d!38424 (= (readNLeastSignificantBitsLoopPure!0 (_1!5277 lt!184986) nBits!396 i!615 lt!184971) (tuple2!10027 (_2!5283 lt!185284) (_1!5283 lt!185284)))))

(declare-fun bs!9298 () Bool)

(assert (= bs!9298 d!38424))

(declare-fun m!180355 () Bool)

(assert (=> bs!9298 m!180355))

(assert (=> b!119523 d!38424))

(declare-fun d!38426 () Bool)

(assert (=> d!38426 (isPrefixOf!0 thiss!1305 (_2!5276 lt!184975))))

(declare-fun lt!185287 () Unit!7359)

(declare-fun choose!30 (BitStream!4314 BitStream!4314 BitStream!4314) Unit!7359)

(assert (=> d!38426 (= lt!185287 (choose!30 thiss!1305 (_2!5276 lt!184991) (_2!5276 lt!184975)))))

(assert (=> d!38426 (isPrefixOf!0 thiss!1305 (_2!5276 lt!184991))))

(assert (=> d!38426 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5276 lt!184991) (_2!5276 lt!184975)) lt!185287)))

(declare-fun bs!9299 () Bool)

(assert (= bs!9299 d!38426))

(assert (=> bs!9299 m!180095))

(declare-fun m!180357 () Bool)

(assert (=> bs!9299 m!180357))

(assert (=> bs!9299 m!180117))

(assert (=> b!119523 d!38426))

(declare-fun e!78433 () Bool)

(declare-fun b!119708 () Bool)

(declare-fun lt!185572 () tuple2!10026)

(declare-fun lt!185580 () tuple2!10024)

(assert (=> b!119708 (= e!78433 (and (= (_2!5278 lt!185572) v!199) (= (_1!5278 lt!185572) (_2!5277 lt!185580))))))

(declare-fun lt!185579 () (_ BitVec 64))

(assert (=> b!119708 (= lt!185572 (readNLeastSignificantBitsLoopPure!0 (_1!5277 lt!185580) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185579))))

(declare-fun lt!185583 () Unit!7359)

(declare-fun lt!185555 () Unit!7359)

(assert (=> b!119708 (= lt!185583 lt!185555)))

(declare-fun lt!185550 () tuple2!10022)

(declare-fun lt!185543 () (_ BitVec 64))

(assert (=> b!119708 (validate_offset_bits!1 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!185550)))) ((_ sign_extend 32) (currentByte!5512 (_2!5276 lt!184991))) ((_ sign_extend 32) (currentBit!5507 (_2!5276 lt!184991))) lt!185543)))

(assert (=> b!119708 (= lt!185555 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5276 lt!184991) (buf!2845 (_2!5276 lt!185550)) lt!185543))))

(declare-fun e!78434 () Bool)

(assert (=> b!119708 e!78434))

(declare-fun res!99096 () Bool)

(assert (=> b!119708 (=> (not res!99096) (not e!78434))))

(assert (=> b!119708 (= res!99096 (and (= (size!2420 (buf!2845 (_2!5276 lt!184991))) (size!2420 (buf!2845 (_2!5276 lt!185550)))) (bvsge lt!185543 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119708 (= lt!185543 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!119708 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119708 (= lt!185579 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!119708 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119708 (= lt!185580 (reader!0 (_2!5276 lt!184991) (_2!5276 lt!185550)))))

(declare-fun c!7197 () Bool)

(declare-fun lt!185557 () tuple2!10022)

(declare-fun call!1558 () Bool)

(declare-fun bm!1555 () Bool)

(declare-fun lt!185570 () BitStream!4314)

(assert (=> bm!1555 (= call!1558 (isPrefixOf!0 (ite c!7197 (_2!5276 lt!184991) lt!185570) (ite c!7197 (_2!5276 lt!185557) lt!185570)))))

(declare-fun b!119709 () Bool)

(declare-fun res!99090 () Bool)

(assert (=> b!119709 (= res!99090 (= (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!185557))) (currentByte!5512 (_2!5276 lt!185557)) (currentBit!5507 (_2!5276 lt!185557))) (bvadd (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184991))) (currentByte!5512 (_2!5276 lt!184991)) (currentBit!5507 (_2!5276 lt!184991))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!78431 () Bool)

(assert (=> b!119709 (=> (not res!99090) (not e!78431))))

(declare-fun b!119710 () Bool)

(declare-fun res!99091 () Bool)

(assert (=> b!119710 (=> (not res!99091) (not e!78433))))

(declare-fun lt!185548 () (_ BitVec 64))

(declare-fun lt!185573 () (_ BitVec 64))

(assert (=> b!119710 (= res!99091 (= (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!185550))) (currentByte!5512 (_2!5276 lt!185550)) (currentBit!5507 (_2!5276 lt!185550))) (bvadd lt!185548 lt!185573)))))

(assert (=> b!119710 (or (not (= (bvand lt!185548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185573 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!185548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!185548 lt!185573) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119710 (= lt!185573 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!119710 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119710 (= lt!185548 (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184991))) (currentByte!5512 (_2!5276 lt!184991)) (currentBit!5507 (_2!5276 lt!184991))))))

(declare-fun b!119711 () Bool)

(declare-fun e!78435 () Bool)

(declare-fun lt!185549 () tuple2!10020)

(assert (=> b!119711 (= e!78435 (= (bitIndex!0 (size!2420 (buf!2845 (_1!5275 lt!185549))) (currentByte!5512 (_1!5275 lt!185549)) (currentBit!5507 (_1!5275 lt!185549))) (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!185557))) (currentByte!5512 (_2!5276 lt!185557)) (currentBit!5507 (_2!5276 lt!185557)))))))

(declare-fun d!38428 () Bool)

(assert (=> d!38428 e!78433))

(declare-fun res!99093 () Bool)

(assert (=> d!38428 (=> (not res!99093) (not e!78433))))

(assert (=> d!38428 (= res!99093 (= (size!2420 (buf!2845 (_2!5276 lt!184991))) (size!2420 (buf!2845 (_2!5276 lt!185550)))))))

(declare-fun e!78430 () tuple2!10022)

(assert (=> d!38428 (= lt!185550 e!78430)))

(assert (=> d!38428 (= c!7197 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!38428 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!38428 (= (appendNLeastSignificantBitsLoop!0 (_2!5276 lt!184991) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!185550)))

(declare-fun b!119712 () Bool)

(declare-fun res!99097 () Bool)

(assert (=> b!119712 (=> (not res!99097) (not e!78433))))

(assert (=> b!119712 (= res!99097 (isPrefixOf!0 (_2!5276 lt!184991) (_2!5276 lt!185550)))))

(declare-fun b!119713 () Bool)

(declare-fun e!78429 () (_ BitVec 64))

(assert (=> b!119713 (= e!78429 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!119714 () Bool)

(declare-fun lt!185581 () tuple2!10022)

(declare-fun Unit!7365 () Unit!7359)

(assert (=> b!119714 (= e!78430 (tuple2!10023 Unit!7365 (_2!5276 lt!185581)))))

(declare-fun lt!185569 () Bool)

(assert (=> b!119714 (= lt!185569 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119714 (= lt!185557 (appendBit!0 (_2!5276 lt!184991) lt!185569))))

(declare-fun res!99094 () Bool)

(assert (=> b!119714 (= res!99094 (= (size!2420 (buf!2845 (_2!5276 lt!184991))) (size!2420 (buf!2845 (_2!5276 lt!185557)))))))

(assert (=> b!119714 (=> (not res!99094) (not e!78431))))

(assert (=> b!119714 e!78431))

(declare-fun lt!185554 () tuple2!10022)

(assert (=> b!119714 (= lt!185554 lt!185557)))

(assert (=> b!119714 (= lt!185581 (appendNLeastSignificantBitsLoop!0 (_2!5276 lt!185554) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!185541 () Unit!7359)

(assert (=> b!119714 (= lt!185541 (lemmaIsPrefixTransitive!0 (_2!5276 lt!184991) (_2!5276 lt!185554) (_2!5276 lt!185581)))))

(assert (=> b!119714 (isPrefixOf!0 (_2!5276 lt!184991) (_2!5276 lt!185581))))

(declare-fun lt!185542 () Unit!7359)

(assert (=> b!119714 (= lt!185542 lt!185541)))

(assert (=> b!119714 (invariant!0 (currentBit!5507 (_2!5276 lt!184991)) (currentByte!5512 (_2!5276 lt!184991)) (size!2420 (buf!2845 (_2!5276 lt!185554))))))

(declare-fun lt!185552 () BitStream!4314)

(assert (=> b!119714 (= lt!185552 (BitStream!4315 (buf!2845 (_2!5276 lt!185554)) (currentByte!5512 (_2!5276 lt!184991)) (currentBit!5507 (_2!5276 lt!184991))))))

(assert (=> b!119714 (invariant!0 (currentBit!5507 lt!185552) (currentByte!5512 lt!185552) (size!2420 (buf!2845 (_2!5276 lt!185581))))))

(declare-fun lt!185547 () BitStream!4314)

(assert (=> b!119714 (= lt!185547 (BitStream!4315 (buf!2845 (_2!5276 lt!185581)) (currentByte!5512 lt!185552) (currentBit!5507 lt!185552)))))

(declare-fun lt!185566 () tuple2!10020)

(assert (=> b!119714 (= lt!185566 (readBitPure!0 lt!185552))))

(declare-fun lt!185567 () tuple2!10020)

(assert (=> b!119714 (= lt!185567 (readBitPure!0 lt!185547))))

(declare-fun lt!185576 () Unit!7359)

(assert (=> b!119714 (= lt!185576 (readBitPrefixLemma!0 lt!185552 (_2!5276 lt!185581)))))

(declare-fun res!99095 () Bool)

(assert (=> b!119714 (= res!99095 (= (bitIndex!0 (size!2420 (buf!2845 (_1!5275 lt!185566))) (currentByte!5512 (_1!5275 lt!185566)) (currentBit!5507 (_1!5275 lt!185566))) (bitIndex!0 (size!2420 (buf!2845 (_1!5275 lt!185567))) (currentByte!5512 (_1!5275 lt!185567)) (currentBit!5507 (_1!5275 lt!185567)))))))

(declare-fun e!78432 () Bool)

(assert (=> b!119714 (=> (not res!99095) (not e!78432))))

(assert (=> b!119714 e!78432))

(declare-fun lt!185558 () Unit!7359)

(assert (=> b!119714 (= lt!185558 lt!185576)))

(declare-fun lt!185575 () tuple2!10024)

(assert (=> b!119714 (= lt!185575 (reader!0 (_2!5276 lt!184991) (_2!5276 lt!185581)))))

(declare-fun lt!185565 () tuple2!10024)

(assert (=> b!119714 (= lt!185565 (reader!0 (_2!5276 lt!185554) (_2!5276 lt!185581)))))

(declare-fun lt!185545 () tuple2!10020)

(assert (=> b!119714 (= lt!185545 (readBitPure!0 (_1!5277 lt!185575)))))

(assert (=> b!119714 (= (_2!5275 lt!185545) lt!185569)))

(declare-fun lt!185561 () Unit!7359)

(declare-fun Unit!7367 () Unit!7359)

(assert (=> b!119714 (= lt!185561 Unit!7367)))

(declare-fun lt!185578 () (_ BitVec 64))

(assert (=> b!119714 (= lt!185578 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!185564 () (_ BitVec 64))

(assert (=> b!119714 (= lt!185564 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!185574 () Unit!7359)

(assert (=> b!119714 (= lt!185574 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5276 lt!184991) (buf!2845 (_2!5276 lt!185581)) lt!185564))))

(assert (=> b!119714 (validate_offset_bits!1 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!185581)))) ((_ sign_extend 32) (currentByte!5512 (_2!5276 lt!184991))) ((_ sign_extend 32) (currentBit!5507 (_2!5276 lt!184991))) lt!185564)))

(declare-fun lt!185571 () Unit!7359)

(assert (=> b!119714 (= lt!185571 lt!185574)))

(declare-fun lt!185568 () tuple2!10026)

(assert (=> b!119714 (= lt!185568 (readNLeastSignificantBitsLoopPure!0 (_1!5277 lt!185575) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185578))))

(declare-fun lt!185551 () (_ BitVec 64))

(assert (=> b!119714 (= lt!185551 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!185539 () Unit!7359)

(assert (=> b!119714 (= lt!185539 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5276 lt!185554) (buf!2845 (_2!5276 lt!185581)) lt!185551))))

(assert (=> b!119714 (validate_offset_bits!1 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!185581)))) ((_ sign_extend 32) (currentByte!5512 (_2!5276 lt!185554))) ((_ sign_extend 32) (currentBit!5507 (_2!5276 lt!185554))) lt!185551)))

(declare-fun lt!185544 () Unit!7359)

(assert (=> b!119714 (= lt!185544 lt!185539)))

(declare-fun lt!185563 () tuple2!10026)

(assert (=> b!119714 (= lt!185563 (readNLeastSignificantBitsLoopPure!0 (_1!5277 lt!185565) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!185578 (ite (_2!5275 lt!185545) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!185546 () tuple2!10026)

(assert (=> b!119714 (= lt!185546 (readNLeastSignificantBitsLoopPure!0 (_1!5277 lt!185575) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185578))))

(declare-fun c!7196 () Bool)

(assert (=> b!119714 (= c!7196 (_2!5275 (readBitPure!0 (_1!5277 lt!185575))))))

(declare-fun lt!185556 () tuple2!10026)

(assert (=> b!119714 (= lt!185556 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5277 lt!185575) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!185578 e!78429)))))

(declare-fun lt!185540 () Unit!7359)

(assert (=> b!119714 (= lt!185540 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5277 lt!185575) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185578))))

(assert (=> b!119714 (and (= (_2!5278 lt!185546) (_2!5278 lt!185556)) (= (_1!5278 lt!185546) (_1!5278 lt!185556)))))

(declare-fun lt!185553 () Unit!7359)

(assert (=> b!119714 (= lt!185553 lt!185540)))

(assert (=> b!119714 (= (_1!5277 lt!185575) (withMovedBitIndex!0 (_2!5277 lt!185575) (bvsub (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184991))) (currentByte!5512 (_2!5276 lt!184991)) (currentBit!5507 (_2!5276 lt!184991))) (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!185581))) (currentByte!5512 (_2!5276 lt!185581)) (currentBit!5507 (_2!5276 lt!185581))))))))

(declare-fun lt!185560 () Unit!7359)

(declare-fun Unit!7368 () Unit!7359)

(assert (=> b!119714 (= lt!185560 Unit!7368)))

(assert (=> b!119714 (= (_1!5277 lt!185565) (withMovedBitIndex!0 (_2!5277 lt!185565) (bvsub (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!185554))) (currentByte!5512 (_2!5276 lt!185554)) (currentBit!5507 (_2!5276 lt!185554))) (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!185581))) (currentByte!5512 (_2!5276 lt!185581)) (currentBit!5507 (_2!5276 lt!185581))))))))

(declare-fun lt!185577 () Unit!7359)

(declare-fun Unit!7369 () Unit!7359)

(assert (=> b!119714 (= lt!185577 Unit!7369)))

(assert (=> b!119714 (= (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!184991))) (currentByte!5512 (_2!5276 lt!184991)) (currentBit!5507 (_2!5276 lt!184991))) (bvsub (bitIndex!0 (size!2420 (buf!2845 (_2!5276 lt!185554))) (currentByte!5512 (_2!5276 lt!185554)) (currentBit!5507 (_2!5276 lt!185554))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!185559 () Unit!7359)

(declare-fun Unit!7370 () Unit!7359)

(assert (=> b!119714 (= lt!185559 Unit!7370)))

(assert (=> b!119714 (= (_2!5278 lt!185568) (_2!5278 lt!185563))))

(declare-fun lt!185582 () Unit!7359)

(declare-fun Unit!7371 () Unit!7359)

(assert (=> b!119714 (= lt!185582 Unit!7371)))

(assert (=> b!119714 (= (_1!5278 lt!185568) (_2!5277 lt!185575))))

(declare-fun b!119715 () Bool)

(assert (=> b!119715 (= e!78432 (= (_2!5275 lt!185566) (_2!5275 lt!185567)))))

(declare-fun b!119716 () Bool)

(declare-fun lt!185562 () Unit!7359)

(assert (=> b!119716 (= e!78430 (tuple2!10023 lt!185562 (_2!5276 lt!184991)))))

(assert (=> b!119716 (= lt!185570 (_2!5276 lt!184991))))

(assert (=> b!119716 (= lt!185562 (lemmaIsPrefixRefl!0 lt!185570))))

(assert (=> b!119716 call!1558))

(declare-fun b!119717 () Bool)

(assert (=> b!119717 (= e!78434 (validate_offset_bits!1 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184991)))) ((_ sign_extend 32) (currentByte!5512 (_2!5276 lt!184991))) ((_ sign_extend 32) (currentBit!5507 (_2!5276 lt!184991))) lt!185543))))

(declare-fun b!119718 () Bool)

(declare-fun res!99092 () Bool)

(assert (=> b!119718 (= res!99092 call!1558)))

(assert (=> b!119718 (=> (not res!99092) (not e!78431))))

(declare-fun b!119719 () Bool)

(assert (=> b!119719 (= lt!185549 (readBitPure!0 (readerFrom!0 (_2!5276 lt!185557) (currentBit!5507 (_2!5276 lt!184991)) (currentByte!5512 (_2!5276 lt!184991)))))))

(declare-fun res!99089 () Bool)

(assert (=> b!119719 (= res!99089 (and (= (_2!5275 lt!185549) lt!185569) (= (_1!5275 lt!185549) (_2!5276 lt!185557))))))

(assert (=> b!119719 (=> (not res!99089) (not e!78435))))

(assert (=> b!119719 (= e!78431 e!78435)))

(declare-fun b!119720 () Bool)

(assert (=> b!119720 (= e!78429 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(assert (= (and d!38428 c!7197) b!119714))

(assert (= (and d!38428 (not c!7197)) b!119716))

(assert (= (and b!119714 res!99094) b!119709))

(assert (= (and b!119709 res!99090) b!119718))

(assert (= (and b!119718 res!99092) b!119719))

(assert (= (and b!119719 res!99089) b!119711))

(assert (= (and b!119714 res!99095) b!119715))

(assert (= (and b!119714 c!7196) b!119720))

(assert (= (and b!119714 (not c!7196)) b!119713))

(assert (= (or b!119718 b!119716) bm!1555))

(assert (= (and d!38428 res!99093) b!119710))

(assert (= (and b!119710 res!99091) b!119712))

(assert (= (and b!119712 res!99097) b!119708))

(assert (= (and b!119708 res!99096) b!119717))

(declare-fun m!180401 () Bool)

(assert (=> b!119716 m!180401))

(declare-fun m!180403 () Bool)

(assert (=> b!119712 m!180403))

(declare-fun m!180405 () Bool)

(assert (=> b!119719 m!180405))

(assert (=> b!119719 m!180405))

(declare-fun m!180407 () Bool)

(assert (=> b!119719 m!180407))

(declare-fun m!180409 () Bool)

(assert (=> b!119709 m!180409))

(assert (=> b!119709 m!180055))

(declare-fun m!180411 () Bool)

(assert (=> b!119714 m!180411))

(declare-fun m!180413 () Bool)

(assert (=> b!119714 m!180413))

(declare-fun m!180415 () Bool)

(assert (=> b!119714 m!180415))

(declare-fun m!180417 () Bool)

(assert (=> b!119714 m!180417))

(declare-fun m!180419 () Bool)

(assert (=> b!119714 m!180419))

(declare-fun m!180421 () Bool)

(assert (=> b!119714 m!180421))

(declare-fun m!180423 () Bool)

(assert (=> b!119714 m!180423))

(declare-fun m!180425 () Bool)

(assert (=> b!119714 m!180425))

(declare-fun m!180427 () Bool)

(assert (=> b!119714 m!180427))

(declare-fun m!180429 () Bool)

(assert (=> b!119714 m!180429))

(declare-fun m!180431 () Bool)

(assert (=> b!119714 m!180431))

(declare-fun m!180433 () Bool)

(assert (=> b!119714 m!180433))

(declare-fun m!180435 () Bool)

(assert (=> b!119714 m!180435))

(declare-fun m!180437 () Bool)

(assert (=> b!119714 m!180437))

(declare-fun m!180439 () Bool)

(assert (=> b!119714 m!180439))

(declare-fun m!180441 () Bool)

(assert (=> b!119714 m!180441))

(assert (=> b!119714 m!180055))

(declare-fun m!180443 () Bool)

(assert (=> b!119714 m!180443))

(declare-fun m!180445 () Bool)

(assert (=> b!119714 m!180445))

(declare-fun m!180447 () Bool)

(assert (=> b!119714 m!180447))

(declare-fun m!180449 () Bool)

(assert (=> b!119714 m!180449))

(declare-fun m!180451 () Bool)

(assert (=> b!119714 m!180451))

(declare-fun m!180453 () Bool)

(assert (=> b!119714 m!180453))

(declare-fun m!180455 () Bool)

(assert (=> b!119714 m!180455))

(declare-fun m!180457 () Bool)

(assert (=> b!119714 m!180457))

(declare-fun m!180459 () Bool)

(assert (=> b!119714 m!180459))

(assert (=> b!119714 m!180455))

(declare-fun m!180461 () Bool)

(assert (=> b!119714 m!180461))

(declare-fun m!180463 () Bool)

(assert (=> b!119714 m!180463))

(declare-fun m!180465 () Bool)

(assert (=> b!119714 m!180465))

(declare-fun m!180467 () Bool)

(assert (=> b!119711 m!180467))

(assert (=> b!119711 m!180409))

(declare-fun m!180469 () Bool)

(assert (=> bm!1555 m!180469))

(declare-fun m!180471 () Bool)

(assert (=> b!119717 m!180471))

(assert (=> b!119708 m!180445))

(declare-fun m!180473 () Bool)

(assert (=> b!119708 m!180473))

(declare-fun m!180475 () Bool)

(assert (=> b!119708 m!180475))

(declare-fun m!180477 () Bool)

(assert (=> b!119708 m!180477))

(declare-fun m!180479 () Bool)

(assert (=> b!119708 m!180479))

(declare-fun m!180481 () Bool)

(assert (=> b!119710 m!180481))

(assert (=> b!119710 m!180055))

(assert (=> b!119523 d!38428))

(declare-fun d!38442 () Bool)

(assert (=> d!38442 (validate_offset_bits!1 ((_ sign_extend 32) (size!2420 (buf!2845 (_2!5276 lt!184975)))) ((_ sign_extend 32) (currentByte!5512 thiss!1305)) ((_ sign_extend 32) (currentBit!5507 thiss!1305)) lt!184993)))

(declare-fun lt!185584 () Unit!7359)

(assert (=> d!38442 (= lt!185584 (choose!9 thiss!1305 (buf!2845 (_2!5276 lt!184975)) lt!184993 (BitStream!4315 (buf!2845 (_2!5276 lt!184975)) (currentByte!5512 thiss!1305) (currentBit!5507 thiss!1305))))))

(assert (=> d!38442 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2845 (_2!5276 lt!184975)) lt!184993) lt!185584)))

(declare-fun bs!9305 () Bool)

(assert (= bs!9305 d!38442))

(assert (=> bs!9305 m!180085))

(declare-fun m!180483 () Bool)

(assert (=> bs!9305 m!180483))

(assert (=> b!119523 d!38442))

(check-sat (not d!38356) (not b!119625) (not d!38368) (not d!38348) (not d!38354) (not d!38412) (not d!38332) (not b!119624) (not d!38422) (not b!119714) (not b!119632) (not b!119717) (not d!38342) (not b!119710) (not d!38370) (not d!38402) (not b!119592) (not d!38420) (not d!38372) (not d!38346) (not b!119605) (not d!38378) (not b!119716) (not b!119712) (not b!119623) (not b!119631) (not d!38334) (not d!38374) (not b!119711) (not b!119708) (not d!38360) (not b!119628) (not d!38408) (not d!38404) (not d!38400) (not b!119607) (not b!119719) (not b!119606) (not b!119621) (not d!38336) (not b!119583) (not b!119604) (not d!38340) (not d!38426) (not b!119590) (not b!119635) (not bm!1555) (not d!38376) (not b!119630) (not b!119709) (not b!119633) (not d!38338) (not d!38424) (not d!38344) (not d!38442))
