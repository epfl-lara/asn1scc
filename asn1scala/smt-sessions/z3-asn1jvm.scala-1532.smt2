; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42734 () Bool)

(assert start!42734)

(declare-fun b!201503 () Bool)

(declare-fun res!168701 () Bool)

(declare-fun e!138196 () Bool)

(assert (=> b!201503 (=> (not res!168701) (not e!138196))))

(declare-fun i!590 () (_ BitVec 32))

(declare-datatypes ((array!10237 0))(
  ( (array!10238 (arr!5438 (Array (_ BitVec 32) (_ BitVec 8))) (size!4508 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8124 0))(
  ( (BitStream!8125 (buf!5013 array!10237) (currentByte!9417 (_ BitVec 32)) (currentBit!9412 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8124)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201503 (= res!168701 (validate_offset_bits!1 ((_ sign_extend 32) (size!4508 (buf!5013 thiss!1204))) ((_ sign_extend 32) (currentByte!9417 thiss!1204)) ((_ sign_extend 32) (currentBit!9412 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!168703 () Bool)

(assert (=> start!42734 (=> (not res!168703) (not e!138196))))

(assert (=> start!42734 (= res!168703 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42734 e!138196))

(assert (=> start!42734 true))

(declare-fun e!138198 () Bool)

(declare-fun inv!12 (BitStream!8124) Bool)

(assert (=> start!42734 (and (inv!12 thiss!1204) e!138198)))

(declare-fun b!201504 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201504 (= e!138196 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4508 (buf!5013 thiss!1204))) ((_ sign_extend 32) (currentByte!9417 thiss!1204)) ((_ sign_extend 32) (currentBit!9412 thiss!1204)))))))

(declare-fun b!201505 () Bool)

(declare-fun array_inv!4249 (array!10237) Bool)

(assert (=> b!201505 (= e!138198 (array_inv!4249 (buf!5013 thiss!1204)))))

(declare-fun b!201506 () Bool)

(declare-fun res!168702 () Bool)

(assert (=> b!201506 (=> (not res!168702) (not e!138196))))

(assert (=> b!201506 (= res!168702 (not (= i!590 nBits!348)))))

(declare-fun b!201507 () Bool)

(declare-fun res!168704 () Bool)

(assert (=> b!201507 (=> (not res!168704) (not e!138196))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201507 (= res!168704 (invariant!0 (currentBit!9412 thiss!1204) (currentByte!9417 thiss!1204) (size!4508 (buf!5013 thiss!1204))))))

(assert (= (and start!42734 res!168703) b!201503))

(assert (= (and b!201503 res!168701) b!201507))

(assert (= (and b!201507 res!168704) b!201506))

(assert (= (and b!201506 res!168702) b!201504))

(assert (= start!42734 b!201505))

(declare-fun m!312097 () Bool)

(assert (=> b!201504 m!312097))

(declare-fun m!312099 () Bool)

(assert (=> b!201503 m!312099))

(declare-fun m!312101 () Bool)

(assert (=> b!201505 m!312101))

(declare-fun m!312103 () Bool)

(assert (=> start!42734 m!312103))

(declare-fun m!312105 () Bool)

(assert (=> b!201507 m!312105))

(check-sat (not b!201504) (not b!201505) (not start!42734) (not b!201503) (not b!201507))
(check-sat)
(get-model)

(declare-fun d!69039 () Bool)

(assert (=> d!69039 (= (invariant!0 (currentBit!9412 thiss!1204) (currentByte!9417 thiss!1204) (size!4508 (buf!5013 thiss!1204))) (and (bvsge (currentBit!9412 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9412 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9417 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9417 thiss!1204) (size!4508 (buf!5013 thiss!1204))) (and (= (currentBit!9412 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9417 thiss!1204) (size!4508 (buf!5013 thiss!1204)))))))))

(assert (=> b!201507 d!69039))

(declare-fun d!69055 () Bool)

(assert (=> d!69055 (= (array_inv!4249 (buf!5013 thiss!1204)) (bvsge (size!4508 (buf!5013 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!201505 d!69055))

(declare-fun d!69059 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69059 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4508 (buf!5013 thiss!1204))) ((_ sign_extend 32) (currentByte!9417 thiss!1204)) ((_ sign_extend 32) (currentBit!9412 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4508 (buf!5013 thiss!1204))) ((_ sign_extend 32) (currentByte!9417 thiss!1204)) ((_ sign_extend 32) (currentBit!9412 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!17043 () Bool)

(assert (= bs!17043 d!69059))

(declare-fun m!312121 () Bool)

(assert (=> bs!17043 m!312121))

(assert (=> b!201504 d!69059))

(declare-fun d!69061 () Bool)

(assert (=> d!69061 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4508 (buf!5013 thiss!1204))) ((_ sign_extend 32) (currentByte!9417 thiss!1204)) ((_ sign_extend 32) (currentBit!9412 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4508 (buf!5013 thiss!1204))) ((_ sign_extend 32) (currentByte!9417 thiss!1204)) ((_ sign_extend 32) (currentBit!9412 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17044 () Bool)

(assert (= bs!17044 d!69061))

(assert (=> bs!17044 m!312121))

(assert (=> b!201503 d!69061))

(declare-fun d!69063 () Bool)

(assert (=> d!69063 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9412 thiss!1204) (currentByte!9417 thiss!1204) (size!4508 (buf!5013 thiss!1204))))))

(declare-fun bs!17045 () Bool)

(assert (= bs!17045 d!69063))

(assert (=> bs!17045 m!312105))

(assert (=> start!42734 d!69063))

(check-sat (not d!69061) (not d!69059) (not d!69063))
(check-sat)
