; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23334 () Bool)

(assert start!23334)

(declare-fun b!118546 () Bool)

(declare-fun e!77716 () Bool)

(declare-fun e!77711 () Bool)

(assert (=> b!118546 (= e!77716 e!77711)))

(declare-fun res!98113 () Bool)

(assert (=> b!118546 (=> (not res!98113) (not e!77711))))

(declare-fun lt!182374 () (_ BitVec 64))

(declare-fun lt!182371 () (_ BitVec 64))

(assert (=> b!118546 (= res!98113 (= lt!182374 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!182371)))))

(declare-datatypes ((array!5319 0))(
  ( (array!5320 (arr!3005 (Array (_ BitVec 32) (_ BitVec 8))) (size!2412 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4298 0))(
  ( (BitStream!4299 (buf!2831 array!5319) (currentByte!5486 (_ BitVec 32)) (currentBit!5481 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7295 0))(
  ( (Unit!7296) )
))
(declare-datatypes ((tuple2!9932 0))(
  ( (tuple2!9933 (_1!5231 Unit!7295) (_2!5231 BitStream!4298)) )
))
(declare-fun lt!182369 () tuple2!9932)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118546 (= lt!182374 (bitIndex!0 (size!2412 (buf!2831 (_2!5231 lt!182369))) (currentByte!5486 (_2!5231 lt!182369)) (currentBit!5481 (_2!5231 lt!182369))))))

(declare-fun thiss!1305 () BitStream!4298)

(assert (=> b!118546 (= lt!182371 (bitIndex!0 (size!2412 (buf!2831 thiss!1305)) (currentByte!5486 thiss!1305) (currentBit!5481 thiss!1305)))))

(declare-fun res!98115 () Bool)

(declare-fun e!77708 () Bool)

(assert (=> start!23334 (=> (not res!98115) (not e!77708))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!23334 (= res!98115 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23334 e!77708))

(assert (=> start!23334 true))

(declare-fun e!77712 () Bool)

(declare-fun inv!12 (BitStream!4298) Bool)

(assert (=> start!23334 (and (inv!12 thiss!1305) e!77712)))

(declare-fun b!118547 () Bool)

(declare-fun lt!182386 () (_ BitVec 64))

(declare-fun lt!182381 () (_ BitVec 64))

(declare-fun e!77710 () Bool)

(declare-fun lt!182378 () (_ BitVec 64))

(assert (=> b!118547 (= e!77710 (or (not (= (bvand lt!182386 lt!182381) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182386 lt!182378) lt!182386)))))

(declare-fun b!118548 () Bool)

(declare-fun e!77714 () Bool)

(assert (=> b!118548 (= e!77714 (not e!77710))))

(declare-fun res!98112 () Bool)

(assert (=> b!118548 (=> res!98112 e!77710)))

(declare-datatypes ((tuple2!9934 0))(
  ( (tuple2!9935 (_1!5232 BitStream!4298) (_2!5232 BitStream!4298)) )
))
(declare-fun lt!182383 () tuple2!9934)

(declare-datatypes ((tuple2!9936 0))(
  ( (tuple2!9937 (_1!5233 BitStream!4298) (_2!5233 Bool)) )
))
(declare-fun lt!182373 () tuple2!9936)

(declare-fun lt!182375 () (_ BitVec 64))

(declare-datatypes ((tuple2!9938 0))(
  ( (tuple2!9939 (_1!5234 BitStream!4298) (_2!5234 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9938)

(assert (=> b!118548 (= res!98112 (not (= (_1!5234 (readNLeastSignificantBitsLoopPure!0 (_1!5232 lt!182383) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!182386 (ite (_2!5233 lt!182373) lt!182375 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5232 lt!182383))))))

(declare-fun lt!182376 () tuple2!9932)

(declare-fun lt!182370 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118548 (validate_offset_bits!1 ((_ sign_extend 32) (size!2412 (buf!2831 (_2!5231 lt!182376)))) ((_ sign_extend 32) (currentByte!5486 (_2!5231 lt!182369))) ((_ sign_extend 32) (currentBit!5481 (_2!5231 lt!182369))) lt!182370)))

(declare-fun lt!182382 () Unit!7295)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4298 array!5319 (_ BitVec 64)) Unit!7295)

(assert (=> b!118548 (= lt!182382 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5231 lt!182369) (buf!2831 (_2!5231 lt!182376)) lt!182370))))

(assert (=> b!118548 (= lt!182370 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!182380 () tuple2!9934)

(declare-fun lt!182385 () tuple2!9938)

(assert (=> b!118548 (= lt!182385 (readNLeastSignificantBitsLoopPure!0 (_1!5232 lt!182380) nBits!396 i!615 lt!182386))))

(declare-fun lt!182388 () (_ BitVec 64))

(assert (=> b!118548 (validate_offset_bits!1 ((_ sign_extend 32) (size!2412 (buf!2831 (_2!5231 lt!182376)))) ((_ sign_extend 32) (currentByte!5486 thiss!1305)) ((_ sign_extend 32) (currentBit!5481 thiss!1305)) lt!182388)))

(declare-fun lt!182391 () Unit!7295)

(assert (=> b!118548 (= lt!182391 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2831 (_2!5231 lt!182376)) lt!182388))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!118548 (= lt!182386 (bvand v!199 (bvnot lt!182381)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118548 (= lt!182381 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun lt!182390 () Bool)

(assert (=> b!118548 (= (_2!5233 lt!182373) lt!182390)))

(declare-fun readBitPure!0 (BitStream!4298) tuple2!9936)

(assert (=> b!118548 (= lt!182373 (readBitPure!0 (_1!5232 lt!182380)))))

(declare-fun reader!0 (BitStream!4298 BitStream!4298) tuple2!9934)

(assert (=> b!118548 (= lt!182383 (reader!0 (_2!5231 lt!182369) (_2!5231 lt!182376)))))

(assert (=> b!118548 (= lt!182380 (reader!0 thiss!1305 (_2!5231 lt!182376)))))

(declare-fun e!77709 () Bool)

(assert (=> b!118548 e!77709))

(declare-fun res!98111 () Bool)

(assert (=> b!118548 (=> (not res!98111) (not e!77709))))

(declare-fun lt!182379 () tuple2!9936)

(declare-fun lt!182384 () tuple2!9936)

(assert (=> b!118548 (= res!98111 (= (bitIndex!0 (size!2412 (buf!2831 (_1!5233 lt!182379))) (currentByte!5486 (_1!5233 lt!182379)) (currentBit!5481 (_1!5233 lt!182379))) (bitIndex!0 (size!2412 (buf!2831 (_1!5233 lt!182384))) (currentByte!5486 (_1!5233 lt!182384)) (currentBit!5481 (_1!5233 lt!182384)))))))

(declare-fun lt!182372 () Unit!7295)

(declare-fun lt!182389 () BitStream!4298)

(declare-fun readBitPrefixLemma!0 (BitStream!4298 BitStream!4298) Unit!7295)

(assert (=> b!118548 (= lt!182372 (readBitPrefixLemma!0 lt!182389 (_2!5231 lt!182376)))))

(assert (=> b!118548 (= lt!182384 (readBitPure!0 (BitStream!4299 (buf!2831 (_2!5231 lt!182376)) (currentByte!5486 thiss!1305) (currentBit!5481 thiss!1305))))))

(assert (=> b!118548 (= lt!182379 (readBitPure!0 lt!182389))))

(assert (=> b!118548 (= lt!182389 (BitStream!4299 (buf!2831 (_2!5231 lt!182369)) (currentByte!5486 thiss!1305) (currentBit!5481 thiss!1305)))))

(declare-fun e!77718 () Bool)

(assert (=> b!118548 e!77718))

(declare-fun res!98108 () Bool)

(assert (=> b!118548 (=> (not res!98108) (not e!77718))))

(declare-fun isPrefixOf!0 (BitStream!4298 BitStream!4298) Bool)

(assert (=> b!118548 (= res!98108 (isPrefixOf!0 thiss!1305 (_2!5231 lt!182376)))))

(declare-fun lt!182377 () Unit!7295)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4298 BitStream!4298 BitStream!4298) Unit!7295)

(assert (=> b!118548 (= lt!182377 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5231 lt!182369) (_2!5231 lt!182376)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4298 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9932)

(assert (=> b!118548 (= lt!182376 (appendNLeastSignificantBitsLoop!0 (_2!5231 lt!182369) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!118548 e!77716))

(declare-fun res!98105 () Bool)

(assert (=> b!118548 (=> (not res!98105) (not e!77716))))

(assert (=> b!118548 (= res!98105 (= (size!2412 (buf!2831 thiss!1305)) (size!2412 (buf!2831 (_2!5231 lt!182369)))))))

(declare-fun appendBit!0 (BitStream!4298 Bool) tuple2!9932)

(assert (=> b!118548 (= lt!182369 (appendBit!0 thiss!1305 lt!182390))))

(assert (=> b!118548 (= lt!182390 (not (= (bvand v!199 lt!182375) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118548 (= lt!182375 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!118549 () Bool)

(declare-fun array_inv!2214 (array!5319) Bool)

(assert (=> b!118549 (= e!77712 (array_inv!2214 (buf!2831 thiss!1305)))))

(declare-fun b!118550 () Bool)

(assert (=> b!118550 (= e!77709 (= (_2!5233 lt!182379) (_2!5233 lt!182384)))))

(declare-fun b!118551 () Bool)

(declare-fun e!77717 () Bool)

(declare-fun lt!182387 () tuple2!9936)

(assert (=> b!118551 (= e!77717 (= (bitIndex!0 (size!2412 (buf!2831 (_1!5233 lt!182387))) (currentByte!5486 (_1!5233 lt!182387)) (currentBit!5481 (_1!5233 lt!182387))) lt!182374))))

(declare-fun b!118552 () Bool)

(assert (=> b!118552 (= e!77711 e!77717)))

(declare-fun res!98104 () Bool)

(assert (=> b!118552 (=> (not res!98104) (not e!77717))))

(assert (=> b!118552 (= res!98104 (and (= (_2!5233 lt!182387) lt!182390) (= (_1!5233 lt!182387) (_2!5231 lt!182369))))))

(declare-fun readerFrom!0 (BitStream!4298 (_ BitVec 32) (_ BitVec 32)) BitStream!4298)

(assert (=> b!118552 (= lt!182387 (readBitPure!0 (readerFrom!0 (_2!5231 lt!182369) (currentBit!5481 thiss!1305) (currentByte!5486 thiss!1305))))))

(declare-fun b!118553 () Bool)

(declare-fun res!98107 () Bool)

(assert (=> b!118553 (=> (not res!98107) (not e!77711))))

(assert (=> b!118553 (= res!98107 (isPrefixOf!0 thiss!1305 (_2!5231 lt!182369)))))

(declare-fun b!118554 () Bool)

(declare-fun res!98114 () Bool)

(assert (=> b!118554 (=> res!98114 e!77710)))

(assert (=> b!118554 (= res!98114 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2412 (buf!2831 (_1!5232 lt!182380)))) ((_ sign_extend 32) (currentByte!5486 (_1!5232 lt!182380))) ((_ sign_extend 32) (currentBit!5481 (_1!5232 lt!182380))) lt!182388)))))

(declare-fun b!118555 () Bool)

(declare-fun e!77713 () Bool)

(assert (=> b!118555 (= e!77713 e!77714)))

(declare-fun res!98109 () Bool)

(assert (=> b!118555 (=> (not res!98109) (not e!77714))))

(assert (=> b!118555 (= res!98109 (and (= (bvand v!199 lt!182378) v!199) (bvslt i!615 nBits!396)))))

(assert (=> b!118555 (= lt!182378 (onesLSBLong!0 nBits!396))))

(declare-fun b!118556 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!118556 (= e!77718 (invariant!0 (currentBit!5481 thiss!1305) (currentByte!5486 thiss!1305) (size!2412 (buf!2831 (_2!5231 lt!182376)))))))

(declare-fun b!118557 () Bool)

(declare-fun res!98106 () Bool)

(assert (=> b!118557 (=> (not res!98106) (not e!77718))))

(assert (=> b!118557 (= res!98106 (invariant!0 (currentBit!5481 thiss!1305) (currentByte!5486 thiss!1305) (size!2412 (buf!2831 (_2!5231 lt!182369)))))))

(declare-fun b!118558 () Bool)

(assert (=> b!118558 (= e!77708 e!77713)))

(declare-fun res!98110 () Bool)

(assert (=> b!118558 (=> (not res!98110) (not e!77713))))

(assert (=> b!118558 (= res!98110 (validate_offset_bits!1 ((_ sign_extend 32) (size!2412 (buf!2831 thiss!1305))) ((_ sign_extend 32) (currentByte!5486 thiss!1305)) ((_ sign_extend 32) (currentBit!5481 thiss!1305)) lt!182388))))

(assert (=> b!118558 (= lt!182388 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!23334 res!98115) b!118558))

(assert (= (and b!118558 res!98110) b!118555))

(assert (= (and b!118555 res!98109) b!118548))

(assert (= (and b!118548 res!98105) b!118546))

(assert (= (and b!118546 res!98113) b!118553))

(assert (= (and b!118553 res!98107) b!118552))

(assert (= (and b!118552 res!98104) b!118551))

(assert (= (and b!118548 res!98108) b!118557))

(assert (= (and b!118557 res!98106) b!118556))

(assert (= (and b!118548 res!98111) b!118550))

(assert (= (and b!118548 (not res!98112)) b!118554))

(assert (= (and b!118554 (not res!98114)) b!118547))

(assert (= start!23334 b!118549))

(declare-fun m!178093 () Bool)

(assert (=> b!118552 m!178093))

(assert (=> b!118552 m!178093))

(declare-fun m!178095 () Bool)

(assert (=> b!118552 m!178095))

(declare-fun m!178097 () Bool)

(assert (=> b!118548 m!178097))

(declare-fun m!178099 () Bool)

(assert (=> b!118548 m!178099))

(declare-fun m!178101 () Bool)

(assert (=> b!118548 m!178101))

(declare-fun m!178103 () Bool)

(assert (=> b!118548 m!178103))

(declare-fun m!178105 () Bool)

(assert (=> b!118548 m!178105))

(declare-fun m!178107 () Bool)

(assert (=> b!118548 m!178107))

(declare-fun m!178109 () Bool)

(assert (=> b!118548 m!178109))

(declare-fun m!178111 () Bool)

(assert (=> b!118548 m!178111))

(declare-fun m!178113 () Bool)

(assert (=> b!118548 m!178113))

(declare-fun m!178115 () Bool)

(assert (=> b!118548 m!178115))

(declare-fun m!178117 () Bool)

(assert (=> b!118548 m!178117))

(declare-fun m!178119 () Bool)

(assert (=> b!118548 m!178119))

(declare-fun m!178121 () Bool)

(assert (=> b!118548 m!178121))

(declare-fun m!178123 () Bool)

(assert (=> b!118548 m!178123))

(declare-fun m!178125 () Bool)

(assert (=> b!118548 m!178125))

(declare-fun m!178127 () Bool)

(assert (=> b!118548 m!178127))

(declare-fun m!178129 () Bool)

(assert (=> b!118548 m!178129))

(declare-fun m!178131 () Bool)

(assert (=> b!118548 m!178131))

(declare-fun m!178133 () Bool)

(assert (=> b!118548 m!178133))

(declare-fun m!178135 () Bool)

(assert (=> b!118555 m!178135))

(declare-fun m!178137 () Bool)

(assert (=> b!118554 m!178137))

(declare-fun m!178139 () Bool)

(assert (=> b!118557 m!178139))

(declare-fun m!178141 () Bool)

(assert (=> b!118556 m!178141))

(declare-fun m!178143 () Bool)

(assert (=> b!118546 m!178143))

(declare-fun m!178145 () Bool)

(assert (=> b!118546 m!178145))

(declare-fun m!178147 () Bool)

(assert (=> b!118551 m!178147))

(declare-fun m!178149 () Bool)

(assert (=> b!118549 m!178149))

(declare-fun m!178151 () Bool)

(assert (=> b!118553 m!178151))

(declare-fun m!178153 () Bool)

(assert (=> start!23334 m!178153))

(declare-fun m!178155 () Bool)

(assert (=> b!118558 m!178155))

(push 1)

(assert (not b!118558))

(assert (not b!118549))

(assert (not b!118548))

(assert (not b!118546))

(assert (not b!118556))

(assert (not b!118551))

(assert (not b!118555))

(assert (not start!23334))

(assert (not b!118554))

(assert (not b!118552))

(assert (not b!118557))

(assert (not b!118553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

