; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52770 () Bool)

(assert start!52770)

(declare-fun b!244537 () Bool)

(declare-fun e!169499 () Bool)

(declare-datatypes ((array!13389 0))(
  ( (array!13390 (arr!6858 (Array (_ BitVec 32) (_ BitVec 8))) (size!5871 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10664 0))(
  ( (BitStream!10665 (buf!6343 array!13389) (currentByte!11721 (_ BitVec 32)) (currentBit!11716 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20988 0))(
  ( (tuple2!20989 (_1!11416 BitStream!10664) (_2!11416 Bool)) )
))
(declare-fun lt!381103 () tuple2!20988)

(declare-fun lt!381105 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244537 (= e!169499 (= (bitIndex!0 (size!5871 (buf!6343 (_1!11416 lt!381103))) (currentByte!11721 (_1!11416 lt!381103)) (currentBit!11716 (_1!11416 lt!381103))) lt!381105))))

(declare-fun res!204397 () Bool)

(declare-fun e!169495 () Bool)

(assert (=> start!52770 (=> (not res!204397) (not e!169495))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!52770 (= res!204397 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52770 e!169495))

(assert (=> start!52770 true))

(declare-fun thiss!1005 () BitStream!10664)

(declare-fun e!169500 () Bool)

(declare-fun inv!12 (BitStream!10664) Bool)

(assert (=> start!52770 (and (inv!12 thiss!1005) e!169500)))

(declare-fun b!244538 () Bool)

(declare-fun e!169497 () Bool)

(declare-fun e!169501 () Bool)

(assert (=> b!244538 (= e!169497 e!169501)))

(declare-fun res!204405 () Bool)

(assert (=> b!244538 (=> (not res!204405) (not e!169501))))

(declare-fun lt!381106 () (_ BitVec 64))

(assert (=> b!244538 (= res!204405 (= lt!381105 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!381106)))))

(declare-datatypes ((Unit!17837 0))(
  ( (Unit!17838) )
))
(declare-datatypes ((tuple2!20990 0))(
  ( (tuple2!20991 (_1!11417 Unit!17837) (_2!11417 BitStream!10664)) )
))
(declare-fun lt!381100 () tuple2!20990)

(assert (=> b!244538 (= lt!381105 (bitIndex!0 (size!5871 (buf!6343 (_2!11417 lt!381100))) (currentByte!11721 (_2!11417 lt!381100)) (currentBit!11716 (_2!11417 lt!381100))))))

(assert (=> b!244538 (= lt!381106 (bitIndex!0 (size!5871 (buf!6343 thiss!1005)) (currentByte!11721 thiss!1005) (currentBit!11716 thiss!1005)))))

(declare-fun b!244539 () Bool)

(declare-fun res!204406 () Bool)

(declare-fun e!169496 () Bool)

(assert (=> b!244539 (=> (not res!204406) (not e!169496))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244539 (= res!204406 (invariant!0 (currentBit!11716 thiss!1005) (currentByte!11721 thiss!1005) (size!5871 (buf!6343 (_2!11417 lt!381100)))))))

(declare-fun b!244540 () Bool)

(declare-fun res!204400 () Bool)

(declare-fun e!169502 () Bool)

(assert (=> b!244540 (=> (not res!204400) (not e!169502))))

(declare-fun lt!381112 () tuple2!20990)

(declare-fun isPrefixOf!0 (BitStream!10664 BitStream!10664) Bool)

(assert (=> b!244540 (= res!204400 (isPrefixOf!0 (_2!11417 lt!381100) (_2!11417 lt!381112)))))

(declare-fun b!244541 () Bool)

(declare-fun res!204408 () Bool)

(assert (=> b!244541 (=> (not res!204408) (not e!169495))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244541 (= res!204408 (validate_offset_bits!1 ((_ sign_extend 32) (size!5871 (buf!6343 thiss!1005))) ((_ sign_extend 32) (currentByte!11721 thiss!1005)) ((_ sign_extend 32) (currentBit!11716 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244542 () Bool)

(declare-fun res!204404 () Bool)

(assert (=> b!244542 (=> (not res!204404) (not e!169495))))

(assert (=> b!244542 (= res!204404 (bvslt from!289 nBits!297))))

(declare-fun b!244543 () Bool)

(declare-fun res!204402 () Bool)

(assert (=> b!244543 (=> (not res!204402) (not e!169501))))

(assert (=> b!244543 (= res!204402 (isPrefixOf!0 thiss!1005 (_2!11417 lt!381100)))))

(declare-fun b!244544 () Bool)

(declare-fun e!169493 () Bool)

(declare-fun lt!381111 () tuple2!20988)

(declare-fun lt!381094 () tuple2!20988)

(assert (=> b!244544 (= e!169493 (= (_2!11416 lt!381111) (_2!11416 lt!381094)))))

(declare-fun b!244545 () Bool)

(declare-fun array_inv!5612 (array!13389) Bool)

(assert (=> b!244545 (= e!169500 (array_inv!5612 (buf!6343 thiss!1005)))))

(declare-fun b!244546 () Bool)

(assert (=> b!244546 (= e!169501 e!169499)))

(declare-fun res!204399 () Bool)

(assert (=> b!244546 (=> (not res!204399) (not e!169499))))

(declare-fun bit!26 () Bool)

(assert (=> b!244546 (= res!204399 (and (= (_2!11416 lt!381103) bit!26) (= (_1!11416 lt!381103) (_2!11417 lt!381100))))))

(declare-fun readBitPure!0 (BitStream!10664) tuple2!20988)

(declare-fun readerFrom!0 (BitStream!10664 (_ BitVec 32) (_ BitVec 32)) BitStream!10664)

(assert (=> b!244546 (= lt!381103 (readBitPure!0 (readerFrom!0 (_2!11417 lt!381100) (currentBit!11716 thiss!1005) (currentByte!11721 thiss!1005))))))

(declare-fun b!244547 () Bool)

(declare-fun e!169494 () Bool)

(assert (=> b!244547 (= e!169494 e!169502)))

(declare-fun res!204398 () Bool)

(assert (=> b!244547 (=> (not res!204398) (not e!169502))))

(declare-fun lt!381101 () (_ BitVec 64))

(assert (=> b!244547 (= res!204398 (= (bitIndex!0 (size!5871 (buf!6343 (_2!11417 lt!381112))) (currentByte!11721 (_2!11417 lt!381112)) (currentBit!11716 (_2!11417 lt!381112))) (bvadd (bitIndex!0 (size!5871 (buf!6343 (_2!11417 lt!381100))) (currentByte!11721 (_2!11417 lt!381100)) (currentBit!11716 (_2!11417 lt!381100))) lt!381101)))))

(assert (=> b!244547 (= lt!381101 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!244548 () Bool)

(assert (=> b!244548 (= e!169496 (invariant!0 (currentBit!11716 thiss!1005) (currentByte!11721 thiss!1005) (size!5871 (buf!6343 (_2!11417 lt!381112)))))))

(declare-fun b!244549 () Bool)

(assert (=> b!244549 (= e!169495 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(declare-fun lt!381097 () (_ BitVec 64))

(assert (=> b!244549 (validate_offset_bits!1 ((_ sign_extend 32) (size!5871 (buf!6343 (_2!11417 lt!381112)))) ((_ sign_extend 32) (currentByte!11721 (_2!11417 lt!381100))) ((_ sign_extend 32) (currentBit!11716 (_2!11417 lt!381100))) lt!381097)))

(declare-fun lt!381113 () Unit!17837)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10664 array!13389 (_ BitVec 64)) Unit!17837)

(assert (=> b!244549 (= lt!381113 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11417 lt!381100) (buf!6343 (_2!11417 lt!381112)) lt!381097))))

(declare-datatypes ((tuple2!20992 0))(
  ( (tuple2!20993 (_1!11418 BitStream!10664) (_2!11418 BitStream!10664)) )
))
(declare-fun lt!381102 () tuple2!20992)

(declare-fun lt!381099 () tuple2!20988)

(declare-fun checkBitsLoopPure!0 (BitStream!10664 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20988)

(assert (=> b!244549 (= lt!381099 (checkBitsLoopPure!0 (_1!11418 lt!381102) nBits!297 bit!26 from!289))))

(assert (=> b!244549 (validate_offset_bits!1 ((_ sign_extend 32) (size!5871 (buf!6343 (_2!11417 lt!381112)))) ((_ sign_extend 32) (currentByte!11721 thiss!1005)) ((_ sign_extend 32) (currentBit!11716 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!381108 () Unit!17837)

(assert (=> b!244549 (= lt!381108 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6343 (_2!11417 lt!381112)) (bvsub nBits!297 from!289)))))

(assert (=> b!244549 (= (_2!11416 (readBitPure!0 (_1!11418 lt!381102))) bit!26)))

(declare-fun lt!381109 () tuple2!20992)

(declare-fun reader!0 (BitStream!10664 BitStream!10664) tuple2!20992)

(assert (=> b!244549 (= lt!381109 (reader!0 (_2!11417 lt!381100) (_2!11417 lt!381112)))))

(assert (=> b!244549 (= lt!381102 (reader!0 thiss!1005 (_2!11417 lt!381112)))))

(assert (=> b!244549 e!169493))

(declare-fun res!204403 () Bool)

(assert (=> b!244549 (=> (not res!204403) (not e!169493))))

(assert (=> b!244549 (= res!204403 (= (bitIndex!0 (size!5871 (buf!6343 (_1!11416 lt!381111))) (currentByte!11721 (_1!11416 lt!381111)) (currentBit!11716 (_1!11416 lt!381111))) (bitIndex!0 (size!5871 (buf!6343 (_1!11416 lt!381094))) (currentByte!11721 (_1!11416 lt!381094)) (currentBit!11716 (_1!11416 lt!381094)))))))

(declare-fun lt!381098 () Unit!17837)

(declare-fun lt!381114 () BitStream!10664)

(declare-fun readBitPrefixLemma!0 (BitStream!10664 BitStream!10664) Unit!17837)

(assert (=> b!244549 (= lt!381098 (readBitPrefixLemma!0 lt!381114 (_2!11417 lt!381112)))))

(assert (=> b!244549 (= lt!381094 (readBitPure!0 (BitStream!10665 (buf!6343 (_2!11417 lt!381112)) (currentByte!11721 thiss!1005) (currentBit!11716 thiss!1005))))))

(assert (=> b!244549 (= lt!381111 (readBitPure!0 lt!381114))))

(assert (=> b!244549 (= lt!381114 (BitStream!10665 (buf!6343 (_2!11417 lt!381100)) (currentByte!11721 thiss!1005) (currentBit!11716 thiss!1005)))))

(assert (=> b!244549 e!169496))

(declare-fun res!204407 () Bool)

(assert (=> b!244549 (=> (not res!204407) (not e!169496))))

(assert (=> b!244549 (= res!204407 (isPrefixOf!0 thiss!1005 (_2!11417 lt!381112)))))

(declare-fun lt!381095 () Unit!17837)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10664 BitStream!10664 BitStream!10664) Unit!17837)

(assert (=> b!244549 (= lt!381095 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11417 lt!381100) (_2!11417 lt!381112)))))

(assert (=> b!244549 e!169494))

(declare-fun res!204396 () Bool)

(assert (=> b!244549 (=> (not res!204396) (not e!169494))))

(assert (=> b!244549 (= res!204396 (= (size!5871 (buf!6343 (_2!11417 lt!381100))) (size!5871 (buf!6343 (_2!11417 lt!381112)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10664 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20990)

(assert (=> b!244549 (= lt!381112 (appendNBitsLoop!0 (_2!11417 lt!381100) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244549 (validate_offset_bits!1 ((_ sign_extend 32) (size!5871 (buf!6343 (_2!11417 lt!381100)))) ((_ sign_extend 32) (currentByte!11721 (_2!11417 lt!381100))) ((_ sign_extend 32) (currentBit!11716 (_2!11417 lt!381100))) lt!381097)))

(assert (=> b!244549 (= lt!381097 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!381110 () Unit!17837)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10664 BitStream!10664 (_ BitVec 64) (_ BitVec 64)) Unit!17837)

(assert (=> b!244549 (= lt!381110 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11417 lt!381100) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!244549 e!169497))

(declare-fun res!204401 () Bool)

(assert (=> b!244549 (=> (not res!204401) (not e!169497))))

(assert (=> b!244549 (= res!204401 (= (size!5871 (buf!6343 thiss!1005)) (size!5871 (buf!6343 (_2!11417 lt!381100)))))))

(declare-fun appendBit!0 (BitStream!10664 Bool) tuple2!20990)

(assert (=> b!244549 (= lt!381100 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244550 () Bool)

(declare-fun lt!381104 () tuple2!20988)

(declare-fun lt!381096 () tuple2!20992)

(assert (=> b!244550 (= e!169502 (not (or (not (_2!11416 lt!381104)) (not (= (_1!11416 lt!381104) (_2!11418 lt!381096))))))))

(assert (=> b!244550 (= lt!381104 (checkBitsLoopPure!0 (_1!11418 lt!381096) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244550 (validate_offset_bits!1 ((_ sign_extend 32) (size!5871 (buf!6343 (_2!11417 lt!381112)))) ((_ sign_extend 32) (currentByte!11721 (_2!11417 lt!381100))) ((_ sign_extend 32) (currentBit!11716 (_2!11417 lt!381100))) lt!381101)))

(declare-fun lt!381107 () Unit!17837)

(assert (=> b!244550 (= lt!381107 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11417 lt!381100) (buf!6343 (_2!11417 lt!381112)) lt!381101))))

(assert (=> b!244550 (= lt!381096 (reader!0 (_2!11417 lt!381100) (_2!11417 lt!381112)))))

(assert (= (and start!52770 res!204397) b!244541))

(assert (= (and b!244541 res!204408) b!244542))

(assert (= (and b!244542 res!204404) b!244549))

(assert (= (and b!244549 res!204401) b!244538))

(assert (= (and b!244538 res!204405) b!244543))

(assert (= (and b!244543 res!204402) b!244546))

(assert (= (and b!244546 res!204399) b!244537))

(assert (= (and b!244549 res!204396) b!244547))

(assert (= (and b!244547 res!204398) b!244540))

(assert (= (and b!244540 res!204400) b!244550))

(assert (= (and b!244549 res!204407) b!244539))

(assert (= (and b!244539 res!204406) b!244548))

(assert (= (and b!244549 res!204403) b!244544))

(assert (= start!52770 b!244545))

(declare-fun m!368569 () Bool)

(assert (=> b!244539 m!368569))

(declare-fun m!368571 () Bool)

(assert (=> b!244548 m!368571))

(declare-fun m!368573 () Bool)

(assert (=> b!244547 m!368573))

(declare-fun m!368575 () Bool)

(assert (=> b!244547 m!368575))

(declare-fun m!368577 () Bool)

(assert (=> b!244543 m!368577))

(declare-fun m!368579 () Bool)

(assert (=> b!244546 m!368579))

(assert (=> b!244546 m!368579))

(declare-fun m!368581 () Bool)

(assert (=> b!244546 m!368581))

(declare-fun m!368583 () Bool)

(assert (=> b!244541 m!368583))

(assert (=> b!244538 m!368575))

(declare-fun m!368585 () Bool)

(assert (=> b!244538 m!368585))

(declare-fun m!368587 () Bool)

(assert (=> b!244545 m!368587))

(declare-fun m!368589 () Bool)

(assert (=> b!244549 m!368589))

(declare-fun m!368591 () Bool)

(assert (=> b!244549 m!368591))

(declare-fun m!368593 () Bool)

(assert (=> b!244549 m!368593))

(declare-fun m!368595 () Bool)

(assert (=> b!244549 m!368595))

(declare-fun m!368597 () Bool)

(assert (=> b!244549 m!368597))

(declare-fun m!368599 () Bool)

(assert (=> b!244549 m!368599))

(declare-fun m!368601 () Bool)

(assert (=> b!244549 m!368601))

(declare-fun m!368603 () Bool)

(assert (=> b!244549 m!368603))

(declare-fun m!368605 () Bool)

(assert (=> b!244549 m!368605))

(declare-fun m!368607 () Bool)

(assert (=> b!244549 m!368607))

(declare-fun m!368609 () Bool)

(assert (=> b!244549 m!368609))

(declare-fun m!368611 () Bool)

(assert (=> b!244549 m!368611))

(declare-fun m!368613 () Bool)

(assert (=> b!244549 m!368613))

(declare-fun m!368615 () Bool)

(assert (=> b!244549 m!368615))

(declare-fun m!368617 () Bool)

(assert (=> b!244549 m!368617))

(declare-fun m!368619 () Bool)

(assert (=> b!244549 m!368619))

(declare-fun m!368621 () Bool)

(assert (=> b!244549 m!368621))

(declare-fun m!368623 () Bool)

(assert (=> b!244549 m!368623))

(declare-fun m!368625 () Bool)

(assert (=> b!244549 m!368625))

(declare-fun m!368627 () Bool)

(assert (=> b!244537 m!368627))

(declare-fun m!368629 () Bool)

(assert (=> start!52770 m!368629))

(declare-fun m!368631 () Bool)

(assert (=> b!244540 m!368631))

(declare-fun m!368633 () Bool)

(assert (=> b!244550 m!368633))

(declare-fun m!368635 () Bool)

(assert (=> b!244550 m!368635))

(declare-fun m!368637 () Bool)

(assert (=> b!244550 m!368637))

(assert (=> b!244550 m!368607))

(push 1)

(assert (not b!244547))

(assert (not b!244537))

(assert (not b!244548))

(assert (not b!244538))

(assert (not b!244540))

(assert (not b!244550))

(assert (not b!244549))

(assert (not b!244539))

(assert (not b!244546))

(assert (not b!244545))

(assert (not b!244541))

(assert (not start!52770))

(assert (not b!244543))

(check-sat)

(pop 1)

(push 1)

(check-sat)

