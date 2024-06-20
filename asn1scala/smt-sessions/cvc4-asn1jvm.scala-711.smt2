; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19982 () Bool)

(assert start!19982)

(declare-fun b!99483 () Bool)

(declare-fun res!81620 () Bool)

(declare-fun e!65108 () Bool)

(assert (=> b!99483 (=> (not res!81620) (not e!65108))))

(declare-datatypes ((array!4681 0))(
  ( (array!4682 (arr!2729 (Array (_ BitVec 32) (_ BitVec 8))) (size!2136 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3746 0))(
  ( (BitStream!3747 (buf!2493 array!4681) (currentByte!4939 (_ BitVec 32)) (currentBit!4934 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3746)

(declare-datatypes ((Unit!6099 0))(
  ( (Unit!6100) )
))
(declare-datatypes ((tuple2!8010 0))(
  ( (tuple2!8011 (_1!4260 Unit!6099) (_2!4260 BitStream!3746)) )
))
(declare-fun lt!144322 () tuple2!8010)

(declare-fun isPrefixOf!0 (BitStream!3746 BitStream!3746) Bool)

(assert (=> b!99483 (= res!81620 (isPrefixOf!0 thiss!1305 (_2!4260 lt!144322)))))

(declare-fun b!99484 () Bool)

(declare-fun res!81621 () Bool)

(declare-fun e!65110 () Bool)

(assert (=> b!99484 (=> (not res!81621) (not e!65110))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!99484 (= res!81621 (bvslt i!615 nBits!396))))

(declare-fun b!99485 () Bool)

(declare-fun e!65112 () Bool)

(assert (=> b!99485 (= e!65108 e!65112)))

(declare-fun res!81622 () Bool)

(assert (=> b!99485 (=> (not res!81622) (not e!65112))))

(declare-fun lt!144321 () Bool)

(declare-datatypes ((tuple2!8012 0))(
  ( (tuple2!8013 (_1!4261 BitStream!3746) (_2!4261 Bool)) )
))
(declare-fun lt!144320 () tuple2!8012)

(assert (=> b!99485 (= res!81622 (and (= (_2!4261 lt!144320) lt!144321) (= (_1!4261 lt!144320) (_2!4260 lt!144322))))))

(declare-fun readBitPure!0 (BitStream!3746) tuple2!8012)

(declare-fun readerFrom!0 (BitStream!3746 (_ BitVec 32) (_ BitVec 32)) BitStream!3746)

(assert (=> b!99485 (= lt!144320 (readBitPure!0 (readerFrom!0 (_2!4260 lt!144322) (currentBit!4934 thiss!1305) (currentByte!4939 thiss!1305))))))

(declare-fun b!99486 () Bool)

(assert (=> b!99486 (= e!65110 (not true))))

(declare-fun e!65109 () Bool)

(assert (=> b!99486 e!65109))

(declare-fun res!81619 () Bool)

(assert (=> b!99486 (=> (not res!81619) (not e!65109))))

(assert (=> b!99486 (= res!81619 (= (size!2136 (buf!2493 thiss!1305)) (size!2136 (buf!2493 (_2!4260 lt!144322)))))))

(declare-fun appendBit!0 (BitStream!3746 Bool) tuple2!8010)

(assert (=> b!99486 (= lt!144322 (appendBit!0 thiss!1305 lt!144321))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!99486 (= lt!144321 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99487 () Bool)

(declare-fun res!81625 () Bool)

(assert (=> b!99487 (=> (not res!81625) (not e!65110))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99487 (= res!81625 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!81626 () Bool)

(assert (=> start!19982 (=> (not res!81626) (not e!65110))))

(assert (=> start!19982 (= res!81626 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19982 e!65110))

(assert (=> start!19982 true))

(declare-fun e!65107 () Bool)

(declare-fun inv!12 (BitStream!3746) Bool)

(assert (=> start!19982 (and (inv!12 thiss!1305) e!65107)))

(declare-fun b!99488 () Bool)

(declare-fun lt!144319 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99488 (= e!65112 (= (bitIndex!0 (size!2136 (buf!2493 (_1!4261 lt!144320))) (currentByte!4939 (_1!4261 lt!144320)) (currentBit!4934 (_1!4261 lt!144320))) lt!144319))))

(declare-fun b!99489 () Bool)

(declare-fun res!81624 () Bool)

(assert (=> b!99489 (=> (not res!81624) (not e!65110))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99489 (= res!81624 (validate_offset_bits!1 ((_ sign_extend 32) (size!2136 (buf!2493 thiss!1305))) ((_ sign_extend 32) (currentByte!4939 thiss!1305)) ((_ sign_extend 32) (currentBit!4934 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99490 () Bool)

(declare-fun array_inv!1938 (array!4681) Bool)

(assert (=> b!99490 (= e!65107 (array_inv!1938 (buf!2493 thiss!1305)))))

(declare-fun b!99491 () Bool)

(assert (=> b!99491 (= e!65109 e!65108)))

(declare-fun res!81623 () Bool)

(assert (=> b!99491 (=> (not res!81623) (not e!65108))))

(declare-fun lt!144318 () (_ BitVec 64))

(assert (=> b!99491 (= res!81623 (= lt!144319 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144318)))))

(assert (=> b!99491 (= lt!144319 (bitIndex!0 (size!2136 (buf!2493 (_2!4260 lt!144322))) (currentByte!4939 (_2!4260 lt!144322)) (currentBit!4934 (_2!4260 lt!144322))))))

(assert (=> b!99491 (= lt!144318 (bitIndex!0 (size!2136 (buf!2493 thiss!1305)) (currentByte!4939 thiss!1305) (currentBit!4934 thiss!1305)))))

(assert (= (and start!19982 res!81626) b!99489))

(assert (= (and b!99489 res!81624) b!99487))

(assert (= (and b!99487 res!81625) b!99484))

(assert (= (and b!99484 res!81621) b!99486))

(assert (= (and b!99486 res!81619) b!99491))

(assert (= (and b!99491 res!81623) b!99483))

(assert (= (and b!99483 res!81620) b!99485))

(assert (= (and b!99485 res!81622) b!99488))

(assert (= start!19982 b!99490))

(declare-fun m!144843 () Bool)

(assert (=> start!19982 m!144843))

(declare-fun m!144845 () Bool)

(assert (=> b!99490 m!144845))

(declare-fun m!144847 () Bool)

(assert (=> b!99483 m!144847))

(declare-fun m!144849 () Bool)

(assert (=> b!99487 m!144849))

(declare-fun m!144851 () Bool)

(assert (=> b!99491 m!144851))

(declare-fun m!144853 () Bool)

(assert (=> b!99491 m!144853))

(declare-fun m!144855 () Bool)

(assert (=> b!99486 m!144855))

(declare-fun m!144857 () Bool)

(assert (=> b!99489 m!144857))

(declare-fun m!144859 () Bool)

(assert (=> b!99485 m!144859))

(assert (=> b!99485 m!144859))

(declare-fun m!144861 () Bool)

(assert (=> b!99485 m!144861))

(declare-fun m!144863 () Bool)

(assert (=> b!99488 m!144863))

(push 1)

(assert (not b!99485))

(assert (not b!99489))

(assert (not b!99491))

(assert (not start!19982))

(assert (not b!99483))

(assert (not b!99488))

(assert (not b!99487))

(assert (not b!99490))

(assert (not b!99486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

