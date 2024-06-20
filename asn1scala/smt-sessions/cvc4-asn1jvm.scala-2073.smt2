; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52500 () Bool)

(assert start!52500)

(declare-fun b!242515 () Bool)

(declare-fun e!168133 () Bool)

(declare-fun e!168137 () Bool)

(assert (=> b!242515 (= e!168133 e!168137)))

(declare-fun res!202538 () Bool)

(assert (=> b!242515 (=> (not res!202538) (not e!168137))))

(declare-fun lt!377948 () (_ BitVec 64))

(declare-fun lt!377959 () (_ BitVec 64))

(assert (=> b!242515 (= res!202538 (= lt!377948 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377959)))))

(declare-datatypes ((array!13311 0))(
  ( (array!13312 (arr!6822 (Array (_ BitVec 32) (_ BitVec 8))) (size!5835 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10592 0))(
  ( (BitStream!10593 (buf!6301 array!13311) (currentByte!11664 (_ BitVec 32)) (currentBit!11659 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17753 0))(
  ( (Unit!17754) )
))
(declare-datatypes ((tuple2!20760 0))(
  ( (tuple2!20761 (_1!11302 Unit!17753) (_2!11302 BitStream!10592)) )
))
(declare-fun lt!377956 () tuple2!20760)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242515 (= lt!377948 (bitIndex!0 (size!5835 (buf!6301 (_2!11302 lt!377956))) (currentByte!11664 (_2!11302 lt!377956)) (currentBit!11659 (_2!11302 lt!377956))))))

(declare-fun thiss!1005 () BitStream!10592)

(assert (=> b!242515 (= lt!377959 (bitIndex!0 (size!5835 (buf!6301 thiss!1005)) (currentByte!11664 thiss!1005) (currentBit!11659 thiss!1005)))))

(declare-fun b!242516 () Bool)

(declare-fun res!202533 () Bool)

(assert (=> b!242516 (=> (not res!202533) (not e!168137))))

(declare-fun isPrefixOf!0 (BitStream!10592 BitStream!10592) Bool)

(assert (=> b!242516 (= res!202533 (isPrefixOf!0 thiss!1005 (_2!11302 lt!377956)))))

(declare-fun b!242517 () Bool)

(declare-fun e!168140 () Bool)

(declare-fun array_inv!5576 (array!13311) Bool)

(assert (=> b!242517 (= e!168140 (array_inv!5576 (buf!6301 thiss!1005)))))

(declare-fun b!242518 () Bool)

(declare-fun e!168131 () Bool)

(declare-datatypes ((tuple2!20762 0))(
  ( (tuple2!20763 (_1!11303 BitStream!10592) (_2!11303 Bool)) )
))
(declare-fun lt!377950 () tuple2!20762)

(declare-datatypes ((tuple2!20764 0))(
  ( (tuple2!20765 (_1!11304 BitStream!10592) (_2!11304 BitStream!10592)) )
))
(declare-fun lt!377953 () tuple2!20764)

(assert (=> b!242518 (= e!168131 (not (or (not (_2!11303 lt!377950)) (not (= (_1!11303 lt!377950) (_2!11304 lt!377953))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10592 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20762)

(assert (=> b!242518 (= lt!377950 (checkBitsLoopPure!0 (_1!11304 lt!377953) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!377949 () tuple2!20760)

(declare-fun lt!377960 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242518 (validate_offset_bits!1 ((_ sign_extend 32) (size!5835 (buf!6301 (_2!11302 lt!377949)))) ((_ sign_extend 32) (currentByte!11664 (_2!11302 lt!377956))) ((_ sign_extend 32) (currentBit!11659 (_2!11302 lt!377956))) lt!377960)))

(declare-fun lt!377947 () Unit!17753)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10592 array!13311 (_ BitVec 64)) Unit!17753)

(assert (=> b!242518 (= lt!377947 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11302 lt!377956) (buf!6301 (_2!11302 lt!377949)) lt!377960))))

(declare-fun reader!0 (BitStream!10592 BitStream!10592) tuple2!20764)

(assert (=> b!242518 (= lt!377953 (reader!0 (_2!11302 lt!377956) (_2!11302 lt!377949)))))

(declare-fun b!242519 () Bool)

(declare-fun e!168139 () Bool)

(assert (=> b!242519 (= e!168139 e!168131)))

(declare-fun res!202532 () Bool)

(assert (=> b!242519 (=> (not res!202532) (not e!168131))))

(assert (=> b!242519 (= res!202532 (= (bitIndex!0 (size!5835 (buf!6301 (_2!11302 lt!377949))) (currentByte!11664 (_2!11302 lt!377949)) (currentBit!11659 (_2!11302 lt!377949))) (bvadd (bitIndex!0 (size!5835 (buf!6301 (_2!11302 lt!377956))) (currentByte!11664 (_2!11302 lt!377956)) (currentBit!11659 (_2!11302 lt!377956))) lt!377960)))))

(assert (=> b!242519 (= lt!377960 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242520 () Bool)

(declare-fun res!202534 () Bool)

(declare-fun e!168138 () Bool)

(assert (=> b!242520 (=> (not res!202534) (not e!168138))))

(assert (=> b!242520 (= res!202534 (bvslt from!289 nBits!297))))

(declare-fun b!242521 () Bool)

(declare-fun e!168135 () Bool)

(declare-fun lt!377952 () tuple2!20762)

(declare-fun lt!377951 () tuple2!20762)

(assert (=> b!242521 (= e!168135 (= (_2!11303 lt!377952) (_2!11303 lt!377951)))))

(declare-fun b!242522 () Bool)

(declare-fun e!168132 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242522 (= e!168132 (invariant!0 (currentBit!11659 thiss!1005) (currentByte!11664 thiss!1005) (size!5835 (buf!6301 (_2!11302 lt!377949)))))))

(declare-fun b!242523 () Bool)

(declare-fun e!168136 () Bool)

(assert (=> b!242523 (= e!168137 e!168136)))

(declare-fun res!202530 () Bool)

(assert (=> b!242523 (=> (not res!202530) (not e!168136))))

(declare-fun lt!377955 () tuple2!20762)

(assert (=> b!242523 (= res!202530 (and (= (_2!11303 lt!377955) bit!26) (= (_1!11303 lt!377955) (_2!11302 lt!377956))))))

(declare-fun readBitPure!0 (BitStream!10592) tuple2!20762)

(declare-fun readerFrom!0 (BitStream!10592 (_ BitVec 32) (_ BitVec 32)) BitStream!10592)

(assert (=> b!242523 (= lt!377955 (readBitPure!0 (readerFrom!0 (_2!11302 lt!377956) (currentBit!11659 thiss!1005) (currentByte!11664 thiss!1005))))))

(declare-fun b!242524 () Bool)

(declare-fun res!202535 () Bool)

(assert (=> b!242524 (=> (not res!202535) (not e!168132))))

(assert (=> b!242524 (= res!202535 (invariant!0 (currentBit!11659 thiss!1005) (currentByte!11664 thiss!1005) (size!5835 (buf!6301 (_2!11302 lt!377956)))))))

(declare-fun b!242525 () Bool)

(assert (=> b!242525 (= e!168136 (= (bitIndex!0 (size!5835 (buf!6301 (_1!11303 lt!377955))) (currentByte!11664 (_1!11303 lt!377955)) (currentBit!11659 (_1!11303 lt!377955))) lt!377948))))

(declare-fun b!242527 () Bool)

(declare-fun res!202536 () Bool)

(assert (=> b!242527 (=> (not res!202536) (not e!168138))))

(assert (=> b!242527 (= res!202536 (validate_offset_bits!1 ((_ sign_extend 32) (size!5835 (buf!6301 thiss!1005))) ((_ sign_extend 32) (currentByte!11664 thiss!1005)) ((_ sign_extend 32) (currentBit!11659 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242528 () Bool)

(assert (=> b!242528 (= e!168138 (not (isPrefixOf!0 (_2!11302 lt!377956) (_2!11302 lt!377949))))))

(declare-fun lt!377954 () tuple2!20764)

(assert (=> b!242528 (= lt!377954 (reader!0 thiss!1005 (_2!11302 lt!377949)))))

(assert (=> b!242528 e!168135))

(declare-fun res!202531 () Bool)

(assert (=> b!242528 (=> (not res!202531) (not e!168135))))

(assert (=> b!242528 (= res!202531 (= (bitIndex!0 (size!5835 (buf!6301 (_1!11303 lt!377952))) (currentByte!11664 (_1!11303 lt!377952)) (currentBit!11659 (_1!11303 lt!377952))) (bitIndex!0 (size!5835 (buf!6301 (_1!11303 lt!377951))) (currentByte!11664 (_1!11303 lt!377951)) (currentBit!11659 (_1!11303 lt!377951)))))))

(declare-fun lt!377957 () Unit!17753)

(declare-fun lt!377961 () BitStream!10592)

(declare-fun readBitPrefixLemma!0 (BitStream!10592 BitStream!10592) Unit!17753)

(assert (=> b!242528 (= lt!377957 (readBitPrefixLemma!0 lt!377961 (_2!11302 lt!377949)))))

(assert (=> b!242528 (= lt!377951 (readBitPure!0 (BitStream!10593 (buf!6301 (_2!11302 lt!377949)) (currentByte!11664 thiss!1005) (currentBit!11659 thiss!1005))))))

(assert (=> b!242528 (= lt!377952 (readBitPure!0 lt!377961))))

(assert (=> b!242528 (= lt!377961 (BitStream!10593 (buf!6301 (_2!11302 lt!377956)) (currentByte!11664 thiss!1005) (currentBit!11659 thiss!1005)))))

(assert (=> b!242528 e!168132))

(declare-fun res!202539 () Bool)

(assert (=> b!242528 (=> (not res!202539) (not e!168132))))

(assert (=> b!242528 (= res!202539 (isPrefixOf!0 thiss!1005 (_2!11302 lt!377949)))))

(declare-fun lt!377958 () Unit!17753)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10592 BitStream!10592 BitStream!10592) Unit!17753)

(assert (=> b!242528 (= lt!377958 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11302 lt!377956) (_2!11302 lt!377949)))))

(assert (=> b!242528 e!168139))

(declare-fun res!202540 () Bool)

(assert (=> b!242528 (=> (not res!202540) (not e!168139))))

(assert (=> b!242528 (= res!202540 (= (size!5835 (buf!6301 (_2!11302 lt!377956))) (size!5835 (buf!6301 (_2!11302 lt!377949)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10592 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20760)

(assert (=> b!242528 (= lt!377949 (appendNBitsLoop!0 (_2!11302 lt!377956) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242528 (validate_offset_bits!1 ((_ sign_extend 32) (size!5835 (buf!6301 (_2!11302 lt!377956)))) ((_ sign_extend 32) (currentByte!11664 (_2!11302 lt!377956))) ((_ sign_extend 32) (currentBit!11659 (_2!11302 lt!377956))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377946 () Unit!17753)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10592 BitStream!10592 (_ BitVec 64) (_ BitVec 64)) Unit!17753)

(assert (=> b!242528 (= lt!377946 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11302 lt!377956) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!242528 e!168133))

(declare-fun res!202542 () Bool)

(assert (=> b!242528 (=> (not res!202542) (not e!168133))))

(assert (=> b!242528 (= res!202542 (= (size!5835 (buf!6301 thiss!1005)) (size!5835 (buf!6301 (_2!11302 lt!377956)))))))

(declare-fun appendBit!0 (BitStream!10592 Bool) tuple2!20760)

(assert (=> b!242528 (= lt!377956 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!202537 () Bool)

(assert (=> start!52500 (=> (not res!202537) (not e!168138))))

(assert (=> start!52500 (= res!202537 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52500 e!168138))

(assert (=> start!52500 true))

(declare-fun inv!12 (BitStream!10592) Bool)

(assert (=> start!52500 (and (inv!12 thiss!1005) e!168140)))

(declare-fun b!242526 () Bool)

(declare-fun res!202541 () Bool)

(assert (=> b!242526 (=> (not res!202541) (not e!168131))))

(assert (=> b!242526 (= res!202541 (isPrefixOf!0 (_2!11302 lt!377956) (_2!11302 lt!377949)))))

(assert (= (and start!52500 res!202537) b!242527))

(assert (= (and b!242527 res!202536) b!242520))

(assert (= (and b!242520 res!202534) b!242528))

(assert (= (and b!242528 res!202542) b!242515))

(assert (= (and b!242515 res!202538) b!242516))

(assert (= (and b!242516 res!202533) b!242523))

(assert (= (and b!242523 res!202530) b!242525))

(assert (= (and b!242528 res!202540) b!242519))

(assert (= (and b!242519 res!202532) b!242526))

(assert (= (and b!242526 res!202541) b!242518))

(assert (= (and b!242528 res!202539) b!242524))

(assert (= (and b!242524 res!202535) b!242522))

(assert (= (and b!242528 res!202531) b!242521))

(assert (= start!52500 b!242517))

(declare-fun m!365383 () Bool)

(assert (=> b!242518 m!365383))

(declare-fun m!365385 () Bool)

(assert (=> b!242518 m!365385))

(declare-fun m!365387 () Bool)

(assert (=> b!242518 m!365387))

(declare-fun m!365389 () Bool)

(assert (=> b!242518 m!365389))

(declare-fun m!365391 () Bool)

(assert (=> b!242524 m!365391))

(declare-fun m!365393 () Bool)

(assert (=> b!242525 m!365393))

(declare-fun m!365395 () Bool)

(assert (=> b!242522 m!365395))

(declare-fun m!365397 () Bool)

(assert (=> b!242516 m!365397))

(declare-fun m!365399 () Bool)

(assert (=> b!242527 m!365399))

(declare-fun m!365401 () Bool)

(assert (=> b!242517 m!365401))

(declare-fun m!365403 () Bool)

(assert (=> b!242519 m!365403))

(declare-fun m!365405 () Bool)

(assert (=> b!242519 m!365405))

(assert (=> b!242515 m!365405))

(declare-fun m!365407 () Bool)

(assert (=> b!242515 m!365407))

(declare-fun m!365409 () Bool)

(assert (=> start!52500 m!365409))

(declare-fun m!365411 () Bool)

(assert (=> b!242523 m!365411))

(assert (=> b!242523 m!365411))

(declare-fun m!365413 () Bool)

(assert (=> b!242523 m!365413))

(declare-fun m!365415 () Bool)

(assert (=> b!242528 m!365415))

(declare-fun m!365417 () Bool)

(assert (=> b!242528 m!365417))

(declare-fun m!365419 () Bool)

(assert (=> b!242528 m!365419))

(declare-fun m!365421 () Bool)

(assert (=> b!242528 m!365421))

(declare-fun m!365423 () Bool)

(assert (=> b!242528 m!365423))

(declare-fun m!365425 () Bool)

(assert (=> b!242528 m!365425))

(declare-fun m!365427 () Bool)

(assert (=> b!242528 m!365427))

(declare-fun m!365429 () Bool)

(assert (=> b!242528 m!365429))

(declare-fun m!365431 () Bool)

(assert (=> b!242528 m!365431))

(declare-fun m!365433 () Bool)

(assert (=> b!242528 m!365433))

(declare-fun m!365435 () Bool)

(assert (=> b!242528 m!365435))

(declare-fun m!365437 () Bool)

(assert (=> b!242528 m!365437))

(declare-fun m!365439 () Bool)

(assert (=> b!242528 m!365439))

(assert (=> b!242526 m!365415))

(push 1)

(assert (not b!242523))

(assert (not b!242515))

(assert (not b!242525))

(assert (not b!242516))

(assert (not start!52500))

(assert (not b!242524))

(assert (not b!242527))

(assert (not b!242528))

(assert (not b!242517))

(assert (not b!242519))

(assert (not b!242518))

(assert (not b!242526))

(assert (not b!242522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

