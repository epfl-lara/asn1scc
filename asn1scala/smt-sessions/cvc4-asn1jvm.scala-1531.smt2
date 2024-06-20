; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42730 () Bool)

(assert start!42730)

(declare-fun b!201476 () Bool)

(declare-fun e!138179 () Bool)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!201476 (= e!138179 (and (not (= i!590 nBits!348)) (or (bvslt ((_ sign_extend 32) i!590) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!590) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun b!201474 () Bool)

(declare-fun res!168680 () Bool)

(assert (=> b!201474 (=> (not res!168680) (not e!138179))))

(declare-datatypes ((array!10233 0))(
  ( (array!10234 (arr!5436 (Array (_ BitVec 32) (_ BitVec 8))) (size!4506 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8120 0))(
  ( (BitStream!8121 (buf!5011 array!10233) (currentByte!9415 (_ BitVec 32)) (currentBit!9410 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8120)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201474 (= res!168680 (validate_offset_bits!1 ((_ sign_extend 32) (size!4506 (buf!5011 thiss!1204))) ((_ sign_extend 32) (currentByte!9415 thiss!1204)) ((_ sign_extend 32) (currentBit!9410 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201477 () Bool)

(declare-fun e!138178 () Bool)

(declare-fun array_inv!4247 (array!10233) Bool)

(assert (=> b!201477 (= e!138178 (array_inv!4247 (buf!5011 thiss!1204)))))

(declare-fun b!201475 () Bool)

(declare-fun res!168678 () Bool)

(assert (=> b!201475 (=> (not res!168678) (not e!138179))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201475 (= res!168678 (invariant!0 (currentBit!9410 thiss!1204) (currentByte!9415 thiss!1204) (size!4506 (buf!5011 thiss!1204))))))

(declare-fun res!168679 () Bool)

(assert (=> start!42730 (=> (not res!168679) (not e!138179))))

(assert (=> start!42730 (= res!168679 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42730 e!138179))

(assert (=> start!42730 true))

(declare-fun inv!12 (BitStream!8120) Bool)

(assert (=> start!42730 (and (inv!12 thiss!1204) e!138178)))

(assert (= (and start!42730 res!168679) b!201474))

(assert (= (and b!201474 res!168680) b!201475))

(assert (= (and b!201475 res!168678) b!201476))

(assert (= start!42730 b!201477))

(declare-fun m!312079 () Bool)

(assert (=> b!201474 m!312079))

(declare-fun m!312081 () Bool)

(assert (=> b!201477 m!312081))

(declare-fun m!312083 () Bool)

(assert (=> b!201475 m!312083))

(declare-fun m!312085 () Bool)

(assert (=> start!42730 m!312085))

(push 1)

(assert (not b!201477))

(assert (not b!201475))

(assert (not b!201474))

(assert (not start!42730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

