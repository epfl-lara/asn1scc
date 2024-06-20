; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19986 () Bool)

(assert start!19986)

(declare-fun b!99542 () Bool)

(declare-fun e!65154 () Bool)

(declare-fun e!65152 () Bool)

(assert (=> b!99542 (= e!65154 e!65152)))

(declare-fun res!81675 () Bool)

(assert (=> b!99542 (=> (not res!81675) (not e!65152))))

(declare-fun lt!144362 () (_ BitVec 64))

(declare-fun lt!144363 () (_ BitVec 64))

(assert (=> b!99542 (= res!81675 (= lt!144362 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144363)))))

(declare-datatypes ((array!4685 0))(
  ( (array!4686 (arr!2731 (Array (_ BitVec 32) (_ BitVec 8))) (size!2138 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3750 0))(
  ( (BitStream!3751 (buf!2495 array!4685) (currentByte!4941 (_ BitVec 32)) (currentBit!4936 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6103 0))(
  ( (Unit!6104) )
))
(declare-datatypes ((tuple2!8018 0))(
  ( (tuple2!8019 (_1!4264 Unit!6103) (_2!4264 BitStream!3750)) )
))
(declare-fun lt!144358 () tuple2!8018)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99542 (= lt!144362 (bitIndex!0 (size!2138 (buf!2495 (_2!4264 lt!144358))) (currentByte!4941 (_2!4264 lt!144358)) (currentBit!4936 (_2!4264 lt!144358))))))

(declare-fun thiss!1305 () BitStream!3750)

(assert (=> b!99542 (= lt!144363 (bitIndex!0 (size!2138 (buf!2495 thiss!1305)) (currentByte!4941 thiss!1305) (currentBit!4936 thiss!1305)))))

(declare-fun b!99543 () Bool)

(declare-fun e!65150 () Bool)

(assert (=> b!99543 (= e!65152 e!65150)))

(declare-fun res!81678 () Bool)

(assert (=> b!99543 (=> (not res!81678) (not e!65150))))

(declare-datatypes ((tuple2!8020 0))(
  ( (tuple2!8021 (_1!4265 BitStream!3750) (_2!4265 Bool)) )
))
(declare-fun lt!144361 () tuple2!8020)

(declare-fun lt!144364 () Bool)

(assert (=> b!99543 (= res!81678 (and (= (_2!4265 lt!144361) lt!144364) (= (_1!4265 lt!144361) (_2!4264 lt!144358))))))

(declare-fun readBitPure!0 (BitStream!3750) tuple2!8020)

(declare-fun readerFrom!0 (BitStream!3750 (_ BitVec 32) (_ BitVec 32)) BitStream!3750)

(assert (=> b!99543 (= lt!144361 (readBitPure!0 (readerFrom!0 (_2!4264 lt!144358) (currentBit!4936 thiss!1305) (currentByte!4941 thiss!1305))))))

(declare-fun b!99544 () Bool)

(declare-fun e!65149 () Bool)

(assert (=> b!99544 (= e!65149 true)))

(declare-fun lt!144359 () Bool)

(declare-fun lt!144360 () tuple2!8018)

(declare-fun isPrefixOf!0 (BitStream!3750 BitStream!3750) Bool)

(assert (=> b!99544 (= lt!144359 (isPrefixOf!0 (_2!4264 lt!144358) (_2!4264 lt!144360)))))

(declare-fun b!99545 () Bool)

(declare-fun res!81679 () Bool)

(declare-fun e!65153 () Bool)

(assert (=> b!99545 (=> (not res!81679) (not e!65153))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99545 (= res!81679 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99547 () Bool)

(declare-fun res!81673 () Bool)

(assert (=> b!99547 (=> (not res!81673) (not e!65153))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99547 (= res!81673 (validate_offset_bits!1 ((_ sign_extend 32) (size!2138 (buf!2495 thiss!1305))) ((_ sign_extend 32) (currentByte!4941 thiss!1305)) ((_ sign_extend 32) (currentBit!4936 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99548 () Bool)

(declare-fun res!81677 () Bool)

(assert (=> b!99548 (=> (not res!81677) (not e!65153))))

(assert (=> b!99548 (= res!81677 (bvslt i!615 nBits!396))))

(declare-fun b!99549 () Bool)

(assert (=> b!99549 (= e!65153 (not e!65149))))

(declare-fun res!81680 () Bool)

(assert (=> b!99549 (=> res!81680 e!65149)))

(assert (=> b!99549 (= res!81680 (not (isPrefixOf!0 thiss!1305 (_2!4264 lt!144358))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3750 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8018)

(assert (=> b!99549 (= lt!144360 (appendNLeastSignificantBitsLoop!0 (_2!4264 lt!144358) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!99549 e!65154))

(declare-fun res!81674 () Bool)

(assert (=> b!99549 (=> (not res!81674) (not e!65154))))

(assert (=> b!99549 (= res!81674 (= (size!2138 (buf!2495 thiss!1305)) (size!2138 (buf!2495 (_2!4264 lt!144358)))))))

(declare-fun appendBit!0 (BitStream!3750 Bool) tuple2!8018)

(assert (=> b!99549 (= lt!144358 (appendBit!0 thiss!1305 lt!144364))))

(assert (=> b!99549 (= lt!144364 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99550 () Bool)

(assert (=> b!99550 (= e!65150 (= (bitIndex!0 (size!2138 (buf!2495 (_1!4265 lt!144361))) (currentByte!4941 (_1!4265 lt!144361)) (currentBit!4936 (_1!4265 lt!144361))) lt!144362))))

(declare-fun b!99551 () Bool)

(declare-fun e!65148 () Bool)

(declare-fun array_inv!1940 (array!4685) Bool)

(assert (=> b!99551 (= e!65148 (array_inv!1940 (buf!2495 thiss!1305)))))

(declare-fun res!81676 () Bool)

(assert (=> start!19986 (=> (not res!81676) (not e!65153))))

(assert (=> start!19986 (= res!81676 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19986 e!65153))

(assert (=> start!19986 true))

(declare-fun inv!12 (BitStream!3750) Bool)

(assert (=> start!19986 (and (inv!12 thiss!1305) e!65148)))

(declare-fun b!99546 () Bool)

(declare-fun res!81672 () Bool)

(assert (=> b!99546 (=> (not res!81672) (not e!65152))))

(assert (=> b!99546 (= res!81672 (isPrefixOf!0 thiss!1305 (_2!4264 lt!144358)))))

(assert (= (and start!19986 res!81676) b!99547))

(assert (= (and b!99547 res!81673) b!99545))

(assert (= (and b!99545 res!81679) b!99548))

(assert (= (and b!99548 res!81677) b!99549))

(assert (= (and b!99549 res!81674) b!99542))

(assert (= (and b!99542 res!81675) b!99546))

(assert (= (and b!99546 res!81672) b!99543))

(assert (= (and b!99543 res!81678) b!99550))

(assert (= (and b!99549 (not res!81680)) b!99544))

(assert (= start!19986 b!99551))

(declare-fun m!144891 () Bool)

(assert (=> start!19986 m!144891))

(declare-fun m!144893 () Bool)

(assert (=> b!99551 m!144893))

(declare-fun m!144895 () Bool)

(assert (=> b!99550 m!144895))

(declare-fun m!144897 () Bool)

(assert (=> b!99545 m!144897))

(declare-fun m!144899 () Bool)

(assert (=> b!99546 m!144899))

(declare-fun m!144901 () Bool)

(assert (=> b!99547 m!144901))

(declare-fun m!144903 () Bool)

(assert (=> b!99544 m!144903))

(declare-fun m!144905 () Bool)

(assert (=> b!99543 m!144905))

(assert (=> b!99543 m!144905))

(declare-fun m!144907 () Bool)

(assert (=> b!99543 m!144907))

(declare-fun m!144909 () Bool)

(assert (=> b!99542 m!144909))

(declare-fun m!144911 () Bool)

(assert (=> b!99542 m!144911))

(assert (=> b!99549 m!144899))

(declare-fun m!144913 () Bool)

(assert (=> b!99549 m!144913))

(declare-fun m!144915 () Bool)

(assert (=> b!99549 m!144915))

(check-sat (not b!99547) (not b!99550) (not b!99549) (not b!99546) (not start!19986) (not b!99544) (not b!99545) (not b!99542) (not b!99543) (not b!99551))
