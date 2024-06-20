; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15874 () Bool)

(assert start!15874)

(declare-fun res!66340 () Bool)

(declare-fun e!52666 () Bool)

(assert (=> start!15874 (=> (not res!66340) (not e!52666))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15874 (= res!66340 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15874 e!52666))

(assert (=> start!15874 true))

(declare-datatypes ((array!3486 0))(
  ( (array!3487 (arr!2215 (Array (_ BitVec 32) (_ BitVec 8))) (size!1608 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2778 0))(
  ( (BitStream!2779 (buf!1998 array!3486) (currentByte!3890 (_ BitVec 32)) (currentBit!3885 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2778)

(declare-fun e!52668 () Bool)

(declare-fun inv!12 (BitStream!2778) Bool)

(assert (=> start!15874 (and (inv!12 thiss!1716) e!52668)))

(declare-fun b!80161 () Bool)

(declare-fun res!66339 () Bool)

(assert (=> b!80161 (=> (not res!66339) (not e!52666))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80161 (= res!66339 (validate_offset_bits!1 ((_ sign_extend 32) (size!1608 (buf!1998 thiss!1716))) ((_ sign_extend 32) (currentByte!3890 thiss!1716)) ((_ sign_extend 32) (currentBit!3885 thiss!1716)) nBits!516))))

(declare-fun b!80162 () Bool)

(assert (=> b!80162 (= e!52666 (and (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand nBits!516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 nBits!516) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!80163 () Bool)

(declare-fun array_inv!1454 (array!3486) Bool)

(assert (=> b!80163 (= e!52668 (array_inv!1454 (buf!1998 thiss!1716)))))

(assert (= (and start!15874 res!66340) b!80161))

(assert (= (and b!80161 res!66339) b!80162))

(assert (= start!15874 b!80163))

(declare-fun m!125667 () Bool)

(assert (=> start!15874 m!125667))

(declare-fun m!125669 () Bool)

(assert (=> b!80161 m!125669))

(declare-fun m!125671 () Bool)

(assert (=> b!80163 m!125671))

(check-sat (not b!80163) (not start!15874) (not b!80161))
(check-sat)
