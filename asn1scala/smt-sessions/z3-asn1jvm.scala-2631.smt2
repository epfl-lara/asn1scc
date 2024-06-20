; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64938 () Bool)

(assert start!64938)

(declare-datatypes ((array!17302 0))(
  ( (array!17303 (arr!8510 (Array (_ BitVec 32) (_ BitVec 8))) (size!7490 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12990 0))(
  ( (BitStream!12991 (buf!7556 array!17302) (currentByte!13990 (_ BitVec 32)) (currentBit!13985 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12990)

(declare-fun b!291494 () Bool)

(declare-fun arr!273 () array!17302)

(declare-datatypes ((Unit!20257 0))(
  ( (Unit!20258) )
))
(declare-datatypes ((tuple3!1724 0))(
  ( (tuple3!1725 (_1!12739 Unit!20257) (_2!12739 BitStream!12990) (_3!1285 array!17302)) )
))
(declare-fun lt!423631 () tuple3!1724)

(declare-fun e!207756 () Bool)

(assert (=> b!291494 (= e!207756 (and (= (buf!7556 thiss!1728) (buf!7556 (_2!12739 lt!423631))) (= (size!7490 arr!273) (size!7490 (_3!1285 lt!423631)))))))

(declare-fun b!291496 () Bool)

(declare-fun res!240806 () Bool)

(declare-fun e!207762 () Bool)

(assert (=> b!291496 (=> (not res!240806) (not e!207762))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291496 (= res!240806 (bvslt from!505 to!474))))

(declare-fun b!291497 () Bool)

(declare-fun e!207761 () Bool)

(declare-fun array_inv!7102 (array!17302) Bool)

(assert (=> b!291497 (= e!207761 (array_inv!7102 (buf!7556 thiss!1728)))))

(declare-fun b!291498 () Bool)

(declare-fun e!207759 () Bool)

(assert (=> b!291498 (= e!207759 (or (bvsge from!505 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!474 from!505))) (bvsle (bvadd from!505 (bvsub to!474 from!505)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7490 (_3!1285 lt!423631)))))))))

(declare-fun b!291499 () Bool)

(declare-fun res!240810 () Bool)

(assert (=> b!291499 (=> (not res!240810) (not e!207762))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291499 (= res!240810 (validate_offset_bits!1 ((_ sign_extend 32) (size!7490 (buf!7556 thiss!1728))) ((_ sign_extend 32) (currentByte!13990 thiss!1728)) ((_ sign_extend 32) (currentBit!13985 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291500 () Bool)

(declare-fun e!207758 () Bool)

(declare-fun lt!423630 () Bool)

(declare-datatypes ((tuple2!22908 0))(
  ( (tuple2!22909 (_1!12740 Bool) (_2!12740 BitStream!12990)) )
))
(declare-fun lt!423625 () tuple2!22908)

(assert (=> b!291500 (= e!207758 (= lt!423630 (_1!12740 lt!423625)))))

(declare-fun b!291501 () Bool)

(assert (=> b!291501 (= e!207762 (not e!207759))))

(declare-fun res!240812 () Bool)

(assert (=> b!291501 (=> res!240812 e!207759)))

(declare-datatypes ((tuple2!22910 0))(
  ( (tuple2!22911 (_1!12741 BitStream!12990) (_2!12741 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12990) tuple2!22910)

(assert (=> b!291501 (= res!240812 (not (= lt!423630 (_2!12741 (readBitPure!0 thiss!1728)))))))

(assert (=> b!291501 e!207758))

(declare-fun res!240808 () Bool)

(assert (=> b!291501 (=> (not res!240808) (not e!207758))))

(declare-fun lt!423627 () array!17302)

(declare-fun bitAt!0 (array!17302 (_ BitVec 64)) Bool)

(assert (=> b!291501 (= res!240808 (= (bitAt!0 lt!423627 from!505) lt!423630))))

(assert (=> b!291501 (= lt!423630 (bitAt!0 (_3!1285 lt!423631) from!505))))

(declare-fun lt!423629 () Unit!20257)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17302 array!17302 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20257)

(assert (=> b!291501 (= lt!423629 (arrayBitRangesEqImpliesEq!0 lt!423627 (_3!1285 lt!423631) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17302 array!17302 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291501 (arrayBitRangesEq!0 arr!273 (_3!1285 lt!423631) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423632 () Unit!20257)

(declare-fun arrayBitRangesEqTransitive!0 (array!17302 array!17302 array!17302 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20257)

(assert (=> b!291501 (= lt!423632 (arrayBitRangesEqTransitive!0 arr!273 lt!423627 (_3!1285 lt!423631) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291501 (arrayBitRangesEq!0 arr!273 lt!423627 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423633 () Unit!20257)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17302 (_ BitVec 64) Bool) Unit!20257)

(assert (=> b!291501 (= lt!423633 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12740 lt!423625)))))

(assert (=> b!291501 e!207756))

(declare-fun res!240809 () Bool)

(assert (=> b!291501 (=> (not res!240809) (not e!207756))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291501 (= res!240809 (= (bvsub (bvadd (bitIndex!0 (size!7490 (buf!7556 thiss!1728)) (currentByte!13990 thiss!1728) (currentBit!13985 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7490 (buf!7556 (_2!12739 lt!423631))) (currentByte!13990 (_2!12739 lt!423631)) (currentBit!13985 (_2!12739 lt!423631)))))))

(declare-fun readBitsLoop!0 (BitStream!12990 (_ BitVec 64) array!17302 (_ BitVec 64) (_ BitVec 64)) tuple3!1724)

(assert (=> b!291501 (= lt!423631 (readBitsLoop!0 (_2!12740 lt!423625) nBits!523 lt!423627 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291501 (validate_offset_bits!1 ((_ sign_extend 32) (size!7490 (buf!7556 (_2!12740 lt!423625)))) ((_ sign_extend 32) (currentByte!13990 (_2!12740 lt!423625))) ((_ sign_extend 32) (currentBit!13985 (_2!12740 lt!423625))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423624 () Unit!20257)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12990 BitStream!12990 (_ BitVec 64) (_ BitVec 64)) Unit!20257)

(assert (=> b!291501 (= lt!423624 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12740 lt!423625) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423628 () (_ BitVec 32))

(declare-fun lt!423626 () (_ BitVec 32))

(assert (=> b!291501 (= lt!423627 (array!17303 (store (arr!8510 arr!273) lt!423626 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8510 arr!273) lt!423626)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423628)))) ((_ sign_extend 24) (ite (_1!12740 lt!423625) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423628) #b00000000))))) (size!7490 arr!273)))))

(assert (=> b!291501 (= lt!423628 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291501 (= lt!423626 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12990) tuple2!22908)

(assert (=> b!291501 (= lt!423625 (readBit!0 thiss!1728))))

(declare-fun res!240807 () Bool)

(assert (=> start!64938 (=> (not res!240807) (not e!207762))))

(assert (=> start!64938 (= res!240807 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7490 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64938 e!207762))

(declare-fun inv!12 (BitStream!12990) Bool)

(assert (=> start!64938 (and (inv!12 thiss!1728) e!207761)))

(assert (=> start!64938 true))

(assert (=> start!64938 (array_inv!7102 arr!273)))

(declare-fun b!291495 () Bool)

(declare-fun res!240811 () Bool)

(assert (=> b!291495 (=> res!240811 e!207759)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291495 (= res!240811 (not (invariant!0 (currentBit!13985 (_2!12739 lt!423631)) (currentByte!13990 (_2!12739 lt!423631)) (size!7490 (buf!7556 (_2!12739 lt!423631))))))))

(assert (= (and start!64938 res!240807) b!291499))

(assert (= (and b!291499 res!240810) b!291496))

(assert (= (and b!291496 res!240806) b!291501))

(assert (= (and b!291501 res!240809) b!291494))

(assert (= (and b!291501 res!240808) b!291500))

(assert (= (and b!291501 (not res!240812)) b!291495))

(assert (= (and b!291495 (not res!240811)) b!291498))

(assert (= start!64938 b!291497))

(declare-fun m!426573 () Bool)

(assert (=> start!64938 m!426573))

(declare-fun m!426575 () Bool)

(assert (=> start!64938 m!426575))

(declare-fun m!426577 () Bool)

(assert (=> b!291501 m!426577))

(declare-fun m!426579 () Bool)

(assert (=> b!291501 m!426579))

(declare-fun m!426581 () Bool)

(assert (=> b!291501 m!426581))

(declare-fun m!426583 () Bool)

(assert (=> b!291501 m!426583))

(declare-fun m!426585 () Bool)

(assert (=> b!291501 m!426585))

(declare-fun m!426587 () Bool)

(assert (=> b!291501 m!426587))

(declare-fun m!426589 () Bool)

(assert (=> b!291501 m!426589))

(declare-fun m!426591 () Bool)

(assert (=> b!291501 m!426591))

(declare-fun m!426593 () Bool)

(assert (=> b!291501 m!426593))

(declare-fun m!426595 () Bool)

(assert (=> b!291501 m!426595))

(declare-fun m!426597 () Bool)

(assert (=> b!291501 m!426597))

(declare-fun m!426599 () Bool)

(assert (=> b!291501 m!426599))

(declare-fun m!426601 () Bool)

(assert (=> b!291501 m!426601))

(declare-fun m!426603 () Bool)

(assert (=> b!291501 m!426603))

(declare-fun m!426605 () Bool)

(assert (=> b!291501 m!426605))

(declare-fun m!426607 () Bool)

(assert (=> b!291501 m!426607))

(declare-fun m!426609 () Bool)

(assert (=> b!291501 m!426609))

(declare-fun m!426611 () Bool)

(assert (=> b!291497 m!426611))

(declare-fun m!426613 () Bool)

(assert (=> b!291499 m!426613))

(declare-fun m!426615 () Bool)

(assert (=> b!291495 m!426615))

(check-sat (not b!291499) (not b!291501) (not b!291495) (not start!64938) (not b!291497))
(check-sat)
