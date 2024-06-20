; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63792 () Bool)

(assert start!63792)

(declare-fun res!235331 () Bool)

(declare-fun e!203056 () Bool)

(assert (=> start!63792 (=> (not res!235331) (not e!203056))))

(declare-datatypes ((array!16629 0))(
  ( (array!16630 (arr!8170 (Array (_ BitVec 32) (_ BitVec 8))) (size!7174 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12718 0))(
  ( (BitStream!12719 (buf!7420 array!16629) (currentByte!13772 (_ BitVec 32)) (currentBit!13767 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12718)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63792 (= res!235331 (validate_offset_bits!1 ((_ sign_extend 32) (size!7174 (buf!7420 thiss!1929))) ((_ sign_extend 32) (currentByte!13772 thiss!1929)) ((_ sign_extend 32) (currentBit!13767 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13767 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63792 e!203056))

(declare-fun e!203057 () Bool)

(declare-fun inv!12 (BitStream!12718) Bool)

(assert (=> start!63792 (and (inv!12 thiss!1929) e!203057)))

(declare-fun b!284069 () Bool)

(assert (=> b!284069 (= e!203056 (and (not (= (currentBit!13767 thiss!1929) #b00000000000000000000000000000000)) (= (bvand (currentByte!13772 thiss!1929) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!13772 thiss!1929) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!13772 thiss!1929)) #b10000000000000000000000000000000)))))))

(declare-fun b!284070 () Bool)

(declare-fun array_inv!6867 (array!16629) Bool)

(assert (=> b!284070 (= e!203057 (array_inv!6867 (buf!7420 thiss!1929)))))

(assert (= (and start!63792 res!235331) b!284069))

(assert (= start!63792 b!284070))

(declare-fun m!417243 () Bool)

(assert (=> start!63792 m!417243))

(declare-fun m!417245 () Bool)

(assert (=> start!63792 m!417245))

(declare-fun m!417247 () Bool)

(assert (=> b!284070 m!417247))

(push 1)

(assert (not b!284070))

(assert (not start!63792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97766 () Bool)

(assert (=> d!97766 (= (array_inv!6867 (buf!7420 thiss!1929)) (bvsge (size!7174 (buf!7420 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284070 d!97766))

(declare-fun d!97772 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97772 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7174 (buf!7420 thiss!1929))) ((_ sign_extend 32) (currentByte!13772 thiss!1929)) ((_ sign_extend 32) (currentBit!13767 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13767 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7174 (buf!7420 thiss!1929))) ((_ sign_extend 32) (currentByte!13772 thiss!1929)) ((_ sign_extend 32) (currentBit!13767 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13767 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24710 () Bool)

(assert (= bs!24710 d!97772))

(declare-fun m!417265 () Bool)

(assert (=> bs!24710 m!417265))

(assert (=> start!63792 d!97772))

(declare-fun d!97776 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97776 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13767 thiss!1929) (currentByte!13772 thiss!1929) (size!7174 (buf!7420 thiss!1929))))))

(declare-fun bs!24713 () Bool)

(assert (= bs!24713 d!97776))

(declare-fun m!417271 () Bool)

(assert (=> bs!24713 m!417271))

(assert (=> start!63792 d!97776))

(push 1)

(assert (not d!97776))

(assert (not d!97772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97784 () Bool)

(assert (=> d!97784 (= (invariant!0 (currentBit!13767 thiss!1929) (currentByte!13772 thiss!1929) (size!7174 (buf!7420 thiss!1929))) (and (bvsge (currentBit!13767 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13767 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13772 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13772 thiss!1929) (size!7174 (buf!7420 thiss!1929))) (and (= (currentBit!13767 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13772 thiss!1929) (size!7174 (buf!7420 thiss!1929)))))))))

(assert (=> d!97776 d!97784))

(declare-fun d!97786 () Bool)

(assert (=> d!97786 (= (remainingBits!0 ((_ sign_extend 32) (size!7174 (buf!7420 thiss!1929))) ((_ sign_extend 32) (currentByte!13772 thiss!1929)) ((_ sign_extend 32) (currentBit!13767 thiss!1929))) (bvsub (bvmul ((_ sign_extend 32) (size!7174 (buf!7420 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13772 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13767 thiss!1929)))))))

(assert (=> d!97772 d!97786))

(push 1)

(check-sat)

