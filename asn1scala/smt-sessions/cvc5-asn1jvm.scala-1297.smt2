; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36928 () Bool)

(assert start!36928)

(declare-fun res!140330 () Bool)

(declare-fun e!117220 () Bool)

(assert (=> start!36928 (=> (not res!140330) (not e!117220))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36928 (= res!140330 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36928 e!117220))

(assert (=> start!36928 true))

(declare-datatypes ((array!8808 0))(
  ( (array!8809 (arr!4825 (Array (_ BitVec 32) (_ BitVec 8))) (size!3904 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6964 0))(
  ( (BitStream!6965 (buf!4356 array!8808) (currentByte!8277 (_ BitVec 32)) (currentBit!8272 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6964)

(declare-fun e!117222 () Bool)

(declare-fun inv!12 (BitStream!6964) Bool)

(assert (=> start!36928 (and (inv!12 thiss!1894) e!117222)))

(declare-fun b!168661 () Bool)

(declare-fun res!140329 () Bool)

(assert (=> b!168661 (=> (not res!140329) (not e!117220))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168661 (= res!140329 (validate_offset_bits!1 ((_ sign_extend 32) (size!3904 (buf!4356 thiss!1894))) ((_ sign_extend 32) (currentByte!8277 thiss!1894)) ((_ sign_extend 32) (currentBit!8272 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168662 () Bool)

(assert (=> b!168662 (= e!117220 (and (bvsgt (bvadd (currentBit!8272 thiss!1894) nBits!600) #b00000000000000000000000000001000) (let ((bdg!10171 (bvand (bvadd (currentBit!8272 thiss!1894) nBits!600) #b10000000000000000000000000000000))) (and (not (= bdg!10171 #b00000000000000000000000000000000)) (not (= bdg!10171 (bvand (bvsub (bvadd (currentBit!8272 thiss!1894) nBits!600) #b00000000000000000000000000001000) #b10000000000000000000000000000000)))))))))

(declare-fun b!168663 () Bool)

(declare-fun array_inv!3645 (array!8808) Bool)

(assert (=> b!168663 (= e!117222 (array_inv!3645 (buf!4356 thiss!1894)))))

(assert (= (and start!36928 res!140330) b!168661))

(assert (= (and b!168661 res!140329) b!168662))

(assert (= start!36928 b!168663))

(declare-fun m!268251 () Bool)

(assert (=> start!36928 m!268251))

(declare-fun m!268253 () Bool)

(assert (=> b!168661 m!268253))

(declare-fun m!268255 () Bool)

(assert (=> b!168663 m!268255))

(push 1)

(assert (not b!168663))

(assert (not start!36928))

(assert (not b!168661))

(check-sat)

(pop 1)

(push 1)

(check-sat)

