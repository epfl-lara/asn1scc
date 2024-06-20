; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30026 () Bool)

(assert start!30026)

(declare-fun b!154069 () Bool)

(declare-fun e!103487 () Bool)

(declare-datatypes ((array!6957 0))(
  ( (array!6958 (arr!3958 (Array (_ BitVec 32) (_ BitVec 8))) (size!3135 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5528 0))(
  ( (BitStream!5529 (buf!3638 array!6957) (currentByte!6654 (_ BitVec 32)) (currentBit!6649 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5528)

(declare-fun array_inv!2924 (array!6957) Bool)

(assert (=> b!154069 (= e!103487 (array_inv!2924 (buf!3638 bs1!10)))))

(declare-fun b!154070 () Bool)

(declare-fun e!103489 () Bool)

(declare-fun bs2!18 () BitStream!5528)

(assert (=> b!154070 (= e!103489 (array_inv!2924 (buf!3638 bs2!18)))))

(declare-fun b!154072 () Bool)

(declare-fun res!128986 () Bool)

(declare-fun e!103491 () Bool)

(assert (=> b!154072 (=> (not res!128986) (not e!103491))))

(declare-fun lt!240473 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154072 (= res!128986 (bvsle lt!240473 (bitIndex!0 (size!3135 (buf!3638 bs2!18)) (currentByte!6654 bs2!18) (currentBit!6649 bs2!18))))))

(declare-fun b!154073 () Bool)

(declare-fun e!103488 () Bool)

(assert (=> b!154073 (= e!103488 e!103491)))

(declare-fun res!128987 () Bool)

(assert (=> b!154073 (=> (not res!128987) (not e!103491))))

(assert (=> b!154073 (= res!128987 (bvsle lt!240473 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3135 (buf!3638 bs1!10))))))))

(declare-fun lt!240475 () (_ BitVec 64))

(assert (=> b!154073 (= lt!240473 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240475))))

(assert (=> b!154073 (= lt!240475 (bitIndex!0 (size!3135 (buf!3638 bs1!10)) (currentByte!6654 bs1!10) (currentBit!6649 bs1!10)))))

(declare-fun res!128988 () Bool)

(assert (=> start!30026 (=> (not res!128988) (not e!103488))))

(assert (=> start!30026 (= res!128988 (= (size!3135 (buf!3638 bs1!10)) (size!3135 (buf!3638 bs2!18))))))

(assert (=> start!30026 e!103488))

(declare-fun inv!12 (BitStream!5528) Bool)

(assert (=> start!30026 (and (inv!12 bs1!10) e!103487)))

(assert (=> start!30026 (and (inv!12 bs2!18) e!103489)))

(declare-fun b!154071 () Bool)

(declare-fun lt!240474 () (_ BitVec 64))

(assert (=> b!154071 (= e!103491 (and (= lt!240474 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!240474 (bvand lt!240473 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!154071 (= lt!240474 (bvand lt!240475 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!30026 res!128988) b!154073))

(assert (= (and b!154073 res!128987) b!154072))

(assert (= (and b!154072 res!128986) b!154071))

(assert (= start!30026 b!154069))

(assert (= start!30026 b!154070))

(declare-fun m!240055 () Bool)

(assert (=> b!154072 m!240055))

(declare-fun m!240057 () Bool)

(assert (=> b!154073 m!240057))

(declare-fun m!240059 () Bool)

(assert (=> start!30026 m!240059))

(declare-fun m!240061 () Bool)

(assert (=> start!30026 m!240061))

(declare-fun m!240063 () Bool)

(assert (=> b!154069 m!240063))

(declare-fun m!240065 () Bool)

(assert (=> b!154070 m!240065))

(push 1)

(assert (not b!154069))

(assert (not b!154072))

(assert (not start!30026))

(assert (not b!154073))

(assert (not b!154070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50802 () Bool)

(assert (=> d!50802 (= (array_inv!2924 (buf!3638 bs1!10)) (bvsge (size!3135 (buf!3638 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154069 d!50802))

(declare-fun d!50806 () Bool)

(declare-fun e!103502 () Bool)

(assert (=> d!50806 e!103502))

(declare-fun res!129009 () Bool)

(assert (=> d!50806 (=> (not res!129009) (not e!103502))))

(declare-fun lt!240536 () (_ BitVec 64))

(declare-fun lt!240537 () (_ BitVec 64))

(declare-fun lt!240538 () (_ BitVec 64))

(assert (=> d!50806 (= res!129009 (= lt!240536 (bvsub lt!240537 lt!240538)))))

(assert (=> d!50806 (or (= (bvand lt!240537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240538 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240537 lt!240538) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50806 (= lt!240538 (remainingBits!0 ((_ sign_extend 32) (size!3135 (buf!3638 bs1!10))) ((_ sign_extend 32) (currentByte!6654 bs1!10)) ((_ sign_extend 32) (currentBit!6649 bs1!10))))))

(declare-fun lt!240539 () (_ BitVec 64))

(declare-fun lt!240541 () (_ BitVec 64))

(assert (=> d!50806 (= lt!240537 (bvmul lt!240539 lt!240541))))

(assert (=> d!50806 (or (= lt!240539 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240541 (bvsdiv (bvmul lt!240539 lt!240541) lt!240539)))))

(assert (=> d!50806 (= lt!240541 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50806 (= lt!240539 ((_ sign_extend 32) (size!3135 (buf!3638 bs1!10))))))

(assert (=> d!50806 (= lt!240536 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6654 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6649 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50806 (invariant!0 (currentBit!6649 bs1!10) (currentByte!6654 bs1!10) (size!3135 (buf!3638 bs1!10)))))

(assert (=> d!50806 (= (bitIndex!0 (size!3135 (buf!3638 bs1!10)) (currentByte!6654 bs1!10) (currentBit!6649 bs1!10)) lt!240536)))

(declare-fun b!154094 () Bool)

(declare-fun res!129010 () Bool)

(assert (=> b!154094 (=> (not res!129010) (not e!103502))))

(assert (=> b!154094 (= res!129010 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240536))))

(declare-fun b!154095 () Bool)

(declare-fun lt!240540 () (_ BitVec 64))

(assert (=> b!154095 (= e!103502 (bvsle lt!240536 (bvmul lt!240540 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154095 (or (= lt!240540 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240540 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240540)))))

(assert (=> b!154095 (= lt!240540 ((_ sign_extend 32) (size!3135 (buf!3638 bs1!10))))))

(assert (= (and d!50806 res!129009) b!154094))

(assert (= (and b!154094 res!129010) b!154095))

(declare-fun m!240083 () Bool)

(assert (=> d!50806 m!240083))

(declare-fun m!240085 () Bool)

(assert (=> d!50806 m!240085))

(assert (=> b!154073 d!50806))

(declare-fun d!50824 () Bool)

(declare-fun e!103503 () Bool)

(assert (=> d!50824 e!103503))

(declare-fun res!129011 () Bool)

(assert (=> d!50824 (=> (not res!129011) (not e!103503))))

(declare-fun lt!240543 () (_ BitVec 64))

(declare-fun lt!240542 () (_ BitVec 64))

(declare-fun lt!240544 () (_ BitVec 64))

(assert (=> d!50824 (= res!129011 (= lt!240542 (bvsub lt!240543 lt!240544)))))

(assert (=> d!50824 (or (= (bvand lt!240543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240544 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240543 lt!240544) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50824 (= lt!240544 (remainingBits!0 ((_ sign_extend 32) (size!3135 (buf!3638 bs2!18))) ((_ sign_extend 32) (currentByte!6654 bs2!18)) ((_ sign_extend 32) (currentBit!6649 bs2!18))))))

(declare-fun lt!240545 () (_ BitVec 64))

(declare-fun lt!240547 () (_ BitVec 64))

(assert (=> d!50824 (= lt!240543 (bvmul lt!240545 lt!240547))))

(assert (=> d!50824 (or (= lt!240545 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240547 (bvsdiv (bvmul lt!240545 lt!240547) lt!240545)))))

(assert (=> d!50824 (= lt!240547 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50824 (= lt!240545 ((_ sign_extend 32) (size!3135 (buf!3638 bs2!18))))))

(assert (=> d!50824 (= lt!240542 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6654 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6649 bs2!18))))))

(assert (=> d!50824 (invariant!0 (currentBit!6649 bs2!18) (currentByte!6654 bs2!18) (size!3135 (buf!3638 bs2!18)))))

(assert (=> d!50824 (= (bitIndex!0 (size!3135 (buf!3638 bs2!18)) (currentByte!6654 bs2!18) (currentBit!6649 bs2!18)) lt!240542)))

(declare-fun b!154096 () Bool)

(declare-fun res!129012 () Bool)

(assert (=> b!154096 (=> (not res!129012) (not e!103503))))

(assert (=> b!154096 (= res!129012 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240542))))

(declare-fun b!154097 () Bool)

(declare-fun lt!240546 () (_ BitVec 64))

(assert (=> b!154097 (= e!103503 (bvsle lt!240542 (bvmul lt!240546 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154097 (or (= lt!240546 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240546 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240546)))))

(assert (=> b!154097 (= lt!240546 ((_ sign_extend 32) (size!3135 (buf!3638 bs2!18))))))

(assert (= (and d!50824 res!129011) b!154096))

(assert (= (and b!154096 res!129012) b!154097))

(declare-fun m!240087 () Bool)

(assert (=> d!50824 m!240087))

(declare-fun m!240089 () Bool)

(assert (=> d!50824 m!240089))

(assert (=> b!154072 d!50824))

(declare-fun d!50826 () Bool)

(assert (=> d!50826 (= (array_inv!2924 (buf!3638 bs2!18)) (bvsge (size!3135 (buf!3638 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154070 d!50826))

(declare-fun d!50828 () Bool)

(assert (=> d!50828 (= (inv!12 bs1!10) (invariant!0 (currentBit!6649 bs1!10) (currentByte!6654 bs1!10) (size!3135 (buf!3638 bs1!10))))))

(declare-fun bs!12426 () Bool)

(assert (= bs!12426 d!50828))

(assert (=> bs!12426 m!240085))

(assert (=> start!30026 d!50828))

(declare-fun d!50830 () Bool)

(assert (=> d!50830 (= (inv!12 bs2!18) (invariant!0 (currentBit!6649 bs2!18) (currentByte!6654 bs2!18) (size!3135 (buf!3638 bs2!18))))))

(declare-fun bs!12427 () Bool)

(assert (= bs!12427 d!50830))

(assert (=> bs!12427 m!240089))

(assert (=> start!30026 d!50830))

(push 1)

(assert (not d!50828))

(assert (not d!50830))

(assert (not d!50806))

(assert (not d!50824))

(check-sat)

(pop 1)

(push 1)

(check-sat)

