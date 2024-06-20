; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42726 () Bool)

(assert start!42726)

(declare-fun b!201450 () Bool)

(declare-fun res!168661 () Bool)

(declare-fun e!138162 () Bool)

(assert (=> b!201450 (=> (not res!168661) (not e!138162))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10229 0))(
  ( (array!10230 (arr!5434 (Array (_ BitVec 32) (_ BitVec 8))) (size!4504 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8116 0))(
  ( (BitStream!8117 (buf!5009 array!10229) (currentByte!9413 (_ BitVec 32)) (currentBit!9408 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8116)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201450 (= res!168661 (validate_offset_bits!1 ((_ sign_extend 32) (size!4504 (buf!5009 thiss!1204))) ((_ sign_extend 32) (currentByte!9413 thiss!1204)) ((_ sign_extend 32) (currentBit!9408 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201452 () Bool)

(assert (=> b!201452 (= e!138162 (and (not (= i!590 nBits!348)) (or (bvslt ((_ sign_extend 32) i!590) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!590) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun b!201451 () Bool)

(declare-fun res!168660 () Bool)

(assert (=> b!201451 (=> (not res!168660) (not e!138162))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201451 (= res!168660 (invariant!0 (currentBit!9408 thiss!1204) (currentByte!9413 thiss!1204) (size!4504 (buf!5009 thiss!1204))))))

(declare-fun res!168662 () Bool)

(assert (=> start!42726 (=> (not res!168662) (not e!138162))))

(assert (=> start!42726 (= res!168662 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42726 e!138162))

(assert (=> start!42726 true))

(declare-fun e!138161 () Bool)

(declare-fun inv!12 (BitStream!8116) Bool)

(assert (=> start!42726 (and (inv!12 thiss!1204) e!138161)))

(declare-fun b!201453 () Bool)

(declare-fun array_inv!4245 (array!10229) Bool)

(assert (=> b!201453 (= e!138161 (array_inv!4245 (buf!5009 thiss!1204)))))

(assert (= (and start!42726 res!168662) b!201450))

(assert (= (and b!201450 res!168661) b!201451))

(assert (= (and b!201451 res!168660) b!201452))

(assert (= start!42726 b!201453))

(declare-fun m!312063 () Bool)

(assert (=> b!201450 m!312063))

(declare-fun m!312065 () Bool)

(assert (=> b!201451 m!312065))

(declare-fun m!312067 () Bool)

(assert (=> start!42726 m!312067))

(declare-fun m!312069 () Bool)

(assert (=> b!201453 m!312069))

(push 1)

(assert (not b!201453))

(assert (not b!201451))

(assert (not b!201450))

(assert (not start!42726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

