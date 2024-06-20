; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36932 () Bool)

(assert start!36932)

(declare-fun res!140341 () Bool)

(declare-fun e!117238 () Bool)

(assert (=> start!36932 (=> (not res!140341) (not e!117238))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36932 (= res!140341 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36932 e!117238))

(assert (=> start!36932 true))

(declare-datatypes ((array!8812 0))(
  ( (array!8813 (arr!4827 (Array (_ BitVec 32) (_ BitVec 8))) (size!3906 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6968 0))(
  ( (BitStream!6969 (buf!4358 array!8812) (currentByte!8279 (_ BitVec 32)) (currentBit!8274 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6968)

(declare-fun e!117240 () Bool)

(declare-fun inv!12 (BitStream!6968) Bool)

(assert (=> start!36932 (and (inv!12 thiss!1894) e!117240)))

(declare-fun b!168679 () Bool)

(declare-fun res!140342 () Bool)

(assert (=> b!168679 (=> (not res!140342) (not e!117238))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168679 (= res!140342 (validate_offset_bits!1 ((_ sign_extend 32) (size!3906 (buf!4358 thiss!1894))) ((_ sign_extend 32) (currentByte!8279 thiss!1894)) ((_ sign_extend 32) (currentBit!8274 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168680 () Bool)

(assert (=> b!168680 (= e!117238 (and (bvsgt (bvadd (currentBit!8274 thiss!1894) nBits!600) #b00000000000000000000000000001000) (let ((bdg!10171 (bvand (bvadd (currentBit!8274 thiss!1894) nBits!600) #b10000000000000000000000000000000))) (and (not (= bdg!10171 #b00000000000000000000000000000000)) (not (= bdg!10171 (bvand (bvsub (bvadd (currentBit!8274 thiss!1894) nBits!600) #b00000000000000000000000000001000) #b10000000000000000000000000000000)))))))))

(declare-fun b!168681 () Bool)

(declare-fun array_inv!3647 (array!8812) Bool)

(assert (=> b!168681 (= e!117240 (array_inv!3647 (buf!4358 thiss!1894)))))

(assert (= (and start!36932 res!140341) b!168679))

(assert (= (and b!168679 res!140342) b!168680))

(assert (= start!36932 b!168681))

(declare-fun m!268263 () Bool)

(assert (=> start!36932 m!268263))

(declare-fun m!268265 () Bool)

(assert (=> b!168679 m!268265))

(declare-fun m!268267 () Bool)

(assert (=> b!168681 m!268267))

(push 1)

(assert (not start!36932))

(assert (not b!168679))

(assert (not b!168681))

(check-sat)

(pop 1)

(push 1)

(check-sat)

