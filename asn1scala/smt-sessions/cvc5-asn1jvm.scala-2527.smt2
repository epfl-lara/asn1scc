; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63828 () Bool)

(assert start!63828)

(declare-fun res!235343 () Bool)

(declare-fun e!203084 () Bool)

(assert (=> start!63828 (=> (not res!235343) (not e!203084))))

(declare-datatypes ((array!16638 0))(
  ( (array!16639 (arr!8173 (Array (_ BitVec 32) (_ BitVec 8))) (size!7177 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12724 0))(
  ( (BitStream!12725 (buf!7423 array!16638) (currentByte!13784 (_ BitVec 32)) (currentBit!13779 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12724)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63828 (= res!235343 (validate_offset_bits!1 ((_ sign_extend 32) (size!7177 (buf!7423 thiss!1929))) ((_ sign_extend 32) (currentByte!13784 thiss!1929)) ((_ sign_extend 32) (currentBit!13779 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13779 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63828 e!203084))

(declare-fun e!203085 () Bool)

(declare-fun inv!12 (BitStream!12724) Bool)

(assert (=> start!63828 (and (inv!12 thiss!1929) e!203085)))

(declare-fun b!284089 () Bool)

(declare-fun res!235342 () Bool)

(assert (=> b!284089 (=> (not res!235342) (not e!203084))))

(assert (=> b!284089 (= res!235342 (not (= (currentBit!13779 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!284090 () Bool)

(declare-fun lt!418233 () (_ BitVec 64))

(declare-fun lt!418232 () (_ BitVec 64))

(assert (=> b!284090 (= e!203084 (and (= lt!418233 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!418233 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 lt!418232) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!284090 (= lt!418233 (bvand lt!418232 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!284090 (= lt!418232 (bitIndex!0 (size!7177 (buf!7423 thiss!1929)) (currentByte!13784 thiss!1929) (currentBit!13779 thiss!1929)))))

(declare-fun b!284091 () Bool)

(declare-fun array_inv!6870 (array!16638) Bool)

(assert (=> b!284091 (= e!203085 (array_inv!6870 (buf!7423 thiss!1929)))))

(assert (= (and start!63828 res!235343) b!284089))

(assert (= (and b!284089 res!235342) b!284090))

(assert (= start!63828 b!284091))

(declare-fun m!417273 () Bool)

(assert (=> start!63828 m!417273))

(declare-fun m!417275 () Bool)

(assert (=> start!63828 m!417275))

(declare-fun m!417277 () Bool)

(assert (=> b!284090 m!417277))

(declare-fun m!417279 () Bool)

(assert (=> b!284091 m!417279))

(push 1)

(assert (not b!284091))

(assert (not b!284090))

(assert (not start!63828))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97794 () Bool)

(assert (=> d!97794 (= (array_inv!6870 (buf!7423 thiss!1929)) (bvsge (size!7177 (buf!7423 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284091 d!97794))

(declare-fun d!97796 () Bool)

(declare-fun e!203106 () Bool)

(assert (=> d!97796 e!203106))

(declare-fun res!235361 () Bool)

(assert (=> d!97796 (=> (not res!235361) (not e!203106))))

(declare-fun lt!418263 () (_ BitVec 64))

(declare-fun lt!418261 () (_ BitVec 64))

(declare-fun lt!418262 () (_ BitVec 64))

(assert (=> d!97796 (= res!235361 (= lt!418262 (bvsub lt!418263 lt!418261)))))

(assert (=> d!97796 (or (= (bvand lt!418263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418261 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418263 lt!418261) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97796 (= lt!418261 (remainingBits!0 ((_ sign_extend 32) (size!7177 (buf!7423 thiss!1929))) ((_ sign_extend 32) (currentByte!13784 thiss!1929)) ((_ sign_extend 32) (currentBit!13779 thiss!1929))))))

(declare-fun lt!418265 () (_ BitVec 64))

(declare-fun lt!418260 () (_ BitVec 64))

(assert (=> d!97796 (= lt!418263 (bvmul lt!418265 lt!418260))))

(assert (=> d!97796 (or (= lt!418265 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418260 (bvsdiv (bvmul lt!418265 lt!418260) lt!418265)))))

(assert (=> d!97796 (= lt!418260 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97796 (= lt!418265 ((_ sign_extend 32) (size!7177 (buf!7423 thiss!1929))))))

(assert (=> d!97796 (= lt!418262 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13784 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13779 thiss!1929))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97796 (invariant!0 (currentBit!13779 thiss!1929) (currentByte!13784 thiss!1929) (size!7177 (buf!7423 thiss!1929)))))

(assert (=> d!97796 (= (bitIndex!0 (size!7177 (buf!7423 thiss!1929)) (currentByte!13784 thiss!1929) (currentBit!13779 thiss!1929)) lt!418262)))

(declare-fun b!284114 () Bool)

(declare-fun res!235360 () Bool)

(assert (=> b!284114 (=> (not res!235360) (not e!203106))))

(assert (=> b!284114 (= res!235360 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418262))))

(declare-fun b!284115 () Bool)

(declare-fun lt!418264 () (_ BitVec 64))

(assert (=> b!284115 (= e!203106 (bvsle lt!418262 (bvmul lt!418264 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284115 (or (= lt!418264 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418264 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418264)))))

(assert (=> b!284115 (= lt!418264 ((_ sign_extend 32) (size!7177 (buf!7423 thiss!1929))))))

(assert (= (and d!97796 res!235361) b!284114))

(assert (= (and b!284114 res!235360) b!284115))

(declare-fun m!417301 () Bool)

(assert (=> d!97796 m!417301))

(declare-fun m!417303 () Bool)

(assert (=> d!97796 m!417303))

(assert (=> b!284090 d!97796))

(declare-fun d!97808 () Bool)

(assert (=> d!97808 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7177 (buf!7423 thiss!1929))) ((_ sign_extend 32) (currentByte!13784 thiss!1929)) ((_ sign_extend 32) (currentBit!13779 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13779 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7177 (buf!7423 thiss!1929))) ((_ sign_extend 32) (currentByte!13784 thiss!1929)) ((_ sign_extend 32) (currentBit!13779 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13779 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24719 () Bool)

(assert (= bs!24719 d!97808))

(assert (=> bs!24719 m!417301))

(assert (=> start!63828 d!97808))

(declare-fun d!97810 () Bool)

(assert (=> d!97810 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13779 thiss!1929) (currentByte!13784 thiss!1929) (size!7177 (buf!7423 thiss!1929))))))

(declare-fun bs!24720 () Bool)

(assert (= bs!24720 d!97810))

(assert (=> bs!24720 m!417303))

(assert (=> start!63828 d!97810))

(push 1)

(assert (not d!97808))

(assert (not d!97810))

(assert (not d!97796))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

