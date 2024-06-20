; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65298 () Bool)

(assert start!65298)

(declare-fun res!241891 () Bool)

(declare-fun e!209017 () Bool)

(assert (=> start!65298 (=> (not res!241891) (not e!209017))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17446 0))(
  ( (array!17447 (arr!8582 (Array (_ BitVec 32) (_ BitVec 8))) (size!7556 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17446)

(assert (=> start!65298 (= res!241891 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7556 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65298 e!209017))

(declare-datatypes ((BitStream!13116 0))(
  ( (BitStream!13117 (buf!7619 array!17446) (currentByte!14083 (_ BitVec 32)) (currentBit!14078 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13116)

(declare-fun e!209019 () Bool)

(declare-fun inv!12 (BitStream!13116) Bool)

(assert (=> start!65298 (and (inv!12 thiss!1728) e!209019)))

(assert (=> start!65298 true))

(declare-fun array_inv!7168 (array!17446) Bool)

(assert (=> start!65298 (array_inv!7168 arr!273)))

(declare-fun b!292885 () Bool)

(declare-fun res!241892 () Bool)

(assert (=> b!292885 (=> (not res!241892) (not e!209017))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292885 (= res!241892 (validate_offset_bits!1 ((_ sign_extend 32) (size!7556 (buf!7619 thiss!1728))) ((_ sign_extend 32) (currentByte!14083 thiss!1728)) ((_ sign_extend 32) (currentBit!14078 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292886 () Bool)

(assert (=> b!292886 (= e!209017 (and (not (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!292887 () Bool)

(assert (=> b!292887 (= e!209019 (array_inv!7168 (buf!7619 thiss!1728)))))

(assert (= (and start!65298 res!241891) b!292885))

(assert (= (and b!292885 res!241892) b!292886))

(assert (= start!65298 b!292887))

(declare-fun m!428499 () Bool)

(assert (=> start!65298 m!428499))

(declare-fun m!428501 () Bool)

(assert (=> start!65298 m!428501))

(declare-fun m!428503 () Bool)

(assert (=> b!292885 m!428503))

(declare-fun m!428505 () Bool)

(assert (=> b!292887 m!428505))

(check-sat (not b!292885) (not b!292887) (not start!65298))
(check-sat)
