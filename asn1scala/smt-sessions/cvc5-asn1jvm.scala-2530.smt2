; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63922 () Bool)

(assert start!63922)

(declare-fun res!235456 () Bool)

(declare-fun e!203196 () Bool)

(assert (=> start!63922 (=> (not res!235456) (not e!203196))))

(declare-datatypes ((array!16665 0))(
  ( (array!16666 (arr!8182 (Array (_ BitVec 32) (_ BitVec 8))) (size!7186 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12742 0))(
  ( (BitStream!12743 (buf!7432 array!16665) (currentByte!13813 (_ BitVec 32)) (currentBit!13808 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12742)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63922 (= res!235456 (validate_offset_bits!1 ((_ sign_extend 32) (size!7186 (buf!7432 thiss!1929))) ((_ sign_extend 32) (currentByte!13813 thiss!1929)) ((_ sign_extend 32) (currentBit!13808 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13808 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63922 e!203196))

(declare-fun e!203195 () Bool)

(declare-fun inv!12 (BitStream!12742) Bool)

(assert (=> start!63922 (and (inv!12 thiss!1929) e!203195)))

(declare-fun b!284230 () Bool)

(declare-fun res!235457 () Bool)

(assert (=> b!284230 (=> (not res!235457) (not e!203196))))

(assert (=> b!284230 (= res!235457 (= (currentBit!13808 thiss!1929) #b00000000000000000000000000000000))))

(declare-fun b!284231 () Bool)

(declare-fun lt!418446 () (_ BitVec 64))

(assert (=> b!284231 (= e!203196 (bvsgt lt!418446 (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 lt!418446)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!284231 (= lt!418446 (bitIndex!0 (size!7186 (buf!7432 thiss!1929)) (currentByte!13813 thiss!1929) (currentBit!13808 thiss!1929)))))

(declare-fun b!284232 () Bool)

(declare-fun array_inv!6879 (array!16665) Bool)

(assert (=> b!284232 (= e!203195 (array_inv!6879 (buf!7432 thiss!1929)))))

(assert (= (and start!63922 res!235456) b!284230))

(assert (= (and b!284230 res!235457) b!284231))

(assert (= start!63922 b!284232))

(declare-fun m!417399 () Bool)

(assert (=> start!63922 m!417399))

(declare-fun m!417401 () Bool)

(assert (=> start!63922 m!417401))

(declare-fun m!417403 () Bool)

(assert (=> b!284231 m!417403))

(declare-fun m!417405 () Bool)

(assert (=> b!284232 m!417405))

(push 1)

(assert (not start!63922))

(assert (not b!284232))

(assert (not b!284231))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97886 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97886 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7186 (buf!7432 thiss!1929))) ((_ sign_extend 32) (currentByte!13813 thiss!1929)) ((_ sign_extend 32) (currentBit!13808 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13808 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7186 (buf!7432 thiss!1929))) ((_ sign_extend 32) (currentByte!13813 thiss!1929)) ((_ sign_extend 32) (currentBit!13808 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13808 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24744 () Bool)

(assert (= bs!24744 d!97886))

(declare-fun m!417423 () Bool)

(assert (=> bs!24744 m!417423))

(assert (=> start!63922 d!97886))

(declare-fun d!97888 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97888 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13808 thiss!1929) (currentByte!13813 thiss!1929) (size!7186 (buf!7432 thiss!1929))))))

(declare-fun bs!24745 () Bool)

(assert (= bs!24745 d!97888))

(declare-fun m!417425 () Bool)

(assert (=> bs!24745 m!417425))

(assert (=> start!63922 d!97888))

(declare-fun d!97892 () Bool)

(assert (=> d!97892 (= (array_inv!6879 (buf!7432 thiss!1929)) (bvsge (size!7186 (buf!7432 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284232 d!97892))

(declare-fun d!97894 () Bool)

(declare-fun e!203219 () Bool)

(assert (=> d!97894 e!203219))

(declare-fun res!235479 () Bool)

(assert (=> d!97894 (=> (not res!235479) (not e!203219))))

(declare-fun lt!418479 () (_ BitVec 64))

(declare-fun lt!418477 () (_ BitVec 64))

(declare-fun lt!418480 () (_ BitVec 64))

(assert (=> d!97894 (= res!235479 (= lt!418480 (bvsub lt!418477 lt!418479)))))

(assert (=> d!97894 (or (= (bvand lt!418477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418479 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418477 lt!418479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97894 (= lt!418479 (remainingBits!0 ((_ sign_extend 32) (size!7186 (buf!7432 thiss!1929))) ((_ sign_extend 32) (currentByte!13813 thiss!1929)) ((_ sign_extend 32) (currentBit!13808 thiss!1929))))))

(declare-fun lt!418478 () (_ BitVec 64))

(declare-fun lt!418482 () (_ BitVec 64))

(assert (=> d!97894 (= lt!418477 (bvmul lt!418478 lt!418482))))

(assert (=> d!97894 (or (= lt!418478 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418482 (bvsdiv (bvmul lt!418478 lt!418482) lt!418478)))))

(assert (=> d!97894 (= lt!418482 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97894 (= lt!418478 ((_ sign_extend 32) (size!7186 (buf!7432 thiss!1929))))))

(assert (=> d!97894 (= lt!418480 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13813 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13808 thiss!1929))))))

(assert (=> d!97894 (invariant!0 (currentBit!13808 thiss!1929) (currentByte!13813 thiss!1929) (size!7186 (buf!7432 thiss!1929)))))

(assert (=> d!97894 (= (bitIndex!0 (size!7186 (buf!7432 thiss!1929)) (currentByte!13813 thiss!1929) (currentBit!13808 thiss!1929)) lt!418480)))

(declare-fun b!284259 () Bool)

(declare-fun res!235478 () Bool)

(assert (=> b!284259 (=> (not res!235478) (not e!203219))))

(assert (=> b!284259 (= res!235478 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418480))))

(declare-fun b!284260 () Bool)

(declare-fun lt!418481 () (_ BitVec 64))

(assert (=> b!284260 (= e!203219 (bvsle lt!418480 (bvmul lt!418481 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284260 (or (= lt!418481 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418481 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418481)))))

(assert (=> b!284260 (= lt!418481 ((_ sign_extend 32) (size!7186 (buf!7432 thiss!1929))))))

(assert (= (and d!97894 res!235479) b!284259))

(assert (= (and b!284259 res!235478) b!284260))

(assert (=> d!97894 m!417423))

(assert (=> d!97894 m!417425))

(assert (=> b!284231 d!97894))

(push 1)

(assert (not d!97888))

(assert (not d!97894))

(assert (not d!97886))

(check-sat)

(pop 1)

(push 1)

(check-sat)

