; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72794 () Bool)

(assert start!72794)

(declare-fun b!324549 () Bool)

(declare-fun res!266357 () Bool)

(declare-fun e!233958 () Bool)

(assert (=> b!324549 (=> (not res!266357) (not e!233958))))

(declare-datatypes ((array!20869 0))(
  ( (array!20870 (arr!10163 (Array (_ BitVec 32) (_ BitVec 8))) (size!9071 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14304 0))(
  ( (BitStream!14305 (buf!8213 array!20869) (currentByte!15187 (_ BitVec 32)) (currentBit!15182 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14304)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324549 (= res!266357 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9071 (buf!8213 thiss!877)) (currentByte!15187 thiss!877) (currentBit!15182 thiss!877))) (bitIndex!0 (size!9071 (buf!8213 thiss!877)) (currentByte!15187 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15182 thiss!877)))))))

(declare-fun b!324550 () Bool)

(declare-fun res!266356 () Bool)

(assert (=> b!324550 (=> (not res!266356) (not e!233958))))

(assert (=> b!324550 (= res!266356 (and (bvsle ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15187 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15182 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15187 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15182 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!324551 () Bool)

(declare-fun e!233956 () Bool)

(declare-fun array_inv!8623 (array!20869) Bool)

(assert (=> b!324551 (= e!233956 (array_inv!8623 (buf!8213 thiss!877)))))

(declare-fun b!324552 () Bool)

(declare-fun res!266358 () Bool)

(assert (=> b!324552 (=> (not res!266358) (not e!233958))))

(assert (=> b!324552 (= res!266358 (bvslt (currentBit!15182 thiss!877) #b00000000000000000000000000000111))))

(declare-fun res!266359 () Bool)

(assert (=> start!72794 (=> (not res!266359) (not e!233958))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72794 (= res!266359 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877))) ((_ sign_extend 32) (currentByte!15187 thiss!877)) ((_ sign_extend 32) (currentBit!15182 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72794 e!233958))

(declare-fun inv!12 (BitStream!14304) Bool)

(assert (=> start!72794 (and (inv!12 thiss!877) e!233956)))

(declare-fun b!324553 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324553 (= e!233958 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15182 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15187 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877)))))))))

(assert (= (and start!72794 res!266359) b!324552))

(assert (= (and b!324552 res!266358) b!324549))

(assert (= (and b!324549 res!266357) b!324550))

(assert (= (and b!324550 res!266356) b!324553))

(assert (= start!72794 b!324551))

(declare-fun m!462649 () Bool)

(assert (=> b!324549 m!462649))

(declare-fun m!462651 () Bool)

(assert (=> b!324549 m!462651))

(declare-fun m!462653 () Bool)

(assert (=> b!324551 m!462653))

(declare-fun m!462655 () Bool)

(assert (=> start!72794 m!462655))

(declare-fun m!462657 () Bool)

(assert (=> start!72794 m!462657))

(declare-fun m!462659 () Bool)

(assert (=> b!324553 m!462659))

(check-sat (not start!72794) (not b!324549) (not b!324553) (not b!324551))
(check-sat)
(get-model)

(declare-fun d!106714 () Bool)

(assert (=> d!106714 (= (remainingBits!0 ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877))) ((_ sign_extend 32) (currentByte!15187 thiss!877)) ((_ sign_extend 32) (currentBit!15182 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15187 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15182 thiss!877)))))))

(assert (=> start!72794 d!106714))

(declare-fun d!106716 () Bool)

(assert (=> d!106716 (= (inv!12 thiss!877) (invariant!0 (currentBit!15182 thiss!877) (currentByte!15187 thiss!877) (size!9071 (buf!8213 thiss!877))))))

(declare-fun bs!28109 () Bool)

(assert (= bs!28109 d!106716))

(declare-fun m!462673 () Bool)

(assert (=> bs!28109 m!462673))

(assert (=> start!72794 d!106716))

(declare-fun d!106718 () Bool)

(declare-fun e!233970 () Bool)

(assert (=> d!106718 e!233970))

(declare-fun res!266377 () Bool)

(assert (=> d!106718 (=> (not res!266377) (not e!233970))))

(declare-fun lt!447055 () (_ BitVec 64))

(declare-fun lt!447053 () (_ BitVec 64))

(declare-fun lt!447054 () (_ BitVec 64))

(assert (=> d!106718 (= res!266377 (= lt!447054 (bvsub lt!447055 lt!447053)))))

(assert (=> d!106718 (or (= (bvand lt!447055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447053 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447055 lt!447053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106718 (= lt!447053 (remainingBits!0 ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877))) ((_ sign_extend 32) (currentByte!15187 thiss!877)) ((_ sign_extend 32) (currentBit!15182 thiss!877))))))

(declare-fun lt!447052 () (_ BitVec 64))

(declare-fun lt!447056 () (_ BitVec 64))

(assert (=> d!106718 (= lt!447055 (bvmul lt!447052 lt!447056))))

(assert (=> d!106718 (or (= lt!447052 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447056 (bvsdiv (bvmul lt!447052 lt!447056) lt!447052)))))

(assert (=> d!106718 (= lt!447056 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106718 (= lt!447052 ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877))))))

(assert (=> d!106718 (= lt!447054 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15187 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15182 thiss!877))))))

(assert (=> d!106718 (invariant!0 (currentBit!15182 thiss!877) (currentByte!15187 thiss!877) (size!9071 (buf!8213 thiss!877)))))

(assert (=> d!106718 (= (bitIndex!0 (size!9071 (buf!8213 thiss!877)) (currentByte!15187 thiss!877) (currentBit!15182 thiss!877)) lt!447054)))

(declare-fun b!324573 () Bool)

(declare-fun res!266376 () Bool)

(assert (=> b!324573 (=> (not res!266376) (not e!233970))))

(assert (=> b!324573 (= res!266376 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447054))))

(declare-fun b!324574 () Bool)

(declare-fun lt!447051 () (_ BitVec 64))

(assert (=> b!324574 (= e!233970 (bvsle lt!447054 (bvmul lt!447051 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324574 (or (= lt!447051 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447051 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447051)))))

(assert (=> b!324574 (= lt!447051 ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877))))))

(assert (= (and d!106718 res!266377) b!324573))

(assert (= (and b!324573 res!266376) b!324574))

(assert (=> d!106718 m!462655))

(assert (=> d!106718 m!462673))

(assert (=> b!324549 d!106718))

(declare-fun d!106722 () Bool)

(declare-fun e!233971 () Bool)

(assert (=> d!106722 e!233971))

(declare-fun res!266379 () Bool)

(assert (=> d!106722 (=> (not res!266379) (not e!233971))))

(declare-fun lt!447060 () (_ BitVec 64))

(declare-fun lt!447061 () (_ BitVec 64))

(declare-fun lt!447059 () (_ BitVec 64))

(assert (=> d!106722 (= res!266379 (= lt!447060 (bvsub lt!447061 lt!447059)))))

(assert (=> d!106722 (or (= (bvand lt!447061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447059 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447061 lt!447059) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106722 (= lt!447059 (remainingBits!0 ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877))) ((_ sign_extend 32) (currentByte!15187 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15182 thiss!877)))))))

(declare-fun lt!447058 () (_ BitVec 64))

(declare-fun lt!447062 () (_ BitVec 64))

(assert (=> d!106722 (= lt!447061 (bvmul lt!447058 lt!447062))))

(assert (=> d!106722 (or (= lt!447058 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447062 (bvsdiv (bvmul lt!447058 lt!447062) lt!447058)))))

(assert (=> d!106722 (= lt!447062 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106722 (= lt!447058 ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877))))))

(assert (=> d!106722 (= lt!447060 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15187 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15182 thiss!877)))))))

(assert (=> d!106722 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15182 thiss!877)) (currentByte!15187 thiss!877) (size!9071 (buf!8213 thiss!877)))))

(assert (=> d!106722 (= (bitIndex!0 (size!9071 (buf!8213 thiss!877)) (currentByte!15187 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15182 thiss!877))) lt!447060)))

(declare-fun b!324575 () Bool)

(declare-fun res!266378 () Bool)

(assert (=> b!324575 (=> (not res!266378) (not e!233971))))

(assert (=> b!324575 (= res!266378 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447060))))

(declare-fun b!324576 () Bool)

(declare-fun lt!447057 () (_ BitVec 64))

(assert (=> b!324576 (= e!233971 (bvsle lt!447060 (bvmul lt!447057 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324576 (or (= lt!447057 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447057 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447057)))))

(assert (=> b!324576 (= lt!447057 ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877))))))

(assert (= (and d!106722 res!266379) b!324575))

(assert (= (and b!324575 res!266378) b!324576))

(declare-fun m!462675 () Bool)

(assert (=> d!106722 m!462675))

(declare-fun m!462677 () Bool)

(assert (=> d!106722 m!462677))

(assert (=> b!324549 d!106722))

(declare-fun d!106726 () Bool)

(assert (=> d!106726 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15182 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15187 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15182 thiss!877))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15182 thiss!877))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15187 thiss!877))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15187 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15182 thiss!877))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15187 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9071 (buf!8213 thiss!877)))))))))))

(assert (=> b!324553 d!106726))

(declare-fun d!106730 () Bool)

(assert (=> d!106730 (= (array_inv!8623 (buf!8213 thiss!877)) (bvsge (size!9071 (buf!8213 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324551 d!106730))

(check-sat (not d!106718) (not d!106722) (not d!106716))
