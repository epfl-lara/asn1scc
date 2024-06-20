; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19980 () Bool)

(assert start!19980)

(declare-fun b!99456 () Bool)

(declare-fun e!65091 () Bool)

(declare-datatypes ((array!4679 0))(
  ( (array!4680 (arr!2728 (Array (_ BitVec 32) (_ BitVec 8))) (size!2135 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3744 0))(
  ( (BitStream!3745 (buf!2492 array!4679) (currentByte!4938 (_ BitVec 32)) (currentBit!4933 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3744)

(declare-fun array_inv!1937 (array!4679) Bool)

(assert (=> b!99456 (= e!65091 (array_inv!1937 (buf!2492 thiss!1305)))))

(declare-fun b!99457 () Bool)

(declare-fun res!81599 () Bool)

(declare-fun e!65089 () Bool)

(assert (=> b!99457 (=> (not res!81599) (not e!65089))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99457 (= res!81599 (validate_offset_bits!1 ((_ sign_extend 32) (size!2135 (buf!2492 thiss!1305))) ((_ sign_extend 32) (currentByte!4938 thiss!1305)) ((_ sign_extend 32) (currentBit!4933 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun res!81596 () Bool)

(assert (=> start!19980 (=> (not res!81596) (not e!65089))))

(assert (=> start!19980 (= res!81596 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19980 e!65089))

(assert (=> start!19980 true))

(declare-fun inv!12 (BitStream!3744) Bool)

(assert (=> start!19980 (and (inv!12 thiss!1305) e!65091)))

(declare-fun b!99458 () Bool)

(declare-fun e!65094 () Bool)

(declare-datatypes ((tuple2!8006 0))(
  ( (tuple2!8007 (_1!4258 BitStream!3744) (_2!4258 Bool)) )
))
(declare-fun lt!144303 () tuple2!8006)

(declare-fun lt!144307 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99458 (= e!65094 (= (bitIndex!0 (size!2135 (buf!2492 (_1!4258 lt!144303))) (currentByte!4938 (_1!4258 lt!144303)) (currentBit!4933 (_1!4258 lt!144303))) lt!144307))))

(declare-fun b!99459 () Bool)

(declare-fun e!65092 () Bool)

(declare-fun e!65090 () Bool)

(assert (=> b!99459 (= e!65092 e!65090)))

(declare-fun res!81600 () Bool)

(assert (=> b!99459 (=> (not res!81600) (not e!65090))))

(declare-fun lt!144305 () (_ BitVec 64))

(assert (=> b!99459 (= res!81600 (= lt!144307 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144305)))))

(declare-datatypes ((Unit!6097 0))(
  ( (Unit!6098) )
))
(declare-datatypes ((tuple2!8008 0))(
  ( (tuple2!8009 (_1!4259 Unit!6097) (_2!4259 BitStream!3744)) )
))
(declare-fun lt!144306 () tuple2!8008)

(assert (=> b!99459 (= lt!144307 (bitIndex!0 (size!2135 (buf!2492 (_2!4259 lt!144306))) (currentByte!4938 (_2!4259 lt!144306)) (currentBit!4933 (_2!4259 lt!144306))))))

(assert (=> b!99459 (= lt!144305 (bitIndex!0 (size!2135 (buf!2492 thiss!1305)) (currentByte!4938 thiss!1305) (currentBit!4933 thiss!1305)))))

(declare-fun b!99460 () Bool)

(assert (=> b!99460 (= e!65089 (not true))))

(assert (=> b!99460 e!65092))

(declare-fun res!81598 () Bool)

(assert (=> b!99460 (=> (not res!81598) (not e!65092))))

(assert (=> b!99460 (= res!81598 (= (size!2135 (buf!2492 thiss!1305)) (size!2135 (buf!2492 (_2!4259 lt!144306)))))))

(declare-fun lt!144304 () Bool)

(declare-fun appendBit!0 (BitStream!3744 Bool) tuple2!8008)

(assert (=> b!99460 (= lt!144306 (appendBit!0 thiss!1305 lt!144304))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!99460 (= lt!144304 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99461 () Bool)

(declare-fun res!81601 () Bool)

(assert (=> b!99461 (=> (not res!81601) (not e!65089))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99461 (= res!81601 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99462 () Bool)

(declare-fun res!81597 () Bool)

(assert (=> b!99462 (=> (not res!81597) (not e!65090))))

(declare-fun isPrefixOf!0 (BitStream!3744 BitStream!3744) Bool)

(assert (=> b!99462 (= res!81597 (isPrefixOf!0 thiss!1305 (_2!4259 lt!144306)))))

(declare-fun b!99463 () Bool)

(declare-fun res!81595 () Bool)

(assert (=> b!99463 (=> (not res!81595) (not e!65089))))

(assert (=> b!99463 (= res!81595 (bvslt i!615 nBits!396))))

(declare-fun b!99464 () Bool)

(assert (=> b!99464 (= e!65090 e!65094)))

(declare-fun res!81602 () Bool)

(assert (=> b!99464 (=> (not res!81602) (not e!65094))))

(assert (=> b!99464 (= res!81602 (and (= (_2!4258 lt!144303) lt!144304) (= (_1!4258 lt!144303) (_2!4259 lt!144306))))))

(declare-fun readBitPure!0 (BitStream!3744) tuple2!8006)

(declare-fun readerFrom!0 (BitStream!3744 (_ BitVec 32) (_ BitVec 32)) BitStream!3744)

(assert (=> b!99464 (= lt!144303 (readBitPure!0 (readerFrom!0 (_2!4259 lt!144306) (currentBit!4933 thiss!1305) (currentByte!4938 thiss!1305))))))

(assert (= (and start!19980 res!81596) b!99457))

(assert (= (and b!99457 res!81599) b!99461))

(assert (= (and b!99461 res!81601) b!99463))

(assert (= (and b!99463 res!81595) b!99460))

(assert (= (and b!99460 res!81598) b!99459))

(assert (= (and b!99459 res!81600) b!99462))

(assert (= (and b!99462 res!81597) b!99464))

(assert (= (and b!99464 res!81602) b!99458))

(assert (= start!19980 b!99456))

(declare-fun m!144821 () Bool)

(assert (=> start!19980 m!144821))

(declare-fun m!144823 () Bool)

(assert (=> b!99456 m!144823))

(declare-fun m!144825 () Bool)

(assert (=> b!99464 m!144825))

(assert (=> b!99464 m!144825))

(declare-fun m!144827 () Bool)

(assert (=> b!99464 m!144827))

(declare-fun m!144829 () Bool)

(assert (=> b!99460 m!144829))

(declare-fun m!144831 () Bool)

(assert (=> b!99461 m!144831))

(declare-fun m!144833 () Bool)

(assert (=> b!99459 m!144833))

(declare-fun m!144835 () Bool)

(assert (=> b!99459 m!144835))

(declare-fun m!144837 () Bool)

(assert (=> b!99462 m!144837))

(declare-fun m!144839 () Bool)

(assert (=> b!99457 m!144839))

(declare-fun m!144841 () Bool)

(assert (=> b!99458 m!144841))

(check-sat (not start!19980) (not b!99458) (not b!99459) (not b!99462) (not b!99457) (not b!99464) (not b!99461) (not b!99456) (not b!99460))
