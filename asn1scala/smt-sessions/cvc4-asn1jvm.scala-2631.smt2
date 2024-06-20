; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64940 () Bool)

(assert start!64940)

(declare-fun b!291518 () Bool)

(declare-fun e!207783 () Bool)

(declare-fun lt!423658 () Bool)

(declare-datatypes ((array!17304 0))(
  ( (array!17305 (arr!8511 (Array (_ BitVec 32) (_ BitVec 8))) (size!7491 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12992 0))(
  ( (BitStream!12993 (buf!7557 array!17304) (currentByte!13991 (_ BitVec 32)) (currentBit!13986 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22912 0))(
  ( (tuple2!22913 (_1!12742 Bool) (_2!12742 BitStream!12992)) )
))
(declare-fun lt!423657 () tuple2!22912)

(assert (=> b!291518 (= e!207783 (= lt!423658 (_1!12742 lt!423657)))))

(declare-fun b!291519 () Bool)

(declare-fun res!240833 () Bool)

(declare-fun e!207777 () Bool)

(assert (=> b!291519 (=> (not res!240833) (not e!207777))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291519 (= res!240833 (bvslt from!505 to!474))))

(declare-fun b!291520 () Bool)

(declare-fun res!240828 () Bool)

(declare-fun e!207779 () Bool)

(assert (=> b!291520 (=> res!240828 e!207779)))

(declare-datatypes ((Unit!20259 0))(
  ( (Unit!20260) )
))
(declare-datatypes ((tuple3!1726 0))(
  ( (tuple3!1727 (_1!12743 Unit!20259) (_2!12743 BitStream!12992) (_3!1286 array!17304)) )
))
(declare-fun lt!423655 () tuple3!1726)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291520 (= res!240828 (not (invariant!0 (currentBit!13986 (_2!12743 lt!423655)) (currentByte!13991 (_2!12743 lt!423655)) (size!7491 (buf!7557 (_2!12743 lt!423655))))))))

(declare-fun b!291522 () Bool)

(declare-fun e!207782 () Bool)

(declare-fun thiss!1728 () BitStream!12992)

(declare-fun array_inv!7103 (array!17304) Bool)

(assert (=> b!291522 (= e!207782 (array_inv!7103 (buf!7557 thiss!1728)))))

(declare-fun b!291523 () Bool)

(declare-fun res!240829 () Bool)

(assert (=> b!291523 (=> (not res!240829) (not e!207777))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291523 (= res!240829 (validate_offset_bits!1 ((_ sign_extend 32) (size!7491 (buf!7557 thiss!1728))) ((_ sign_extend 32) (currentByte!13991 thiss!1728)) ((_ sign_extend 32) (currentBit!13986 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291524 () Bool)

(assert (=> b!291524 (= e!207779 (or (bvsge from!505 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!474 from!505))) (bvsle (bvadd from!505 (bvsub to!474 from!505)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7491 (_3!1286 lt!423655)))))))))

(declare-fun e!207780 () Bool)

(declare-fun arr!273 () array!17304)

(declare-fun b!291525 () Bool)

(assert (=> b!291525 (= e!207780 (and (= (buf!7557 thiss!1728) (buf!7557 (_2!12743 lt!423655))) (= (size!7491 arr!273) (size!7491 (_3!1286 lt!423655)))))))

(declare-fun res!240832 () Bool)

(assert (=> start!64940 (=> (not res!240832) (not e!207777))))

(assert (=> start!64940 (= res!240832 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7491 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64940 e!207777))

(declare-fun inv!12 (BitStream!12992) Bool)

(assert (=> start!64940 (and (inv!12 thiss!1728) e!207782)))

(assert (=> start!64940 true))

(assert (=> start!64940 (array_inv!7103 arr!273)))

(declare-fun b!291521 () Bool)

(assert (=> b!291521 (= e!207777 (not e!207779))))

(declare-fun res!240830 () Bool)

(assert (=> b!291521 (=> res!240830 e!207779)))

(declare-datatypes ((tuple2!22914 0))(
  ( (tuple2!22915 (_1!12744 BitStream!12992) (_2!12744 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12992) tuple2!22914)

(assert (=> b!291521 (= res!240830 (not (= lt!423658 (_2!12744 (readBitPure!0 thiss!1728)))))))

(assert (=> b!291521 e!207783))

(declare-fun res!240831 () Bool)

(assert (=> b!291521 (=> (not res!240831) (not e!207783))))

(declare-fun lt!423661 () array!17304)

(declare-fun bitAt!0 (array!17304 (_ BitVec 64)) Bool)

(assert (=> b!291521 (= res!240831 (= (bitAt!0 lt!423661 from!505) lt!423658))))

(assert (=> b!291521 (= lt!423658 (bitAt!0 (_3!1286 lt!423655) from!505))))

(declare-fun lt!423660 () Unit!20259)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17304 array!17304 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20259)

(assert (=> b!291521 (= lt!423660 (arrayBitRangesEqImpliesEq!0 lt!423661 (_3!1286 lt!423655) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17304 array!17304 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291521 (arrayBitRangesEq!0 arr!273 (_3!1286 lt!423655) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423654 () Unit!20259)

(declare-fun arrayBitRangesEqTransitive!0 (array!17304 array!17304 array!17304 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20259)

(assert (=> b!291521 (= lt!423654 (arrayBitRangesEqTransitive!0 arr!273 lt!423661 (_3!1286 lt!423655) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291521 (arrayBitRangesEq!0 arr!273 lt!423661 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423663 () Unit!20259)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17304 (_ BitVec 64) Bool) Unit!20259)

(assert (=> b!291521 (= lt!423663 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12742 lt!423657)))))

(assert (=> b!291521 e!207780))

(declare-fun res!240827 () Bool)

(assert (=> b!291521 (=> (not res!240827) (not e!207780))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291521 (= res!240827 (= (bvsub (bvadd (bitIndex!0 (size!7491 (buf!7557 thiss!1728)) (currentByte!13991 thiss!1728) (currentBit!13986 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7491 (buf!7557 (_2!12743 lt!423655))) (currentByte!13991 (_2!12743 lt!423655)) (currentBit!13986 (_2!12743 lt!423655)))))))

(declare-fun readBitsLoop!0 (BitStream!12992 (_ BitVec 64) array!17304 (_ BitVec 64) (_ BitVec 64)) tuple3!1726)

(assert (=> b!291521 (= lt!423655 (readBitsLoop!0 (_2!12742 lt!423657) nBits!523 lt!423661 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291521 (validate_offset_bits!1 ((_ sign_extend 32) (size!7491 (buf!7557 (_2!12742 lt!423657)))) ((_ sign_extend 32) (currentByte!13991 (_2!12742 lt!423657))) ((_ sign_extend 32) (currentBit!13986 (_2!12742 lt!423657))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423662 () Unit!20259)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12992 BitStream!12992 (_ BitVec 64) (_ BitVec 64)) Unit!20259)

(assert (=> b!291521 (= lt!423662 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12742 lt!423657) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423659 () (_ BitVec 32))

(declare-fun lt!423656 () (_ BitVec 32))

(assert (=> b!291521 (= lt!423661 (array!17305 (store (arr!8511 arr!273) lt!423659 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8511 arr!273) lt!423659)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423656)))) ((_ sign_extend 24) (ite (_1!12742 lt!423657) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423656) #b00000000))))) (size!7491 arr!273)))))

(assert (=> b!291521 (= lt!423656 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291521 (= lt!423659 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12992) tuple2!22912)

(assert (=> b!291521 (= lt!423657 (readBit!0 thiss!1728))))

(assert (= (and start!64940 res!240832) b!291523))

(assert (= (and b!291523 res!240829) b!291519))

(assert (= (and b!291519 res!240833) b!291521))

(assert (= (and b!291521 res!240827) b!291525))

(assert (= (and b!291521 res!240831) b!291518))

(assert (= (and b!291521 (not res!240830)) b!291520))

(assert (= (and b!291520 (not res!240828)) b!291524))

(assert (= start!64940 b!291522))

(declare-fun m!426617 () Bool)

(assert (=> start!64940 m!426617))

(declare-fun m!426619 () Bool)

(assert (=> start!64940 m!426619))

(declare-fun m!426621 () Bool)

(assert (=> b!291520 m!426621))

(declare-fun m!426623 () Bool)

(assert (=> b!291521 m!426623))

(declare-fun m!426625 () Bool)

(assert (=> b!291521 m!426625))

(declare-fun m!426627 () Bool)

(assert (=> b!291521 m!426627))

(declare-fun m!426629 () Bool)

(assert (=> b!291521 m!426629))

(declare-fun m!426631 () Bool)

(assert (=> b!291521 m!426631))

(declare-fun m!426633 () Bool)

(assert (=> b!291521 m!426633))

(declare-fun m!426635 () Bool)

(assert (=> b!291521 m!426635))

(declare-fun m!426637 () Bool)

(assert (=> b!291521 m!426637))

(declare-fun m!426639 () Bool)

(assert (=> b!291521 m!426639))

(declare-fun m!426641 () Bool)

(assert (=> b!291521 m!426641))

(declare-fun m!426643 () Bool)

(assert (=> b!291521 m!426643))

(declare-fun m!426645 () Bool)

(assert (=> b!291521 m!426645))

(declare-fun m!426647 () Bool)

(assert (=> b!291521 m!426647))

(declare-fun m!426649 () Bool)

(assert (=> b!291521 m!426649))

(declare-fun m!426651 () Bool)

(assert (=> b!291521 m!426651))

(declare-fun m!426653 () Bool)

(assert (=> b!291521 m!426653))

(declare-fun m!426655 () Bool)

(assert (=> b!291521 m!426655))

(declare-fun m!426657 () Bool)

(assert (=> b!291522 m!426657))

(declare-fun m!426659 () Bool)

(assert (=> b!291523 m!426659))

(push 1)

(assert (not b!291522))

(assert (not b!291520))

(assert (not start!64940))

(assert (not b!291523))

(assert (not b!291521))

(check-sat)

(pop 1)

(push 1)

(check-sat)

