; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63896 () Bool)

(assert start!63896)

(declare-fun res!235433 () Bool)

(declare-fun e!203178 () Bool)

(assert (=> start!63896 (=> (not res!235433) (not e!203178))))

(declare-datatypes ((array!16660 0))(
  ( (array!16661 (arr!8181 (Array (_ BitVec 32) (_ BitVec 8))) (size!7185 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12740 0))(
  ( (BitStream!12741 (buf!7431 array!16660) (currentByte!13806 (_ BitVec 32)) (currentBit!13801 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12740)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63896 (= res!235433 (validate_offset_bits!1 ((_ sign_extend 32) (size!7185 (buf!7431 thiss!1929))) ((_ sign_extend 32) (currentByte!13806 thiss!1929)) ((_ sign_extend 32) (currentBit!13801 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13801 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63896 e!203178))

(declare-fun e!203176 () Bool)

(declare-fun inv!12 (BitStream!12740) Bool)

(assert (=> start!63896 (and (inv!12 thiss!1929) e!203176)))

(declare-fun b!284203 () Bool)

(declare-fun res!235432 () Bool)

(assert (=> b!284203 (=> (not res!235432) (not e!203178))))

(assert (=> b!284203 (= res!235432 (= (currentBit!13801 thiss!1929) #b00000000000000000000000000000000))))

(declare-fun b!284204 () Bool)

(declare-fun lt!418388 () (_ BitVec 64))

(declare-fun lt!418389 () (_ BitVec 64))

(assert (=> b!284204 (= e!203178 (and (= lt!418388 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!418388 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 lt!418389) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!284204 (= lt!418388 (bvand lt!418389 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!284204 (= lt!418389 (bitIndex!0 (size!7185 (buf!7431 thiss!1929)) (currentByte!13806 thiss!1929) (currentBit!13801 thiss!1929)))))

(declare-fun b!284205 () Bool)

(declare-fun array_inv!6878 (array!16660) Bool)

(assert (=> b!284205 (= e!203176 (array_inv!6878 (buf!7431 thiss!1929)))))

(assert (= (and start!63896 res!235433) b!284203))

(assert (= (and b!284203 res!235432) b!284204))

(assert (= start!63896 b!284205))

(declare-fun m!417379 () Bool)

(assert (=> start!63896 m!417379))

(declare-fun m!417381 () Bool)

(assert (=> start!63896 m!417381))

(declare-fun m!417383 () Bool)

(assert (=> b!284204 m!417383))

(declare-fun m!417385 () Bool)

(assert (=> b!284205 m!417385))

(push 1)

(assert (not b!284205))

(assert (not start!63896))

(assert (not b!284204))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97862 () Bool)

(assert (=> d!97862 (= (array_inv!6878 (buf!7431 thiss!1929)) (bvsge (size!7185 (buf!7431 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284205 d!97862))

(declare-fun d!97864 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97864 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7185 (buf!7431 thiss!1929))) ((_ sign_extend 32) (currentByte!13806 thiss!1929)) ((_ sign_extend 32) (currentBit!13801 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13801 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7185 (buf!7431 thiss!1929))) ((_ sign_extend 32) (currentByte!13806 thiss!1929)) ((_ sign_extend 32) (currentBit!13801 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13801 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24735 () Bool)

(assert (= bs!24735 d!97864))

(declare-fun m!417387 () Bool)

(assert (=> bs!24735 m!417387))

(assert (=> start!63896 d!97864))

(declare-fun d!97868 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97868 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13801 thiss!1929) (currentByte!13806 thiss!1929) (size!7185 (buf!7431 thiss!1929))))))

(declare-fun bs!24737 () Bool)

(assert (= bs!24737 d!97868))

(declare-fun m!417391 () Bool)

(assert (=> bs!24737 m!417391))

(assert (=> start!63896 d!97868))

(declare-fun d!97872 () Bool)

(declare-fun e!203186 () Bool)

(assert (=> d!97872 e!203186))

(declare-fun res!235449 () Bool)

(assert (=> d!97872 (=> (not res!235449) (not e!203186))))

(declare-fun lt!418437 () (_ BitVec 64))

(declare-fun lt!418433 () (_ BitVec 64))

(declare-fun lt!418435 () (_ BitVec 64))

(assert (=> d!97872 (= res!235449 (= lt!418435 (bvsub lt!418433 lt!418437)))))

(assert (=> d!97872 (or (= (bvand lt!418433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418437 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418433 lt!418437) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97872 (= lt!418437 (remainingBits!0 ((_ sign_extend 32) (size!7185 (buf!7431 thiss!1929))) ((_ sign_extend 32) (currentByte!13806 thiss!1929)) ((_ sign_extend 32) (currentBit!13801 thiss!1929))))))

(declare-fun lt!418434 () (_ BitVec 64))

(declare-fun lt!418432 () (_ BitVec 64))

(assert (=> d!97872 (= lt!418433 (bvmul lt!418434 lt!418432))))

(assert (=> d!97872 (or (= lt!418434 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418432 (bvsdiv (bvmul lt!418434 lt!418432) lt!418434)))))

(assert (=> d!97872 (= lt!418432 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97872 (= lt!418434 ((_ sign_extend 32) (size!7185 (buf!7431 thiss!1929))))))

(assert (=> d!97872 (= lt!418435 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13806 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13801 thiss!1929))))))

(assert (=> d!97872 (invariant!0 (currentBit!13801 thiss!1929) (currentByte!13806 thiss!1929) (size!7185 (buf!7431 thiss!1929)))))

(assert (=> d!97872 (= (bitIndex!0 (size!7185 (buf!7431 thiss!1929)) (currentByte!13806 thiss!1929) (currentBit!13801 thiss!1929)) lt!418435)))

(declare-fun b!284220 () Bool)

(declare-fun res!235448 () Bool)

(assert (=> b!284220 (=> (not res!235448) (not e!203186))))

(assert (=> b!284220 (= res!235448 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418435))))

(declare-fun b!284221 () Bool)

(declare-fun lt!418436 () (_ BitVec 64))

(assert (=> b!284221 (= e!203186 (bvsle lt!418435 (bvmul lt!418436 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284221 (or (= lt!418436 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418436 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418436)))))

(assert (=> b!284221 (= lt!418436 ((_ sign_extend 32) (size!7185 (buf!7431 thiss!1929))))))

(assert (= (and d!97872 res!235449) b!284220))

(assert (= (and b!284220 res!235448) b!284221))

(assert (=> d!97872 m!417387))

(assert (=> d!97872 m!417391))

(assert (=> b!284204 d!97872))

(push 1)

(assert (not d!97864))

(assert (not d!97872))

(assert (not d!97868))

(check-sat)

(pop 1)

(push 1)

(check-sat)

