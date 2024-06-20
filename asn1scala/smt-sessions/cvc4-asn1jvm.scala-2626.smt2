; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64832 () Bool)

(assert start!64832)

(declare-fun b!290995 () Bool)

(declare-fun res!240398 () Bool)

(declare-fun e!207336 () Bool)

(assert (=> b!290995 (=> (not res!240398) (not e!207336))))

(declare-datatypes ((array!17271 0))(
  ( (array!17272 (arr!8490 (Array (_ BitVec 32) (_ BitVec 8))) (size!7476 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12962 0))(
  ( (BitStream!12963 (buf!7542 array!17271) (currentByte!13967 (_ BitVec 32)) (currentBit!13962 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12962)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290995 (= res!240398 (validate_offset_bits!1 ((_ sign_extend 32) (size!7476 (buf!7542 thiss!1728))) ((_ sign_extend 32) (currentByte!13967 thiss!1728)) ((_ sign_extend 32) (currentBit!13962 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290996 () Bool)

(declare-datatypes ((Unit!20217 0))(
  ( (Unit!20218) )
))
(declare-datatypes ((tuple3!1696 0))(
  ( (tuple3!1697 (_1!12692 Unit!20217) (_2!12692 BitStream!12962) (_3!1268 array!17271)) )
))
(declare-fun lt!422632 () tuple3!1696)

(assert (=> b!290996 (= e!207336 (not (bvslt from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7476 (_3!1268 lt!422632)))))))))

(declare-fun e!207334 () Bool)

(assert (=> b!290996 e!207334))

(declare-fun res!240394 () Bool)

(assert (=> b!290996 (=> (not res!240394) (not e!207334))))

(declare-fun lt!422630 () array!17271)

(declare-fun lt!422635 () Bool)

(declare-fun bitAt!0 (array!17271 (_ BitVec 64)) Bool)

(assert (=> b!290996 (= res!240394 (= (bitAt!0 lt!422630 from!505) lt!422635))))

(assert (=> b!290996 (= lt!422635 (bitAt!0 (_3!1268 lt!422632) from!505))))

(declare-fun lt!422629 () Unit!20217)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17271 array!17271 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20217)

(assert (=> b!290996 (= lt!422629 (arrayBitRangesEqImpliesEq!0 lt!422630 (_3!1268 lt!422632) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17271)

(declare-fun arrayBitRangesEq!0 (array!17271 array!17271 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290996 (arrayBitRangesEq!0 arr!273 (_3!1268 lt!422632) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422628 () Unit!20217)

(declare-fun arrayBitRangesEqTransitive!0 (array!17271 array!17271 array!17271 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20217)

(assert (=> b!290996 (= lt!422628 (arrayBitRangesEqTransitive!0 arr!273 lt!422630 (_3!1268 lt!422632) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290996 (arrayBitRangesEq!0 arr!273 lt!422630 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22848 0))(
  ( (tuple2!22849 (_1!12693 Bool) (_2!12693 BitStream!12962)) )
))
(declare-fun lt!422631 () tuple2!22848)

(declare-fun lt!422636 () Unit!20217)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17271 (_ BitVec 64) Bool) Unit!20217)

(assert (=> b!290996 (= lt!422636 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12693 lt!422631)))))

(declare-fun e!207331 () Bool)

(assert (=> b!290996 e!207331))

(declare-fun res!240395 () Bool)

(assert (=> b!290996 (=> (not res!240395) (not e!207331))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290996 (= res!240395 (= (bvsub (bvadd (bitIndex!0 (size!7476 (buf!7542 thiss!1728)) (currentByte!13967 thiss!1728) (currentBit!13962 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7476 (buf!7542 (_2!12692 lt!422632))) (currentByte!13967 (_2!12692 lt!422632)) (currentBit!13962 (_2!12692 lt!422632)))))))

(declare-fun readBitsLoop!0 (BitStream!12962 (_ BitVec 64) array!17271 (_ BitVec 64) (_ BitVec 64)) tuple3!1696)

(assert (=> b!290996 (= lt!422632 (readBitsLoop!0 (_2!12693 lt!422631) nBits!523 lt!422630 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290996 (validate_offset_bits!1 ((_ sign_extend 32) (size!7476 (buf!7542 (_2!12693 lt!422631)))) ((_ sign_extend 32) (currentByte!13967 (_2!12693 lt!422631))) ((_ sign_extend 32) (currentBit!13962 (_2!12693 lt!422631))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422633 () Unit!20217)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12962 BitStream!12962 (_ BitVec 64) (_ BitVec 64)) Unit!20217)

(assert (=> b!290996 (= lt!422633 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12693 lt!422631) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422637 () (_ BitVec 32))

(declare-fun lt!422634 () (_ BitVec 32))

(assert (=> b!290996 (= lt!422630 (array!17272 (store (arr!8490 arr!273) lt!422637 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8490 arr!273) lt!422637)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422634)))) ((_ sign_extend 24) (ite (_1!12693 lt!422631) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422634) #b00000000))))) (size!7476 arr!273)))))

(assert (=> b!290996 (= lt!422634 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290996 (= lt!422637 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12962) tuple2!22848)

(assert (=> b!290996 (= lt!422631 (readBit!0 thiss!1728))))

(declare-fun res!240397 () Bool)

(assert (=> start!64832 (=> (not res!240397) (not e!207336))))

(assert (=> start!64832 (= res!240397 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7476 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64832 e!207336))

(declare-fun e!207335 () Bool)

(declare-fun inv!12 (BitStream!12962) Bool)

(assert (=> start!64832 (and (inv!12 thiss!1728) e!207335)))

(assert (=> start!64832 true))

(declare-fun array_inv!7088 (array!17271) Bool)

(assert (=> start!64832 (array_inv!7088 arr!273)))

(declare-fun b!290997 () Bool)

(assert (=> b!290997 (= e!207331 (and (= (buf!7542 thiss!1728) (buf!7542 (_2!12692 lt!422632))) (= (size!7476 arr!273) (size!7476 (_3!1268 lt!422632)))))))

(declare-fun b!290998 () Bool)

(assert (=> b!290998 (= e!207334 (= lt!422635 (_1!12693 lt!422631)))))

(declare-fun b!290999 () Bool)

(assert (=> b!290999 (= e!207335 (array_inv!7088 (buf!7542 thiss!1728)))))

(declare-fun b!291000 () Bool)

(declare-fun res!240396 () Bool)

(assert (=> b!291000 (=> (not res!240396) (not e!207336))))

(assert (=> b!291000 (= res!240396 (bvslt from!505 to!474))))

(assert (= (and start!64832 res!240397) b!290995))

(assert (= (and b!290995 res!240398) b!291000))

(assert (= (and b!291000 res!240396) b!290996))

(assert (= (and b!290996 res!240395) b!290997))

(assert (= (and b!290996 res!240394) b!290998))

(assert (= start!64832 b!290999))

(declare-fun m!425595 () Bool)

(assert (=> b!290995 m!425595))

(declare-fun m!425597 () Bool)

(assert (=> b!290996 m!425597))

(declare-fun m!425599 () Bool)

(assert (=> b!290996 m!425599))

(declare-fun m!425601 () Bool)

(assert (=> b!290996 m!425601))

(declare-fun m!425603 () Bool)

(assert (=> b!290996 m!425603))

(declare-fun m!425605 () Bool)

(assert (=> b!290996 m!425605))

(declare-fun m!425607 () Bool)

(assert (=> b!290996 m!425607))

(declare-fun m!425609 () Bool)

(assert (=> b!290996 m!425609))

(declare-fun m!425611 () Bool)

(assert (=> b!290996 m!425611))

(declare-fun m!425613 () Bool)

(assert (=> b!290996 m!425613))

(declare-fun m!425615 () Bool)

(assert (=> b!290996 m!425615))

(declare-fun m!425617 () Bool)

(assert (=> b!290996 m!425617))

(declare-fun m!425619 () Bool)

(assert (=> b!290996 m!425619))

(declare-fun m!425621 () Bool)

(assert (=> b!290996 m!425621))

(declare-fun m!425623 () Bool)

(assert (=> b!290996 m!425623))

(declare-fun m!425625 () Bool)

(assert (=> b!290996 m!425625))

(declare-fun m!425627 () Bool)

(assert (=> b!290996 m!425627))

(declare-fun m!425629 () Bool)

(assert (=> start!64832 m!425629))

(declare-fun m!425631 () Bool)

(assert (=> start!64832 m!425631))

(declare-fun m!425633 () Bool)

(assert (=> b!290999 m!425633))

(push 1)

(assert (not b!290999))

(assert (not start!64832))

(assert (not b!290995))

(assert (not b!290996))

(check-sat)

(pop 1)

(push 1)

(check-sat)

