; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20572 () Bool)

(assert start!20572)

(declare-fun b!103477 () Bool)

(declare-fun e!67689 () Bool)

(declare-datatypes ((array!4830 0))(
  ( (array!4831 (arr!2796 (Array (_ BitVec 32) (_ BitVec 8))) (size!2203 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3880 0))(
  ( (BitStream!3881 (buf!2569 array!4830) (currentByte!5054 (_ BitVec 32)) (currentBit!5049 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8470 0))(
  ( (tuple2!8471 (_1!4490 BitStream!3880) (_2!4490 Bool)) )
))
(declare-fun lt!151407 () tuple2!8470)

(declare-fun lt!151415 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103477 (= e!67689 (= (bitIndex!0 (size!2203 (buf!2569 (_1!4490 lt!151407))) (currentByte!5054 (_1!4490 lt!151407)) (currentBit!5049 (_1!4490 lt!151407))) lt!151415))))

(declare-fun b!103478 () Bool)

(declare-fun res!85130 () Bool)

(declare-fun e!67695 () Bool)

(assert (=> b!103478 (=> (not res!85130) (not e!67695))))

(declare-fun thiss!1305 () BitStream!3880)

(declare-datatypes ((Unit!6350 0))(
  ( (Unit!6351) )
))
(declare-datatypes ((tuple2!8472 0))(
  ( (tuple2!8473 (_1!4491 Unit!6350) (_2!4491 BitStream!3880)) )
))
(declare-fun lt!151404 () tuple2!8472)

(declare-fun isPrefixOf!0 (BitStream!3880 BitStream!3880) Bool)

(assert (=> b!103478 (= res!85130 (isPrefixOf!0 thiss!1305 (_2!4491 lt!151404)))))

(declare-fun b!103479 () Bool)

(declare-fun res!85127 () Bool)

(declare-fun e!67693 () Bool)

(assert (=> b!103479 (=> (not res!85127) (not e!67693))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103479 (= res!85127 (invariant!0 (currentBit!5049 thiss!1305) (currentByte!5054 thiss!1305) (size!2203 (buf!2569 (_2!4491 lt!151404)))))))

(declare-fun b!103480 () Bool)

(declare-fun e!67698 () Bool)

(declare-fun lt!151418 () tuple2!8470)

(declare-fun lt!151412 () tuple2!8470)

(assert (=> b!103480 (= e!67698 (= (_2!4490 lt!151418) (_2!4490 lt!151412)))))

(declare-fun b!103481 () Bool)

(declare-fun res!85125 () Bool)

(declare-fun e!67694 () Bool)

(assert (=> b!103481 (=> res!85125 e!67694)))

(declare-fun lt!151401 () (_ BitVec 64))

(declare-fun lt!151406 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103481 (= res!85125 (not (= (bvand lt!151401 (onesLSBLong!0 lt!151406)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!103483 () Bool)

(declare-fun e!67687 () Bool)

(declare-fun e!67688 () Bool)

(assert (=> b!103483 (= e!67687 e!67688)))

(declare-fun res!85123 () Bool)

(assert (=> b!103483 (=> (not res!85123) (not e!67688))))

(declare-fun lt!151397 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103483 (= res!85123 (validate_offset_bits!1 ((_ sign_extend 32) (size!2203 (buf!2569 thiss!1305))) ((_ sign_extend 32) (currentByte!5054 thiss!1305)) ((_ sign_extend 32) (currentBit!5049 thiss!1305)) lt!151397))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!103483 (= lt!151397 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!103484 () Bool)

(declare-fun e!67691 () Bool)

(assert (=> b!103484 (= e!67688 e!67691)))

(declare-fun res!85122 () Bool)

(assert (=> b!103484 (=> (not res!85122) (not e!67691))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!151411 () (_ BitVec 64))

(assert (=> b!103484 (= res!85122 (and (= (bvand v!199 lt!151411) v!199) (bvslt i!615 nBits!396)))))

(assert (=> b!103484 (= lt!151411 (onesLSBLong!0 nBits!396))))

(declare-fun b!103485 () Bool)

(declare-fun e!67696 () Bool)

(declare-fun array_inv!2005 (array!4830) Bool)

(assert (=> b!103485 (= e!67696 (array_inv!2005 (buf!2569 thiss!1305)))))

(declare-fun b!103486 () Bool)

(declare-fun e!67692 () Bool)

(assert (=> b!103486 (= e!67692 e!67695)))

(declare-fun res!85119 () Bool)

(assert (=> b!103486 (=> (not res!85119) (not e!67695))))

(declare-fun lt!151402 () (_ BitVec 64))

(assert (=> b!103486 (= res!85119 (= lt!151415 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!151402)))))

(assert (=> b!103486 (= lt!151415 (bitIndex!0 (size!2203 (buf!2569 (_2!4491 lt!151404))) (currentByte!5054 (_2!4491 lt!151404)) (currentBit!5049 (_2!4491 lt!151404))))))

(assert (=> b!103486 (= lt!151402 (bitIndex!0 (size!2203 (buf!2569 thiss!1305)) (currentByte!5054 thiss!1305) (currentBit!5049 thiss!1305)))))

(declare-fun b!103487 () Bool)

(declare-fun e!67690 () Bool)

(assert (=> b!103487 (= e!67690 e!67694)))

(declare-fun res!85129 () Bool)

(assert (=> b!103487 (=> res!85129 e!67694)))

(declare-datatypes ((tuple2!8474 0))(
  ( (tuple2!8475 (_1!4492 BitStream!3880) (_2!4492 BitStream!3880)) )
))
(declare-fun lt!151400 () tuple2!8474)

(assert (=> b!103487 (= res!85129 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2203 (buf!2569 (_1!4492 lt!151400)))) ((_ sign_extend 32) (currentByte!5054 (_1!4492 lt!151400))) ((_ sign_extend 32) (currentBit!5049 (_1!4492 lt!151400))) ((_ sign_extend 32) lt!151406))))))

(assert (=> b!103487 (= lt!151406 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun res!85118 () Bool)

(assert (=> start!20572 (=> (not res!85118) (not e!67687))))

(assert (=> start!20572 (= res!85118 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20572 e!67687))

(assert (=> start!20572 true))

(declare-fun inv!12 (BitStream!3880) Bool)

(assert (=> start!20572 (and (inv!12 thiss!1305) e!67696)))

(declare-fun b!103482 () Bool)

(assert (=> b!103482 (= e!67695 e!67689)))

(declare-fun res!85120 () Bool)

(assert (=> b!103482 (=> (not res!85120) (not e!67689))))

(declare-fun lt!151408 () Bool)

(assert (=> b!103482 (= res!85120 (and (= (_2!4490 lt!151407) lt!151408) (= (_1!4490 lt!151407) (_2!4491 lt!151404))))))

(declare-fun readBitPure!0 (BitStream!3880) tuple2!8470)

(declare-fun readerFrom!0 (BitStream!3880 (_ BitVec 32) (_ BitVec 32)) BitStream!3880)

(assert (=> b!103482 (= lt!151407 (readBitPure!0 (readerFrom!0 (_2!4491 lt!151404) (currentBit!5049 thiss!1305) (currentByte!5054 thiss!1305))))))

(declare-fun b!103488 () Bool)

(assert (=> b!103488 (= e!67691 (not e!67690))))

(declare-fun res!85128 () Bool)

(assert (=> b!103488 (=> res!85128 e!67690)))

(assert (=> b!103488 (= res!85128 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun lt!151398 () tuple2!8472)

(declare-fun lt!151409 () (_ BitVec 64))

(assert (=> b!103488 (validate_offset_bits!1 ((_ sign_extend 32) (size!2203 (buf!2569 (_2!4491 lt!151398)))) ((_ sign_extend 32) (currentByte!5054 (_2!4491 lt!151404))) ((_ sign_extend 32) (currentBit!5049 (_2!4491 lt!151404))) lt!151409)))

(declare-fun lt!151420 () Unit!6350)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3880 array!4830 (_ BitVec 64)) Unit!6350)

(assert (=> b!103488 (= lt!151420 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4491 lt!151404) (buf!2569 (_2!4491 lt!151398)) lt!151409))))

(assert (=> b!103488 (= lt!151409 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!151405 () (_ BitVec 64))

(declare-fun lt!151403 () (_ BitVec 64))

(declare-fun lt!151419 () tuple2!8470)

(assert (=> b!103488 (= lt!151401 (bvor lt!151405 (ite (_2!4490 lt!151419) lt!151403 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8476 0))(
  ( (tuple2!8477 (_1!4493 BitStream!3880) (_2!4493 (_ BitVec 64))) )
))
(declare-fun lt!151410 () tuple2!8476)

(declare-fun lt!151416 () tuple2!8474)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8476)

(assert (=> b!103488 (= lt!151410 (readNLeastSignificantBitsLoopPure!0 (_1!4492 lt!151416) nBits!396 i!615 lt!151405))))

(assert (=> b!103488 (validate_offset_bits!1 ((_ sign_extend 32) (size!2203 (buf!2569 (_2!4491 lt!151398)))) ((_ sign_extend 32) (currentByte!5054 thiss!1305)) ((_ sign_extend 32) (currentBit!5049 thiss!1305)) lt!151397)))

(declare-fun lt!151413 () Unit!6350)

(assert (=> b!103488 (= lt!151413 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2569 (_2!4491 lt!151398)) lt!151397))))

(assert (=> b!103488 (= lt!151405 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!103488 (= (_2!4490 lt!151419) lt!151408)))

(assert (=> b!103488 (= lt!151419 (readBitPure!0 (_1!4492 lt!151416)))))

(declare-fun reader!0 (BitStream!3880 BitStream!3880) tuple2!8474)

(assert (=> b!103488 (= lt!151400 (reader!0 (_2!4491 lt!151404) (_2!4491 lt!151398)))))

(assert (=> b!103488 (= lt!151416 (reader!0 thiss!1305 (_2!4491 lt!151398)))))

(assert (=> b!103488 e!67698))

(declare-fun res!85126 () Bool)

(assert (=> b!103488 (=> (not res!85126) (not e!67698))))

(assert (=> b!103488 (= res!85126 (= (bitIndex!0 (size!2203 (buf!2569 (_1!4490 lt!151418))) (currentByte!5054 (_1!4490 lt!151418)) (currentBit!5049 (_1!4490 lt!151418))) (bitIndex!0 (size!2203 (buf!2569 (_1!4490 lt!151412))) (currentByte!5054 (_1!4490 lt!151412)) (currentBit!5049 (_1!4490 lt!151412)))))))

(declare-fun lt!151417 () Unit!6350)

(declare-fun lt!151414 () BitStream!3880)

(declare-fun readBitPrefixLemma!0 (BitStream!3880 BitStream!3880) Unit!6350)

(assert (=> b!103488 (= lt!151417 (readBitPrefixLemma!0 lt!151414 (_2!4491 lt!151398)))))

(assert (=> b!103488 (= lt!151412 (readBitPure!0 (BitStream!3881 (buf!2569 (_2!4491 lt!151398)) (currentByte!5054 thiss!1305) (currentBit!5049 thiss!1305))))))

(assert (=> b!103488 (= lt!151418 (readBitPure!0 lt!151414))))

(assert (=> b!103488 (= lt!151414 (BitStream!3881 (buf!2569 (_2!4491 lt!151404)) (currentByte!5054 thiss!1305) (currentBit!5049 thiss!1305)))))

(assert (=> b!103488 e!67693))

(declare-fun res!85124 () Bool)

(assert (=> b!103488 (=> (not res!85124) (not e!67693))))

(assert (=> b!103488 (= res!85124 (isPrefixOf!0 thiss!1305 (_2!4491 lt!151398)))))

(declare-fun lt!151399 () Unit!6350)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3880 BitStream!3880 BitStream!3880) Unit!6350)

(assert (=> b!103488 (= lt!151399 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4491 lt!151404) (_2!4491 lt!151398)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3880 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8472)

(assert (=> b!103488 (= lt!151398 (appendNLeastSignificantBitsLoop!0 (_2!4491 lt!151404) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!103488 e!67692))

(declare-fun res!85121 () Bool)

(assert (=> b!103488 (=> (not res!85121) (not e!67692))))

(assert (=> b!103488 (= res!85121 (= (size!2203 (buf!2569 thiss!1305)) (size!2203 (buf!2569 (_2!4491 lt!151404)))))))

(declare-fun appendBit!0 (BitStream!3880 Bool) tuple2!8472)

(assert (=> b!103488 (= lt!151404 (appendBit!0 thiss!1305 lt!151408))))

(assert (=> b!103488 (= lt!151408 (not (= (bvand v!199 lt!151403) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103488 (= lt!151403 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!103489 () Bool)

(assert (=> b!103489 (= e!67693 (invariant!0 (currentBit!5049 thiss!1305) (currentByte!5054 thiss!1305) (size!2203 (buf!2569 (_2!4491 lt!151398)))))))

(declare-fun b!103490 () Bool)

(assert (=> b!103490 (= e!67694 (= (bvand lt!151401 lt!151411) lt!151401))))

(assert (= (and start!20572 res!85118) b!103483))

(assert (= (and b!103483 res!85123) b!103484))

(assert (= (and b!103484 res!85122) b!103488))

(assert (= (and b!103488 res!85121) b!103486))

(assert (= (and b!103486 res!85119) b!103478))

(assert (= (and b!103478 res!85130) b!103482))

(assert (= (and b!103482 res!85120) b!103477))

(assert (= (and b!103488 res!85124) b!103479))

(assert (= (and b!103479 res!85127) b!103489))

(assert (= (and b!103488 res!85126) b!103480))

(assert (= (and b!103488 (not res!85128)) b!103487))

(assert (= (and b!103487 (not res!85129)) b!103481))

(assert (= (and b!103481 (not res!85125)) b!103490))

(assert (= start!20572 b!103485))

(declare-fun m!151105 () Bool)

(assert (=> b!103482 m!151105))

(assert (=> b!103482 m!151105))

(declare-fun m!151107 () Bool)

(assert (=> b!103482 m!151107))

(declare-fun m!151109 () Bool)

(assert (=> b!103478 m!151109))

(declare-fun m!151111 () Bool)

(assert (=> b!103489 m!151111))

(declare-fun m!151113 () Bool)

(assert (=> b!103484 m!151113))

(declare-fun m!151115 () Bool)

(assert (=> b!103481 m!151115))

(declare-fun m!151117 () Bool)

(assert (=> b!103485 m!151117))

(declare-fun m!151119 () Bool)

(assert (=> b!103486 m!151119))

(declare-fun m!151121 () Bool)

(assert (=> b!103486 m!151121))

(declare-fun m!151123 () Bool)

(assert (=> b!103477 m!151123))

(declare-fun m!151125 () Bool)

(assert (=> b!103487 m!151125))

(declare-fun m!151127 () Bool)

(assert (=> b!103483 m!151127))

(declare-fun m!151129 () Bool)

(assert (=> b!103488 m!151129))

(declare-fun m!151131 () Bool)

(assert (=> b!103488 m!151131))

(declare-fun m!151133 () Bool)

(assert (=> b!103488 m!151133))

(declare-fun m!151135 () Bool)

(assert (=> b!103488 m!151135))

(declare-fun m!151137 () Bool)

(assert (=> b!103488 m!151137))

(declare-fun m!151139 () Bool)

(assert (=> b!103488 m!151139))

(declare-fun m!151141 () Bool)

(assert (=> b!103488 m!151141))

(declare-fun m!151143 () Bool)

(assert (=> b!103488 m!151143))

(declare-fun m!151145 () Bool)

(assert (=> b!103488 m!151145))

(declare-fun m!151147 () Bool)

(assert (=> b!103488 m!151147))

(declare-fun m!151149 () Bool)

(assert (=> b!103488 m!151149))

(declare-fun m!151151 () Bool)

(assert (=> b!103488 m!151151))

(declare-fun m!151153 () Bool)

(assert (=> b!103488 m!151153))

(declare-fun m!151155 () Bool)

(assert (=> b!103488 m!151155))

(declare-fun m!151157 () Bool)

(assert (=> b!103488 m!151157))

(declare-fun m!151159 () Bool)

(assert (=> b!103488 m!151159))

(declare-fun m!151161 () Bool)

(assert (=> b!103488 m!151161))

(declare-fun m!151163 () Bool)

(assert (=> b!103488 m!151163))

(declare-fun m!151165 () Bool)

(assert (=> start!20572 m!151165))

(declare-fun m!151167 () Bool)

(assert (=> b!103479 m!151167))

(push 1)

(assert (not b!103477))

(assert (not b!103484))

(assert (not start!20572))

(assert (not b!103485))

(assert (not b!103489))

(assert (not b!103488))

(assert (not b!103478))

(assert (not b!103482))

(assert (not b!103479))

(assert (not b!103483))

(assert (not b!103486))

(assert (not b!103487))

(assert (not b!103481))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

