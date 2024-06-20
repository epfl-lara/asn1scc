; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72792 () Bool)

(assert start!72792)

(declare-fun b!324534 () Bool)

(declare-fun e!233947 () Bool)

(declare-datatypes ((array!20867 0))(
  ( (array!20868 (arr!10162 (Array (_ BitVec 32) (_ BitVec 8))) (size!9070 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14302 0))(
  ( (BitStream!14303 (buf!8212 array!20867) (currentByte!15186 (_ BitVec 32)) (currentBit!15181 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14302)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324534 (= e!233947 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15181 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15186 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877)))))))))

(declare-fun res!266346 () Bool)

(assert (=> start!72792 (=> (not res!266346) (not e!233947))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72792 (= res!266346 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877))) ((_ sign_extend 32) (currentByte!15186 thiss!877)) ((_ sign_extend 32) (currentBit!15181 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72792 e!233947))

(declare-fun e!233948 () Bool)

(declare-fun inv!12 (BitStream!14302) Bool)

(assert (=> start!72792 (and (inv!12 thiss!877) e!233948)))

(declare-fun b!324535 () Bool)

(declare-fun array_inv!8622 (array!20867) Bool)

(assert (=> b!324535 (= e!233948 (array_inv!8622 (buf!8212 thiss!877)))))

(declare-fun b!324536 () Bool)

(declare-fun res!266347 () Bool)

(assert (=> b!324536 (=> (not res!266347) (not e!233947))))

(assert (=> b!324536 (= res!266347 (and (bvsle ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15186 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15181 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15186 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15181 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!324537 () Bool)

(declare-fun res!266345 () Bool)

(assert (=> b!324537 (=> (not res!266345) (not e!233947))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324537 (= res!266345 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9070 (buf!8212 thiss!877)) (currentByte!15186 thiss!877) (currentBit!15181 thiss!877))) (bitIndex!0 (size!9070 (buf!8212 thiss!877)) (currentByte!15186 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15181 thiss!877)))))))

(declare-fun b!324538 () Bool)

(declare-fun res!266344 () Bool)

(assert (=> b!324538 (=> (not res!266344) (not e!233947))))

(assert (=> b!324538 (= res!266344 (bvslt (currentBit!15181 thiss!877) #b00000000000000000000000000000111))))

(assert (= (and start!72792 res!266346) b!324538))

(assert (= (and b!324538 res!266344) b!324537))

(assert (= (and b!324537 res!266345) b!324536))

(assert (= (and b!324536 res!266347) b!324534))

(assert (= start!72792 b!324535))

(declare-fun m!462637 () Bool)

(assert (=> b!324534 m!462637))

(declare-fun m!462639 () Bool)

(assert (=> start!72792 m!462639))

(declare-fun m!462641 () Bool)

(assert (=> start!72792 m!462641))

(declare-fun m!462643 () Bool)

(assert (=> b!324535 m!462643))

(declare-fun m!462645 () Bool)

(assert (=> b!324537 m!462645))

(declare-fun m!462647 () Bool)

(assert (=> b!324537 m!462647))

(push 1)

(assert (not b!324537))

(assert (not b!324535))

(assert (not start!72792))

(assert (not b!324534))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106720 () Bool)

(declare-fun e!233974 () Bool)

(assert (=> d!106720 e!233974))

(declare-fun res!266385 () Bool)

(assert (=> d!106720 (=> (not res!266385) (not e!233974))))

(declare-fun lt!447080 () (_ BitVec 64))

(declare-fun lt!447078 () (_ BitVec 64))

(declare-fun lt!447077 () (_ BitVec 64))

(assert (=> d!106720 (= res!266385 (= lt!447078 (bvsub lt!447080 lt!447077)))))

(assert (=> d!106720 (or (= (bvand lt!447080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447077 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447080 lt!447077) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106720 (= lt!447077 (remainingBits!0 ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877))) ((_ sign_extend 32) (currentByte!15186 thiss!877)) ((_ sign_extend 32) (currentBit!15181 thiss!877))))))

(declare-fun lt!447076 () (_ BitVec 64))

(declare-fun lt!447075 () (_ BitVec 64))

(assert (=> d!106720 (= lt!447080 (bvmul lt!447076 lt!447075))))

(assert (=> d!106720 (or (= lt!447076 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447075 (bvsdiv (bvmul lt!447076 lt!447075) lt!447076)))))

(assert (=> d!106720 (= lt!447075 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106720 (= lt!447076 ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877))))))

(assert (=> d!106720 (= lt!447078 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15186 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15181 thiss!877))))))

(assert (=> d!106720 (invariant!0 (currentBit!15181 thiss!877) (currentByte!15186 thiss!877) (size!9070 (buf!8212 thiss!877)))))

(assert (=> d!106720 (= (bitIndex!0 (size!9070 (buf!8212 thiss!877)) (currentByte!15186 thiss!877) (currentBit!15181 thiss!877)) lt!447078)))

(declare-fun b!324581 () Bool)

(declare-fun res!266384 () Bool)

(assert (=> b!324581 (=> (not res!266384) (not e!233974))))

(assert (=> b!324581 (= res!266384 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447078))))

(declare-fun b!324582 () Bool)

(declare-fun lt!447079 () (_ BitVec 64))

(assert (=> b!324582 (= e!233974 (bvsle lt!447078 (bvmul lt!447079 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324582 (or (= lt!447079 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447079 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447079)))))

(assert (=> b!324582 (= lt!447079 ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877))))))

(assert (= (and d!106720 res!266385) b!324581))

(assert (= (and b!324581 res!266384) b!324582))

(assert (=> d!106720 m!462639))

(declare-fun m!462681 () Bool)

(assert (=> d!106720 m!462681))

(assert (=> b!324537 d!106720))

(declare-fun d!106736 () Bool)

(declare-fun e!233975 () Bool)

(assert (=> d!106736 e!233975))

(declare-fun res!266387 () Bool)

(assert (=> d!106736 (=> (not res!266387) (not e!233975))))

(declare-fun lt!447083 () (_ BitVec 64))

(declare-fun lt!447084 () (_ BitVec 64))

(declare-fun lt!447086 () (_ BitVec 64))

(assert (=> d!106736 (= res!266387 (= lt!447084 (bvsub lt!447086 lt!447083)))))

(assert (=> d!106736 (or (= (bvand lt!447086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447083 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447086 lt!447083) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106736 (= lt!447083 (remainingBits!0 ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877))) ((_ sign_extend 32) (currentByte!15186 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15181 thiss!877)))))))

(declare-fun lt!447082 () (_ BitVec 64))

(declare-fun lt!447081 () (_ BitVec 64))

(assert (=> d!106736 (= lt!447086 (bvmul lt!447082 lt!447081))))

(assert (=> d!106736 (or (= lt!447082 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447081 (bvsdiv (bvmul lt!447082 lt!447081) lt!447082)))))

(assert (=> d!106736 (= lt!447081 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106736 (= lt!447082 ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877))))))

(assert (=> d!106736 (= lt!447084 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15186 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15181 thiss!877)))))))

(assert (=> d!106736 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15181 thiss!877)) (currentByte!15186 thiss!877) (size!9070 (buf!8212 thiss!877)))))

(assert (=> d!106736 (= (bitIndex!0 (size!9070 (buf!8212 thiss!877)) (currentByte!15186 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15181 thiss!877))) lt!447084)))

(declare-fun b!324583 () Bool)

(declare-fun res!266386 () Bool)

(assert (=> b!324583 (=> (not res!266386) (not e!233975))))

(assert (=> b!324583 (= res!266386 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447084))))

(declare-fun b!324584 () Bool)

(declare-fun lt!447085 () (_ BitVec 64))

(assert (=> b!324584 (= e!233975 (bvsle lt!447084 (bvmul lt!447085 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324584 (or (= lt!447085 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447085 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447085)))))

(assert (=> b!324584 (= lt!447085 ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877))))))

(assert (= (and d!106736 res!266387) b!324583))

(assert (= (and b!324583 res!266386) b!324584))

(declare-fun m!462683 () Bool)

(assert (=> d!106736 m!462683))

(declare-fun m!462685 () Bool)

(assert (=> d!106736 m!462685))

(assert (=> b!324537 d!106736))

(declare-fun d!106740 () Bool)

(assert (=> d!106740 (= (array_inv!8622 (buf!8212 thiss!877)) (bvsge (size!9070 (buf!8212 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324535 d!106740))

(declare-fun d!106742 () Bool)

(assert (=> d!106742 (= (remainingBits!0 ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877))) ((_ sign_extend 32) (currentByte!15186 thiss!877)) ((_ sign_extend 32) (currentBit!15181 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15186 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15181 thiss!877)))))))

(assert (=> start!72792 d!106742))

(declare-fun d!106744 () Bool)

(assert (=> d!106744 (= (inv!12 thiss!877) (invariant!0 (currentBit!15181 thiss!877) (currentByte!15186 thiss!877) (size!9070 (buf!8212 thiss!877))))))

(declare-fun bs!28111 () Bool)

(assert (= bs!28111 d!106744))

(assert (=> bs!28111 m!462681))

(assert (=> start!72792 d!106744))

(declare-fun d!106746 () Bool)

(assert (=> d!106746 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15181 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15186 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15181 thiss!877))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15181 thiss!877))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15186 thiss!877))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15186 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15181 thiss!877))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15186 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9070 (buf!8212 thiss!877)))))))))))

(assert (=> b!324534 d!106746))

(push 1)

(assert (not d!106736))

(assert (not d!106744))

(assert (not d!106720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

