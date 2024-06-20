; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30002 () Bool)

(assert start!30002)

(declare-fun res!128943 () Bool)

(declare-fun e!103426 () Bool)

(assert (=> start!30002 (=> (not res!128943) (not e!103426))))

(declare-datatypes ((array!6948 0))(
  ( (array!6949 (arr!3955 (Array (_ BitVec 32) (_ BitVec 8))) (size!3132 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5522 0))(
  ( (BitStream!5523 (buf!3635 array!6948) (currentByte!6648 (_ BitVec 32)) (currentBit!6643 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5522)

(declare-fun bs2!18 () BitStream!5522)

(assert (=> start!30002 (= res!128943 (= (size!3132 (buf!3635 bs1!10)) (size!3132 (buf!3635 bs2!18))))))

(assert (=> start!30002 e!103426))

(declare-fun e!103425 () Bool)

(declare-fun inv!12 (BitStream!5522) Bool)

(assert (=> start!30002 (and (inv!12 bs1!10) e!103425)))

(declare-fun e!103424 () Bool)

(assert (=> start!30002 (and (inv!12 bs2!18) e!103424)))

(declare-fun lt!240394 () (_ BitVec 64))

(declare-fun b!154008 () Bool)

(declare-fun lt!240393 () (_ BitVec 64))

(assert (=> b!154008 (= e!103426 (and (bvsle lt!240394 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3132 (buf!3635 bs1!10))))) (let ((bdg!8949 (bvand lt!240393 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!8949 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= bdg!8949 (bvand lt!240394 #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!154008 (= lt!240394 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240393))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154008 (= lt!240393 (bitIndex!0 (size!3132 (buf!3635 bs1!10)) (currentByte!6648 bs1!10) (currentBit!6643 bs1!10)))))

(declare-fun b!154009 () Bool)

(declare-fun array_inv!2921 (array!6948) Bool)

(assert (=> b!154009 (= e!103425 (array_inv!2921 (buf!3635 bs1!10)))))

(declare-fun b!154010 () Bool)

(assert (=> b!154010 (= e!103424 (array_inv!2921 (buf!3635 bs2!18)))))

(assert (= (and start!30002 res!128943) b!154008))

(assert (= start!30002 b!154009))

(assert (= start!30002 b!154010))

(declare-fun m!240003 () Bool)

(assert (=> start!30002 m!240003))

(declare-fun m!240005 () Bool)

(assert (=> start!30002 m!240005))

(declare-fun m!240007 () Bool)

(assert (=> b!154008 m!240007))

(declare-fun m!240009 () Bool)

(assert (=> b!154009 m!240009))

(declare-fun m!240011 () Bool)

(assert (=> b!154010 m!240011))

(push 1)

(assert (not b!154010))

(assert (not b!154009))

(assert (not start!30002))

(assert (not b!154008))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50776 () Bool)

(assert (=> d!50776 (= (array_inv!2921 (buf!3635 bs2!18)) (bvsge (size!3132 (buf!3635 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154010 d!50776))

(declare-fun d!50778 () Bool)

(assert (=> d!50778 (= (array_inv!2921 (buf!3635 bs1!10)) (bvsge (size!3132 (buf!3635 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154009 d!50778))

(declare-fun d!50780 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50780 (= (inv!12 bs1!10) (invariant!0 (currentBit!6643 bs1!10) (currentByte!6648 bs1!10) (size!3132 (buf!3635 bs1!10))))))

(declare-fun bs!12415 () Bool)

(assert (= bs!12415 d!50780))

(declare-fun m!240017 () Bool)

(assert (=> bs!12415 m!240017))

(assert (=> start!30002 d!50780))

(declare-fun d!50782 () Bool)

(assert (=> d!50782 (= (inv!12 bs2!18) (invariant!0 (currentBit!6643 bs2!18) (currentByte!6648 bs2!18) (size!3132 (buf!3635 bs2!18))))))

(declare-fun bs!12416 () Bool)

(assert (= bs!12416 d!50782))

(declare-fun m!240019 () Bool)

(assert (=> bs!12416 m!240019))

(assert (=> start!30002 d!50782))

(declare-fun d!50784 () Bool)

(declare-fun e!103437 () Bool)

(assert (=> d!50784 e!103437))

(declare-fun res!128961 () Bool)

(assert (=> d!50784 (=> (not res!128961) (not e!103437))))

(declare-fun lt!240448 () (_ BitVec 64))

(declare-fun lt!240445 () (_ BitVec 64))

(declare-fun lt!240444 () (_ BitVec 64))

(assert (=> d!50784 (= res!128961 (= lt!240444 (bvsub lt!240448 lt!240445)))))

(assert (=> d!50784 (or (= (bvand lt!240448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240445 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240448 lt!240445) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50784 (= lt!240445 (remainingBits!0 ((_ sign_extend 32) (size!3132 (buf!3635 bs1!10))) ((_ sign_extend 32) (currentByte!6648 bs1!10)) ((_ sign_extend 32) (currentBit!6643 bs1!10))))))

(declare-fun lt!240447 () (_ BitVec 64))

(declare-fun lt!240446 () (_ BitVec 64))

(assert (=> d!50784 (= lt!240448 (bvmul lt!240447 lt!240446))))

(assert (=> d!50784 (or (= lt!240447 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240446 (bvsdiv (bvmul lt!240447 lt!240446) lt!240447)))))

(assert (=> d!50784 (= lt!240446 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50784 (= lt!240447 ((_ sign_extend 32) (size!3132 (buf!3635 bs1!10))))))

(assert (=> d!50784 (= lt!240444 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6648 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6643 bs1!10))))))

(assert (=> d!50784 (invariant!0 (currentBit!6643 bs1!10) (currentByte!6648 bs1!10) (size!3132 (buf!3635 bs1!10)))))

(assert (=> d!50784 (= (bitIndex!0 (size!3132 (buf!3635 bs1!10)) (currentByte!6648 bs1!10) (currentBit!6643 bs1!10)) lt!240444)))

(declare-fun b!154027 () Bool)

(declare-fun res!128960 () Bool)

(assert (=> b!154027 (=> (not res!128960) (not e!103437))))

(assert (=> b!154027 (= res!128960 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240444))))

(declare-fun b!154028 () Bool)

(declare-fun lt!240443 () (_ BitVec 64))

(assert (=> b!154028 (= e!103437 (bvsle lt!240444 (bvmul lt!240443 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154028 (or (= lt!240443 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240443 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240443)))))

(assert (=> b!154028 (= lt!240443 ((_ sign_extend 32) (size!3132 (buf!3635 bs1!10))))))

(assert (= (and d!50784 res!128961) b!154027))

(assert (= (and b!154027 res!128960) b!154028))

(declare-fun m!240029 () Bool)

(assert (=> d!50784 m!240029))

(assert (=> d!50784 m!240017))

(assert (=> b!154008 d!50784))

(push 1)

(assert (not d!50784))

(assert (not d!50780))

(assert (not d!50782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

