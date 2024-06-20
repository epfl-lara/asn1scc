; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31862 () Bool)

(assert start!31862)

(declare-fun res!132491 () Bool)

(declare-fun e!107970 () Bool)

(assert (=> start!31862 (=> (not res!132491) (not e!107970))))

(declare-datatypes ((array!7431 0))(
  ( (array!7432 (arr!4290 (Array (_ BitVec 32) (_ BitVec 8))) (size!3369 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5906 0))(
  ( (BitStream!5907 (buf!3827 array!7431) (currentByte!7033 (_ BitVec 32)) (currentBit!7028 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5906)

(declare-fun buf!77 () array!7431)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31862 (= res!132491 (and (= (size!3369 (buf!3827 b1!99)) (size!3369 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31862 e!107970))

(declare-fun e!107971 () Bool)

(declare-fun inv!12 (BitStream!5906) Bool)

(assert (=> start!31862 (and (inv!12 b1!99) e!107971)))

(declare-fun array_inv!3116 (array!7431) Bool)

(assert (=> start!31862 (array_inv!3116 buf!77)))

(assert (=> start!31862 true))

(declare-fun b!158647 () Bool)

(declare-fun res!132490 () Bool)

(assert (=> b!158647 (=> (not res!132490) (not e!107970))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158647 (= res!132490 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3369 (buf!3827 b1!99))) ((_ sign_extend 32) (currentByte!7033 b1!99)) ((_ sign_extend 32) (currentBit!7028 b1!99)) bytes!14))))

(declare-fun b!158648 () Bool)

(assert (=> b!158648 (= e!107970 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3369 buf!77)) ((_ sign_extend 32) (currentByte!7033 b1!99)) ((_ sign_extend 32) (currentBit!7028 b1!99)) bytes!14)))))

(declare-fun b!158649 () Bool)

(assert (=> b!158649 (= e!107971 (array_inv!3116 (buf!3827 b1!99)))))

(assert (= (and start!31862 res!132491) b!158647))

(assert (= (and b!158647 res!132490) b!158648))

(assert (= start!31862 b!158649))

(declare-fun m!249175 () Bool)

(assert (=> start!31862 m!249175))

(declare-fun m!249177 () Bool)

(assert (=> start!31862 m!249177))

(declare-fun m!249179 () Bool)

(assert (=> b!158647 m!249179))

(declare-fun m!249181 () Bool)

(assert (=> b!158648 m!249181))

(declare-fun m!249183 () Bool)

(assert (=> b!158649 m!249183))

(push 1)

(assert (not b!158647))

(assert (not start!31862))

(assert (not b!158648))

(assert (not b!158649))

(check-sat)

(pop 1)

(push 1)

(check-sat)

