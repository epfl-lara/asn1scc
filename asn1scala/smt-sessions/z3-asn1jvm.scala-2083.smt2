; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52756 () Bool)

(assert start!52756)

(declare-fun b!244243 () Bool)

(declare-fun res!204123 () Bool)

(declare-fun e!169290 () Bool)

(assert (=> b!244243 (=> (not res!204123) (not e!169290))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!244243 (= res!204123 (bvslt from!289 nBits!297))))

(declare-fun b!244244 () Bool)

(assert (=> b!244244 (= e!169290 (not true))))

(declare-datatypes ((array!13375 0))(
  ( (array!13376 (arr!6851 (Array (_ BitVec 32) (_ BitVec 8))) (size!5864 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10650 0))(
  ( (BitStream!10651 (buf!6336 array!13375) (currentByte!11714 (_ BitVec 32)) (currentBit!11709 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20946 0))(
  ( (tuple2!20947 (_1!11395 BitStream!10650) (_2!11395 BitStream!10650)) )
))
(declare-fun lt!380677 () tuple2!20946)

(declare-datatypes ((tuple2!20948 0))(
  ( (tuple2!20949 (_1!11396 BitStream!10650) (_2!11396 Bool)) )
))
(declare-fun lt!380669 () tuple2!20948)

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10650 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20948)

(assert (=> b!244244 (= lt!380669 (checkBitsLoopPure!0 (_1!11395 lt!380677) nBits!297 bit!26 from!289))))

(declare-datatypes ((Unit!17823 0))(
  ( (Unit!17824) )
))
(declare-datatypes ((tuple2!20950 0))(
  ( (tuple2!20951 (_1!11397 Unit!17823) (_2!11397 BitStream!10650)) )
))
(declare-fun lt!380663 () tuple2!20950)

(declare-fun thiss!1005 () BitStream!10650)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244244 (validate_offset_bits!1 ((_ sign_extend 32) (size!5864 (buf!6336 (_2!11397 lt!380663)))) ((_ sign_extend 32) (currentByte!11714 thiss!1005)) ((_ sign_extend 32) (currentBit!11709 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!380667 () Unit!17823)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10650 array!13375 (_ BitVec 64)) Unit!17823)

(assert (=> b!244244 (= lt!380667 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6336 (_2!11397 lt!380663)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10650) tuple2!20948)

(assert (=> b!244244 (= (_2!11396 (readBitPure!0 (_1!11395 lt!380677))) bit!26)))

(declare-fun lt!380670 () tuple2!20946)

(declare-fun lt!380678 () tuple2!20950)

(declare-fun reader!0 (BitStream!10650 BitStream!10650) tuple2!20946)

(assert (=> b!244244 (= lt!380670 (reader!0 (_2!11397 lt!380678) (_2!11397 lt!380663)))))

(assert (=> b!244244 (= lt!380677 (reader!0 thiss!1005 (_2!11397 lt!380663)))))

(declare-fun e!169283 () Bool)

(assert (=> b!244244 e!169283))

(declare-fun res!204133 () Bool)

(assert (=> b!244244 (=> (not res!204133) (not e!169283))))

(declare-fun lt!380666 () tuple2!20948)

(declare-fun lt!380672 () tuple2!20948)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244244 (= res!204133 (= (bitIndex!0 (size!5864 (buf!6336 (_1!11396 lt!380666))) (currentByte!11714 (_1!11396 lt!380666)) (currentBit!11709 (_1!11396 lt!380666))) (bitIndex!0 (size!5864 (buf!6336 (_1!11396 lt!380672))) (currentByte!11714 (_1!11396 lt!380672)) (currentBit!11709 (_1!11396 lt!380672)))))))

(declare-fun lt!380675 () Unit!17823)

(declare-fun lt!380674 () BitStream!10650)

(declare-fun readBitPrefixLemma!0 (BitStream!10650 BitStream!10650) Unit!17823)

(assert (=> b!244244 (= lt!380675 (readBitPrefixLemma!0 lt!380674 (_2!11397 lt!380663)))))

(assert (=> b!244244 (= lt!380672 (readBitPure!0 (BitStream!10651 (buf!6336 (_2!11397 lt!380663)) (currentByte!11714 thiss!1005) (currentBit!11709 thiss!1005))))))

(assert (=> b!244244 (= lt!380666 (readBitPure!0 lt!380674))))

(assert (=> b!244244 (= lt!380674 (BitStream!10651 (buf!6336 (_2!11397 lt!380678)) (currentByte!11714 thiss!1005) (currentBit!11709 thiss!1005)))))

(declare-fun e!169287 () Bool)

(assert (=> b!244244 e!169287))

(declare-fun res!204130 () Bool)

(assert (=> b!244244 (=> (not res!204130) (not e!169287))))

(declare-fun isPrefixOf!0 (BitStream!10650 BitStream!10650) Bool)

(assert (=> b!244244 (= res!204130 (isPrefixOf!0 thiss!1005 (_2!11397 lt!380663)))))

(declare-fun lt!380671 () Unit!17823)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10650 BitStream!10650 BitStream!10650) Unit!17823)

(assert (=> b!244244 (= lt!380671 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11397 lt!380678) (_2!11397 lt!380663)))))

(declare-fun e!169288 () Bool)

(assert (=> b!244244 e!169288))

(declare-fun res!204134 () Bool)

(assert (=> b!244244 (=> (not res!204134) (not e!169288))))

(assert (=> b!244244 (= res!204134 (= (size!5864 (buf!6336 (_2!11397 lt!380678))) (size!5864 (buf!6336 (_2!11397 lt!380663)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10650 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20950)

(assert (=> b!244244 (= lt!380663 (appendNBitsLoop!0 (_2!11397 lt!380678) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244244 (validate_offset_bits!1 ((_ sign_extend 32) (size!5864 (buf!6336 (_2!11397 lt!380678)))) ((_ sign_extend 32) (currentByte!11714 (_2!11397 lt!380678))) ((_ sign_extend 32) (currentBit!11709 (_2!11397 lt!380678))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!380665 () Unit!17823)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10650 BitStream!10650 (_ BitVec 64) (_ BitVec 64)) Unit!17823)

(assert (=> b!244244 (= lt!380665 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11397 lt!380678) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!169291 () Bool)

(assert (=> b!244244 e!169291))

(declare-fun res!204125 () Bool)

(assert (=> b!244244 (=> (not res!204125) (not e!169291))))

(assert (=> b!244244 (= res!204125 (= (size!5864 (buf!6336 thiss!1005)) (size!5864 (buf!6336 (_2!11397 lt!380678)))))))

(declare-fun appendBit!0 (BitStream!10650 Bool) tuple2!20950)

(assert (=> b!244244 (= lt!380678 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244245 () Bool)

(declare-fun res!204131 () Bool)

(declare-fun e!169286 () Bool)

(assert (=> b!244245 (=> (not res!204131) (not e!169286))))

(assert (=> b!244245 (= res!204131 (isPrefixOf!0 (_2!11397 lt!380678) (_2!11397 lt!380663)))))

(declare-fun b!244246 () Bool)

(declare-fun res!204127 () Bool)

(assert (=> b!244246 (=> (not res!204127) (not e!169287))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244246 (= res!204127 (invariant!0 (currentBit!11709 thiss!1005) (currentByte!11714 thiss!1005) (size!5864 (buf!6336 (_2!11397 lt!380678)))))))

(declare-fun b!244247 () Bool)

(declare-fun e!169285 () Bool)

(declare-fun e!169289 () Bool)

(assert (=> b!244247 (= e!169285 e!169289)))

(declare-fun res!204128 () Bool)

(assert (=> b!244247 (=> (not res!204128) (not e!169289))))

(declare-fun lt!380676 () tuple2!20948)

(assert (=> b!244247 (= res!204128 (and (= (_2!11396 lt!380676) bit!26) (= (_1!11396 lt!380676) (_2!11397 lt!380678))))))

(declare-fun readerFrom!0 (BitStream!10650 (_ BitVec 32) (_ BitVec 32)) BitStream!10650)

(assert (=> b!244247 (= lt!380676 (readBitPure!0 (readerFrom!0 (_2!11397 lt!380678) (currentBit!11709 thiss!1005) (currentByte!11714 thiss!1005))))))

(declare-fun b!244248 () Bool)

(declare-fun res!204129 () Bool)

(assert (=> b!244248 (=> (not res!204129) (not e!169285))))

(assert (=> b!244248 (= res!204129 (isPrefixOf!0 thiss!1005 (_2!11397 lt!380678)))))

(declare-fun b!244250 () Bool)

(declare-fun lt!380668 () (_ BitVec 64))

(assert (=> b!244250 (= e!169289 (= (bitIndex!0 (size!5864 (buf!6336 (_1!11396 lt!380676))) (currentByte!11714 (_1!11396 lt!380676)) (currentBit!11709 (_1!11396 lt!380676))) lt!380668))))

(declare-fun b!244251 () Bool)

(assert (=> b!244251 (= e!169287 (invariant!0 (currentBit!11709 thiss!1005) (currentByte!11714 thiss!1005) (size!5864 (buf!6336 (_2!11397 lt!380663)))))))

(declare-fun b!244252 () Bool)

(assert (=> b!244252 (= e!169283 (= (_2!11396 lt!380666) (_2!11396 lt!380672)))))

(declare-fun b!244253 () Bool)

(declare-fun lt!380662 () tuple2!20948)

(declare-fun lt!380664 () tuple2!20946)

(assert (=> b!244253 (= e!169286 (not (or (not (_2!11396 lt!380662)) (not (= (_1!11396 lt!380662) (_2!11395 lt!380664))))))))

(assert (=> b!244253 (= lt!380662 (checkBitsLoopPure!0 (_1!11395 lt!380664) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!380679 () (_ BitVec 64))

(assert (=> b!244253 (validate_offset_bits!1 ((_ sign_extend 32) (size!5864 (buf!6336 (_2!11397 lt!380663)))) ((_ sign_extend 32) (currentByte!11714 (_2!11397 lt!380678))) ((_ sign_extend 32) (currentBit!11709 (_2!11397 lt!380678))) lt!380679)))

(declare-fun lt!380661 () Unit!17823)

(assert (=> b!244253 (= lt!380661 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11397 lt!380678) (buf!6336 (_2!11397 lt!380663)) lt!380679))))

(assert (=> b!244253 (= lt!380664 (reader!0 (_2!11397 lt!380678) (_2!11397 lt!380663)))))

(declare-fun b!244254 () Bool)

(assert (=> b!244254 (= e!169291 e!169285)))

(declare-fun res!204124 () Bool)

(assert (=> b!244254 (=> (not res!204124) (not e!169285))))

(declare-fun lt!380673 () (_ BitVec 64))

(assert (=> b!244254 (= res!204124 (= lt!380668 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!380673)))))

(assert (=> b!244254 (= lt!380668 (bitIndex!0 (size!5864 (buf!6336 (_2!11397 lt!380678))) (currentByte!11714 (_2!11397 lt!380678)) (currentBit!11709 (_2!11397 lt!380678))))))

(assert (=> b!244254 (= lt!380673 (bitIndex!0 (size!5864 (buf!6336 thiss!1005)) (currentByte!11714 thiss!1005) (currentBit!11709 thiss!1005)))))

(declare-fun b!244255 () Bool)

(declare-fun res!204126 () Bool)

(assert (=> b!244255 (=> (not res!204126) (not e!169290))))

(assert (=> b!244255 (= res!204126 (validate_offset_bits!1 ((_ sign_extend 32) (size!5864 (buf!6336 thiss!1005))) ((_ sign_extend 32) (currentByte!11714 thiss!1005)) ((_ sign_extend 32) (currentBit!11709 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244256 () Bool)

(declare-fun e!169292 () Bool)

(declare-fun array_inv!5605 (array!13375) Bool)

(assert (=> b!244256 (= e!169292 (array_inv!5605 (buf!6336 thiss!1005)))))

(declare-fun res!204132 () Bool)

(assert (=> start!52756 (=> (not res!204132) (not e!169290))))

(assert (=> start!52756 (= res!204132 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52756 e!169290))

(assert (=> start!52756 true))

(declare-fun inv!12 (BitStream!10650) Bool)

(assert (=> start!52756 (and (inv!12 thiss!1005) e!169292)))

(declare-fun b!244249 () Bool)

(assert (=> b!244249 (= e!169288 e!169286)))

(declare-fun res!204135 () Bool)

(assert (=> b!244249 (=> (not res!204135) (not e!169286))))

(assert (=> b!244249 (= res!204135 (= (bitIndex!0 (size!5864 (buf!6336 (_2!11397 lt!380663))) (currentByte!11714 (_2!11397 lt!380663)) (currentBit!11709 (_2!11397 lt!380663))) (bvadd (bitIndex!0 (size!5864 (buf!6336 (_2!11397 lt!380678))) (currentByte!11714 (_2!11397 lt!380678)) (currentBit!11709 (_2!11397 lt!380678))) lt!380679)))))

(assert (=> b!244249 (= lt!380679 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (= (and start!52756 res!204132) b!244255))

(assert (= (and b!244255 res!204126) b!244243))

(assert (= (and b!244243 res!204123) b!244244))

(assert (= (and b!244244 res!204125) b!244254))

(assert (= (and b!244254 res!204124) b!244248))

(assert (= (and b!244248 res!204129) b!244247))

(assert (= (and b!244247 res!204128) b!244250))

(assert (= (and b!244244 res!204134) b!244249))

(assert (= (and b!244249 res!204135) b!244245))

(assert (= (and b!244245 res!204131) b!244253))

(assert (= (and b!244244 res!204130) b!244246))

(assert (= (and b!244246 res!204127) b!244251))

(assert (= (and b!244244 res!204133) b!244252))

(assert (= start!52756 b!244256))

(declare-fun m!368087 () Bool)

(assert (=> b!244245 m!368087))

(declare-fun m!368089 () Bool)

(assert (=> b!244251 m!368089))

(declare-fun m!368091 () Bool)

(assert (=> b!244253 m!368091))

(declare-fun m!368093 () Bool)

(assert (=> b!244253 m!368093))

(declare-fun m!368095 () Bool)

(assert (=> b!244253 m!368095))

(declare-fun m!368097 () Bool)

(assert (=> b!244253 m!368097))

(declare-fun m!368099 () Bool)

(assert (=> b!244246 m!368099))

(declare-fun m!368101 () Bool)

(assert (=> b!244247 m!368101))

(assert (=> b!244247 m!368101))

(declare-fun m!368103 () Bool)

(assert (=> b!244247 m!368103))

(declare-fun m!368105 () Bool)

(assert (=> b!244254 m!368105))

(declare-fun m!368107 () Bool)

(assert (=> b!244254 m!368107))

(declare-fun m!368109 () Bool)

(assert (=> b!244249 m!368109))

(assert (=> b!244249 m!368105))

(declare-fun m!368111 () Bool)

(assert (=> b!244244 m!368111))

(declare-fun m!368113 () Bool)

(assert (=> b!244244 m!368113))

(declare-fun m!368115 () Bool)

(assert (=> b!244244 m!368115))

(declare-fun m!368117 () Bool)

(assert (=> b!244244 m!368117))

(declare-fun m!368119 () Bool)

(assert (=> b!244244 m!368119))

(declare-fun m!368121 () Bool)

(assert (=> b!244244 m!368121))

(declare-fun m!368123 () Bool)

(assert (=> b!244244 m!368123))

(declare-fun m!368125 () Bool)

(assert (=> b!244244 m!368125))

(declare-fun m!368127 () Bool)

(assert (=> b!244244 m!368127))

(declare-fun m!368129 () Bool)

(assert (=> b!244244 m!368129))

(declare-fun m!368131 () Bool)

(assert (=> b!244244 m!368131))

(declare-fun m!368133 () Bool)

(assert (=> b!244244 m!368133))

(declare-fun m!368135 () Bool)

(assert (=> b!244244 m!368135))

(assert (=> b!244244 m!368097))

(declare-fun m!368137 () Bool)

(assert (=> b!244244 m!368137))

(declare-fun m!368139 () Bool)

(assert (=> b!244244 m!368139))

(declare-fun m!368141 () Bool)

(assert (=> b!244244 m!368141))

(declare-fun m!368143 () Bool)

(assert (=> b!244255 m!368143))

(declare-fun m!368145 () Bool)

(assert (=> b!244248 m!368145))

(declare-fun m!368147 () Bool)

(assert (=> start!52756 m!368147))

(declare-fun m!368149 () Bool)

(assert (=> b!244250 m!368149))

(declare-fun m!368151 () Bool)

(assert (=> b!244256 m!368151))

(check-sat (not b!244249) (not b!244248) (not b!244246) (not b!244244) (not b!244253) (not b!244251) (not b!244255) (not b!244250) (not b!244247) (not b!244245) (not start!52756) (not b!244256) (not b!244254))
