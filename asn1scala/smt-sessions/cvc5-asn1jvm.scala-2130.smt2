; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54060 () Bool)

(assert start!54060)

(declare-fun b!251536 () Bool)

(declare-fun res!210655 () Bool)

(declare-fun e!174289 () Bool)

(assert (=> b!251536 (=> (not res!210655) (not e!174289))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13684 0))(
  ( (array!13685 (arr!6988 (Array (_ BitVec 32) (_ BitVec 8))) (size!6001 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10924 0))(
  ( (BitStream!10925 (buf!6503 array!13684) (currentByte!11958 (_ BitVec 32)) (currentBit!11953 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10924)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251536 (= res!210655 (validate_offset_bits!1 ((_ sign_extend 32) (size!6001 (buf!6503 thiss!1005))) ((_ sign_extend 32) (currentByte!11958 thiss!1005)) ((_ sign_extend 32) (currentBit!11953 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251537 () Bool)

(declare-fun e!174290 () Bool)

(declare-datatypes ((tuple2!21576 0))(
  ( (tuple2!21577 (_1!11716 BitStream!10924) (_2!11716 Bool)) )
))
(declare-fun lt!390886 () tuple2!21576)

(declare-fun lt!390891 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251537 (= e!174290 (= (bitIndex!0 (size!6001 (buf!6503 (_1!11716 lt!390886))) (currentByte!11958 (_1!11716 lt!390886)) (currentBit!11953 (_1!11716 lt!390886))) lt!390891))))

(declare-fun b!251538 () Bool)

(declare-fun e!174287 () Bool)

(declare-fun e!174285 () Bool)

(assert (=> b!251538 (= e!174287 e!174285)))

(declare-fun res!210657 () Bool)

(assert (=> b!251538 (=> (not res!210657) (not e!174285))))

(declare-datatypes ((Unit!18150 0))(
  ( (Unit!18151) )
))
(declare-datatypes ((tuple2!21578 0))(
  ( (tuple2!21579 (_1!11717 Unit!18150) (_2!11717 BitStream!10924)) )
))
(declare-fun lt!390899 () tuple2!21578)

(declare-fun lt!390890 () tuple2!21578)

(declare-fun lt!390894 () (_ BitVec 64))

(assert (=> b!251538 (= res!210657 (= (bitIndex!0 (size!6001 (buf!6503 (_2!11717 lt!390890))) (currentByte!11958 (_2!11717 lt!390890)) (currentBit!11953 (_2!11717 lt!390890))) (bvadd (bitIndex!0 (size!6001 (buf!6503 (_2!11717 lt!390899))) (currentByte!11958 (_2!11717 lt!390899)) (currentBit!11953 (_2!11717 lt!390899))) lt!390894)))))

(assert (=> b!251538 (= lt!390894 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251539 () Bool)

(declare-fun e!174282 () Bool)

(declare-fun e!174286 () Bool)

(assert (=> b!251539 (= e!174282 e!174286)))

(declare-fun res!210664 () Bool)

(assert (=> b!251539 (=> (not res!210664) (not e!174286))))

(declare-fun lt!390887 () (_ BitVec 64))

(assert (=> b!251539 (= res!210664 (= lt!390891 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!390887)))))

(assert (=> b!251539 (= lt!390891 (bitIndex!0 (size!6001 (buf!6503 (_2!11717 lt!390899))) (currentByte!11958 (_2!11717 lt!390899)) (currentBit!11953 (_2!11717 lt!390899))))))

(assert (=> b!251539 (= lt!390887 (bitIndex!0 (size!6001 (buf!6503 thiss!1005)) (currentByte!11958 thiss!1005) (currentBit!11953 thiss!1005)))))

(declare-fun b!251540 () Bool)

(declare-fun e!174283 () Bool)

(declare-fun lt!390889 () tuple2!21576)

(declare-fun lt!390898 () tuple2!21576)

(assert (=> b!251540 (= e!174283 (= (_2!11716 lt!390889) (_2!11716 lt!390898)))))

(declare-fun b!251541 () Bool)

(declare-fun e!174281 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251541 (= e!174281 (invariant!0 (currentBit!11953 thiss!1005) (currentByte!11958 thiss!1005) (size!6001 (buf!6503 (_2!11717 lt!390890)))))))

(declare-fun res!210659 () Bool)

(assert (=> start!54060 (=> (not res!210659) (not e!174289))))

(assert (=> start!54060 (= res!210659 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54060 e!174289))

(assert (=> start!54060 true))

(declare-fun e!174284 () Bool)

(declare-fun inv!12 (BitStream!10924) Bool)

(assert (=> start!54060 (and (inv!12 thiss!1005) e!174284)))

(declare-fun b!251542 () Bool)

(declare-fun res!210661 () Bool)

(assert (=> b!251542 (=> (not res!210661) (not e!174285))))

(declare-fun isPrefixOf!0 (BitStream!10924 BitStream!10924) Bool)

(assert (=> b!251542 (= res!210661 (isPrefixOf!0 (_2!11717 lt!390899) (_2!11717 lt!390890)))))

(declare-fun b!251543 () Bool)

(declare-fun array_inv!5742 (array!13684) Bool)

(assert (=> b!251543 (= e!174284 (array_inv!5742 (buf!6503 thiss!1005)))))

(declare-fun b!251544 () Bool)

(declare-fun res!210658 () Bool)

(assert (=> b!251544 (=> (not res!210658) (not e!174281))))

(assert (=> b!251544 (= res!210658 (invariant!0 (currentBit!11953 thiss!1005) (currentByte!11958 thiss!1005) (size!6001 (buf!6503 (_2!11717 lt!390899)))))))

(declare-fun b!251545 () Bool)

(assert (=> b!251545 (= e!174286 e!174290)))

(declare-fun res!210663 () Bool)

(assert (=> b!251545 (=> (not res!210663) (not e!174290))))

(declare-fun bit!26 () Bool)

(assert (=> b!251545 (= res!210663 (and (= (_2!11716 lt!390886) bit!26) (= (_1!11716 lt!390886) (_2!11717 lt!390899))))))

(declare-fun readBitPure!0 (BitStream!10924) tuple2!21576)

(declare-fun readerFrom!0 (BitStream!10924 (_ BitVec 32) (_ BitVec 32)) BitStream!10924)

(assert (=> b!251545 (= lt!390886 (readBitPure!0 (readerFrom!0 (_2!11717 lt!390899) (currentBit!11953 thiss!1005) (currentByte!11958 thiss!1005))))))

(declare-fun b!251546 () Bool)

(declare-fun lt!390900 () tuple2!21576)

(declare-datatypes ((tuple2!21580 0))(
  ( (tuple2!21581 (_1!11718 BitStream!10924) (_2!11718 BitStream!10924)) )
))
(declare-fun lt!390892 () tuple2!21580)

(assert (=> b!251546 (= e!174285 (not (or (not (_2!11716 lt!390900)) (not (= (_1!11716 lt!390900) (_2!11718 lt!390892))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10924 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21576)

(assert (=> b!251546 (= lt!390900 (checkBitsLoopPure!0 (_1!11718 lt!390892) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251546 (validate_offset_bits!1 ((_ sign_extend 32) (size!6001 (buf!6503 (_2!11717 lt!390890)))) ((_ sign_extend 32) (currentByte!11958 (_2!11717 lt!390899))) ((_ sign_extend 32) (currentBit!11953 (_2!11717 lt!390899))) lt!390894)))

(declare-fun lt!390885 () Unit!18150)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10924 array!13684 (_ BitVec 64)) Unit!18150)

(assert (=> b!251546 (= lt!390885 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11717 lt!390899) (buf!6503 (_2!11717 lt!390890)) lt!390894))))

(declare-fun reader!0 (BitStream!10924 BitStream!10924) tuple2!21580)

(assert (=> b!251546 (= lt!390892 (reader!0 (_2!11717 lt!390899) (_2!11717 lt!390890)))))

(declare-fun b!251547 () Bool)

(declare-fun res!210665 () Bool)

(assert (=> b!251547 (=> (not res!210665) (not e!174286))))

(assert (=> b!251547 (= res!210665 (isPrefixOf!0 thiss!1005 (_2!11717 lt!390899)))))

(declare-fun b!251548 () Bool)

(declare-fun res!210654 () Bool)

(assert (=> b!251548 (=> (not res!210654) (not e!174289))))

(assert (=> b!251548 (= res!210654 (bvslt from!289 nBits!297))))

(declare-fun b!251549 () Bool)

(assert (=> b!251549 (= e!174289 (not (= (size!6001 (buf!6503 thiss!1005)) (size!6001 (buf!6503 (_2!11717 lt!390890))))))))

(declare-fun lt!390895 () tuple2!21580)

(assert (=> b!251549 (= (_2!11716 (readBitPure!0 (_1!11718 lt!390895))) bit!26)))

(declare-fun lt!390884 () tuple2!21580)

(assert (=> b!251549 (= lt!390884 (reader!0 (_2!11717 lt!390899) (_2!11717 lt!390890)))))

(assert (=> b!251549 (= lt!390895 (reader!0 thiss!1005 (_2!11717 lt!390890)))))

(assert (=> b!251549 e!174283))

(declare-fun res!210666 () Bool)

(assert (=> b!251549 (=> (not res!210666) (not e!174283))))

(assert (=> b!251549 (= res!210666 (= (bitIndex!0 (size!6001 (buf!6503 (_1!11716 lt!390889))) (currentByte!11958 (_1!11716 lt!390889)) (currentBit!11953 (_1!11716 lt!390889))) (bitIndex!0 (size!6001 (buf!6503 (_1!11716 lt!390898))) (currentByte!11958 (_1!11716 lt!390898)) (currentBit!11953 (_1!11716 lt!390898)))))))

(declare-fun lt!390896 () Unit!18150)

(declare-fun lt!390893 () BitStream!10924)

(declare-fun readBitPrefixLemma!0 (BitStream!10924 BitStream!10924) Unit!18150)

(assert (=> b!251549 (= lt!390896 (readBitPrefixLemma!0 lt!390893 (_2!11717 lt!390890)))))

(assert (=> b!251549 (= lt!390898 (readBitPure!0 (BitStream!10925 (buf!6503 (_2!11717 lt!390890)) (currentByte!11958 thiss!1005) (currentBit!11953 thiss!1005))))))

(assert (=> b!251549 (= lt!390889 (readBitPure!0 lt!390893))))

(assert (=> b!251549 (= lt!390893 (BitStream!10925 (buf!6503 (_2!11717 lt!390899)) (currentByte!11958 thiss!1005) (currentBit!11953 thiss!1005)))))

(assert (=> b!251549 e!174281))

(declare-fun res!210656 () Bool)

(assert (=> b!251549 (=> (not res!210656) (not e!174281))))

(assert (=> b!251549 (= res!210656 (isPrefixOf!0 thiss!1005 (_2!11717 lt!390890)))))

(declare-fun lt!390888 () Unit!18150)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10924 BitStream!10924 BitStream!10924) Unit!18150)

(assert (=> b!251549 (= lt!390888 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11717 lt!390899) (_2!11717 lt!390890)))))

(assert (=> b!251549 e!174287))

(declare-fun res!210662 () Bool)

(assert (=> b!251549 (=> (not res!210662) (not e!174287))))

(assert (=> b!251549 (= res!210662 (= (size!6001 (buf!6503 (_2!11717 lt!390899))) (size!6001 (buf!6503 (_2!11717 lt!390890)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10924 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21578)

(assert (=> b!251549 (= lt!390890 (appendNBitsLoop!0 (_2!11717 lt!390899) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251549 (validate_offset_bits!1 ((_ sign_extend 32) (size!6001 (buf!6503 (_2!11717 lt!390899)))) ((_ sign_extend 32) (currentByte!11958 (_2!11717 lt!390899))) ((_ sign_extend 32) (currentBit!11953 (_2!11717 lt!390899))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!390897 () Unit!18150)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10924 BitStream!10924 (_ BitVec 64) (_ BitVec 64)) Unit!18150)

(assert (=> b!251549 (= lt!390897 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11717 lt!390899) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!251549 e!174282))

(declare-fun res!210660 () Bool)

(assert (=> b!251549 (=> (not res!210660) (not e!174282))))

(assert (=> b!251549 (= res!210660 (= (size!6001 (buf!6503 thiss!1005)) (size!6001 (buf!6503 (_2!11717 lt!390899)))))))

(declare-fun appendBit!0 (BitStream!10924 Bool) tuple2!21578)

(assert (=> b!251549 (= lt!390899 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!54060 res!210659) b!251536))

(assert (= (and b!251536 res!210655) b!251548))

(assert (= (and b!251548 res!210654) b!251549))

(assert (= (and b!251549 res!210660) b!251539))

(assert (= (and b!251539 res!210664) b!251547))

(assert (= (and b!251547 res!210665) b!251545))

(assert (= (and b!251545 res!210663) b!251537))

(assert (= (and b!251549 res!210662) b!251538))

(assert (= (and b!251538 res!210657) b!251542))

(assert (= (and b!251542 res!210661) b!251546))

(assert (= (and b!251549 res!210656) b!251544))

(assert (= (and b!251544 res!210658) b!251541))

(assert (= (and b!251549 res!210666) b!251540))

(assert (= start!54060 b!251543))

(declare-fun m!378447 () Bool)

(assert (=> b!251538 m!378447))

(declare-fun m!378449 () Bool)

(assert (=> b!251538 m!378449))

(declare-fun m!378451 () Bool)

(assert (=> b!251544 m!378451))

(declare-fun m!378453 () Bool)

(assert (=> b!251543 m!378453))

(assert (=> b!251539 m!378449))

(declare-fun m!378455 () Bool)

(assert (=> b!251539 m!378455))

(declare-fun m!378457 () Bool)

(assert (=> b!251537 m!378457))

(declare-fun m!378459 () Bool)

(assert (=> b!251542 m!378459))

(declare-fun m!378461 () Bool)

(assert (=> start!54060 m!378461))

(declare-fun m!378463 () Bool)

(assert (=> b!251547 m!378463))

(declare-fun m!378465 () Bool)

(assert (=> b!251546 m!378465))

(declare-fun m!378467 () Bool)

(assert (=> b!251546 m!378467))

(declare-fun m!378469 () Bool)

(assert (=> b!251546 m!378469))

(declare-fun m!378471 () Bool)

(assert (=> b!251546 m!378471))

(declare-fun m!378473 () Bool)

(assert (=> b!251545 m!378473))

(assert (=> b!251545 m!378473))

(declare-fun m!378475 () Bool)

(assert (=> b!251545 m!378475))

(declare-fun m!378477 () Bool)

(assert (=> b!251541 m!378477))

(declare-fun m!378479 () Bool)

(assert (=> b!251536 m!378479))

(declare-fun m!378481 () Bool)

(assert (=> b!251549 m!378481))

(declare-fun m!378483 () Bool)

(assert (=> b!251549 m!378483))

(declare-fun m!378485 () Bool)

(assert (=> b!251549 m!378485))

(declare-fun m!378487 () Bool)

(assert (=> b!251549 m!378487))

(declare-fun m!378489 () Bool)

(assert (=> b!251549 m!378489))

(declare-fun m!378491 () Bool)

(assert (=> b!251549 m!378491))

(declare-fun m!378493 () Bool)

(assert (=> b!251549 m!378493))

(declare-fun m!378495 () Bool)

(assert (=> b!251549 m!378495))

(declare-fun m!378497 () Bool)

(assert (=> b!251549 m!378497))

(assert (=> b!251549 m!378471))

(declare-fun m!378499 () Bool)

(assert (=> b!251549 m!378499))

(declare-fun m!378501 () Bool)

(assert (=> b!251549 m!378501))

(declare-fun m!378503 () Bool)

(assert (=> b!251549 m!378503))

(declare-fun m!378505 () Bool)

(assert (=> b!251549 m!378505))

(push 1)

(assert (not b!251538))

(assert (not b!251545))

(assert (not b!251544))

(assert (not b!251546))

(assert (not b!251539))

(assert (not b!251542))

(assert (not b!251536))

(assert (not start!54060))

(assert (not b!251543))

(assert (not b!251537))

(assert (not b!251541))

(assert (not b!251549))

(assert (not b!251547))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

