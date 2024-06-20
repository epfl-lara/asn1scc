; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22972 () Bool)

(assert start!22972)

(declare-fun b!116234 () Bool)

(declare-fun e!76165 () Bool)

(declare-datatypes ((array!5236 0))(
  ( (array!5237 (arr!2968 (Array (_ BitVec 32) (_ BitVec 8))) (size!2375 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4224 0))(
  ( (BitStream!4225 (buf!2785 array!5236) (currentByte!5422 (_ BitVec 32)) (currentBit!5417 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9600 0))(
  ( (tuple2!9601 (_1!5065 BitStream!4224) (_2!5065 Bool)) )
))
(declare-fun lt!177650 () tuple2!9600)

(declare-fun lt!177638 () tuple2!9600)

(assert (=> b!116234 (= e!76165 (= (_2!5065 lt!177650) (_2!5065 lt!177638)))))

(declare-fun b!116235 () Bool)

(declare-fun res!96085 () Bool)

(declare-fun e!76164 () Bool)

(assert (=> b!116235 (=> (not res!96085) (not e!76164))))

(declare-fun thiss!1305 () BitStream!4224)

(declare-datatypes ((Unit!7155 0))(
  ( (Unit!7156) )
))
(declare-datatypes ((tuple2!9602 0))(
  ( (tuple2!9603 (_1!5066 Unit!7155) (_2!5066 BitStream!4224)) )
))
(declare-fun lt!177644 () tuple2!9602)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116235 (= res!96085 (invariant!0 (currentBit!5417 thiss!1305) (currentByte!5422 thiss!1305) (size!2375 (buf!2785 (_2!5066 lt!177644)))))))

(declare-fun b!116236 () Bool)

(declare-fun res!96090 () Bool)

(declare-fun e!76169 () Bool)

(assert (=> b!116236 (=> (not res!96090) (not e!76169))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!116236 (= res!96090 (bvslt i!615 nBits!396))))

(declare-fun b!116237 () Bool)

(declare-fun e!76170 () Bool)

(declare-fun e!76168 () Bool)

(assert (=> b!116237 (= e!76170 e!76168)))

(declare-fun res!96092 () Bool)

(assert (=> b!116237 (=> (not res!96092) (not e!76168))))

(declare-fun lt!177654 () (_ BitVec 64))

(declare-fun lt!177652 () (_ BitVec 64))

(assert (=> b!116237 (= res!96092 (= lt!177654 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!177652)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116237 (= lt!177654 (bitIndex!0 (size!2375 (buf!2785 (_2!5066 lt!177644))) (currentByte!5422 (_2!5066 lt!177644)) (currentBit!5417 (_2!5066 lt!177644))))))

(assert (=> b!116237 (= lt!177652 (bitIndex!0 (size!2375 (buf!2785 thiss!1305)) (currentByte!5422 thiss!1305) (currentBit!5417 thiss!1305)))))

(declare-fun b!116238 () Bool)

(declare-fun e!76167 () Bool)

(declare-fun array_inv!2177 (array!5236) Bool)

(assert (=> b!116238 (= e!76167 (array_inv!2177 (buf!2785 thiss!1305)))))

(declare-fun b!116239 () Bool)

(declare-fun e!76163 () Bool)

(assert (=> b!116239 (= e!76163 e!76169)))

(declare-fun res!96086 () Bool)

(assert (=> b!116239 (=> (not res!96086) (not e!76169))))

(declare-fun lt!177643 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116239 (= res!96086 (validate_offset_bits!1 ((_ sign_extend 32) (size!2375 (buf!2785 thiss!1305))) ((_ sign_extend 32) (currentByte!5422 thiss!1305)) ((_ sign_extend 32) (currentBit!5417 thiss!1305)) lt!177643))))

(assert (=> b!116239 (= lt!177643 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116240 () Bool)

(declare-fun e!76162 () Bool)

(declare-fun lt!177639 () tuple2!9600)

(assert (=> b!116240 (= e!76162 (= (bitIndex!0 (size!2375 (buf!2785 (_1!5065 lt!177639))) (currentByte!5422 (_1!5065 lt!177639)) (currentBit!5417 (_1!5065 lt!177639))) lt!177654))))

(declare-fun b!116241 () Bool)

(declare-fun res!96091 () Bool)

(assert (=> b!116241 (=> (not res!96091) (not e!76168))))

(declare-fun isPrefixOf!0 (BitStream!4224 BitStream!4224) Bool)

(assert (=> b!116241 (= res!96091 (isPrefixOf!0 thiss!1305 (_2!5066 lt!177644)))))

(declare-fun res!96084 () Bool)

(assert (=> start!22972 (=> (not res!96084) (not e!76163))))

(assert (=> start!22972 (= res!96084 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22972 e!76163))

(assert (=> start!22972 true))

(declare-fun inv!12 (BitStream!4224) Bool)

(assert (=> start!22972 (and (inv!12 thiss!1305) e!76167)))

(declare-fun b!116242 () Bool)

(assert (=> b!116242 (= e!76168 e!76162)))

(declare-fun res!96089 () Bool)

(assert (=> b!116242 (=> (not res!96089) (not e!76162))))

(declare-fun lt!177645 () Bool)

(assert (=> b!116242 (= res!96089 (and (= (_2!5065 lt!177639) lt!177645) (= (_1!5065 lt!177639) (_2!5066 lt!177644))))))

(declare-fun readBitPure!0 (BitStream!4224) tuple2!9600)

(declare-fun readerFrom!0 (BitStream!4224 (_ BitVec 32) (_ BitVec 32)) BitStream!4224)

(assert (=> b!116242 (= lt!177639 (readBitPure!0 (readerFrom!0 (_2!5066 lt!177644) (currentBit!5417 thiss!1305) (currentByte!5422 thiss!1305))))))

(declare-fun b!116243 () Bool)

(declare-fun lt!177642 () tuple2!9600)

(assert (=> b!116243 (= e!76169 (not (or (not (_2!5065 lt!177642)) (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!9604 0))(
  ( (tuple2!9605 (_1!5067 BitStream!4224) (_2!5067 BitStream!4224)) )
))
(declare-fun lt!177648 () tuple2!9604)

(declare-datatypes ((tuple2!9606 0))(
  ( (tuple2!9607 (_1!5068 BitStream!4224) (_2!5068 (_ BitVec 64))) )
))
(declare-fun lt!177649 () tuple2!9606)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9606)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116243 (= lt!177649 (readNLeastSignificantBitsLoopPure!0 (_1!5067 lt!177648) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!177651 () tuple2!9602)

(assert (=> b!116243 (validate_offset_bits!1 ((_ sign_extend 32) (size!2375 (buf!2785 (_2!5066 lt!177651)))) ((_ sign_extend 32) (currentByte!5422 thiss!1305)) ((_ sign_extend 32) (currentBit!5417 thiss!1305)) lt!177643)))

(declare-fun lt!177647 () Unit!7155)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4224 array!5236 (_ BitVec 64)) Unit!7155)

(assert (=> b!116243 (= lt!177647 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2785 (_2!5066 lt!177651)) lt!177643))))

(assert (=> b!116243 (= (_2!5065 lt!177642) lt!177645)))

(assert (=> b!116243 (= lt!177642 (readBitPure!0 (_1!5067 lt!177648)))))

(declare-fun lt!177646 () tuple2!9604)

(declare-fun reader!0 (BitStream!4224 BitStream!4224) tuple2!9604)

(assert (=> b!116243 (= lt!177646 (reader!0 (_2!5066 lt!177644) (_2!5066 lt!177651)))))

(assert (=> b!116243 (= lt!177648 (reader!0 thiss!1305 (_2!5066 lt!177651)))))

(assert (=> b!116243 e!76165))

(declare-fun res!96087 () Bool)

(assert (=> b!116243 (=> (not res!96087) (not e!76165))))

(assert (=> b!116243 (= res!96087 (= (bitIndex!0 (size!2375 (buf!2785 (_1!5065 lt!177650))) (currentByte!5422 (_1!5065 lt!177650)) (currentBit!5417 (_1!5065 lt!177650))) (bitIndex!0 (size!2375 (buf!2785 (_1!5065 lt!177638))) (currentByte!5422 (_1!5065 lt!177638)) (currentBit!5417 (_1!5065 lt!177638)))))))

(declare-fun lt!177640 () Unit!7155)

(declare-fun lt!177653 () BitStream!4224)

(declare-fun readBitPrefixLemma!0 (BitStream!4224 BitStream!4224) Unit!7155)

(assert (=> b!116243 (= lt!177640 (readBitPrefixLemma!0 lt!177653 (_2!5066 lt!177651)))))

(assert (=> b!116243 (= lt!177638 (readBitPure!0 (BitStream!4225 (buf!2785 (_2!5066 lt!177651)) (currentByte!5422 thiss!1305) (currentBit!5417 thiss!1305))))))

(assert (=> b!116243 (= lt!177650 (readBitPure!0 lt!177653))))

(assert (=> b!116243 (= lt!177653 (BitStream!4225 (buf!2785 (_2!5066 lt!177644)) (currentByte!5422 thiss!1305) (currentBit!5417 thiss!1305)))))

(assert (=> b!116243 e!76164))

(declare-fun res!96093 () Bool)

(assert (=> b!116243 (=> (not res!96093) (not e!76164))))

(assert (=> b!116243 (= res!96093 (isPrefixOf!0 thiss!1305 (_2!5066 lt!177651)))))

(declare-fun lt!177641 () Unit!7155)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4224 BitStream!4224 BitStream!4224) Unit!7155)

(assert (=> b!116243 (= lt!177641 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5066 lt!177644) (_2!5066 lt!177651)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4224 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9602)

(assert (=> b!116243 (= lt!177651 (appendNLeastSignificantBitsLoop!0 (_2!5066 lt!177644) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!116243 e!76170))

(declare-fun res!96088 () Bool)

(assert (=> b!116243 (=> (not res!96088) (not e!76170))))

(assert (=> b!116243 (= res!96088 (= (size!2375 (buf!2785 thiss!1305)) (size!2375 (buf!2785 (_2!5066 lt!177644)))))))

(declare-fun appendBit!0 (BitStream!4224 Bool) tuple2!9602)

(assert (=> b!116243 (= lt!177644 (appendBit!0 thiss!1305 lt!177645))))

(assert (=> b!116243 (= lt!177645 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!116244 () Bool)

(declare-fun res!96083 () Bool)

(assert (=> b!116244 (=> (not res!96083) (not e!76169))))

(assert (=> b!116244 (= res!96083 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!116245 () Bool)

(assert (=> b!116245 (= e!76164 (invariant!0 (currentBit!5417 thiss!1305) (currentByte!5422 thiss!1305) (size!2375 (buf!2785 (_2!5066 lt!177651)))))))

(assert (= (and start!22972 res!96084) b!116239))

(assert (= (and b!116239 res!96086) b!116244))

(assert (= (and b!116244 res!96083) b!116236))

(assert (= (and b!116236 res!96090) b!116243))

(assert (= (and b!116243 res!96088) b!116237))

(assert (= (and b!116237 res!96092) b!116241))

(assert (= (and b!116241 res!96091) b!116242))

(assert (= (and b!116242 res!96089) b!116240))

(assert (= (and b!116243 res!96093) b!116235))

(assert (= (and b!116235 res!96085) b!116245))

(assert (= (and b!116243 res!96087) b!116234))

(assert (= start!22972 b!116238))

(declare-fun m!174043 () Bool)

(assert (=> b!116239 m!174043))

(declare-fun m!174045 () Bool)

(assert (=> b!116244 m!174045))

(declare-fun m!174047 () Bool)

(assert (=> b!116241 m!174047))

(declare-fun m!174049 () Bool)

(assert (=> start!22972 m!174049))

(declare-fun m!174051 () Bool)

(assert (=> b!116235 m!174051))

(declare-fun m!174053 () Bool)

(assert (=> b!116245 m!174053))

(declare-fun m!174055 () Bool)

(assert (=> b!116240 m!174055))

(declare-fun m!174057 () Bool)

(assert (=> b!116238 m!174057))

(declare-fun m!174059 () Bool)

(assert (=> b!116243 m!174059))

(declare-fun m!174061 () Bool)

(assert (=> b!116243 m!174061))

(declare-fun m!174063 () Bool)

(assert (=> b!116243 m!174063))

(declare-fun m!174065 () Bool)

(assert (=> b!116243 m!174065))

(declare-fun m!174067 () Bool)

(assert (=> b!116243 m!174067))

(declare-fun m!174069 () Bool)

(assert (=> b!116243 m!174069))

(declare-fun m!174071 () Bool)

(assert (=> b!116243 m!174071))

(declare-fun m!174073 () Bool)

(assert (=> b!116243 m!174073))

(declare-fun m!174075 () Bool)

(assert (=> b!116243 m!174075))

(declare-fun m!174077 () Bool)

(assert (=> b!116243 m!174077))

(declare-fun m!174079 () Bool)

(assert (=> b!116243 m!174079))

(declare-fun m!174081 () Bool)

(assert (=> b!116243 m!174081))

(declare-fun m!174083 () Bool)

(assert (=> b!116243 m!174083))

(declare-fun m!174085 () Bool)

(assert (=> b!116243 m!174085))

(declare-fun m!174087 () Bool)

(assert (=> b!116243 m!174087))

(declare-fun m!174089 () Bool)

(assert (=> b!116243 m!174089))

(declare-fun m!174091 () Bool)

(assert (=> b!116237 m!174091))

(declare-fun m!174093 () Bool)

(assert (=> b!116237 m!174093))

(declare-fun m!174095 () Bool)

(assert (=> b!116242 m!174095))

(assert (=> b!116242 m!174095))

(declare-fun m!174097 () Bool)

(assert (=> b!116242 m!174097))

(check-sat (not b!116242) (not b!116239) (not start!22972) (not b!116237) (not b!116243) (not b!116244) (not b!116235) (not b!116238) (not b!116245) (not b!116240) (not b!116241))
(check-sat)
