; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70954 () Bool)

(assert start!70954)

(declare-fun nBits!545 () (_ BitVec 32))

(declare-datatypes ((array!20225 0))(
  ( (array!20226 (arr!9908 (Array (_ BitVec 32) (_ BitVec 8))) (size!8816 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13794 0))(
  ( (BitStream!13795 (buf!7958 array!20225) (currentByte!14686 (_ BitVec 32)) (currentBit!14681 (_ BitVec 32))) )
))
(declare-fun thiss!1788 () BitStream!13794)

(assert (=> start!70954 (and (bvsge nBits!545 #b00000000000000000000000000000000) (bvsle nBits!545 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!8816 (buf!7958 thiss!1788))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14686 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14681 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!70954 true))

(declare-fun e!230846 () Bool)

(declare-fun inv!12 (BitStream!13794) Bool)

(assert (=> start!70954 (and (inv!12 thiss!1788) e!230846)))

(declare-fun b!320704 () Bool)

(declare-fun array_inv!8368 (array!20225) Bool)

(assert (=> b!320704 (= e!230846 (array_inv!8368 (buf!7958 thiss!1788)))))

(assert (= start!70954 b!320704))

(declare-fun m!459065 () Bool)

(assert (=> start!70954 m!459065))

(declare-fun m!459067 () Bool)

(assert (=> b!320704 m!459067))

(check-sat (not b!320704) (not start!70954))
(check-sat)
