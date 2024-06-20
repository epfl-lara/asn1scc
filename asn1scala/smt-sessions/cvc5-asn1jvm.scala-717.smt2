; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20014 () Bool)

(assert start!20014)

(declare-fun b!100047 () Bool)

(declare-fun e!65474 () Bool)

(declare-datatypes ((array!4713 0))(
  ( (array!4714 (arr!2745 (Array (_ BitVec 32) (_ BitVec 8))) (size!2152 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3778 0))(
  ( (BitStream!3779 (buf!2509 array!4713) (currentByte!4955 (_ BitVec 32)) (currentBit!4950 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8074 0))(
  ( (tuple2!8075 (_1!4292 BitStream!3778) (_2!4292 Bool)) )
))
(declare-fun lt!144716 () tuple2!8074)

(declare-fun lt!144714 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100047 (= e!65474 (= (bitIndex!0 (size!2152 (buf!2509 (_1!4292 lt!144716))) (currentByte!4955 (_1!4292 lt!144716)) (currentBit!4950 (_1!4292 lt!144716))) lt!144714))))

(declare-fun b!100048 () Bool)

(declare-fun e!65477 () Bool)

(declare-fun e!65475 () Bool)

(assert (=> b!100048 (= e!65477 e!65475)))

(declare-fun res!82143 () Bool)

(assert (=> b!100048 (=> (not res!82143) (not e!65475))))

(declare-fun lt!144722 () (_ BitVec 64))

(assert (=> b!100048 (= res!82143 (= lt!144714 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144722)))))

(declare-datatypes ((Unit!6131 0))(
  ( (Unit!6132) )
))
(declare-datatypes ((tuple2!8076 0))(
  ( (tuple2!8077 (_1!4293 Unit!6131) (_2!4293 BitStream!3778)) )
))
(declare-fun lt!144720 () tuple2!8076)

(assert (=> b!100048 (= lt!144714 (bitIndex!0 (size!2152 (buf!2509 (_2!4293 lt!144720))) (currentByte!4955 (_2!4293 lt!144720)) (currentBit!4950 (_2!4293 lt!144720))))))

(declare-fun thiss!1305 () BitStream!3778)

(assert (=> b!100048 (= lt!144722 (bitIndex!0 (size!2152 (buf!2509 thiss!1305)) (currentByte!4955 thiss!1305) (currentBit!4950 thiss!1305)))))

(declare-fun b!100049 () Bool)

(declare-fun res!82137 () Bool)

(declare-fun e!65478 () Bool)

(assert (=> b!100049 (=> (not res!82137) (not e!65478))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!100049 (= res!82137 (invariant!0 (currentBit!4950 thiss!1305) (currentByte!4955 thiss!1305) (size!2152 (buf!2509 (_2!4293 lt!144720)))))))

(declare-fun b!100050 () Bool)

(declare-fun e!65476 () Bool)

(assert (=> b!100050 (= e!65476 (not true))))

(declare-fun e!65471 () Bool)

(assert (=> b!100050 e!65471))

(declare-fun res!82138 () Bool)

(assert (=> b!100050 (=> (not res!82138) (not e!65471))))

(declare-fun lt!144719 () tuple2!8074)

(declare-fun lt!144721 () tuple2!8074)

(assert (=> b!100050 (= res!82138 (= (bitIndex!0 (size!2152 (buf!2509 (_1!4292 lt!144719))) (currentByte!4955 (_1!4292 lt!144719)) (currentBit!4950 (_1!4292 lt!144719))) (bitIndex!0 (size!2152 (buf!2509 (_1!4292 lt!144721))) (currentByte!4955 (_1!4292 lt!144721)) (currentBit!4950 (_1!4292 lt!144721)))))))

(declare-fun lt!144724 () Unit!6131)

(declare-fun lt!144723 () BitStream!3778)

(declare-fun lt!144717 () tuple2!8076)

(declare-fun readBitPrefixLemma!0 (BitStream!3778 BitStream!3778) Unit!6131)

(assert (=> b!100050 (= lt!144724 (readBitPrefixLemma!0 lt!144723 (_2!4293 lt!144717)))))

(declare-fun readBitPure!0 (BitStream!3778) tuple2!8074)

(assert (=> b!100050 (= lt!144721 (readBitPure!0 (BitStream!3779 (buf!2509 (_2!4293 lt!144717)) (currentByte!4955 thiss!1305) (currentBit!4950 thiss!1305))))))

(assert (=> b!100050 (= lt!144719 (readBitPure!0 lt!144723))))

(assert (=> b!100050 (= lt!144723 (BitStream!3779 (buf!2509 (_2!4293 lt!144720)) (currentByte!4955 thiss!1305) (currentBit!4950 thiss!1305)))))

(assert (=> b!100050 e!65478))

(declare-fun res!82136 () Bool)

(assert (=> b!100050 (=> (not res!82136) (not e!65478))))

(declare-fun isPrefixOf!0 (BitStream!3778 BitStream!3778) Bool)

(assert (=> b!100050 (= res!82136 (isPrefixOf!0 thiss!1305 (_2!4293 lt!144717)))))

(declare-fun lt!144718 () Unit!6131)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3778 BitStream!3778 BitStream!3778) Unit!6131)

(assert (=> b!100050 (= lt!144718 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4293 lt!144720) (_2!4293 lt!144717)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3778 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8076)

(assert (=> b!100050 (= lt!144717 (appendNLeastSignificantBitsLoop!0 (_2!4293 lt!144720) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!100050 e!65477))

(declare-fun res!82139 () Bool)

(assert (=> b!100050 (=> (not res!82139) (not e!65477))))

(assert (=> b!100050 (= res!82139 (= (size!2152 (buf!2509 thiss!1305)) (size!2152 (buf!2509 (_2!4293 lt!144720)))))))

(declare-fun lt!144715 () Bool)

(declare-fun appendBit!0 (BitStream!3778 Bool) tuple2!8076)

(assert (=> b!100050 (= lt!144720 (appendBit!0 thiss!1305 lt!144715))))

(assert (=> b!100050 (= lt!144715 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!100051 () Bool)

(assert (=> b!100051 (= e!65471 (= (_2!4292 lt!144719) (_2!4292 lt!144721)))))

(declare-fun b!100052 () Bool)

(assert (=> b!100052 (= e!65478 (invariant!0 (currentBit!4950 thiss!1305) (currentByte!4955 thiss!1305) (size!2152 (buf!2509 (_2!4293 lt!144717)))))))

(declare-fun res!82135 () Bool)

(assert (=> start!20014 (=> (not res!82135) (not e!65476))))

(assert (=> start!20014 (= res!82135 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20014 e!65476))

(assert (=> start!20014 true))

(declare-fun e!65473 () Bool)

(declare-fun inv!12 (BitStream!3778) Bool)

(assert (=> start!20014 (and (inv!12 thiss!1305) e!65473)))

(declare-fun b!100053 () Bool)

(declare-fun res!82145 () Bool)

(assert (=> b!100053 (=> (not res!82145) (not e!65475))))

(assert (=> b!100053 (= res!82145 (isPrefixOf!0 thiss!1305 (_2!4293 lt!144720)))))

(declare-fun b!100054 () Bool)

(declare-fun res!82142 () Bool)

(assert (=> b!100054 (=> (not res!82142) (not e!65476))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100054 (= res!82142 (validate_offset_bits!1 ((_ sign_extend 32) (size!2152 (buf!2509 thiss!1305))) ((_ sign_extend 32) (currentByte!4955 thiss!1305)) ((_ sign_extend 32) (currentBit!4950 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!100055 () Bool)

(assert (=> b!100055 (= e!65475 e!65474)))

(declare-fun res!82141 () Bool)

(assert (=> b!100055 (=> (not res!82141) (not e!65474))))

(assert (=> b!100055 (= res!82141 (and (= (_2!4292 lt!144716) lt!144715) (= (_1!4292 lt!144716) (_2!4293 lt!144720))))))

(declare-fun readerFrom!0 (BitStream!3778 (_ BitVec 32) (_ BitVec 32)) BitStream!3778)

(assert (=> b!100055 (= lt!144716 (readBitPure!0 (readerFrom!0 (_2!4293 lt!144720) (currentBit!4950 thiss!1305) (currentByte!4955 thiss!1305))))))

(declare-fun b!100056 () Bool)

(declare-fun array_inv!1954 (array!4713) Bool)

(assert (=> b!100056 (= e!65473 (array_inv!1954 (buf!2509 thiss!1305)))))

(declare-fun b!100057 () Bool)

(declare-fun res!82144 () Bool)

(assert (=> b!100057 (=> (not res!82144) (not e!65476))))

(assert (=> b!100057 (= res!82144 (bvslt i!615 nBits!396))))

(declare-fun b!100058 () Bool)

(declare-fun res!82140 () Bool)

(assert (=> b!100058 (=> (not res!82140) (not e!65476))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100058 (= res!82140 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!20014 res!82135) b!100054))

(assert (= (and b!100054 res!82142) b!100058))

(assert (= (and b!100058 res!82140) b!100057))

(assert (= (and b!100057 res!82144) b!100050))

(assert (= (and b!100050 res!82139) b!100048))

(assert (= (and b!100048 res!82143) b!100053))

(assert (= (and b!100053 res!82145) b!100055))

(assert (= (and b!100055 res!82141) b!100047))

(assert (= (and b!100050 res!82136) b!100049))

(assert (= (and b!100049 res!82137) b!100052))

(assert (= (and b!100050 res!82138) b!100051))

(assert (= start!20014 b!100056))

(declare-fun m!145399 () Bool)

(assert (=> b!100053 m!145399))

(declare-fun m!145401 () Bool)

(assert (=> b!100056 m!145401))

(declare-fun m!145403 () Bool)

(assert (=> b!100048 m!145403))

(declare-fun m!145405 () Bool)

(assert (=> b!100048 m!145405))

(declare-fun m!145407 () Bool)

(assert (=> b!100058 m!145407))

(declare-fun m!145409 () Bool)

(assert (=> b!100054 m!145409))

(declare-fun m!145411 () Bool)

(assert (=> b!100050 m!145411))

(declare-fun m!145413 () Bool)

(assert (=> b!100050 m!145413))

(declare-fun m!145415 () Bool)

(assert (=> b!100050 m!145415))

(declare-fun m!145417 () Bool)

(assert (=> b!100050 m!145417))

(declare-fun m!145419 () Bool)

(assert (=> b!100050 m!145419))

(declare-fun m!145421 () Bool)

(assert (=> b!100050 m!145421))

(declare-fun m!145423 () Bool)

(assert (=> b!100050 m!145423))

(declare-fun m!145425 () Bool)

(assert (=> b!100050 m!145425))

(declare-fun m!145427 () Bool)

(assert (=> b!100050 m!145427))

(declare-fun m!145429 () Bool)

(assert (=> b!100055 m!145429))

(assert (=> b!100055 m!145429))

(declare-fun m!145431 () Bool)

(assert (=> b!100055 m!145431))

(declare-fun m!145433 () Bool)

(assert (=> start!20014 m!145433))

(declare-fun m!145435 () Bool)

(assert (=> b!100052 m!145435))

(declare-fun m!145437 () Bool)

(assert (=> b!100049 m!145437))

(declare-fun m!145439 () Bool)

(assert (=> b!100047 m!145439))

(push 1)

(assert (not b!100058))

(assert (not b!100049))

(assert (not b!100053))

(assert (not b!100056))

(assert (not b!100052))

(assert (not b!100050))

(assert (not b!100054))

(assert (not start!20014))

(assert (not b!100048))

(assert (not b!100055))

(assert (not b!100047))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

