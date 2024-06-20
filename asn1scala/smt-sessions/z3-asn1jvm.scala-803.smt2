; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23326 () Bool)

(assert start!23326)

(declare-fun b!118386 () Bool)

(declare-fun res!97963 () Bool)

(declare-fun e!77582 () Bool)

(assert (=> b!118386 (=> res!97963 e!77582)))

(declare-datatypes ((array!5311 0))(
  ( (array!5312 (arr!3001 (Array (_ BitVec 32) (_ BitVec 8))) (size!2408 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4290 0))(
  ( (BitStream!4291 (buf!2827 array!5311) (currentByte!5482 (_ BitVec 32)) (currentBit!5477 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9900 0))(
  ( (tuple2!9901 (_1!5215 BitStream!4290) (_2!5215 BitStream!4290)) )
))
(declare-fun lt!182118 () tuple2!9900)

(declare-fun lt!182112 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118386 (= res!97963 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2408 (buf!2827 (_1!5215 lt!182118)))) ((_ sign_extend 32) (currentByte!5482 (_1!5215 lt!182118))) ((_ sign_extend 32) (currentBit!5477 (_1!5215 lt!182118))) lt!182112)))))

(declare-fun b!118387 () Bool)

(declare-fun e!77586 () Bool)

(declare-fun e!77583 () Bool)

(assert (=> b!118387 (= e!77586 e!77583)))

(declare-fun res!97961 () Bool)

(assert (=> b!118387 (=> (not res!97961) (not e!77583))))

(declare-fun thiss!1305 () BitStream!4290)

(assert (=> b!118387 (= res!97961 (validate_offset_bits!1 ((_ sign_extend 32) (size!2408 (buf!2827 thiss!1305))) ((_ sign_extend 32) (currentByte!5482 thiss!1305)) ((_ sign_extend 32) (currentBit!5477 thiss!1305)) lt!182112))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!118387 (= lt!182112 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!118388 () Bool)

(declare-fun e!77584 () Bool)

(declare-datatypes ((tuple2!9902 0))(
  ( (tuple2!9903 (_1!5216 BitStream!4290) (_2!5216 Bool)) )
))
(declare-fun lt!182100 () tuple2!9902)

(declare-fun lt!182117 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118388 (= e!77584 (= (bitIndex!0 (size!2408 (buf!2827 (_1!5216 lt!182100))) (currentByte!5482 (_1!5216 lt!182100)) (currentBit!5477 (_1!5216 lt!182100))) lt!182117))))

(declare-fun b!118389 () Bool)

(assert (=> b!118389 (= e!77583 (not e!77582))))

(declare-fun res!97966 () Bool)

(assert (=> b!118389 (=> res!97966 e!77582)))

(declare-fun lt!182115 () tuple2!9900)

(declare-fun lt!182116 () (_ BitVec 64))

(declare-fun lt!182109 () tuple2!9902)

(declare-fun lt!182097 () (_ BitVec 64))

(declare-datatypes ((tuple2!9904 0))(
  ( (tuple2!9905 (_1!5217 BitStream!4290) (_2!5217 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9904)

(assert (=> b!118389 (= res!97966 (not (= (_1!5217 (readNLeastSignificantBitsLoopPure!0 (_1!5215 lt!182115) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!182097 (ite (_2!5216 lt!182109) lt!182116 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5215 lt!182115))))))

(declare-datatypes ((Unit!7287 0))(
  ( (Unit!7288) )
))
(declare-datatypes ((tuple2!9906 0))(
  ( (tuple2!9907 (_1!5218 Unit!7287) (_2!5218 BitStream!4290)) )
))
(declare-fun lt!182108 () tuple2!9906)

(declare-fun lt!182104 () tuple2!9906)

(declare-fun lt!182111 () (_ BitVec 64))

(assert (=> b!118389 (validate_offset_bits!1 ((_ sign_extend 32) (size!2408 (buf!2827 (_2!5218 lt!182108)))) ((_ sign_extend 32) (currentByte!5482 (_2!5218 lt!182104))) ((_ sign_extend 32) (currentBit!5477 (_2!5218 lt!182104))) lt!182111)))

(declare-fun lt!182102 () Unit!7287)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4290 array!5311 (_ BitVec 64)) Unit!7287)

(assert (=> b!118389 (= lt!182102 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5218 lt!182104) (buf!2827 (_2!5218 lt!182108)) lt!182111))))

(assert (=> b!118389 (= lt!182111 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!182098 () tuple2!9904)

(assert (=> b!118389 (= lt!182098 (readNLeastSignificantBitsLoopPure!0 (_1!5215 lt!182118) nBits!396 i!615 lt!182097))))

(assert (=> b!118389 (validate_offset_bits!1 ((_ sign_extend 32) (size!2408 (buf!2827 (_2!5218 lt!182108)))) ((_ sign_extend 32) (currentByte!5482 thiss!1305)) ((_ sign_extend 32) (currentBit!5477 thiss!1305)) lt!182112)))

(declare-fun lt!182101 () Unit!7287)

(assert (=> b!118389 (= lt!182101 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2827 (_2!5218 lt!182108)) lt!182112))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!182107 () (_ BitVec 64))

(assert (=> b!118389 (= lt!182097 (bvand v!199 (bvnot lt!182107)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118389 (= lt!182107 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun lt!182114 () Bool)

(assert (=> b!118389 (= (_2!5216 lt!182109) lt!182114)))

(declare-fun readBitPure!0 (BitStream!4290) tuple2!9902)

(assert (=> b!118389 (= lt!182109 (readBitPure!0 (_1!5215 lt!182118)))))

(declare-fun reader!0 (BitStream!4290 BitStream!4290) tuple2!9900)

(assert (=> b!118389 (= lt!182115 (reader!0 (_2!5218 lt!182104) (_2!5218 lt!182108)))))

(assert (=> b!118389 (= lt!182118 (reader!0 thiss!1305 (_2!5218 lt!182108)))))

(declare-fun e!77589 () Bool)

(assert (=> b!118389 e!77589))

(declare-fun res!97964 () Bool)

(assert (=> b!118389 (=> (not res!97964) (not e!77589))))

(declare-fun lt!182106 () tuple2!9902)

(declare-fun lt!182113 () tuple2!9902)

(assert (=> b!118389 (= res!97964 (= (bitIndex!0 (size!2408 (buf!2827 (_1!5216 lt!182106))) (currentByte!5482 (_1!5216 lt!182106)) (currentBit!5477 (_1!5216 lt!182106))) (bitIndex!0 (size!2408 (buf!2827 (_1!5216 lt!182113))) (currentByte!5482 (_1!5216 lt!182113)) (currentBit!5477 (_1!5216 lt!182113)))))))

(declare-fun lt!182099 () Unit!7287)

(declare-fun lt!182103 () BitStream!4290)

(declare-fun readBitPrefixLemma!0 (BitStream!4290 BitStream!4290) Unit!7287)

(assert (=> b!118389 (= lt!182099 (readBitPrefixLemma!0 lt!182103 (_2!5218 lt!182108)))))

(assert (=> b!118389 (= lt!182113 (readBitPure!0 (BitStream!4291 (buf!2827 (_2!5218 lt!182108)) (currentByte!5482 thiss!1305) (currentBit!5477 thiss!1305))))))

(assert (=> b!118389 (= lt!182106 (readBitPure!0 lt!182103))))

(assert (=> b!118389 (= lt!182103 (BitStream!4291 (buf!2827 (_2!5218 lt!182104)) (currentByte!5482 thiss!1305) (currentBit!5477 thiss!1305)))))

(declare-fun e!77587 () Bool)

(assert (=> b!118389 e!77587))

(declare-fun res!97965 () Bool)

(assert (=> b!118389 (=> (not res!97965) (not e!77587))))

(declare-fun isPrefixOf!0 (BitStream!4290 BitStream!4290) Bool)

(assert (=> b!118389 (= res!97965 (isPrefixOf!0 thiss!1305 (_2!5218 lt!182108)))))

(declare-fun lt!182105 () Unit!7287)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4290 BitStream!4290 BitStream!4290) Unit!7287)

(assert (=> b!118389 (= lt!182105 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5218 lt!182104) (_2!5218 lt!182108)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4290 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9906)

(assert (=> b!118389 (= lt!182108 (appendNLeastSignificantBitsLoop!0 (_2!5218 lt!182104) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!77588 () Bool)

(assert (=> b!118389 e!77588))

(declare-fun res!97967 () Bool)

(assert (=> b!118389 (=> (not res!97967) (not e!77588))))

(assert (=> b!118389 (= res!97967 (= (size!2408 (buf!2827 thiss!1305)) (size!2408 (buf!2827 (_2!5218 lt!182104)))))))

(declare-fun appendBit!0 (BitStream!4290 Bool) tuple2!9906)

(assert (=> b!118389 (= lt!182104 (appendBit!0 thiss!1305 lt!182114))))

(assert (=> b!118389 (= lt!182114 (not (= (bvand v!199 lt!182116) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118389 (= lt!182116 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!118390 () Bool)

(declare-fun e!77580 () Bool)

(declare-fun array_inv!2210 (array!5311) Bool)

(assert (=> b!118390 (= e!77580 (array_inv!2210 (buf!2827 thiss!1305)))))

(declare-fun b!118391 () Bool)

(declare-fun res!97962 () Bool)

(assert (=> b!118391 (=> (not res!97962) (not e!77583))))

(assert (=> b!118391 (= res!97962 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!118392 () Bool)

(declare-fun res!97957 () Bool)

(assert (=> b!118392 (=> (not res!97957) (not e!77583))))

(assert (=> b!118392 (= res!97957 (bvslt i!615 nBits!396))))

(declare-fun b!118393 () Bool)

(assert (=> b!118393 (= e!77582 (= (bvand lt!182097 lt!182107) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!118394 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!118394 (= e!77587 (invariant!0 (currentBit!5477 thiss!1305) (currentByte!5482 thiss!1305) (size!2408 (buf!2827 (_2!5218 lt!182108)))))))

(declare-fun b!118395 () Bool)

(declare-fun res!97960 () Bool)

(assert (=> b!118395 (=> (not res!97960) (not e!77587))))

(assert (=> b!118395 (= res!97960 (invariant!0 (currentBit!5477 thiss!1305) (currentByte!5482 thiss!1305) (size!2408 (buf!2827 (_2!5218 lt!182104)))))))

(declare-fun b!118396 () Bool)

(assert (=> b!118396 (= e!77589 (= (_2!5216 lt!182106) (_2!5216 lt!182113)))))

(declare-fun res!97956 () Bool)

(assert (=> start!23326 (=> (not res!97956) (not e!77586))))

(assert (=> start!23326 (= res!97956 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23326 e!77586))

(assert (=> start!23326 true))

(declare-fun inv!12 (BitStream!4290) Bool)

(assert (=> start!23326 (and (inv!12 thiss!1305) e!77580)))

(declare-fun b!118397 () Bool)

(declare-fun res!97959 () Bool)

(declare-fun e!77585 () Bool)

(assert (=> b!118397 (=> (not res!97959) (not e!77585))))

(assert (=> b!118397 (= res!97959 (isPrefixOf!0 thiss!1305 (_2!5218 lt!182104)))))

(declare-fun b!118398 () Bool)

(assert (=> b!118398 (= e!77588 e!77585)))

(declare-fun res!97958 () Bool)

(assert (=> b!118398 (=> (not res!97958) (not e!77585))))

(declare-fun lt!182110 () (_ BitVec 64))

(assert (=> b!118398 (= res!97958 (= lt!182117 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!182110)))))

(assert (=> b!118398 (= lt!182117 (bitIndex!0 (size!2408 (buf!2827 (_2!5218 lt!182104))) (currentByte!5482 (_2!5218 lt!182104)) (currentBit!5477 (_2!5218 lt!182104))))))

(assert (=> b!118398 (= lt!182110 (bitIndex!0 (size!2408 (buf!2827 thiss!1305)) (currentByte!5482 thiss!1305) (currentBit!5477 thiss!1305)))))

(declare-fun b!118399 () Bool)

(assert (=> b!118399 (= e!77585 e!77584)))

(declare-fun res!97968 () Bool)

(assert (=> b!118399 (=> (not res!97968) (not e!77584))))

(assert (=> b!118399 (= res!97968 (and (= (_2!5216 lt!182100) lt!182114) (= (_1!5216 lt!182100) (_2!5218 lt!182104))))))

(declare-fun readerFrom!0 (BitStream!4290 (_ BitVec 32) (_ BitVec 32)) BitStream!4290)

(assert (=> b!118399 (= lt!182100 (readBitPure!0 (readerFrom!0 (_2!5218 lt!182104) (currentBit!5477 thiss!1305) (currentByte!5482 thiss!1305))))))

(assert (= (and start!23326 res!97956) b!118387))

(assert (= (and b!118387 res!97961) b!118391))

(assert (= (and b!118391 res!97962) b!118392))

(assert (= (and b!118392 res!97957) b!118389))

(assert (= (and b!118389 res!97967) b!118398))

(assert (= (and b!118398 res!97958) b!118397))

(assert (= (and b!118397 res!97959) b!118399))

(assert (= (and b!118399 res!97968) b!118388))

(assert (= (and b!118389 res!97965) b!118395))

(assert (= (and b!118395 res!97960) b!118394))

(assert (= (and b!118389 res!97964) b!118396))

(assert (= (and b!118389 (not res!97966)) b!118386))

(assert (= (and b!118386 (not res!97963)) b!118393))

(assert (= start!23326 b!118390))

(declare-fun m!177837 () Bool)

(assert (=> b!118387 m!177837))

(declare-fun m!177839 () Bool)

(assert (=> b!118397 m!177839))

(declare-fun m!177841 () Bool)

(assert (=> b!118388 m!177841))

(declare-fun m!177843 () Bool)

(assert (=> start!23326 m!177843))

(declare-fun m!177845 () Bool)

(assert (=> b!118395 m!177845))

(declare-fun m!177847 () Bool)

(assert (=> b!118394 m!177847))

(declare-fun m!177849 () Bool)

(assert (=> b!118391 m!177849))

(declare-fun m!177851 () Bool)

(assert (=> b!118399 m!177851))

(assert (=> b!118399 m!177851))

(declare-fun m!177853 () Bool)

(assert (=> b!118399 m!177853))

(declare-fun m!177855 () Bool)

(assert (=> b!118386 m!177855))

(declare-fun m!177857 () Bool)

(assert (=> b!118390 m!177857))

(declare-fun m!177859 () Bool)

(assert (=> b!118389 m!177859))

(declare-fun m!177861 () Bool)

(assert (=> b!118389 m!177861))

(declare-fun m!177863 () Bool)

(assert (=> b!118389 m!177863))

(declare-fun m!177865 () Bool)

(assert (=> b!118389 m!177865))

(declare-fun m!177867 () Bool)

(assert (=> b!118389 m!177867))

(declare-fun m!177869 () Bool)

(assert (=> b!118389 m!177869))

(declare-fun m!177871 () Bool)

(assert (=> b!118389 m!177871))

(declare-fun m!177873 () Bool)

(assert (=> b!118389 m!177873))

(declare-fun m!177875 () Bool)

(assert (=> b!118389 m!177875))

(declare-fun m!177877 () Bool)

(assert (=> b!118389 m!177877))

(declare-fun m!177879 () Bool)

(assert (=> b!118389 m!177879))

(declare-fun m!177881 () Bool)

(assert (=> b!118389 m!177881))

(declare-fun m!177883 () Bool)

(assert (=> b!118389 m!177883))

(declare-fun m!177885 () Bool)

(assert (=> b!118389 m!177885))

(declare-fun m!177887 () Bool)

(assert (=> b!118389 m!177887))

(declare-fun m!177889 () Bool)

(assert (=> b!118389 m!177889))

(declare-fun m!177891 () Bool)

(assert (=> b!118389 m!177891))

(declare-fun m!177893 () Bool)

(assert (=> b!118389 m!177893))

(declare-fun m!177895 () Bool)

(assert (=> b!118389 m!177895))

(declare-fun m!177897 () Bool)

(assert (=> b!118398 m!177897))

(declare-fun m!177899 () Bool)

(assert (=> b!118398 m!177899))

(check-sat (not b!118390) (not b!118398) (not start!23326) (not b!118388) (not b!118386) (not b!118395) (not b!118399) (not b!118394) (not b!118387) (not b!118397) (not b!118389) (not b!118391))
(check-sat)
