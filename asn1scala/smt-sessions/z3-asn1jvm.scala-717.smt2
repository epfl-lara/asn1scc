; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20016 () Bool)

(assert start!20016)

(declare-fun b!100083 () Bool)

(declare-fun e!65498 () Bool)

(declare-fun e!65495 () Bool)

(assert (=> b!100083 (= e!65498 e!65495)))

(declare-fun res!82171 () Bool)

(assert (=> b!100083 (=> (not res!82171) (not e!65495))))

(declare-datatypes ((array!4715 0))(
  ( (array!4716 (arr!2746 (Array (_ BitVec 32) (_ BitVec 8))) (size!2153 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3780 0))(
  ( (BitStream!3781 (buf!2510 array!4715) (currentByte!4956 (_ BitVec 32)) (currentBit!4951 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6133 0))(
  ( (Unit!6134) )
))
(declare-datatypes ((tuple2!8078 0))(
  ( (tuple2!8079 (_1!4294 Unit!6133) (_2!4294 BitStream!3780)) )
))
(declare-fun lt!144753 () tuple2!8078)

(declare-datatypes ((tuple2!8080 0))(
  ( (tuple2!8081 (_1!4295 BitStream!3780) (_2!4295 Bool)) )
))
(declare-fun lt!144754 () tuple2!8080)

(declare-fun lt!144749 () Bool)

(assert (=> b!100083 (= res!82171 (and (= (_2!4295 lt!144754) lt!144749) (= (_1!4295 lt!144754) (_2!4294 lt!144753))))))

(declare-fun thiss!1305 () BitStream!3780)

(declare-fun readBitPure!0 (BitStream!3780) tuple2!8080)

(declare-fun readerFrom!0 (BitStream!3780 (_ BitVec 32) (_ BitVec 32)) BitStream!3780)

(assert (=> b!100083 (= lt!144754 (readBitPure!0 (readerFrom!0 (_2!4294 lt!144753) (currentBit!4951 thiss!1305) (currentByte!4956 thiss!1305))))))

(declare-fun b!100084 () Bool)

(declare-fun res!82172 () Bool)

(declare-fun e!65500 () Bool)

(assert (=> b!100084 (=> (not res!82172) (not e!65500))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!100084 (= res!82172 (bvslt i!615 nBits!396))))

(declare-fun b!100085 () Bool)

(declare-fun e!65496 () Bool)

(declare-fun array_inv!1955 (array!4715) Bool)

(assert (=> b!100085 (= e!65496 (array_inv!1955 (buf!2510 thiss!1305)))))

(declare-fun b!100086 () Bool)

(declare-fun e!65501 () Bool)

(assert (=> b!100086 (= e!65501 e!65498)))

(declare-fun res!82170 () Bool)

(assert (=> b!100086 (=> (not res!82170) (not e!65498))))

(declare-fun lt!144755 () (_ BitVec 64))

(declare-fun lt!144752 () (_ BitVec 64))

(assert (=> b!100086 (= res!82170 (= lt!144755 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144752)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100086 (= lt!144755 (bitIndex!0 (size!2153 (buf!2510 (_2!4294 lt!144753))) (currentByte!4956 (_2!4294 lt!144753)) (currentBit!4951 (_2!4294 lt!144753))))))

(assert (=> b!100086 (= lt!144752 (bitIndex!0 (size!2153 (buf!2510 thiss!1305)) (currentByte!4956 thiss!1305) (currentBit!4951 thiss!1305)))))

(declare-fun b!100087 () Bool)

(assert (=> b!100087 (= e!65500 (not true))))

(declare-fun e!65502 () Bool)

(assert (=> b!100087 e!65502))

(declare-fun res!82173 () Bool)

(assert (=> b!100087 (=> (not res!82173) (not e!65502))))

(declare-fun lt!144748 () tuple2!8080)

(declare-fun lt!144756 () tuple2!8080)

(assert (=> b!100087 (= res!82173 (= (bitIndex!0 (size!2153 (buf!2510 (_1!4295 lt!144748))) (currentByte!4956 (_1!4295 lt!144748)) (currentBit!4951 (_1!4295 lt!144748))) (bitIndex!0 (size!2153 (buf!2510 (_1!4295 lt!144756))) (currentByte!4956 (_1!4295 lt!144756)) (currentBit!4951 (_1!4295 lt!144756)))))))

(declare-fun lt!144757 () Unit!6133)

(declare-fun lt!144747 () BitStream!3780)

(declare-fun lt!144751 () tuple2!8078)

(declare-fun readBitPrefixLemma!0 (BitStream!3780 BitStream!3780) Unit!6133)

(assert (=> b!100087 (= lt!144757 (readBitPrefixLemma!0 lt!144747 (_2!4294 lt!144751)))))

(assert (=> b!100087 (= lt!144756 (readBitPure!0 (BitStream!3781 (buf!2510 (_2!4294 lt!144751)) (currentByte!4956 thiss!1305) (currentBit!4951 thiss!1305))))))

(assert (=> b!100087 (= lt!144748 (readBitPure!0 lt!144747))))

(assert (=> b!100087 (= lt!144747 (BitStream!3781 (buf!2510 (_2!4294 lt!144753)) (currentByte!4956 thiss!1305) (currentBit!4951 thiss!1305)))))

(declare-fun e!65499 () Bool)

(assert (=> b!100087 e!65499))

(declare-fun res!82177 () Bool)

(assert (=> b!100087 (=> (not res!82177) (not e!65499))))

(declare-fun isPrefixOf!0 (BitStream!3780 BitStream!3780) Bool)

(assert (=> b!100087 (= res!82177 (isPrefixOf!0 thiss!1305 (_2!4294 lt!144751)))))

(declare-fun lt!144750 () Unit!6133)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3780 BitStream!3780 BitStream!3780) Unit!6133)

(assert (=> b!100087 (= lt!144750 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4294 lt!144753) (_2!4294 lt!144751)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3780 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8078)

(assert (=> b!100087 (= lt!144751 (appendNLeastSignificantBitsLoop!0 (_2!4294 lt!144753) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!100087 e!65501))

(declare-fun res!82174 () Bool)

(assert (=> b!100087 (=> (not res!82174) (not e!65501))))

(assert (=> b!100087 (= res!82174 (= (size!2153 (buf!2510 thiss!1305)) (size!2153 (buf!2510 (_2!4294 lt!144753)))))))

(declare-fun appendBit!0 (BitStream!3780 Bool) tuple2!8078)

(assert (=> b!100087 (= lt!144753 (appendBit!0 thiss!1305 lt!144749))))

(assert (=> b!100087 (= lt!144749 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!82175 () Bool)

(assert (=> start!20016 (=> (not res!82175) (not e!65500))))

(assert (=> start!20016 (= res!82175 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20016 e!65500))

(assert (=> start!20016 true))

(declare-fun inv!12 (BitStream!3780) Bool)

(assert (=> start!20016 (and (inv!12 thiss!1305) e!65496)))

(declare-fun b!100088 () Bool)

(declare-fun res!82168 () Bool)

(assert (=> b!100088 (=> (not res!82168) (not e!65498))))

(assert (=> b!100088 (= res!82168 (isPrefixOf!0 thiss!1305 (_2!4294 lt!144753)))))

(declare-fun b!100089 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!100089 (= e!65499 (invariant!0 (currentBit!4951 thiss!1305) (currentByte!4956 thiss!1305) (size!2153 (buf!2510 (_2!4294 lt!144751)))))))

(declare-fun b!100090 () Bool)

(assert (=> b!100090 (= e!65502 (= (_2!4295 lt!144748) (_2!4295 lt!144756)))))

(declare-fun b!100091 () Bool)

(declare-fun res!82169 () Bool)

(assert (=> b!100091 (=> (not res!82169) (not e!65500))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100091 (= res!82169 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!100092 () Bool)

(declare-fun res!82176 () Bool)

(assert (=> b!100092 (=> (not res!82176) (not e!65499))))

(assert (=> b!100092 (= res!82176 (invariant!0 (currentBit!4951 thiss!1305) (currentByte!4956 thiss!1305) (size!2153 (buf!2510 (_2!4294 lt!144753)))))))

(declare-fun b!100093 () Bool)

(declare-fun res!82178 () Bool)

(assert (=> b!100093 (=> (not res!82178) (not e!65500))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100093 (= res!82178 (validate_offset_bits!1 ((_ sign_extend 32) (size!2153 (buf!2510 thiss!1305))) ((_ sign_extend 32) (currentByte!4956 thiss!1305)) ((_ sign_extend 32) (currentBit!4951 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!100094 () Bool)

(assert (=> b!100094 (= e!65495 (= (bitIndex!0 (size!2153 (buf!2510 (_1!4295 lt!144754))) (currentByte!4956 (_1!4295 lt!144754)) (currentBit!4951 (_1!4295 lt!144754))) lt!144755))))

(assert (= (and start!20016 res!82175) b!100093))

(assert (= (and b!100093 res!82178) b!100091))

(assert (= (and b!100091 res!82169) b!100084))

(assert (= (and b!100084 res!82172) b!100087))

(assert (= (and b!100087 res!82174) b!100086))

(assert (= (and b!100086 res!82170) b!100088))

(assert (= (and b!100088 res!82168) b!100083))

(assert (= (and b!100083 res!82171) b!100094))

(assert (= (and b!100087 res!82177) b!100092))

(assert (= (and b!100092 res!82176) b!100089))

(assert (= (and b!100087 res!82173) b!100090))

(assert (= start!20016 b!100085))

(declare-fun m!145441 () Bool)

(assert (=> b!100087 m!145441))

(declare-fun m!145443 () Bool)

(assert (=> b!100087 m!145443))

(declare-fun m!145445 () Bool)

(assert (=> b!100087 m!145445))

(declare-fun m!145447 () Bool)

(assert (=> b!100087 m!145447))

(declare-fun m!145449 () Bool)

(assert (=> b!100087 m!145449))

(declare-fun m!145451 () Bool)

(assert (=> b!100087 m!145451))

(declare-fun m!145453 () Bool)

(assert (=> b!100087 m!145453))

(declare-fun m!145455 () Bool)

(assert (=> b!100087 m!145455))

(declare-fun m!145457 () Bool)

(assert (=> b!100087 m!145457))

(declare-fun m!145459 () Bool)

(assert (=> b!100085 m!145459))

(declare-fun m!145461 () Bool)

(assert (=> b!100083 m!145461))

(assert (=> b!100083 m!145461))

(declare-fun m!145463 () Bool)

(assert (=> b!100083 m!145463))

(declare-fun m!145465 () Bool)

(assert (=> b!100094 m!145465))

(declare-fun m!145467 () Bool)

(assert (=> b!100093 m!145467))

(declare-fun m!145469 () Bool)

(assert (=> b!100086 m!145469))

(declare-fun m!145471 () Bool)

(assert (=> b!100086 m!145471))

(declare-fun m!145473 () Bool)

(assert (=> b!100088 m!145473))

(declare-fun m!145475 () Bool)

(assert (=> b!100089 m!145475))

(declare-fun m!145477 () Bool)

(assert (=> b!100091 m!145477))

(declare-fun m!145479 () Bool)

(assert (=> start!20016 m!145479))

(declare-fun m!145481 () Bool)

(assert (=> b!100092 m!145481))

(check-sat (not b!100086) (not b!100092) (not b!100083) (not b!100094) (not b!100089) (not b!100085) (not b!100093) (not b!100088) (not b!100091) (not b!100087) (not start!20016))
