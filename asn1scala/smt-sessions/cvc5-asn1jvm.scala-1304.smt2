; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37114 () Bool)

(assert start!37114)

(declare-fun res!140464 () Bool)

(declare-fun e!117411 () Bool)

(assert (=> start!37114 (=> (not res!140464) (not e!117411))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37114 (= res!140464 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37114 e!117411))

(assert (=> start!37114 true))

(declare-datatypes ((array!8865 0))(
  ( (array!8866 (arr!4846 (Array (_ BitVec 32) (_ BitVec 8))) (size!3925 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7006 0))(
  ( (BitStream!7007 (buf!4377 array!8865) (currentByte!8340 (_ BitVec 32)) (currentBit!8335 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!7006)

(declare-fun e!117410 () Bool)

(declare-fun inv!12 (BitStream!7006) Bool)

(assert (=> start!37114 (and (inv!12 thiss!1894) e!117410)))

(declare-fun b!168859 () Bool)

(declare-fun res!140465 () Bool)

(assert (=> b!168859 (=> (not res!140465) (not e!117411))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168859 (= res!140465 (validate_offset_bits!1 ((_ sign_extend 32) (size!3925 (buf!4377 thiss!1894))) ((_ sign_extend 32) (currentByte!8340 thiss!1894)) ((_ sign_extend 32) (currentBit!8335 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168860 () Bool)

(assert (=> b!168860 (= e!117411 (and (bvsgt (bvadd (currentBit!8335 thiss!1894) nBits!600) #b00000000000000000000000000001000) (or (bvslt nBits!600 #b00000000000000000000000000000000) (bvsge nBits!600 #b00000000000000000000000000001001))))))

(declare-fun b!168861 () Bool)

(declare-fun array_inv!3666 (array!8865) Bool)

(assert (=> b!168861 (= e!117410 (array_inv!3666 (buf!4377 thiss!1894)))))

(assert (= (and start!37114 res!140464) b!168859))

(assert (= (and b!168859 res!140465) b!168860))

(assert (= start!37114 b!168861))

(declare-fun m!268449 () Bool)

(assert (=> start!37114 m!268449))

(declare-fun m!268451 () Bool)

(assert (=> b!168859 m!268451))

(declare-fun m!268453 () Bool)

(assert (=> b!168861 m!268453))

(push 1)

(assert (not b!168859))

(assert (not start!37114))

(assert (not b!168861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

