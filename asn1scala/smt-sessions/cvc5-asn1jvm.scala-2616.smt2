; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64612 () Bool)

(assert start!64612)

(declare-fun b!290033 () Bool)

(declare-fun e!206493 () Bool)

(declare-datatypes ((array!17201 0))(
  ( (array!17202 (arr!8446 (Array (_ BitVec 32) (_ BitVec 8))) (size!7444 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12898 0))(
  ( (BitStream!12899 (buf!7510 array!17201) (currentByte!13917 (_ BitVec 32)) (currentBit!13912 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12898)

(declare-fun array_inv!7056 (array!17201) Bool)

(assert (=> b!290033 (= e!206493 (array_inv!7056 (buf!7510 thiss!1728)))))

(declare-fun b!290035 () Bool)

(declare-fun e!206490 () Bool)

(assert (=> b!290035 (= e!206490 (not true))))

(declare-fun arr!273 () array!17201)

(declare-datatypes ((Unit!20129 0))(
  ( (Unit!20130) )
))
(declare-datatypes ((tuple3!1632 0))(
  ( (tuple3!1633 (_1!12611 Unit!20129) (_2!12611 BitStream!12898) (_3!1230 array!17201)) )
))
(declare-fun lt!420635 () tuple3!1632)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17201 array!17201 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290035 (arrayBitRangesEq!0 arr!273 (_3!1230 lt!420635) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420632 () Unit!20129)

(declare-fun lt!420630 () array!17201)

(declare-fun arrayBitRangesEqTransitive!0 (array!17201 array!17201 array!17201 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20129)

(assert (=> b!290035 (= lt!420632 (arrayBitRangesEqTransitive!0 arr!273 lt!420630 (_3!1230 lt!420635) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290035 (arrayBitRangesEq!0 arr!273 lt!420630 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22762 0))(
  ( (tuple2!22763 (_1!12612 Bool) (_2!12612 BitStream!12898)) )
))
(declare-fun lt!420631 () tuple2!22762)

(declare-fun lt!420633 () Unit!20129)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17201 (_ BitVec 64) Bool) Unit!20129)

(assert (=> b!290035 (= lt!420633 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12612 lt!420631)))))

(declare-fun e!206491 () Bool)

(assert (=> b!290035 e!206491))

(declare-fun res!239620 () Bool)

(assert (=> b!290035 (=> (not res!239620) (not e!206491))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290035 (= res!239620 (= (bvsub (bvadd (bitIndex!0 (size!7444 (buf!7510 thiss!1728)) (currentByte!13917 thiss!1728) (currentBit!13912 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7444 (buf!7510 (_2!12611 lt!420635))) (currentByte!13917 (_2!12611 lt!420635)) (currentBit!13912 (_2!12611 lt!420635)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12898 (_ BitVec 64) array!17201 (_ BitVec 64) (_ BitVec 64)) tuple3!1632)

(assert (=> b!290035 (= lt!420635 (readBitsLoop!0 (_2!12612 lt!420631) nBits!523 lt!420630 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290035 (validate_offset_bits!1 ((_ sign_extend 32) (size!7444 (buf!7510 (_2!12612 lt!420631)))) ((_ sign_extend 32) (currentByte!13917 (_2!12612 lt!420631))) ((_ sign_extend 32) (currentBit!13912 (_2!12612 lt!420631))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420636 () Unit!20129)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12898 BitStream!12898 (_ BitVec 64) (_ BitVec 64)) Unit!20129)

(assert (=> b!290035 (= lt!420636 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12612 lt!420631) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420629 () (_ BitVec 32))

(declare-fun lt!420634 () (_ BitVec 32))

(assert (=> b!290035 (= lt!420630 (array!17202 (store (arr!8446 arr!273) lt!420634 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8446 arr!273) lt!420634)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420629)))) ((_ sign_extend 24) (ite (_1!12612 lt!420631) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420629) #b00000000))))) (size!7444 arr!273)))))

(assert (=> b!290035 (= lt!420629 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290035 (= lt!420634 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12898) tuple2!22762)

(assert (=> b!290035 (= lt!420631 (readBit!0 thiss!1728))))

(declare-fun b!290036 () Bool)

(declare-fun res!239618 () Bool)

(assert (=> b!290036 (=> (not res!239618) (not e!206490))))

(assert (=> b!290036 (= res!239618 (validate_offset_bits!1 ((_ sign_extend 32) (size!7444 (buf!7510 thiss!1728))) ((_ sign_extend 32) (currentByte!13917 thiss!1728)) ((_ sign_extend 32) (currentBit!13912 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290037 () Bool)

(assert (=> b!290037 (= e!206491 (and (= (buf!7510 thiss!1728) (buf!7510 (_2!12611 lt!420635))) (= (size!7444 arr!273) (size!7444 (_3!1230 lt!420635)))))))

(declare-fun b!290034 () Bool)

(declare-fun res!239621 () Bool)

(assert (=> b!290034 (=> (not res!239621) (not e!206490))))

(assert (=> b!290034 (= res!239621 (bvslt from!505 to!474))))

(declare-fun res!239619 () Bool)

(assert (=> start!64612 (=> (not res!239619) (not e!206490))))

(assert (=> start!64612 (= res!239619 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7444 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64612 e!206490))

(declare-fun inv!12 (BitStream!12898) Bool)

(assert (=> start!64612 (and (inv!12 thiss!1728) e!206493)))

(assert (=> start!64612 true))

(assert (=> start!64612 (array_inv!7056 arr!273)))

(assert (= (and start!64612 res!239619) b!290036))

(assert (= (and b!290036 res!239618) b!290034))

(assert (= (and b!290034 res!239621) b!290035))

(assert (= (and b!290035 res!239620) b!290037))

(assert (= start!64612 b!290033))

(declare-fun m!423589 () Bool)

(assert (=> b!290033 m!423589))

(declare-fun m!423591 () Bool)

(assert (=> b!290035 m!423591))

(declare-fun m!423593 () Bool)

(assert (=> b!290035 m!423593))

(declare-fun m!423595 () Bool)

(assert (=> b!290035 m!423595))

(declare-fun m!423597 () Bool)

(assert (=> b!290035 m!423597))

(declare-fun m!423599 () Bool)

(assert (=> b!290035 m!423599))

(declare-fun m!423601 () Bool)

(assert (=> b!290035 m!423601))

(declare-fun m!423603 () Bool)

(assert (=> b!290035 m!423603))

(declare-fun m!423605 () Bool)

(assert (=> b!290035 m!423605))

(declare-fun m!423607 () Bool)

(assert (=> b!290035 m!423607))

(declare-fun m!423609 () Bool)

(assert (=> b!290035 m!423609))

(declare-fun m!423611 () Bool)

(assert (=> b!290035 m!423611))

(declare-fun m!423613 () Bool)

(assert (=> b!290035 m!423613))

(declare-fun m!423615 () Bool)

(assert (=> b!290035 m!423615))

(declare-fun m!423617 () Bool)

(assert (=> b!290036 m!423617))

(declare-fun m!423619 () Bool)

(assert (=> start!64612 m!423619))

(declare-fun m!423621 () Bool)

(assert (=> start!64612 m!423621))

(push 1)

(assert (not b!290036))

(assert (not b!290033))

(assert (not b!290035))

(assert (not start!64612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

