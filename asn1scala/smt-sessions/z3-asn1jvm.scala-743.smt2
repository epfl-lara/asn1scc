; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21008 () Bool)

(assert start!21008)

(declare-fun b!106067 () Bool)

(declare-fun e!69448 () Bool)

(declare-datatypes ((array!4895 0))(
  ( (array!4896 (arr!2824 (Array (_ BitVec 32) (_ BitVec 8))) (size!2231 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3936 0))(
  ( (BitStream!3937 (buf!2607 array!4895) (currentByte!5113 (_ BitVec 32)) (currentBit!5108 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8726 0))(
  ( (tuple2!8727 (_1!4620 BitStream!3936) (_2!4620 Bool)) )
))
(declare-fun lt!157139 () tuple2!8726)

(declare-fun lt!157144 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106067 (= e!69448 (= (bitIndex!0 (size!2231 (buf!2607 (_1!4620 lt!157139))) (currentByte!5113 (_1!4620 lt!157139)) (currentBit!5108 (_1!4620 lt!157139))) lt!157144))))

(declare-fun b!106068 () Bool)

(declare-fun e!69454 () Bool)

(declare-fun e!69455 () Bool)

(assert (=> b!106068 (= e!69454 e!69455)))

(declare-fun res!87367 () Bool)

(assert (=> b!106068 (=> (not res!87367) (not e!69455))))

(declare-fun thiss!1305 () BitStream!3936)

(declare-fun lt!157143 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!106068 (= res!87367 (validate_offset_bits!1 ((_ sign_extend 32) (size!2231 (buf!2607 thiss!1305))) ((_ sign_extend 32) (currentByte!5113 thiss!1305)) ((_ sign_extend 32) (currentBit!5108 thiss!1305)) lt!157143))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!106068 (= lt!157143 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!106069 () Bool)

(declare-fun res!87362 () Bool)

(declare-fun e!69453 () Bool)

(assert (=> b!106069 (=> (not res!87362) (not e!69453))))

(declare-datatypes ((Unit!6500 0))(
  ( (Unit!6501) )
))
(declare-datatypes ((tuple2!8728 0))(
  ( (tuple2!8729 (_1!4621 Unit!6500) (_2!4621 BitStream!3936)) )
))
(declare-fun lt!157150 () tuple2!8728)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!106069 (= res!87362 (invariant!0 (currentBit!5108 thiss!1305) (currentByte!5113 thiss!1305) (size!2231 (buf!2607 (_2!4621 lt!157150)))))))

(declare-fun b!106070 () Bool)

(declare-fun lt!157130 () tuple2!8728)

(assert (=> b!106070 (= e!69453 (invariant!0 (currentBit!5108 thiss!1305) (currentByte!5113 thiss!1305) (size!2231 (buf!2607 (_2!4621 lt!157130)))))))

(declare-fun b!106066 () Bool)

(declare-fun e!69450 () Bool)

(assert (=> b!106066 (= e!69450 (invariant!0 (currentBit!5108 (_2!4621 lt!157130)) (currentByte!5113 (_2!4621 lt!157130)) (size!2231 (buf!2607 (_2!4621 lt!157130)))))))

(declare-fun lt!157145 () (_ BitVec 64))

(assert (=> b!106066 (= lt!157145 (bitIndex!0 (size!2231 (buf!2607 (_2!4621 lt!157150))) (currentByte!5113 (_2!4621 lt!157150)) (currentBit!5108 (_2!4621 lt!157150))))))

(declare-fun e!69447 () Bool)

(assert (=> b!106066 e!69447))

(declare-fun res!87364 () Bool)

(assert (=> b!106066 (=> (not res!87364) (not e!69447))))

(declare-datatypes ((tuple2!8730 0))(
  ( (tuple2!8731 (_1!4622 BitStream!3936) (_2!4622 (_ BitVec 64))) )
))
(declare-fun lt!157146 () tuple2!8730)

(declare-fun lt!157149 () tuple2!8730)

(assert (=> b!106066 (= res!87364 (and (= (_2!4622 lt!157146) (_2!4622 lt!157149)) (= (_1!4622 lt!157146) (_1!4622 lt!157149))))))

(declare-fun lt!157131 () (_ BitVec 64))

(declare-datatypes ((tuple2!8732 0))(
  ( (tuple2!8733 (_1!4623 BitStream!3936) (_2!4623 BitStream!3936)) )
))
(declare-fun lt!157142 () tuple2!8732)

(declare-fun lt!157140 () Unit!6500)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6500)

(assert (=> b!106066 (= lt!157140 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4623 lt!157142) nBits!396 i!615 lt!157131))))

(declare-fun lt!157138 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8730)

(declare-fun withMovedBitIndex!0 (BitStream!3936 (_ BitVec 64)) BitStream!3936)

(assert (=> b!106066 (= lt!157149 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4623 lt!157142) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157138))))

(declare-fun res!87368 () Bool)

(assert (=> start!21008 (=> (not res!87368) (not e!69454))))

(assert (=> start!21008 (= res!87368 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21008 e!69454))

(assert (=> start!21008 true))

(declare-fun e!69451 () Bool)

(declare-fun inv!12 (BitStream!3936) Bool)

(assert (=> start!21008 (and (inv!12 thiss!1305) e!69451)))

(declare-fun b!106071 () Bool)

(declare-fun res!87360 () Bool)

(assert (=> b!106071 (=> (not res!87360) (not e!69455))))

(assert (=> b!106071 (= res!87360 (bvslt i!615 nBits!396))))

(declare-fun b!106072 () Bool)

(assert (=> b!106072 (= e!69455 (not e!69450))))

(declare-fun res!87366 () Bool)

(assert (=> b!106072 (=> res!87366 e!69450)))

(declare-fun lt!157147 () tuple2!8732)

(assert (=> b!106072 (= res!87366 (not (= (_1!4622 (readNLeastSignificantBitsLoopPure!0 (_1!4623 lt!157147) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!157138)) (_2!4623 lt!157147))))))

(declare-fun lt!157141 () (_ BitVec 64))

(assert (=> b!106072 (validate_offset_bits!1 ((_ sign_extend 32) (size!2231 (buf!2607 (_2!4621 lt!157130)))) ((_ sign_extend 32) (currentByte!5113 (_2!4621 lt!157150))) ((_ sign_extend 32) (currentBit!5108 (_2!4621 lt!157150))) lt!157141)))

(declare-fun lt!157133 () Unit!6500)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3936 array!4895 (_ BitVec 64)) Unit!6500)

(assert (=> b!106072 (= lt!157133 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4621 lt!157150) (buf!2607 (_2!4621 lt!157130)) lt!157141))))

(assert (=> b!106072 (= lt!157141 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!157129 () tuple2!8726)

(declare-fun lt!157128 () (_ BitVec 64))

(assert (=> b!106072 (= lt!157138 (bvor lt!157131 (ite (_2!4620 lt!157129) lt!157128 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106072 (= lt!157146 (readNLeastSignificantBitsLoopPure!0 (_1!4623 lt!157142) nBits!396 i!615 lt!157131))))

(assert (=> b!106072 (validate_offset_bits!1 ((_ sign_extend 32) (size!2231 (buf!2607 (_2!4621 lt!157130)))) ((_ sign_extend 32) (currentByte!5113 thiss!1305)) ((_ sign_extend 32) (currentBit!5108 thiss!1305)) lt!157143)))

(declare-fun lt!157134 () Unit!6500)

(assert (=> b!106072 (= lt!157134 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2607 (_2!4621 lt!157130)) lt!157143))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106072 (= lt!157131 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!157132 () Bool)

(assert (=> b!106072 (= (_2!4620 lt!157129) lt!157132)))

(declare-fun readBitPure!0 (BitStream!3936) tuple2!8726)

(assert (=> b!106072 (= lt!157129 (readBitPure!0 (_1!4623 lt!157142)))))

(declare-fun reader!0 (BitStream!3936 BitStream!3936) tuple2!8732)

(assert (=> b!106072 (= lt!157147 (reader!0 (_2!4621 lt!157150) (_2!4621 lt!157130)))))

(assert (=> b!106072 (= lt!157142 (reader!0 thiss!1305 (_2!4621 lt!157130)))))

(declare-fun e!69449 () Bool)

(assert (=> b!106072 e!69449))

(declare-fun res!87361 () Bool)

(assert (=> b!106072 (=> (not res!87361) (not e!69449))))

(declare-fun lt!157137 () tuple2!8726)

(declare-fun lt!157127 () tuple2!8726)

(assert (=> b!106072 (= res!87361 (= (bitIndex!0 (size!2231 (buf!2607 (_1!4620 lt!157137))) (currentByte!5113 (_1!4620 lt!157137)) (currentBit!5108 (_1!4620 lt!157137))) (bitIndex!0 (size!2231 (buf!2607 (_1!4620 lt!157127))) (currentByte!5113 (_1!4620 lt!157127)) (currentBit!5108 (_1!4620 lt!157127)))))))

(declare-fun lt!157148 () Unit!6500)

(declare-fun lt!157126 () BitStream!3936)

(declare-fun readBitPrefixLemma!0 (BitStream!3936 BitStream!3936) Unit!6500)

(assert (=> b!106072 (= lt!157148 (readBitPrefixLemma!0 lt!157126 (_2!4621 lt!157130)))))

(assert (=> b!106072 (= lt!157127 (readBitPure!0 (BitStream!3937 (buf!2607 (_2!4621 lt!157130)) (currentByte!5113 thiss!1305) (currentBit!5108 thiss!1305))))))

(assert (=> b!106072 (= lt!157137 (readBitPure!0 lt!157126))))

(assert (=> b!106072 (= lt!157126 (BitStream!3937 (buf!2607 (_2!4621 lt!157150)) (currentByte!5113 thiss!1305) (currentBit!5108 thiss!1305)))))

(assert (=> b!106072 e!69453))

(declare-fun res!87357 () Bool)

(assert (=> b!106072 (=> (not res!87357) (not e!69453))))

(declare-fun isPrefixOf!0 (BitStream!3936 BitStream!3936) Bool)

(assert (=> b!106072 (= res!87357 (isPrefixOf!0 thiss!1305 (_2!4621 lt!157130)))))

(declare-fun lt!157136 () Unit!6500)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3936 BitStream!3936 BitStream!3936) Unit!6500)

(assert (=> b!106072 (= lt!157136 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4621 lt!157150) (_2!4621 lt!157130)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3936 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8728)

(assert (=> b!106072 (= lt!157130 (appendNLeastSignificantBitsLoop!0 (_2!4621 lt!157150) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!69446 () Bool)

(assert (=> b!106072 e!69446))

(declare-fun res!87365 () Bool)

(assert (=> b!106072 (=> (not res!87365) (not e!69446))))

(assert (=> b!106072 (= res!87365 (= (size!2231 (buf!2607 thiss!1305)) (size!2231 (buf!2607 (_2!4621 lt!157150)))))))

(declare-fun appendBit!0 (BitStream!3936 Bool) tuple2!8728)

(assert (=> b!106072 (= lt!157150 (appendBit!0 thiss!1305 lt!157132))))

(assert (=> b!106072 (= lt!157132 (not (= (bvand v!199 lt!157128) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106072 (= lt!157128 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!106073 () Bool)

(assert (=> b!106073 (= e!69447 (= (_1!4623 lt!157142) (withMovedBitIndex!0 (_2!4623 lt!157142) (bvsub (bitIndex!0 (size!2231 (buf!2607 thiss!1305)) (currentByte!5113 thiss!1305) (currentBit!5108 thiss!1305)) (bitIndex!0 (size!2231 (buf!2607 (_2!4621 lt!157130))) (currentByte!5113 (_2!4621 lt!157130)) (currentBit!5108 (_2!4621 lt!157130)))))))))

(declare-fun b!106074 () Bool)

(assert (=> b!106074 (= e!69449 (= (_2!4620 lt!157137) (_2!4620 lt!157127)))))

(declare-fun b!106075 () Bool)

(declare-fun e!69452 () Bool)

(assert (=> b!106075 (= e!69446 e!69452)))

(declare-fun res!87369 () Bool)

(assert (=> b!106075 (=> (not res!87369) (not e!69452))))

(declare-fun lt!157135 () (_ BitVec 64))

(assert (=> b!106075 (= res!87369 (= lt!157144 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!157135)))))

(assert (=> b!106075 (= lt!157144 (bitIndex!0 (size!2231 (buf!2607 (_2!4621 lt!157150))) (currentByte!5113 (_2!4621 lt!157150)) (currentBit!5108 (_2!4621 lt!157150))))))

(assert (=> b!106075 (= lt!157135 (bitIndex!0 (size!2231 (buf!2607 thiss!1305)) (currentByte!5113 thiss!1305) (currentBit!5108 thiss!1305)))))

(declare-fun b!106076 () Bool)

(declare-fun array_inv!2033 (array!4895) Bool)

(assert (=> b!106076 (= e!69451 (array_inv!2033 (buf!2607 thiss!1305)))))

(declare-fun b!106077 () Bool)

(declare-fun res!87358 () Bool)

(assert (=> b!106077 (=> (not res!87358) (not e!69452))))

(assert (=> b!106077 (= res!87358 (isPrefixOf!0 thiss!1305 (_2!4621 lt!157150)))))

(declare-fun b!106078 () Bool)

(declare-fun res!87359 () Bool)

(assert (=> b!106078 (=> (not res!87359) (not e!69455))))

(assert (=> b!106078 (= res!87359 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!106079 () Bool)

(assert (=> b!106079 (= e!69452 e!69448)))

(declare-fun res!87363 () Bool)

(assert (=> b!106079 (=> (not res!87363) (not e!69448))))

(assert (=> b!106079 (= res!87363 (and (= (_2!4620 lt!157139) lt!157132) (= (_1!4620 lt!157139) (_2!4621 lt!157150))))))

(declare-fun readerFrom!0 (BitStream!3936 (_ BitVec 32) (_ BitVec 32)) BitStream!3936)

(assert (=> b!106079 (= lt!157139 (readBitPure!0 (readerFrom!0 (_2!4621 lt!157150) (currentBit!5108 thiss!1305) (currentByte!5113 thiss!1305))))))

(assert (= (and start!21008 res!87368) b!106068))

(assert (= (and b!106068 res!87367) b!106078))

(assert (= (and b!106078 res!87359) b!106071))

(assert (= (and b!106071 res!87360) b!106072))

(assert (= (and b!106072 res!87365) b!106075))

(assert (= (and b!106075 res!87369) b!106077))

(assert (= (and b!106077 res!87358) b!106079))

(assert (= (and b!106079 res!87363) b!106067))

(assert (= (and b!106072 res!87357) b!106069))

(assert (= (and b!106069 res!87362) b!106070))

(assert (= (and b!106072 res!87361) b!106074))

(assert (= (and b!106072 (not res!87366)) b!106066))

(assert (= (and b!106066 res!87364) b!106073))

(assert (= start!21008 b!106076))

(declare-fun m!156069 () Bool)

(assert (=> b!106076 m!156069))

(declare-fun m!156071 () Bool)

(assert (=> b!106073 m!156071))

(declare-fun m!156073 () Bool)

(assert (=> b!106073 m!156073))

(declare-fun m!156075 () Bool)

(assert (=> b!106073 m!156075))

(declare-fun m!156077 () Bool)

(assert (=> b!106070 m!156077))

(declare-fun m!156079 () Bool)

(assert (=> b!106077 m!156079))

(declare-fun m!156081 () Bool)

(assert (=> b!106069 m!156081))

(declare-fun m!156083 () Bool)

(assert (=> start!21008 m!156083))

(declare-fun m!156085 () Bool)

(assert (=> b!106075 m!156085))

(assert (=> b!106075 m!156071))

(declare-fun m!156087 () Bool)

(assert (=> b!106078 m!156087))

(declare-fun m!156089 () Bool)

(assert (=> b!106079 m!156089))

(assert (=> b!106079 m!156089))

(declare-fun m!156091 () Bool)

(assert (=> b!106079 m!156091))

(declare-fun m!156093 () Bool)

(assert (=> b!106066 m!156093))

(assert (=> b!106066 m!156085))

(declare-fun m!156095 () Bool)

(assert (=> b!106066 m!156095))

(assert (=> b!106066 m!156095))

(declare-fun m!156097 () Bool)

(assert (=> b!106066 m!156097))

(declare-fun m!156099 () Bool)

(assert (=> b!106066 m!156099))

(declare-fun m!156101 () Bool)

(assert (=> b!106068 m!156101))

(declare-fun m!156103 () Bool)

(assert (=> b!106067 m!156103))

(declare-fun m!156105 () Bool)

(assert (=> b!106072 m!156105))

(declare-fun m!156107 () Bool)

(assert (=> b!106072 m!156107))

(declare-fun m!156109 () Bool)

(assert (=> b!106072 m!156109))

(declare-fun m!156111 () Bool)

(assert (=> b!106072 m!156111))

(declare-fun m!156113 () Bool)

(assert (=> b!106072 m!156113))

(declare-fun m!156115 () Bool)

(assert (=> b!106072 m!156115))

(declare-fun m!156117 () Bool)

(assert (=> b!106072 m!156117))

(declare-fun m!156119 () Bool)

(assert (=> b!106072 m!156119))

(declare-fun m!156121 () Bool)

(assert (=> b!106072 m!156121))

(declare-fun m!156123 () Bool)

(assert (=> b!106072 m!156123))

(declare-fun m!156125 () Bool)

(assert (=> b!106072 m!156125))

(declare-fun m!156127 () Bool)

(assert (=> b!106072 m!156127))

(declare-fun m!156129 () Bool)

(assert (=> b!106072 m!156129))

(declare-fun m!156131 () Bool)

(assert (=> b!106072 m!156131))

(declare-fun m!156133 () Bool)

(assert (=> b!106072 m!156133))

(declare-fun m!156135 () Bool)

(assert (=> b!106072 m!156135))

(declare-fun m!156137 () Bool)

(assert (=> b!106072 m!156137))

(declare-fun m!156139 () Bool)

(assert (=> b!106072 m!156139))

(declare-fun m!156141 () Bool)

(assert (=> b!106072 m!156141))

(check-sat (not b!106077) (not b!106069) (not b!106079) (not b!106078) (not b!106070) (not b!106067) (not b!106068) (not b!106073) (not b!106075) (not b!106076) (not start!21008) (not b!106066) (not b!106072))
(check-sat)
(get-model)

