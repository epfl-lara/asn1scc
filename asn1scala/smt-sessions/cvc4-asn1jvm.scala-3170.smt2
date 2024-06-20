; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72838 () Bool)

(assert start!72838)

(declare-fun b!324663 () Bool)

(declare-fun e!234032 () Bool)

(declare-datatypes ((array!20886 0))(
  ( (array!20887 (arr!10170 (Array (_ BitVec 32) (_ BitVec 8))) (size!9078 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14318 0))(
  ( (BitStream!14319 (buf!8220 array!20886) (currentByte!15203 (_ BitVec 32)) (currentBit!15198 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14318)

(declare-fun lt!447119 () (_ BitVec 64))

(assert (=> b!324663 (= e!234032 (and (bvsle ((_ sign_extend 32) (size!9078 (buf!8220 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15203 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle lt!447119 #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9078 (buf!8220 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15203 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt lt!447119 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!324663 (= lt!447119 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15198 thiss!877))))))

(declare-fun b!324664 () Bool)

(declare-fun e!234033 () Bool)

(declare-fun array_inv!8630 (array!20886) Bool)

(assert (=> b!324664 (= e!234033 (array_inv!8630 (buf!8220 thiss!877)))))

(declare-fun b!324662 () Bool)

(declare-fun res!266448 () Bool)

(assert (=> b!324662 (=> (not res!266448) (not e!234032))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324662 (= res!266448 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9078 (buf!8220 thiss!877)) (currentByte!15203 thiss!877) (currentBit!15198 thiss!877))) (bitIndex!0 (size!9078 (buf!8220 thiss!877)) (currentByte!15203 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15198 thiss!877)))))))

(declare-fun res!266449 () Bool)

(assert (=> start!72838 (=> (not res!266449) (not e!234032))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72838 (= res!266449 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9078 (buf!8220 thiss!877))) ((_ sign_extend 32) (currentByte!15203 thiss!877)) ((_ sign_extend 32) (currentBit!15198 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72838 e!234032))

(declare-fun inv!12 (BitStream!14318) Bool)

(assert (=> start!72838 (and (inv!12 thiss!877) e!234033)))

(declare-fun b!324661 () Bool)

(declare-fun res!266447 () Bool)

(assert (=> b!324661 (=> (not res!266447) (not e!234032))))

(assert (=> b!324661 (= res!266447 (bvslt (currentBit!15198 thiss!877) #b00000000000000000000000000000111))))

(assert (= (and start!72838 res!266449) b!324661))

(assert (= (and b!324661 res!266447) b!324662))

(assert (= (and b!324662 res!266448) b!324663))

(assert (= start!72838 b!324664))

(declare-fun m!462741 () Bool)

(assert (=> b!324664 m!462741))

(declare-fun m!462743 () Bool)

(assert (=> b!324662 m!462743))

(declare-fun m!462745 () Bool)

(assert (=> b!324662 m!462745))

(declare-fun m!462747 () Bool)

(assert (=> start!72838 m!462747))

(declare-fun m!462749 () Bool)

(assert (=> start!72838 m!462749))

(push 1)

(assert (not b!324664))

(assert (not b!324662))

(assert (not start!72838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106772 () Bool)

(assert (=> d!106772 (= (array_inv!8630 (buf!8220 thiss!877)) (bvsge (size!9078 (buf!8220 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324664 d!106772))

(declare-fun d!106774 () Bool)

(declare-fun e!234044 () Bool)

(assert (=> d!106774 e!234044))

(declare-fun res!266471 () Bool)

(assert (=> d!106774 (=> (not res!266471) (not e!234044))))

(declare-fun lt!447181 () (_ BitVec 64))

(declare-fun lt!447185 () (_ BitVec 64))

(declare-fun lt!447180 () (_ BitVec 64))

(assert (=> d!106774 (= res!266471 (= lt!447181 (bvsub lt!447180 lt!447185)))))

(assert (=> d!106774 (or (= (bvand lt!447180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447185 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447180 lt!447185) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106774 (= lt!447185 (remainingBits!0 ((_ sign_extend 32) (size!9078 (buf!8220 thiss!877))) ((_ sign_extend 32) (currentByte!15203 thiss!877)) ((_ sign_extend 32) (currentBit!15198 thiss!877))))))

(declare-fun lt!447183 () (_ BitVec 64))

(declare-fun lt!447182 () (_ BitVec 64))

(assert (=> d!106774 (= lt!447180 (bvmul lt!447183 lt!447182))))

(assert (=> d!106774 (or (= lt!447183 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447182 (bvsdiv (bvmul lt!447183 lt!447182) lt!447183)))))

(assert (=> d!106774 (= lt!447182 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106774 (= lt!447183 ((_ sign_extend 32) (size!9078 (buf!8220 thiss!877))))))

(assert (=> d!106774 (= lt!447181 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15203 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15198 thiss!877))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106774 (invariant!0 (currentBit!15198 thiss!877) (currentByte!15203 thiss!877) (size!9078 (buf!8220 thiss!877)))))

(assert (=> d!106774 (= (bitIndex!0 (size!9078 (buf!8220 thiss!877)) (currentByte!15203 thiss!877) (currentBit!15198 thiss!877)) lt!447181)))

(declare-fun b!324685 () Bool)

(declare-fun res!266470 () Bool)

(assert (=> b!324685 (=> (not res!266470) (not e!234044))))

(assert (=> b!324685 (= res!266470 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447181))))

(declare-fun b!324686 () Bool)

(declare-fun lt!447184 () (_ BitVec 64))

(assert (=> b!324686 (= e!234044 (bvsle lt!447181 (bvmul lt!447184 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324686 (or (= lt!447184 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447184 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447184)))))

(assert (=> b!324686 (= lt!447184 ((_ sign_extend 32) (size!9078 (buf!8220 thiss!877))))))

(assert (= (and d!106774 res!266471) b!324685))

(assert (= (and b!324685 res!266470) b!324686))

(assert (=> d!106774 m!462747))

(declare-fun m!462763 () Bool)

(assert (=> d!106774 m!462763))

(assert (=> b!324662 d!106774))

(declare-fun d!106778 () Bool)

(declare-fun e!234045 () Bool)

(assert (=> d!106778 e!234045))

(declare-fun res!266473 () Bool)

(assert (=> d!106778 (=> (not res!266473) (not e!234045))))

(declare-fun lt!447186 () (_ BitVec 64))

(declare-fun lt!447187 () (_ BitVec 64))

(declare-fun lt!447191 () (_ BitVec 64))

(assert (=> d!106778 (= res!266473 (= lt!447187 (bvsub lt!447186 lt!447191)))))

(assert (=> d!106778 (or (= (bvand lt!447186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447191 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447186 lt!447191) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106778 (= lt!447191 (remainingBits!0 ((_ sign_extend 32) (size!9078 (buf!8220 thiss!877))) ((_ sign_extend 32) (currentByte!15203 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15198 thiss!877)))))))

(declare-fun lt!447189 () (_ BitVec 64))

(declare-fun lt!447188 () (_ BitVec 64))

(assert (=> d!106778 (= lt!447186 (bvmul lt!447189 lt!447188))))

(assert (=> d!106778 (or (= lt!447189 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447188 (bvsdiv (bvmul lt!447189 lt!447188) lt!447189)))))

(assert (=> d!106778 (= lt!447188 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106778 (= lt!447189 ((_ sign_extend 32) (size!9078 (buf!8220 thiss!877))))))

(assert (=> d!106778 (= lt!447187 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15203 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15198 thiss!877)))))))

(assert (=> d!106778 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15198 thiss!877)) (currentByte!15203 thiss!877) (size!9078 (buf!8220 thiss!877)))))

(assert (=> d!106778 (= (bitIndex!0 (size!9078 (buf!8220 thiss!877)) (currentByte!15203 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15198 thiss!877))) lt!447187)))

(declare-fun b!324687 () Bool)

(declare-fun res!266472 () Bool)

(assert (=> b!324687 (=> (not res!266472) (not e!234045))))

(assert (=> b!324687 (= res!266472 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447187))))

(declare-fun b!324688 () Bool)

(declare-fun lt!447190 () (_ BitVec 64))

(assert (=> b!324688 (= e!234045 (bvsle lt!447187 (bvmul lt!447190 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324688 (or (= lt!447190 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447190 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447190)))))

(assert (=> b!324688 (= lt!447190 ((_ sign_extend 32) (size!9078 (buf!8220 thiss!877))))))

(assert (= (and d!106778 res!266473) b!324687))

(assert (= (and b!324687 res!266472) b!324688))

(declare-fun m!462765 () Bool)

(assert (=> d!106778 m!462765))

(declare-fun m!462767 () Bool)

(assert (=> d!106778 m!462767))

(assert (=> b!324662 d!106778))

(declare-fun d!106780 () Bool)

(assert (=> d!106780 (= (remainingBits!0 ((_ sign_extend 32) (size!9078 (buf!8220 thiss!877))) ((_ sign_extend 32) (currentByte!15203 thiss!877)) ((_ sign_extend 32) (currentBit!15198 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9078 (buf!8220 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15203 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15198 thiss!877)))))))

(assert (=> start!72838 d!106780))

(declare-fun d!106782 () Bool)

(assert (=> d!106782 (= (inv!12 thiss!877) (invariant!0 (currentBit!15198 thiss!877) (currentByte!15203 thiss!877) (size!9078 (buf!8220 thiss!877))))))

(declare-fun bs!28120 () Bool)

(assert (= bs!28120 d!106782))

(assert (=> bs!28120 m!462763))

(assert (=> start!72838 d!106782))

(push 1)

(assert (not d!106782))

(assert (not d!106774))

(assert (not d!106778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106784 () Bool)

(assert (=> d!106784 (= (invariant!0 (currentBit!15198 thiss!877) (currentByte!15203 thiss!877) (size!9078 (buf!8220 thiss!877))) (and (bvsge (currentBit!15198 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15198 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15203 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15203 thiss!877) (size!9078 (buf!8220 thiss!877))) (and (= (currentBit!15198 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15203 thiss!877) (size!9078 (buf!8220 thiss!877)))))))))

(assert (=> d!106782 d!106784))

(assert (=> d!106774 d!106780))

(assert (=> d!106774 d!106784))

(declare-fun d!106786 () Bool)

(assert (=> d!106786 (= (remainingBits!0 ((_ sign_extend 32) (size!9078 (buf!8220 thiss!877))) ((_ sign_extend 32) (currentByte!15203 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15198 thiss!877)))) (bvsub (bvmul ((_ sign_extend 32) (size!9078 (buf!8220 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15203 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15198 thiss!877))))))))

(assert (=> d!106778 d!106786))

(declare-fun d!106788 () Bool)

(assert (=> d!106788 (= (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15198 thiss!877)) (currentByte!15203 thiss!877) (size!9078 (buf!8220 thiss!877))) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentBit!15198 thiss!877)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentBit!15198 thiss!877)) #b00000000000000000000000000001000) (bvsge (currentByte!15203 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15203 thiss!877) (size!9078 (buf!8220 thiss!877))) (and (= (bvadd #b00000000000000000000000000000001 (currentBit!15198 thiss!877)) #b00000000000000000000000000000000) (= (currentByte!15203 thiss!877) (size!9078 (buf!8220 thiss!877)))))))))

(assert (=> d!106778 d!106788))

(push 1)

(check-sat)

(pop 1)

