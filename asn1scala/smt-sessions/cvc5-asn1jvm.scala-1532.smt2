; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42732 () Bool)

(assert start!42732)

(declare-fun b!201488 () Bool)

(declare-fun e!138187 () Bool)

(declare-datatypes ((array!10235 0))(
  ( (array!10236 (arr!5437 (Array (_ BitVec 32) (_ BitVec 8))) (size!4507 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8122 0))(
  ( (BitStream!8123 (buf!5012 array!10235) (currentByte!9416 (_ BitVec 32)) (currentBit!9411 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8122)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201488 (= e!138187 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4507 (buf!5012 thiss!1204))) ((_ sign_extend 32) (currentByte!9416 thiss!1204)) ((_ sign_extend 32) (currentBit!9411 thiss!1204)))))))

(declare-fun b!201489 () Bool)

(declare-fun res!168691 () Bool)

(assert (=> b!201489 (=> (not res!168691) (not e!138187))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201489 (= res!168691 (invariant!0 (currentBit!9411 thiss!1204) (currentByte!9416 thiss!1204) (size!4507 (buf!5012 thiss!1204))))))

(declare-fun b!201490 () Bool)

(declare-fun res!168690 () Bool)

(assert (=> b!201490 (=> (not res!168690) (not e!138187))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201490 (= res!168690 (validate_offset_bits!1 ((_ sign_extend 32) (size!4507 (buf!5012 thiss!1204))) ((_ sign_extend 32) (currentByte!9416 thiss!1204)) ((_ sign_extend 32) (currentBit!9411 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201491 () Bool)

(declare-fun res!168692 () Bool)

(assert (=> b!201491 (=> (not res!168692) (not e!138187))))

(assert (=> b!201491 (= res!168692 (not (= i!590 nBits!348)))))

(declare-fun b!201492 () Bool)

(declare-fun e!138188 () Bool)

(declare-fun array_inv!4248 (array!10235) Bool)

(assert (=> b!201492 (= e!138188 (array_inv!4248 (buf!5012 thiss!1204)))))

(declare-fun res!168689 () Bool)

(assert (=> start!42732 (=> (not res!168689) (not e!138187))))

(assert (=> start!42732 (= res!168689 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42732 e!138187))

(assert (=> start!42732 true))

(declare-fun inv!12 (BitStream!8122) Bool)

(assert (=> start!42732 (and (inv!12 thiss!1204) e!138188)))

(assert (= (and start!42732 res!168689) b!201490))

(assert (= (and b!201490 res!168690) b!201489))

(assert (= (and b!201489 res!168691) b!201491))

(assert (= (and b!201491 res!168692) b!201488))

(assert (= start!42732 b!201492))

(declare-fun m!312087 () Bool)

(assert (=> start!42732 m!312087))

(declare-fun m!312089 () Bool)

(assert (=> b!201488 m!312089))

(declare-fun m!312091 () Bool)

(assert (=> b!201490 m!312091))

(declare-fun m!312093 () Bool)

(assert (=> b!201489 m!312093))

(declare-fun m!312095 () Bool)

(assert (=> b!201492 m!312095))

(push 1)

(assert (not b!201489))

(assert (not start!42732))

(assert (not b!201488))

(assert (not b!201492))

(assert (not b!201490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69035 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69035 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4507 (buf!5012 thiss!1204))) ((_ sign_extend 32) (currentByte!9416 thiss!1204)) ((_ sign_extend 32) (currentBit!9411 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4507 (buf!5012 thiss!1204))) ((_ sign_extend 32) (currentByte!9416 thiss!1204)) ((_ sign_extend 32) (currentBit!9411 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17037 () Bool)

(assert (= bs!17037 d!69035))

(declare-fun m!312117 () Bool)

(assert (=> bs!17037 m!312117))

(assert (=> b!201490 d!69035))

(declare-fun d!69037 () Bool)

(assert (=> d!69037 (= (invariant!0 (currentBit!9411 thiss!1204) (currentByte!9416 thiss!1204) (size!4507 (buf!5012 thiss!1204))) (and (bvsge (currentBit!9411 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9411 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9416 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9416 thiss!1204) (size!4507 (buf!5012 thiss!1204))) (and (= (currentBit!9411 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9416 thiss!1204) (size!4507 (buf!5012 thiss!1204)))))))))

(assert (=> b!201489 d!69037))

(declare-fun d!69043 () Bool)

(assert (=> d!69043 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4507 (buf!5012 thiss!1204))) ((_ sign_extend 32) (currentByte!9416 thiss!1204)) ((_ sign_extend 32) (currentBit!9411 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4507 (buf!5012 thiss!1204))) ((_ sign_extend 32) (currentByte!9416 thiss!1204)) ((_ sign_extend 32) (currentBit!9411 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!17038 () Bool)

(assert (= bs!17038 d!69043))

(assert (=> bs!17038 m!312117))

(assert (=> b!201488 d!69043))

(declare-fun d!69047 () Bool)

(assert (=> d!69047 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9411 thiss!1204) (currentByte!9416 thiss!1204) (size!4507 (buf!5012 thiss!1204))))))

(declare-fun bs!17039 () Bool)

(assert (= bs!17039 d!69047))

(assert (=> bs!17039 m!312093))

(assert (=> start!42732 d!69047))

(declare-fun d!69051 () Bool)

(assert (=> d!69051 (= (array_inv!4248 (buf!5012 thiss!1204)) (bvsge (size!4507 (buf!5012 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!201492 d!69051))

(push 1)

(assert (not d!69035))

(assert (not d!69047))

(assert (not d!69043))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

