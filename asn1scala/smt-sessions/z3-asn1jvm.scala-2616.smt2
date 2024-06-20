; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64614 () Bool)

(assert start!64614)

(declare-fun res!239631 () Bool)

(declare-fun e!206505 () Bool)

(assert (=> start!64614 (=> (not res!239631) (not e!206505))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17203 0))(
  ( (array!17204 (arr!8447 (Array (_ BitVec 32) (_ BitVec 8))) (size!7445 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17203)

(assert (=> start!64614 (= res!239631 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7445 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64614 e!206505))

(declare-datatypes ((BitStream!12900 0))(
  ( (BitStream!12901 (buf!7511 array!17203) (currentByte!13918 (_ BitVec 32)) (currentBit!13913 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12900)

(declare-fun e!206508 () Bool)

(declare-fun inv!12 (BitStream!12900) Bool)

(assert (=> start!64614 (and (inv!12 thiss!1728) e!206508)))

(assert (=> start!64614 true))

(declare-fun array_inv!7057 (array!17203) Bool)

(assert (=> start!64614 (array_inv!7057 arr!273)))

(declare-fun b!290048 () Bool)

(assert (=> b!290048 (= e!206505 (not true))))

(declare-datatypes ((Unit!20131 0))(
  ( (Unit!20132) )
))
(declare-datatypes ((tuple3!1634 0))(
  ( (tuple3!1635 (_1!12613 Unit!20131) (_2!12613 BitStream!12900) (_3!1231 array!17203)) )
))
(declare-fun lt!420660 () tuple3!1634)

(declare-fun arrayBitRangesEq!0 (array!17203 array!17203 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290048 (arrayBitRangesEq!0 arr!273 (_3!1231 lt!420660) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420653 () array!17203)

(declare-fun lt!420657 () Unit!20131)

(declare-fun arrayBitRangesEqTransitive!0 (array!17203 array!17203 array!17203 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20131)

(assert (=> b!290048 (= lt!420657 (arrayBitRangesEqTransitive!0 arr!273 lt!420653 (_3!1231 lt!420660) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290048 (arrayBitRangesEq!0 arr!273 lt!420653 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420654 () Unit!20131)

(declare-datatypes ((tuple2!22764 0))(
  ( (tuple2!22765 (_1!12614 Bool) (_2!12614 BitStream!12900)) )
))
(declare-fun lt!420659 () tuple2!22764)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17203 (_ BitVec 64) Bool) Unit!20131)

(assert (=> b!290048 (= lt!420654 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12614 lt!420659)))))

(declare-fun e!206507 () Bool)

(assert (=> b!290048 e!206507))

(declare-fun res!239630 () Bool)

(assert (=> b!290048 (=> (not res!239630) (not e!206507))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290048 (= res!239630 (= (bvsub (bvadd (bitIndex!0 (size!7445 (buf!7511 thiss!1728)) (currentByte!13918 thiss!1728) (currentBit!13913 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7445 (buf!7511 (_2!12613 lt!420660))) (currentByte!13918 (_2!12613 lt!420660)) (currentBit!13913 (_2!12613 lt!420660)))))))

(declare-fun readBitsLoop!0 (BitStream!12900 (_ BitVec 64) array!17203 (_ BitVec 64) (_ BitVec 64)) tuple3!1634)

(assert (=> b!290048 (= lt!420660 (readBitsLoop!0 (_2!12614 lt!420659) nBits!523 lt!420653 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290048 (validate_offset_bits!1 ((_ sign_extend 32) (size!7445 (buf!7511 (_2!12614 lt!420659)))) ((_ sign_extend 32) (currentByte!13918 (_2!12614 lt!420659))) ((_ sign_extend 32) (currentBit!13913 (_2!12614 lt!420659))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420658 () Unit!20131)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12900 BitStream!12900 (_ BitVec 64) (_ BitVec 64)) Unit!20131)

(assert (=> b!290048 (= lt!420658 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12614 lt!420659) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420656 () (_ BitVec 32))

(declare-fun lt!420655 () (_ BitVec 32))

(assert (=> b!290048 (= lt!420653 (array!17204 (store (arr!8447 arr!273) lt!420656 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8447 arr!273) lt!420656)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420655)))) ((_ sign_extend 24) (ite (_1!12614 lt!420659) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420655) #b00000000))))) (size!7445 arr!273)))))

(assert (=> b!290048 (= lt!420655 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290048 (= lt!420656 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12900) tuple2!22764)

(assert (=> b!290048 (= lt!420659 (readBit!0 thiss!1728))))

(declare-fun b!290049 () Bool)

(declare-fun res!239632 () Bool)

(assert (=> b!290049 (=> (not res!239632) (not e!206505))))

(assert (=> b!290049 (= res!239632 (validate_offset_bits!1 ((_ sign_extend 32) (size!7445 (buf!7511 thiss!1728))) ((_ sign_extend 32) (currentByte!13918 thiss!1728)) ((_ sign_extend 32) (currentBit!13913 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290050 () Bool)

(declare-fun res!239633 () Bool)

(assert (=> b!290050 (=> (not res!239633) (not e!206505))))

(assert (=> b!290050 (= res!239633 (bvslt from!505 to!474))))

(declare-fun b!290051 () Bool)

(assert (=> b!290051 (= e!206508 (array_inv!7057 (buf!7511 thiss!1728)))))

(declare-fun b!290052 () Bool)

(assert (=> b!290052 (= e!206507 (and (= (buf!7511 thiss!1728) (buf!7511 (_2!12613 lt!420660))) (= (size!7445 arr!273) (size!7445 (_3!1231 lt!420660)))))))

(assert (= (and start!64614 res!239631) b!290049))

(assert (= (and b!290049 res!239632) b!290050))

(assert (= (and b!290050 res!239633) b!290048))

(assert (= (and b!290048 res!239630) b!290052))

(assert (= start!64614 b!290051))

(declare-fun m!423623 () Bool)

(assert (=> start!64614 m!423623))

(declare-fun m!423625 () Bool)

(assert (=> start!64614 m!423625))

(declare-fun m!423627 () Bool)

(assert (=> b!290048 m!423627))

(declare-fun m!423629 () Bool)

(assert (=> b!290048 m!423629))

(declare-fun m!423631 () Bool)

(assert (=> b!290048 m!423631))

(declare-fun m!423633 () Bool)

(assert (=> b!290048 m!423633))

(declare-fun m!423635 () Bool)

(assert (=> b!290048 m!423635))

(declare-fun m!423637 () Bool)

(assert (=> b!290048 m!423637))

(declare-fun m!423639 () Bool)

(assert (=> b!290048 m!423639))

(declare-fun m!423641 () Bool)

(assert (=> b!290048 m!423641))

(declare-fun m!423643 () Bool)

(assert (=> b!290048 m!423643))

(declare-fun m!423645 () Bool)

(assert (=> b!290048 m!423645))

(declare-fun m!423647 () Bool)

(assert (=> b!290048 m!423647))

(declare-fun m!423649 () Bool)

(assert (=> b!290048 m!423649))

(declare-fun m!423651 () Bool)

(assert (=> b!290048 m!423651))

(declare-fun m!423653 () Bool)

(assert (=> b!290049 m!423653))

(declare-fun m!423655 () Bool)

(assert (=> b!290051 m!423655))

(check-sat (not b!290051) (not b!290048) (not start!64614) (not b!290049))
