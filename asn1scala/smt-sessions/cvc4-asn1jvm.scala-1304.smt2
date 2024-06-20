; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37118 () Bool)

(assert start!37118)

(declare-fun res!140476 () Bool)

(declare-fun e!117428 () Bool)

(assert (=> start!37118 (=> (not res!140476) (not e!117428))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37118 (= res!140476 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37118 e!117428))

(assert (=> start!37118 true))

(declare-datatypes ((array!8869 0))(
  ( (array!8870 (arr!4848 (Array (_ BitVec 32) (_ BitVec 8))) (size!3927 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7010 0))(
  ( (BitStream!7011 (buf!4379 array!8869) (currentByte!8342 (_ BitVec 32)) (currentBit!8337 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!7010)

(declare-fun e!117427 () Bool)

(declare-fun inv!12 (BitStream!7010) Bool)

(assert (=> start!37118 (and (inv!12 thiss!1894) e!117427)))

(declare-fun b!168877 () Bool)

(declare-fun res!140477 () Bool)

(assert (=> b!168877 (=> (not res!140477) (not e!117428))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168877 (= res!140477 (validate_offset_bits!1 ((_ sign_extend 32) (size!3927 (buf!4379 thiss!1894))) ((_ sign_extend 32) (currentByte!8342 thiss!1894)) ((_ sign_extend 32) (currentBit!8337 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168878 () Bool)

(assert (=> b!168878 (= e!117428 (and (bvsgt (bvadd (currentBit!8337 thiss!1894) nBits!600) #b00000000000000000000000000001000) (or (bvslt nBits!600 #b00000000000000000000000000000000) (bvsge nBits!600 #b00000000000000000000000000001001))))))

(declare-fun b!168879 () Bool)

(declare-fun array_inv!3668 (array!8869) Bool)

(assert (=> b!168879 (= e!117427 (array_inv!3668 (buf!4379 thiss!1894)))))

(assert (= (and start!37118 res!140476) b!168877))

(assert (= (and b!168877 res!140477) b!168878))

(assert (= start!37118 b!168879))

(declare-fun m!268461 () Bool)

(assert (=> start!37118 m!268461))

(declare-fun m!268463 () Bool)

(assert (=> b!168877 m!268463))

(declare-fun m!268465 () Bool)

(assert (=> b!168879 m!268465))

(push 1)

(assert (not b!168879))

(assert (not b!168877))

(assert (not start!37118))

(check-sat)

(pop 1)

(push 1)

(check-sat)

