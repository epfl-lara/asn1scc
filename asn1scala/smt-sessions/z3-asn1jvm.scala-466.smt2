; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13388 () Bool)

(assert start!13388)

(declare-fun b!68536 () Bool)

(declare-fun e!44812 () Bool)

(declare-fun e!44813 () Bool)

(assert (=> b!68536 (= e!44812 e!44813)))

(declare-fun res!56660 () Bool)

(assert (=> b!68536 (=> res!56660 e!44813)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!109767 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!109779 () (_ BitVec 64))

(assert (=> b!68536 (= res!56660 (not (= lt!109779 (bvsub (bvadd lt!109767 to!314) i!635))))))

(declare-datatypes ((array!2886 0))(
  ( (array!2887 (arr!1914 (Array (_ BitVec 32) (_ BitVec 8))) (size!1338 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2286 0))(
  ( (BitStream!2287 (buf!1719 array!2886) (currentByte!3415 (_ BitVec 32)) (currentBit!3410 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4609 0))(
  ( (Unit!4610) )
))
(declare-datatypes ((tuple2!6004 0))(
  ( (tuple2!6005 (_1!3113 Unit!4609) (_2!3113 BitStream!2286)) )
))
(declare-fun lt!109781 () tuple2!6004)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!68536 (= lt!109779 (bitIndex!0 (size!1338 (buf!1719 (_2!3113 lt!109781))) (currentByte!3415 (_2!3113 lt!109781)) (currentBit!3410 (_2!3113 lt!109781))))))

(declare-fun b!68537 () Bool)

(declare-fun e!44810 () Bool)

(declare-fun thiss!1379 () BitStream!2286)

(declare-fun array_inv!1202 (array!2886) Bool)

(assert (=> b!68537 (= e!44810 (array_inv!1202 (buf!1719 thiss!1379)))))

(declare-fun b!68538 () Bool)

(declare-fun e!44809 () Bool)

(assert (=> b!68538 (= e!44813 e!44809)))

(declare-fun res!56652 () Bool)

(assert (=> b!68538 (=> res!56652 e!44809)))

(declare-fun lt!109770 () tuple2!6004)

(assert (=> b!68538 (= res!56652 (not (= (size!1338 (buf!1719 (_2!3113 lt!109770))) (size!1338 (buf!1719 (_2!3113 lt!109781))))))))

(declare-fun e!44807 () Bool)

(assert (=> b!68538 e!44807))

(declare-fun res!56653 () Bool)

(assert (=> b!68538 (=> (not res!56653) (not e!44807))))

(assert (=> b!68538 (= res!56653 (= (size!1338 (buf!1719 (_2!3113 lt!109781))) (size!1338 (buf!1719 thiss!1379))))))

(declare-fun b!68539 () Bool)

(declare-fun res!56655 () Bool)

(declare-fun e!44811 () Bool)

(assert (=> b!68539 (=> (not res!56655) (not e!44811))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!68539 (= res!56655 (validate_offset_bits!1 ((_ sign_extend 32) (size!1338 (buf!1719 thiss!1379))) ((_ sign_extend 32) (currentByte!3415 thiss!1379)) ((_ sign_extend 32) (currentBit!3410 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun e!44805 () Bool)

(declare-fun b!68540 () Bool)

(declare-datatypes ((tuple2!6006 0))(
  ( (tuple2!6007 (_1!3114 BitStream!2286) (_2!3114 BitStream!2286)) )
))
(declare-fun lt!109778 () tuple2!6006)

(declare-fun srcBuffer!2 () array!2886)

(declare-datatypes ((List!718 0))(
  ( (Nil!715) (Cons!714 (h!833 Bool) (t!1468 List!718)) )
))
(declare-fun head!537 (List!718) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2286 array!2886 (_ BitVec 64) (_ BitVec 64)) List!718)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2286 BitStream!2286 (_ BitVec 64)) List!718)

(assert (=> b!68540 (= e!44805 (= (head!537 (byteArrayBitContentToList!0 (_2!3113 lt!109770) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!537 (bitStreamReadBitsIntoList!0 (_2!3113 lt!109770) (_1!3114 lt!109778) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!68541 () Bool)

(declare-fun res!56658 () Bool)

(assert (=> b!68541 (=> res!56658 e!44809)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!68541 (= res!56658 (not (invariant!0 (currentBit!3410 (_2!3113 lt!109770)) (currentByte!3415 (_2!3113 lt!109770)) (size!1338 (buf!1719 (_2!3113 lt!109770))))))))

(declare-fun b!68542 () Bool)

(declare-fun e!44804 () Bool)

(assert (=> b!68542 (= e!44804 e!44812)))

(declare-fun res!56650 () Bool)

(assert (=> b!68542 (=> res!56650 e!44812)))

(declare-fun isPrefixOf!0 (BitStream!2286 BitStream!2286) Bool)

(assert (=> b!68542 (= res!56650 (not (isPrefixOf!0 (_2!3113 lt!109770) (_2!3113 lt!109781))))))

(assert (=> b!68542 (isPrefixOf!0 thiss!1379 (_2!3113 lt!109781))))

(declare-fun lt!109776 () Unit!4609)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2286 BitStream!2286 BitStream!2286) Unit!4609)

(assert (=> b!68542 (= lt!109776 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3113 lt!109770) (_2!3113 lt!109781)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2286 array!2886 (_ BitVec 64) (_ BitVec 64)) tuple2!6004)

(assert (=> b!68542 (= lt!109781 (appendBitsMSBFirstLoop!0 (_2!3113 lt!109770) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!68542 e!44805))

(declare-fun res!56664 () Bool)

(assert (=> b!68542 (=> (not res!56664) (not e!44805))))

(assert (=> b!68542 (= res!56664 (validate_offset_bits!1 ((_ sign_extend 32) (size!1338 (buf!1719 (_2!3113 lt!109770)))) ((_ sign_extend 32) (currentByte!3415 thiss!1379)) ((_ sign_extend 32) (currentBit!3410 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109780 () Unit!4609)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2286 array!2886 (_ BitVec 64)) Unit!4609)

(assert (=> b!68542 (= lt!109780 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1719 (_2!3113 lt!109770)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2286 BitStream!2286) tuple2!6006)

(assert (=> b!68542 (= lt!109778 (reader!0 thiss!1379 (_2!3113 lt!109770)))))

(declare-fun res!56656 () Bool)

(assert (=> start!13388 (=> (not res!56656) (not e!44811))))

(assert (=> start!13388 (= res!56656 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1338 srcBuffer!2))))))))

(assert (=> start!13388 e!44811))

(assert (=> start!13388 true))

(assert (=> start!13388 (array_inv!1202 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2286) Bool)

(assert (=> start!13388 (and (inv!12 thiss!1379) e!44810)))

(declare-fun b!68543 () Bool)

(assert (=> b!68543 (= e!44807 (= lt!109779 (bvsub (bvsub (bvadd (bitIndex!0 (size!1338 (buf!1719 (_2!3113 lt!109770))) (currentByte!3415 (_2!3113 lt!109770)) (currentBit!3410 (_2!3113 lt!109770))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!68544 () Bool)

(declare-fun e!44803 () Bool)

(assert (=> b!68544 (= e!44811 (not e!44803))))

(declare-fun res!56661 () Bool)

(assert (=> b!68544 (=> res!56661 e!44803)))

(assert (=> b!68544 (= res!56661 (bvsge i!635 to!314))))

(assert (=> b!68544 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!109769 () Unit!4609)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2286) Unit!4609)

(assert (=> b!68544 (= lt!109769 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!68544 (= lt!109767 (bitIndex!0 (size!1338 (buf!1719 thiss!1379)) (currentByte!3415 thiss!1379) (currentBit!3410 thiss!1379)))))

(declare-fun b!68545 () Bool)

(declare-fun res!56657 () Bool)

(assert (=> b!68545 (=> res!56657 e!44809)))

(assert (=> b!68545 (= res!56657 (not (invariant!0 (currentBit!3410 (_2!3113 lt!109770)) (currentByte!3415 (_2!3113 lt!109770)) (size!1338 (buf!1719 (_2!3113 lt!109781))))))))

(declare-fun b!68546 () Bool)

(declare-fun res!56651 () Bool)

(declare-fun e!44808 () Bool)

(assert (=> b!68546 (=> res!56651 e!44808)))

(declare-fun lt!109772 () List!718)

(declare-fun length!346 (List!718) Int)

(assert (=> b!68546 (= res!56651 (<= (length!346 lt!109772) 0))))

(declare-fun b!68547 () Bool)

(assert (=> b!68547 (= e!44808 true)))

(declare-fun lt!109768 () List!718)

(declare-fun tail!322 (List!718) List!718)

(assert (=> b!68547 (= lt!109768 (tail!322 lt!109772))))

(declare-fun lt!109773 () tuple2!6006)

(declare-fun lt!109782 () tuple2!6006)

(declare-fun lt!109783 () Unit!4609)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2286 BitStream!2286 BitStream!2286 BitStream!2286 (_ BitVec 64) List!718) Unit!4609)

(assert (=> b!68547 (= lt!109783 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3113 lt!109781) (_2!3113 lt!109781) (_1!3114 lt!109782) (_1!3114 lt!109773) (bvsub to!314 i!635) lt!109772))))

(declare-fun b!68548 () Bool)

(declare-fun res!56659 () Bool)

(assert (=> b!68548 (=> res!56659 e!44813)))

(assert (=> b!68548 (= res!56659 (not (invariant!0 (currentBit!3410 (_2!3113 lt!109781)) (currentByte!3415 (_2!3113 lt!109781)) (size!1338 (buf!1719 (_2!3113 lt!109781))))))))

(declare-fun b!68549 () Bool)

(assert (=> b!68549 (= e!44803 e!44804)))

(declare-fun res!56663 () Bool)

(assert (=> b!68549 (=> res!56663 e!44804)))

(assert (=> b!68549 (= res!56663 (not (isPrefixOf!0 thiss!1379 (_2!3113 lt!109770))))))

(declare-fun lt!109771 () (_ BitVec 64))

(assert (=> b!68549 (validate_offset_bits!1 ((_ sign_extend 32) (size!1338 (buf!1719 (_2!3113 lt!109770)))) ((_ sign_extend 32) (currentByte!3415 (_2!3113 lt!109770))) ((_ sign_extend 32) (currentBit!3410 (_2!3113 lt!109770))) lt!109771)))

(assert (=> b!68549 (= lt!109771 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109777 () Unit!4609)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2286 BitStream!2286 (_ BitVec 64) (_ BitVec 64)) Unit!4609)

(assert (=> b!68549 (= lt!109777 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3113 lt!109770) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2286 (_ BitVec 8) (_ BitVec 32)) tuple2!6004)

(assert (=> b!68549 (= lt!109770 (appendBitFromByte!0 thiss!1379 (select (arr!1914 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!68550 () Bool)

(assert (=> b!68550 (= e!44809 e!44808)))

(declare-fun res!56654 () Bool)

(assert (=> b!68550 (=> res!56654 e!44808)))

(assert (=> b!68550 (= res!56654 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!68550 (= lt!109768 (bitStreamReadBitsIntoList!0 (_2!3113 lt!109781) (_1!3114 lt!109773) lt!109771))))

(assert (=> b!68550 (= lt!109772 (bitStreamReadBitsIntoList!0 (_2!3113 lt!109781) (_1!3114 lt!109782) (bvsub to!314 i!635)))))

(assert (=> b!68550 (validate_offset_bits!1 ((_ sign_extend 32) (size!1338 (buf!1719 (_2!3113 lt!109781)))) ((_ sign_extend 32) (currentByte!3415 (_2!3113 lt!109770))) ((_ sign_extend 32) (currentBit!3410 (_2!3113 lt!109770))) lt!109771)))

(declare-fun lt!109774 () Unit!4609)

(assert (=> b!68550 (= lt!109774 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3113 lt!109770) (buf!1719 (_2!3113 lt!109781)) lt!109771))))

(assert (=> b!68550 (= lt!109773 (reader!0 (_2!3113 lt!109770) (_2!3113 lt!109781)))))

(assert (=> b!68550 (validate_offset_bits!1 ((_ sign_extend 32) (size!1338 (buf!1719 (_2!3113 lt!109781)))) ((_ sign_extend 32) (currentByte!3415 thiss!1379)) ((_ sign_extend 32) (currentBit!3410 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!109775 () Unit!4609)

(assert (=> b!68550 (= lt!109775 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1719 (_2!3113 lt!109781)) (bvsub to!314 i!635)))))

(assert (=> b!68550 (= lt!109782 (reader!0 thiss!1379 (_2!3113 lt!109781)))))

(declare-fun b!68551 () Bool)

(declare-fun res!56662 () Bool)

(assert (=> b!68551 (=> res!56662 e!44813)))

(assert (=> b!68551 (= res!56662 (not (= (size!1338 (buf!1719 thiss!1379)) (size!1338 (buf!1719 (_2!3113 lt!109781))))))))

(assert (= (and start!13388 res!56656) b!68539))

(assert (= (and b!68539 res!56655) b!68544))

(assert (= (and b!68544 (not res!56661)) b!68549))

(assert (= (and b!68549 (not res!56663)) b!68542))

(assert (= (and b!68542 res!56664) b!68540))

(assert (= (and b!68542 (not res!56650)) b!68536))

(assert (= (and b!68536 (not res!56660)) b!68548))

(assert (= (and b!68548 (not res!56659)) b!68551))

(assert (= (and b!68551 (not res!56662)) b!68538))

(assert (= (and b!68538 res!56653) b!68543))

(assert (= (and b!68538 (not res!56652)) b!68541))

(assert (= (and b!68541 (not res!56658)) b!68545))

(assert (= (and b!68545 (not res!56657)) b!68550))

(assert (= (and b!68550 (not res!56654)) b!68546))

(assert (= (and b!68546 (not res!56651)) b!68547))

(assert (= start!13388 b!68537))

(declare-fun m!109447 () Bool)

(assert (=> b!68542 m!109447))

(declare-fun m!109449 () Bool)

(assert (=> b!68542 m!109449))

(declare-fun m!109451 () Bool)

(assert (=> b!68542 m!109451))

(declare-fun m!109453 () Bool)

(assert (=> b!68542 m!109453))

(declare-fun m!109455 () Bool)

(assert (=> b!68542 m!109455))

(declare-fun m!109457 () Bool)

(assert (=> b!68542 m!109457))

(declare-fun m!109459 () Bool)

(assert (=> b!68542 m!109459))

(declare-fun m!109461 () Bool)

(assert (=> b!68543 m!109461))

(declare-fun m!109463 () Bool)

(assert (=> b!68541 m!109463))

(declare-fun m!109465 () Bool)

(assert (=> b!68545 m!109465))

(declare-fun m!109467 () Bool)

(assert (=> b!68547 m!109467))

(declare-fun m!109469 () Bool)

(assert (=> b!68547 m!109469))

(declare-fun m!109471 () Bool)

(assert (=> start!13388 m!109471))

(declare-fun m!109473 () Bool)

(assert (=> start!13388 m!109473))

(declare-fun m!109475 () Bool)

(assert (=> b!68539 m!109475))

(declare-fun m!109477 () Bool)

(assert (=> b!68544 m!109477))

(declare-fun m!109479 () Bool)

(assert (=> b!68544 m!109479))

(declare-fun m!109481 () Bool)

(assert (=> b!68544 m!109481))

(declare-fun m!109483 () Bool)

(assert (=> b!68548 m!109483))

(declare-fun m!109485 () Bool)

(assert (=> b!68550 m!109485))

(declare-fun m!109487 () Bool)

(assert (=> b!68550 m!109487))

(declare-fun m!109489 () Bool)

(assert (=> b!68550 m!109489))

(declare-fun m!109491 () Bool)

(assert (=> b!68550 m!109491))

(declare-fun m!109493 () Bool)

(assert (=> b!68550 m!109493))

(declare-fun m!109495 () Bool)

(assert (=> b!68550 m!109495))

(declare-fun m!109497 () Bool)

(assert (=> b!68550 m!109497))

(declare-fun m!109499 () Bool)

(assert (=> b!68550 m!109499))

(declare-fun m!109501 () Bool)

(assert (=> b!68537 m!109501))

(declare-fun m!109503 () Bool)

(assert (=> b!68549 m!109503))

(declare-fun m!109505 () Bool)

(assert (=> b!68549 m!109505))

(declare-fun m!109507 () Bool)

(assert (=> b!68549 m!109507))

(assert (=> b!68549 m!109503))

(declare-fun m!109509 () Bool)

(assert (=> b!68549 m!109509))

(declare-fun m!109511 () Bool)

(assert (=> b!68549 m!109511))

(declare-fun m!109513 () Bool)

(assert (=> b!68536 m!109513))

(declare-fun m!109515 () Bool)

(assert (=> b!68540 m!109515))

(assert (=> b!68540 m!109515))

(declare-fun m!109517 () Bool)

(assert (=> b!68540 m!109517))

(declare-fun m!109519 () Bool)

(assert (=> b!68540 m!109519))

(assert (=> b!68540 m!109519))

(declare-fun m!109521 () Bool)

(assert (=> b!68540 m!109521))

(declare-fun m!109523 () Bool)

(assert (=> b!68546 m!109523))

(check-sat (not b!68541) (not b!68543) (not b!68537) (not b!68549) (not b!68544) (not b!68547) (not b!68536) (not b!68546) (not b!68542) (not b!68540) (not b!68539) (not b!68548) (not start!13388) (not b!68545) (not b!68550))
