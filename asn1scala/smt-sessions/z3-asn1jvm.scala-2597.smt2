; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64416 () Bool)

(assert start!64416)

(declare-fun res!238829 () Bool)

(declare-fun e!205566 () Bool)

(assert (=> start!64416 (=> (not res!238829) (not e!205566))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17083 0))(
  ( (array!17084 (arr!8384 (Array (_ BitVec 32) (_ BitVec 8))) (size!7388 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17083)

(assert (=> start!64416 (= res!238829 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7388 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64416 e!205566))

(declare-datatypes ((BitStream!12786 0))(
  ( (BitStream!12787 (buf!7454 array!17083) (currentByte!13849 (_ BitVec 32)) (currentBit!13844 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12786)

(declare-fun e!205563 () Bool)

(declare-fun inv!12 (BitStream!12786) Bool)

(assert (=> start!64416 (and (inv!12 thiss!1728) e!205563)))

(assert (=> start!64416 true))

(declare-fun array_inv!7000 (array!17083) Bool)

(assert (=> start!64416 (array_inv!7000 arr!273)))

(declare-fun b!289040 () Bool)

(declare-fun res!238832 () Bool)

(assert (=> b!289040 (=> (not res!238832) (not e!205566))))

(assert (=> b!289040 (= res!238832 (bvslt from!505 to!474))))

(declare-fun b!289041 () Bool)

(declare-fun res!238830 () Bool)

(assert (=> b!289041 (=> (not res!238830) (not e!205566))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289041 (= res!238830 (validate_offset_bits!1 ((_ sign_extend 32) (size!7388 (buf!7454 thiss!1728))) ((_ sign_extend 32) (currentByte!13849 thiss!1728)) ((_ sign_extend 32) (currentBit!13844 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289042 () Bool)

(declare-fun e!205565 () Bool)

(assert (=> b!289042 (= e!205565 false)))

(declare-fun lt!418945 () (_ BitVec 64))

(declare-datatypes ((tuple2!22634 0))(
  ( (tuple2!22635 (_1!12511 Bool) (_2!12511 BitStream!12786)) )
))
(declare-fun lt!418946 () tuple2!22634)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289042 (= lt!418945 (bitIndex!0 (size!7388 (buf!7454 (_2!12511 lt!418946))) (currentByte!13849 (_2!12511 lt!418946)) (currentBit!13844 (_2!12511 lt!418946))))))

(declare-fun lt!418947 () (_ BitVec 64))

(assert (=> b!289042 (= lt!418947 (bitIndex!0 (size!7388 (buf!7454 thiss!1728)) (currentByte!13849 thiss!1728) (currentBit!13844 thiss!1728)))))

(declare-fun b!289043 () Bool)

(assert (=> b!289043 (= e!205566 e!205565)))

(declare-fun res!238831 () Bool)

(assert (=> b!289043 (=> (not res!238831) (not e!205565))))

(assert (=> b!289043 (= res!238831 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7388 (buf!7454 thiss!1728)) (size!7388 (buf!7454 (_2!12511 lt!418946))))))))

(declare-fun readBit!0 (BitStream!12786) tuple2!22634)

(assert (=> b!289043 (= lt!418946 (readBit!0 thiss!1728))))

(declare-fun b!289044 () Bool)

(assert (=> b!289044 (= e!205563 (array_inv!7000 (buf!7454 thiss!1728)))))

(assert (= (and start!64416 res!238829) b!289041))

(assert (= (and b!289041 res!238830) b!289040))

(assert (= (and b!289040 res!238832) b!289043))

(assert (= (and b!289043 res!238831) b!289042))

(assert (= start!64416 b!289044))

(declare-fun m!421761 () Bool)

(assert (=> b!289044 m!421761))

(declare-fun m!421763 () Bool)

(assert (=> b!289041 m!421763))

(declare-fun m!421765 () Bool)

(assert (=> start!64416 m!421765))

(declare-fun m!421767 () Bool)

(assert (=> start!64416 m!421767))

(declare-fun m!421769 () Bool)

(assert (=> b!289042 m!421769))

(declare-fun m!421771 () Bool)

(assert (=> b!289042 m!421771))

(declare-fun m!421773 () Bool)

(assert (=> b!289043 m!421773))

(check-sat (not b!289043) (not b!289044) (not start!64416) (not b!289042) (not b!289041))
