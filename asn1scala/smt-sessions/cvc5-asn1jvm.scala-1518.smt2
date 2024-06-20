; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42422 () Bool)

(assert start!42422)

(declare-fun res!167838 () Bool)

(declare-fun e!137520 () Bool)

(assert (=> start!42422 (=> (not res!167838) (not e!137520))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42422 (= res!167838 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42422 e!137520))

(assert (=> start!42422 true))

(declare-datatypes ((array!10136 0))(
  ( (array!10137 (arr!5395 (Array (_ BitVec 32) (_ BitVec 8))) (size!4465 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8038 0))(
  ( (BitStream!8039 (buf!4966 array!10136) (currentByte!9328 (_ BitVec 32)) (currentBit!9323 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8038)

(declare-fun e!137521 () Bool)

(declare-fun inv!12 (BitStream!8038) Bool)

(assert (=> start!42422 (and (inv!12 thiss!1204) e!137521)))

(declare-fun b!200476 () Bool)

(declare-fun array_inv!4206 (array!10136) Bool)

(assert (=> b!200476 (= e!137521 (array_inv!4206 (buf!4966 thiss!1204)))))

(declare-fun b!200477 () Bool)

(declare-fun res!167835 () Bool)

(assert (=> b!200477 (=> (not res!167835) (not e!137520))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200477 (= res!167835 (invariant!0 (currentBit!9323 thiss!1204) (currentByte!9328 thiss!1204) (size!4465 (buf!4966 thiss!1204))))))

(declare-fun b!200478 () Bool)

(declare-fun res!167837 () Bool)

(assert (=> b!200478 (=> (not res!167837) (not e!137520))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200478 (= res!167837 (validate_offset_bits!1 ((_ sign_extend 32) (size!4465 (buf!4966 thiss!1204))) ((_ sign_extend 32) (currentByte!9328 thiss!1204)) ((_ sign_extend 32) (currentBit!9323 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200479 () Bool)

(declare-fun res!167836 () Bool)

(assert (=> b!200479 (=> (not res!167836) (not e!137520))))

(assert (=> b!200479 (= res!167836 (= i!590 nBits!348))))

(declare-fun lt!313458 () (_ BitVec 64))

(declare-fun b!200480 () Bool)

(declare-fun lt!313459 () (_ BitVec 64))

(assert (=> b!200480 (= e!137520 (and (= lt!313459 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!313459 (bvand (bvadd lt!313458 ((_ sign_extend 32) nBits!348)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!200480 (= lt!313459 (bvand lt!313458 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200480 (= lt!313458 (bitIndex!0 (size!4465 (buf!4966 thiss!1204)) (currentByte!9328 thiss!1204) (currentBit!9323 thiss!1204)))))

(assert (= (and start!42422 res!167838) b!200478))

(assert (= (and b!200478 res!167837) b!200477))

(assert (= (and b!200477 res!167835) b!200479))

(assert (= (and b!200479 res!167836) b!200480))

(assert (= start!42422 b!200476))

(declare-fun m!311287 () Bool)

(assert (=> b!200476 m!311287))

(declare-fun m!311289 () Bool)

(assert (=> b!200477 m!311289))

(declare-fun m!311291 () Bool)

(assert (=> b!200480 m!311291))

(declare-fun m!311293 () Bool)

(assert (=> b!200478 m!311293))

(declare-fun m!311295 () Bool)

(assert (=> start!42422 m!311295))

(push 1)

(assert (not b!200478))

(assert (not b!200477))

(assert (not start!42422))

(assert (not b!200476))

(assert (not b!200480))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68765 () Bool)

(assert (=> d!68765 (= (array_inv!4206 (buf!4966 thiss!1204)) (bvsge (size!4465 (buf!4966 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!200476 d!68765))

(declare-fun d!68767 () Bool)

(assert (=> d!68767 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9323 thiss!1204) (currentByte!9328 thiss!1204) (size!4465 (buf!4966 thiss!1204))))))

(declare-fun bs!16936 () Bool)

(assert (= bs!16936 d!68767))

(assert (=> bs!16936 m!311289))

(assert (=> start!42422 d!68767))

(declare-fun d!68773 () Bool)

(declare-fun e!137548 () Bool)

(assert (=> d!68773 e!137548))

(declare-fun res!167878 () Bool)

(assert (=> d!68773 (=> (not res!167878) (not e!137548))))

(declare-fun lt!313514 () (_ BitVec 64))

(declare-fun lt!313516 () (_ BitVec 64))

(declare-fun lt!313517 () (_ BitVec 64))

(assert (=> d!68773 (= res!167878 (= lt!313514 (bvsub lt!313517 lt!313516)))))

(assert (=> d!68773 (or (= (bvand lt!313517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313516 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313517 lt!313516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68773 (= lt!313516 (remainingBits!0 ((_ sign_extend 32) (size!4465 (buf!4966 thiss!1204))) ((_ sign_extend 32) (currentByte!9328 thiss!1204)) ((_ sign_extend 32) (currentBit!9323 thiss!1204))))))

(declare-fun lt!313518 () (_ BitVec 64))

(declare-fun lt!313519 () (_ BitVec 64))

(assert (=> d!68773 (= lt!313517 (bvmul lt!313518 lt!313519))))

(assert (=> d!68773 (or (= lt!313518 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313519 (bvsdiv (bvmul lt!313518 lt!313519) lt!313518)))))

(assert (=> d!68773 (= lt!313519 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68773 (= lt!313518 ((_ sign_extend 32) (size!4465 (buf!4966 thiss!1204))))))

(assert (=> d!68773 (= lt!313514 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9328 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9323 thiss!1204))))))

(assert (=> d!68773 (invariant!0 (currentBit!9323 thiss!1204) (currentByte!9328 thiss!1204) (size!4465 (buf!4966 thiss!1204)))))

(assert (=> d!68773 (= (bitIndex!0 (size!4465 (buf!4966 thiss!1204)) (currentByte!9328 thiss!1204) (currentBit!9323 thiss!1204)) lt!313514)))

(declare-fun b!200525 () Bool)

(declare-fun res!167877 () Bool)

(assert (=> b!200525 (=> (not res!167877) (not e!137548))))

(assert (=> b!200525 (= res!167877 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313514))))

(declare-fun b!200526 () Bool)

(declare-fun lt!313515 () (_ BitVec 64))

(assert (=> b!200526 (= e!137548 (bvsle lt!313514 (bvmul lt!313515 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200526 (or (= lt!313515 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313515 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313515)))))

(assert (=> b!200526 (= lt!313515 ((_ sign_extend 32) (size!4465 (buf!4966 thiss!1204))))))

(assert (= (and d!68773 res!167878) b!200525))

(assert (= (and b!200525 res!167877) b!200526))

(declare-fun m!311319 () Bool)

(assert (=> d!68773 m!311319))

(assert (=> d!68773 m!311289))

(assert (=> b!200480 d!68773))

(declare-fun d!68779 () Bool)

(assert (=> d!68779 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4465 (buf!4966 thiss!1204))) ((_ sign_extend 32) (currentByte!9328 thiss!1204)) ((_ sign_extend 32) (currentBit!9323 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4465 (buf!4966 thiss!1204))) ((_ sign_extend 32) (currentByte!9328 thiss!1204)) ((_ sign_extend 32) (currentBit!9323 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16938 () Bool)

(assert (= bs!16938 d!68779))

(assert (=> bs!16938 m!311319))

(assert (=> b!200478 d!68779))

(declare-fun d!68781 () Bool)

(assert (=> d!68781 (= (invariant!0 (currentBit!9323 thiss!1204) (currentByte!9328 thiss!1204) (size!4465 (buf!4966 thiss!1204))) (and (bvsge (currentBit!9323 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9323 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9328 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9328 thiss!1204) (size!4465 (buf!4966 thiss!1204))) (and (= (currentBit!9323 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9328 thiss!1204) (size!4465 (buf!4966 thiss!1204)))))))))

(assert (=> b!200477 d!68781))

(push 1)

(assert (not d!68767))

(assert (not d!68773))

(assert (not d!68779))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

