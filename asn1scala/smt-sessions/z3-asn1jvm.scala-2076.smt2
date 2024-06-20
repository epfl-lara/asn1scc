; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52618 () Bool)

(assert start!52618)

(declare-fun b!243106 () Bool)

(declare-fun e!168514 () Bool)

(declare-datatypes ((array!13330 0))(
  ( (array!13331 (arr!6830 (Array (_ BitVec 32) (_ BitVec 8))) (size!5843 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10608 0))(
  ( (BitStream!10609 (buf!6312 array!13330) (currentByte!11684 (_ BitVec 32)) (currentBit!11679 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20814 0))(
  ( (tuple2!20815 (_1!11329 BitStream!10608) (_2!11329 Bool)) )
))
(declare-fun lt!378941 () tuple2!20814)

(declare-fun lt!378934 () tuple2!20814)

(assert (=> b!243106 (= e!168514 (= (_2!11329 lt!378941) (_2!11329 lt!378934)))))

(declare-fun b!243107 () Bool)

(declare-fun res!203080 () Bool)

(declare-fun e!168516 () Bool)

(assert (=> b!243107 (=> (not res!203080) (not e!168516))))

(declare-datatypes ((Unit!17775 0))(
  ( (Unit!17776) )
))
(declare-datatypes ((tuple2!20816 0))(
  ( (tuple2!20817 (_1!11330 Unit!17775) (_2!11330 BitStream!10608)) )
))
(declare-fun lt!378945 () tuple2!20816)

(declare-fun lt!378943 () tuple2!20816)

(declare-fun isPrefixOf!0 (BitStream!10608 BitStream!10608) Bool)

(assert (=> b!243107 (= res!203080 (isPrefixOf!0 (_2!11330 lt!378945) (_2!11330 lt!378943)))))

(declare-fun b!243108 () Bool)

(declare-fun e!168512 () Bool)

(declare-fun lt!378946 () tuple2!20814)

(declare-fun lt!378936 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243108 (= e!168512 (= (bitIndex!0 (size!5843 (buf!6312 (_1!11329 lt!378946))) (currentByte!11684 (_1!11329 lt!378946)) (currentBit!11679 (_1!11329 lt!378946))) lt!378936))))

(declare-fun b!243109 () Bool)

(declare-fun e!168519 () Bool)

(assert (=> b!243109 (= e!168519 e!168512)))

(declare-fun res!203078 () Bool)

(assert (=> b!243109 (=> (not res!203078) (not e!168512))))

(declare-fun bit!26 () Bool)

(assert (=> b!243109 (= res!203078 (and (= (_2!11329 lt!378946) bit!26) (= (_1!11329 lt!378946) (_2!11330 lt!378945))))))

(declare-fun thiss!1005 () BitStream!10608)

(declare-fun readBitPure!0 (BitStream!10608) tuple2!20814)

(declare-fun readerFrom!0 (BitStream!10608 (_ BitVec 32) (_ BitVec 32)) BitStream!10608)

(assert (=> b!243109 (= lt!378946 (readBitPure!0 (readerFrom!0 (_2!11330 lt!378945) (currentBit!11679 thiss!1005) (currentByte!11684 thiss!1005))))))

(declare-fun b!243110 () Bool)

(declare-fun res!203077 () Bool)

(declare-fun e!168517 () Bool)

(assert (=> b!243110 (=> (not res!203077) (not e!168517))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243110 (= res!203077 (validate_offset_bits!1 ((_ sign_extend 32) (size!5843 (buf!6312 thiss!1005))) ((_ sign_extend 32) (currentByte!11684 thiss!1005)) ((_ sign_extend 32) (currentBit!11679 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!243112 () Bool)

(assert (=> b!243112 (= e!168517 (not true))))

(declare-datatypes ((tuple2!20818 0))(
  ( (tuple2!20819 (_1!11331 BitStream!10608) (_2!11331 BitStream!10608)) )
))
(declare-fun lt!378937 () tuple2!20818)

(assert (=> b!243112 (= (_2!11329 (readBitPure!0 (_1!11331 lt!378937))) bit!26)))

(declare-fun lt!378942 () tuple2!20818)

(declare-fun reader!0 (BitStream!10608 BitStream!10608) tuple2!20818)

(assert (=> b!243112 (= lt!378942 (reader!0 (_2!11330 lt!378945) (_2!11330 lt!378943)))))

(assert (=> b!243112 (= lt!378937 (reader!0 thiss!1005 (_2!11330 lt!378943)))))

(assert (=> b!243112 e!168514))

(declare-fun res!203073 () Bool)

(assert (=> b!243112 (=> (not res!203073) (not e!168514))))

(assert (=> b!243112 (= res!203073 (= (bitIndex!0 (size!5843 (buf!6312 (_1!11329 lt!378941))) (currentByte!11684 (_1!11329 lt!378941)) (currentBit!11679 (_1!11329 lt!378941))) (bitIndex!0 (size!5843 (buf!6312 (_1!11329 lt!378934))) (currentByte!11684 (_1!11329 lt!378934)) (currentBit!11679 (_1!11329 lt!378934)))))))

(declare-fun lt!378944 () Unit!17775)

(declare-fun lt!378939 () BitStream!10608)

(declare-fun readBitPrefixLemma!0 (BitStream!10608 BitStream!10608) Unit!17775)

(assert (=> b!243112 (= lt!378944 (readBitPrefixLemma!0 lt!378939 (_2!11330 lt!378943)))))

(assert (=> b!243112 (= lt!378934 (readBitPure!0 (BitStream!10609 (buf!6312 (_2!11330 lt!378943)) (currentByte!11684 thiss!1005) (currentBit!11679 thiss!1005))))))

(assert (=> b!243112 (= lt!378941 (readBitPure!0 lt!378939))))

(assert (=> b!243112 (= lt!378939 (BitStream!10609 (buf!6312 (_2!11330 lt!378945)) (currentByte!11684 thiss!1005) (currentBit!11679 thiss!1005)))))

(declare-fun e!168521 () Bool)

(assert (=> b!243112 e!168521))

(declare-fun res!203079 () Bool)

(assert (=> b!243112 (=> (not res!203079) (not e!168521))))

(assert (=> b!243112 (= res!203079 (isPrefixOf!0 thiss!1005 (_2!11330 lt!378943)))))

(declare-fun lt!378947 () Unit!17775)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10608 BitStream!10608 BitStream!10608) Unit!17775)

(assert (=> b!243112 (= lt!378947 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11330 lt!378945) (_2!11330 lt!378943)))))

(declare-fun e!168513 () Bool)

(assert (=> b!243112 e!168513))

(declare-fun res!203083 () Bool)

(assert (=> b!243112 (=> (not res!203083) (not e!168513))))

(assert (=> b!243112 (= res!203083 (= (size!5843 (buf!6312 (_2!11330 lt!378945))) (size!5843 (buf!6312 (_2!11330 lt!378943)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10608 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20816)

(assert (=> b!243112 (= lt!378943 (appendNBitsLoop!0 (_2!11330 lt!378945) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243112 (validate_offset_bits!1 ((_ sign_extend 32) (size!5843 (buf!6312 (_2!11330 lt!378945)))) ((_ sign_extend 32) (currentByte!11684 (_2!11330 lt!378945))) ((_ sign_extend 32) (currentBit!11679 (_2!11330 lt!378945))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!378948 () Unit!17775)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10608 BitStream!10608 (_ BitVec 64) (_ BitVec 64)) Unit!17775)

(assert (=> b!243112 (= lt!378948 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11330 lt!378945) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168518 () Bool)

(assert (=> b!243112 e!168518))

(declare-fun res!203084 () Bool)

(assert (=> b!243112 (=> (not res!203084) (not e!168518))))

(assert (=> b!243112 (= res!203084 (= (size!5843 (buf!6312 thiss!1005)) (size!5843 (buf!6312 (_2!11330 lt!378945)))))))

(declare-fun appendBit!0 (BitStream!10608 Bool) tuple2!20816)

(assert (=> b!243112 (= lt!378945 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243113 () Bool)

(assert (=> b!243113 (= e!168513 e!168516)))

(declare-fun res!203085 () Bool)

(assert (=> b!243113 (=> (not res!203085) (not e!168516))))

(declare-fun lt!378938 () (_ BitVec 64))

(assert (=> b!243113 (= res!203085 (= (bitIndex!0 (size!5843 (buf!6312 (_2!11330 lt!378943))) (currentByte!11684 (_2!11330 lt!378943)) (currentBit!11679 (_2!11330 lt!378943))) (bvadd (bitIndex!0 (size!5843 (buf!6312 (_2!11330 lt!378945))) (currentByte!11684 (_2!11330 lt!378945)) (currentBit!11679 (_2!11330 lt!378945))) lt!378938)))))

(assert (=> b!243113 (= lt!378938 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243114 () Bool)

(declare-fun res!203075 () Bool)

(assert (=> b!243114 (=> (not res!203075) (not e!168517))))

(assert (=> b!243114 (= res!203075 (bvslt from!289 nBits!297))))

(declare-fun b!243115 () Bool)

(declare-fun res!203082 () Bool)

(assert (=> b!243115 (=> (not res!203082) (not e!168519))))

(assert (=> b!243115 (= res!203082 (isPrefixOf!0 thiss!1005 (_2!11330 lt!378945)))))

(declare-fun b!243116 () Bool)

(declare-fun e!168515 () Bool)

(declare-fun array_inv!5584 (array!13330) Bool)

(assert (=> b!243116 (= e!168515 (array_inv!5584 (buf!6312 thiss!1005)))))

(declare-fun b!243117 () Bool)

(declare-fun res!203081 () Bool)

(assert (=> b!243117 (=> (not res!203081) (not e!168521))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243117 (= res!203081 (invariant!0 (currentBit!11679 thiss!1005) (currentByte!11684 thiss!1005) (size!5843 (buf!6312 (_2!11330 lt!378945)))))))

(declare-fun b!243118 () Bool)

(assert (=> b!243118 (= e!168518 e!168519)))

(declare-fun res!203076 () Bool)

(assert (=> b!243118 (=> (not res!203076) (not e!168519))))

(declare-fun lt!378940 () (_ BitVec 64))

(assert (=> b!243118 (= res!203076 (= lt!378936 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!378940)))))

(assert (=> b!243118 (= lt!378936 (bitIndex!0 (size!5843 (buf!6312 (_2!11330 lt!378945))) (currentByte!11684 (_2!11330 lt!378945)) (currentBit!11679 (_2!11330 lt!378945))))))

(assert (=> b!243118 (= lt!378940 (bitIndex!0 (size!5843 (buf!6312 thiss!1005)) (currentByte!11684 thiss!1005) (currentBit!11679 thiss!1005)))))

(declare-fun b!243119 () Bool)

(assert (=> b!243119 (= e!168521 (invariant!0 (currentBit!11679 thiss!1005) (currentByte!11684 thiss!1005) (size!5843 (buf!6312 (_2!11330 lt!378943)))))))

(declare-fun res!203074 () Bool)

(assert (=> start!52618 (=> (not res!203074) (not e!168517))))

(assert (=> start!52618 (= res!203074 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52618 e!168517))

(assert (=> start!52618 true))

(declare-fun inv!12 (BitStream!10608) Bool)

(assert (=> start!52618 (and (inv!12 thiss!1005) e!168515)))

(declare-fun b!243111 () Bool)

(declare-fun lt!378933 () tuple2!20814)

(declare-fun lt!378935 () tuple2!20818)

(assert (=> b!243111 (= e!168516 (not (or (not (_2!11329 lt!378933)) (not (= (_1!11329 lt!378933) (_2!11331 lt!378935))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10608 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20814)

(assert (=> b!243111 (= lt!378933 (checkBitsLoopPure!0 (_1!11331 lt!378935) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243111 (validate_offset_bits!1 ((_ sign_extend 32) (size!5843 (buf!6312 (_2!11330 lt!378943)))) ((_ sign_extend 32) (currentByte!11684 (_2!11330 lt!378945))) ((_ sign_extend 32) (currentBit!11679 (_2!11330 lt!378945))) lt!378938)))

(declare-fun lt!378932 () Unit!17775)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10608 array!13330 (_ BitVec 64)) Unit!17775)

(assert (=> b!243111 (= lt!378932 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11330 lt!378945) (buf!6312 (_2!11330 lt!378943)) lt!378938))))

(assert (=> b!243111 (= lt!378935 (reader!0 (_2!11330 lt!378945) (_2!11330 lt!378943)))))

(assert (= (and start!52618 res!203074) b!243110))

(assert (= (and b!243110 res!203077) b!243114))

(assert (= (and b!243114 res!203075) b!243112))

(assert (= (and b!243112 res!203084) b!243118))

(assert (= (and b!243118 res!203076) b!243115))

(assert (= (and b!243115 res!203082) b!243109))

(assert (= (and b!243109 res!203078) b!243108))

(assert (= (and b!243112 res!203083) b!243113))

(assert (= (and b!243113 res!203085) b!243107))

(assert (= (and b!243107 res!203080) b!243111))

(assert (= (and b!243112 res!203079) b!243117))

(assert (= (and b!243117 res!203081) b!243119))

(assert (= (and b!243112 res!203073) b!243106))

(assert (= start!52618 b!243116))

(declare-fun m!366293 () Bool)

(assert (=> b!243118 m!366293))

(declare-fun m!366295 () Bool)

(assert (=> b!243118 m!366295))

(declare-fun m!366297 () Bool)

(assert (=> b!243112 m!366297))

(declare-fun m!366299 () Bool)

(assert (=> b!243112 m!366299))

(declare-fun m!366301 () Bool)

(assert (=> b!243112 m!366301))

(declare-fun m!366303 () Bool)

(assert (=> b!243112 m!366303))

(declare-fun m!366305 () Bool)

(assert (=> b!243112 m!366305))

(declare-fun m!366307 () Bool)

(assert (=> b!243112 m!366307))

(declare-fun m!366309 () Bool)

(assert (=> b!243112 m!366309))

(declare-fun m!366311 () Bool)

(assert (=> b!243112 m!366311))

(declare-fun m!366313 () Bool)

(assert (=> b!243112 m!366313))

(declare-fun m!366315 () Bool)

(assert (=> b!243112 m!366315))

(declare-fun m!366317 () Bool)

(assert (=> b!243112 m!366317))

(declare-fun m!366319 () Bool)

(assert (=> b!243112 m!366319))

(declare-fun m!366321 () Bool)

(assert (=> b!243112 m!366321))

(declare-fun m!366323 () Bool)

(assert (=> b!243112 m!366323))

(declare-fun m!366325 () Bool)

(assert (=> b!243109 m!366325))

(assert (=> b!243109 m!366325))

(declare-fun m!366327 () Bool)

(assert (=> b!243109 m!366327))

(declare-fun m!366329 () Bool)

(assert (=> b!243110 m!366329))

(declare-fun m!366331 () Bool)

(assert (=> b!243117 m!366331))

(declare-fun m!366333 () Bool)

(assert (=> b!243115 m!366333))

(declare-fun m!366335 () Bool)

(assert (=> b!243107 m!366335))

(declare-fun m!366337 () Bool)

(assert (=> start!52618 m!366337))

(declare-fun m!366339 () Bool)

(assert (=> b!243113 m!366339))

(assert (=> b!243113 m!366293))

(declare-fun m!366341 () Bool)

(assert (=> b!243119 m!366341))

(declare-fun m!366343 () Bool)

(assert (=> b!243108 m!366343))

(declare-fun m!366345 () Bool)

(assert (=> b!243116 m!366345))

(declare-fun m!366347 () Bool)

(assert (=> b!243111 m!366347))

(declare-fun m!366349 () Bool)

(assert (=> b!243111 m!366349))

(declare-fun m!366351 () Bool)

(assert (=> b!243111 m!366351))

(assert (=> b!243111 m!366313))

(check-sat (not start!52618) (not b!243110) (not b!243117) (not b!243113) (not b!243118) (not b!243116) (not b!243107) (not b!243111) (not b!243119) (not b!243109) (not b!243115) (not b!243108) (not b!243112))
