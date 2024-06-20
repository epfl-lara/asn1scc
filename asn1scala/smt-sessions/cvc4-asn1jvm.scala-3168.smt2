; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72796 () Bool)

(assert start!72796)

(declare-fun b!324564 () Bool)

(declare-fun res!266370 () Bool)

(declare-fun e!233967 () Bool)

(assert (=> b!324564 (=> (not res!266370) (not e!233967))))

(declare-datatypes ((array!20871 0))(
  ( (array!20872 (arr!10164 (Array (_ BitVec 32) (_ BitVec 8))) (size!9072 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14306 0))(
  ( (BitStream!14307 (buf!8214 array!20871) (currentByte!15188 (_ BitVec 32)) (currentBit!15183 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14306)

(assert (=> b!324564 (= res!266370 (and (bvsle ((_ sign_extend 32) (size!9072 (buf!8214 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15188 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15183 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9072 (buf!8214 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15188 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15183 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!266371 () Bool)

(assert (=> start!72796 (=> (not res!266371) (not e!233967))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72796 (= res!266371 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9072 (buf!8214 thiss!877))) ((_ sign_extend 32) (currentByte!15188 thiss!877)) ((_ sign_extend 32) (currentBit!15183 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72796 e!233967))

(declare-fun e!233966 () Bool)

(declare-fun inv!12 (BitStream!14306) Bool)

(assert (=> start!72796 (and (inv!12 thiss!877) e!233966)))

(declare-fun b!324565 () Bool)

(declare-fun res!266369 () Bool)

(assert (=> b!324565 (=> (not res!266369) (not e!233967))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324565 (= res!266369 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9072 (buf!8214 thiss!877)) (currentByte!15188 thiss!877) (currentBit!15183 thiss!877))) (bitIndex!0 (size!9072 (buf!8214 thiss!877)) (currentByte!15188 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15183 thiss!877)))))))

(declare-fun b!324566 () Bool)

(declare-fun res!266368 () Bool)

(assert (=> b!324566 (=> (not res!266368) (not e!233967))))

(assert (=> b!324566 (= res!266368 (bvslt (currentBit!15183 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324567 () Bool)

(declare-fun array_inv!8624 (array!20871) Bool)

(assert (=> b!324567 (= e!233966 (array_inv!8624 (buf!8214 thiss!877)))))

(declare-fun b!324568 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324568 (= e!233967 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15183 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15188 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9072 (buf!8214 thiss!877)))))))))

(assert (= (and start!72796 res!266371) b!324566))

(assert (= (and b!324566 res!266368) b!324565))

(assert (= (and b!324565 res!266369) b!324564))

(assert (= (and b!324564 res!266370) b!324568))

(assert (= start!72796 b!324567))

(declare-fun m!462661 () Bool)

(assert (=> start!72796 m!462661))

(declare-fun m!462663 () Bool)

(assert (=> start!72796 m!462663))

(declare-fun m!462665 () Bool)

(assert (=> b!324565 m!462665))

(declare-fun m!462667 () Bool)

(assert (=> b!324565 m!462667))

(declare-fun m!462669 () Bool)

(assert (=> b!324567 m!462669))

(declare-fun m!462671 () Bool)

(assert (=> b!324568 m!462671))

(push 1)

(assert (not start!72796))

(assert (not b!324568))

(assert (not b!324567))

(assert (not b!324565))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106724 () Bool)

(assert (=> d!106724 (= (remainingBits!0 ((_ sign_extend 32) (size!9072 (buf!8214 thiss!877))) ((_ sign_extend 32) (currentByte!15188 thiss!877)) ((_ sign_extend 32) (currentBit!15183 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9072 (buf!8214 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15188 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15183 thiss!877)))))))

(assert (=> start!72796 d!106724))

(declare-fun d!106728 () Bool)

(assert (=> d!106728 (= (inv!12 thiss!877) (invariant!0 (currentBit!15183 thiss!877) (currentByte!15188 thiss!877) (size!9072 (buf!8214 thiss!877))))))

(declare-fun bs!28110 () Bool)

(assert (= bs!28110 d!106728))

(declare-fun m!462679 () Bool)

(assert (=> bs!28110 m!462679))

(assert (=> start!72796 d!106728))

(declare-fun d!106732 () Bool)

(assert (=> d!106732 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15183 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15188 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9072 (buf!8214 thiss!877))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15183 thiss!877))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15183 thiss!877))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15188 thiss!877))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15188 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9072 (buf!8214 thiss!877))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15183 thiss!877))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15188 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9072 (buf!8214 thiss!877)))))))))))

(assert (=> b!324568 d!106732))

(declare-fun d!106734 () Bool)

(assert (=> d!106734 (= (array_inv!8624 (buf!8214 thiss!877)) (bvsge (size!9072 (buf!8214 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324567 d!106734))

(declare-fun d!106738 () Bool)

(declare-fun e!233978 () Bool)

(assert (=> d!106738 e!233978))

(declare-fun res!266393 () Bool)

(assert (=> d!106738 (=> (not res!266393) (not e!233978))))

(declare-fun lt!447099 () (_ BitVec 64))

(declare-fun lt!447101 () (_ BitVec 64))

(declare-fun lt!447103 () (_ BitVec 64))

(assert (=> d!106738 (= res!266393 (= lt!447101 (bvsub lt!447099 lt!447103)))))

(assert (=> d!106738 (or (= (bvand lt!447099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447103 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447099 lt!447103) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106738 (= lt!447103 (remainingBits!0 ((_ sign_extend 32) (size!9072 (buf!8214 thiss!877))) ((_ sign_extend 32) (currentByte!15188 thiss!877)) ((_ sign_extend 32) (currentBit!15183 thiss!877))))))

(declare-fun lt!447104 () (_ BitVec 64))

(declare-fun lt!447100 () (_ BitVec 64))

(assert (=> d!106738 (= lt!447099 (bvmul lt!447104 lt!447100))))

(assert (=> d!106738 (or (= lt!447104 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447100 (bvsdiv (bvmul lt!447104 lt!447100) lt!447104)))))

(assert (=> d!106738 (= lt!447100 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106738 (= lt!447104 ((_ sign_extend 32) (size!9072 (buf!8214 thiss!877))))))

(assert (=> d!106738 (= lt!447101 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15188 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15183 thiss!877))))))

(assert (=> d!106738 (invariant!0 (currentBit!15183 thiss!877) (currentByte!15188 thiss!877) (size!9072 (buf!8214 thiss!877)))))

(assert (=> d!106738 (= (bitIndex!0 (size!9072 (buf!8214 thiss!877)) (currentByte!15188 thiss!877) (currentBit!15183 thiss!877)) lt!447101)))

(declare-fun b!324589 () Bool)

(declare-fun res!266392 () Bool)

(assert (=> b!324589 (=> (not res!266392) (not e!233978))))

