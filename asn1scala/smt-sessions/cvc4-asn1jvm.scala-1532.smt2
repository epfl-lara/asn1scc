; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42736 () Bool)

(assert start!42736)

(declare-fun b!201518 () Bool)

(declare-fun res!168714 () Bool)

(declare-fun e!138205 () Bool)

(assert (=> b!201518 (=> (not res!168714) (not e!138205))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10239 0))(
  ( (array!10240 (arr!5439 (Array (_ BitVec 32) (_ BitVec 8))) (size!4509 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8126 0))(
  ( (BitStream!8127 (buf!5014 array!10239) (currentByte!9418 (_ BitVec 32)) (currentBit!9413 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8126)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201518 (= res!168714 (validate_offset_bits!1 ((_ sign_extend 32) (size!4509 (buf!5014 thiss!1204))) ((_ sign_extend 32) (currentByte!9418 thiss!1204)) ((_ sign_extend 32) (currentBit!9413 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201519 () Bool)

(declare-fun res!168716 () Bool)

(assert (=> b!201519 (=> (not res!168716) (not e!138205))))

(assert (=> b!201519 (= res!168716 (not (= i!590 nBits!348)))))

(declare-fun b!201520 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201520 (= e!138205 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4509 (buf!5014 thiss!1204))) ((_ sign_extend 32) (currentByte!9418 thiss!1204)) ((_ sign_extend 32) (currentBit!9413 thiss!1204)))))))

(declare-fun b!201521 () Bool)

(declare-fun e!138206 () Bool)

(declare-fun array_inv!4250 (array!10239) Bool)

(assert (=> b!201521 (= e!138206 (array_inv!4250 (buf!5014 thiss!1204)))))

(declare-fun res!168713 () Bool)

(assert (=> start!42736 (=> (not res!168713) (not e!138205))))

(assert (=> start!42736 (= res!168713 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42736 e!138205))

(assert (=> start!42736 true))

(declare-fun inv!12 (BitStream!8126) Bool)

(assert (=> start!42736 (and (inv!12 thiss!1204) e!138206)))

(declare-fun b!201522 () Bool)

(declare-fun res!168715 () Bool)

(assert (=> b!201522 (=> (not res!168715) (not e!138205))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201522 (= res!168715 (invariant!0 (currentBit!9413 thiss!1204) (currentByte!9418 thiss!1204) (size!4509 (buf!5014 thiss!1204))))))

(assert (= (and start!42736 res!168713) b!201518))

(assert (= (and b!201518 res!168714) b!201522))

(assert (= (and b!201522 res!168715) b!201519))

(assert (= (and b!201519 res!168716) b!201520))

(assert (= start!42736 b!201521))

(declare-fun m!312107 () Bool)

(assert (=> b!201520 m!312107))

(declare-fun m!312109 () Bool)

(assert (=> b!201518 m!312109))

(declare-fun m!312111 () Bool)

(assert (=> b!201522 m!312111))

(declare-fun m!312113 () Bool)

(assert (=> b!201521 m!312113))

(declare-fun m!312115 () Bool)

(assert (=> start!42736 m!312115))

(push 1)

(assert (not start!42736))

(assert (not b!201518))

(assert (not b!201522))

(assert (not b!201521))

(assert (not b!201520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69041 () Bool)

(assert (=> d!69041 (= (invariant!0 (currentBit!9413 thiss!1204) (currentByte!9418 thiss!1204) (size!4509 (buf!5014 thiss!1204))) (and (bvsge (currentBit!9413 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9413 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9418 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9418 thiss!1204) (size!4509 (buf!5014 thiss!1204))) (and (= (currentBit!9413 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9418 thiss!1204) (size!4509 (buf!5014 thiss!1204)))))))))

(assert (=> b!201522 d!69041))

(declare-fun d!69045 () Bool)

(assert (=> d!69045 (= (array_inv!4250 (buf!5014 thiss!1204)) (bvsge (size!4509 (buf!5014 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!201521 d!69045))

(declare-fun d!69049 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69049 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4509 (buf!5014 thiss!1204))) ((_ sign_extend 32) (currentByte!9418 thiss!1204)) ((_ sign_extend 32) (currentBit!9413 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4509 (buf!5014 thiss!1204))) ((_ sign_extend 32) (currentByte!9418 thiss!1204)) ((_ sign_extend 32) (currentBit!9413 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!17040 () Bool)

(assert (= bs!17040 d!69049))

(declare-fun m!312119 () Bool)

(assert (=> bs!17040 m!312119))

(assert (=> b!201520 d!69049))

(declare-fun d!69053 () Bool)

(assert (=> d!69053 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9413 thiss!1204) (currentByte!9418 thiss!1204) (size!4509 (buf!5014 thiss!1204))))))

(declare-fun bs!17041 () Bool)

(assert (= bs!17041 d!69053))

(assert (=> bs!17041 m!312111))

(assert (=> start!42736 d!69053))

(declare-fun d!69057 () Bool)

(assert (=> d!69057 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4509 (buf!5014 thiss!1204))) ((_ sign_extend 32) (currentByte!9418 thiss!1204)) ((_ sign_extend 32) (currentBit!9413 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4509 (buf!5014 thiss!1204))) ((_ sign_extend 32) (currentByte!9418 thiss!1204)) ((_ sign_extend 32) (currentBit!9413 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17042 () Bool)

(assert (= bs!17042 d!69057))

(assert (=> bs!17042 m!312119))

(assert (=> b!201518 d!69057))

(push 1)

(assert (not d!69057))

(assert (not d!69049))

(assert (not d!69053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

