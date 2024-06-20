; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37074 () Bool)

(assert start!37074)

(declare-fun res!140434 () Bool)

(declare-fun e!117365 () Bool)

(assert (=> start!37074 (=> (not res!140434) (not e!117365))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37074 (= res!140434 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37074 e!117365))

(assert (=> start!37074 true))

(declare-datatypes ((array!8852 0))(
  ( (array!8853 (arr!4841 (Array (_ BitVec 32) (_ BitVec 8))) (size!3920 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6996 0))(
  ( (BitStream!6997 (buf!4372 array!8852) (currentByte!8326 (_ BitVec 32)) (currentBit!8321 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6996)

(declare-fun e!117366 () Bool)

(declare-fun inv!12 (BitStream!6996) Bool)

(assert (=> start!37074 (and (inv!12 thiss!1894) e!117366)))

(declare-fun b!168814 () Bool)

(declare-fun res!140435 () Bool)

(assert (=> b!168814 (=> (not res!140435) (not e!117365))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168814 (= res!140435 (validate_offset_bits!1 ((_ sign_extend 32) (size!3920 (buf!4372 thiss!1894))) ((_ sign_extend 32) (currentByte!8326 thiss!1894)) ((_ sign_extend 32) (currentBit!8321 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168815 () Bool)

(assert (=> b!168815 (= e!117365 (and (bvsgt (bvadd (currentBit!8321 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsgt (bvsub #b00000000000000000000000000001000 (bvsub (bvadd (currentBit!8321 thiss!1894) nBits!600) #b00000000000000000000000000001000)) #b00000000000000000000000000100000)))))

(declare-fun b!168816 () Bool)

(declare-fun array_inv!3661 (array!8852) Bool)

(assert (=> b!168816 (= e!117366 (array_inv!3661 (buf!4372 thiss!1894)))))

(assert (= (and start!37074 res!140434) b!168814))

(assert (= (and b!168814 res!140435) b!168815))

(assert (= start!37074 b!168816))

(declare-fun m!268407 () Bool)

(assert (=> start!37074 m!268407))

(declare-fun m!268409 () Bool)

(assert (=> b!168814 m!268409))

(declare-fun m!268411 () Bool)

(assert (=> b!168816 m!268411))

(check-sat (not start!37074) (not b!168814) (not b!168816))
(check-sat)
