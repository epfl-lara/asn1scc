; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32020 () Bool)

(assert start!32020)

(declare-fun res!132536 () Bool)

(declare-fun e!108133 () Bool)

(assert (=> start!32020 (=> (not res!132536) (not e!108133))))

(declare-datatypes ((array!7484 0))(
  ( (array!7485 (arr!4312 (Array (_ BitVec 32) (_ BitVec 8))) (size!3391 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5950 0))(
  ( (BitStream!5951 (buf!3849 array!7484) (currentByte!7063 (_ BitVec 32)) (currentBit!7058 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5950)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32020 (= res!132536 (validate_offset_byte!0 ((_ sign_extend 32) (size!3391 (buf!3849 thiss!1602))) ((_ sign_extend 32) (currentByte!7063 thiss!1602)) ((_ sign_extend 32) (currentBit!7058 thiss!1602))))))

(assert (=> start!32020 e!108133))

(declare-fun e!108134 () Bool)

(declare-fun inv!12 (BitStream!5950) Bool)

(assert (=> start!32020 (and (inv!12 thiss!1602) e!108134)))

(declare-fun b!158753 () Bool)

(assert (=> b!158753 (= e!108133 (and (bvslt (currentByte!7063 thiss!1602) (size!3391 (buf!3849 thiss!1602))) (or (bvsgt #b00000000000000000000000000000000 (currentBit!7058 thiss!1602)) (bvsgt (currentBit!7058 thiss!1602) #b00000000000000000000000000001000))))))

(declare-fun b!158754 () Bool)

(declare-fun array_inv!3138 (array!7484) Bool)

(assert (=> b!158754 (= e!108134 (array_inv!3138 (buf!3849 thiss!1602)))))

(assert (= (and start!32020 res!132536) b!158753))

(assert (= start!32020 b!158754))

(declare-fun m!249319 () Bool)

(assert (=> start!32020 m!249319))

(declare-fun m!249321 () Bool)

(assert (=> start!32020 m!249321))

(declare-fun m!249323 () Bool)

(assert (=> b!158754 m!249323))

(push 1)

(assert (not b!158754))

(assert (not start!32020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53377 () Bool)

(assert (=> d!53377 (= (array_inv!3138 (buf!3849 thiss!1602)) (bvsge (size!3391 (buf!3849 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!158754 d!53377))

(declare-fun d!53379 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53379 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3391 (buf!3849 thiss!1602))) ((_ sign_extend 32) (currentByte!7063 thiss!1602)) ((_ sign_extend 32) (currentBit!7058 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3391 (buf!3849 thiss!1602))) ((_ sign_extend 32) (currentByte!7063 thiss!1602)) ((_ sign_extend 32) (currentBit!7058 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13211 () Bool)

(assert (= bs!13211 d!53379))

(declare-fun m!249341 () Bool)

(assert (=> bs!13211 m!249341))

(assert (=> start!32020 d!53379))

(declare-fun d!53385 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53385 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7058 thiss!1602) (currentByte!7063 thiss!1602) (size!3391 (buf!3849 thiss!1602))))))

(declare-fun bs!13213 () Bool)

(assert (= bs!13213 d!53385))

(declare-fun m!249345 () Bool)

(assert (=> bs!13213 m!249345))

(assert (=> start!32020 d!53385))

(push 1)

(assert (not d!53385))

(assert (not d!53379))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53393 () Bool)

(assert (=> d!53393 (= (invariant!0 (currentBit!7058 thiss!1602) (currentByte!7063 thiss!1602) (size!3391 (buf!3849 thiss!1602))) (and (bvsge (currentBit!7058 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7058 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7063 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7063 thiss!1602) (size!3391 (buf!3849 thiss!1602))) (and (= (currentBit!7058 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7063 thiss!1602) (size!3391 (buf!3849 thiss!1602)))))))))

(assert (=> d!53385 d!53393))

