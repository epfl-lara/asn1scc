; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72866 () Bool)

(assert start!72866)

(declare-fun b!324699 () Bool)

(declare-fun e!234056 () Bool)

(declare-fun e!234055 () Bool)

(assert (=> b!324699 (= e!234056 e!234055)))

(declare-fun res!266482 () Bool)

(assert (=> b!324699 (=> (not res!266482) (not e!234055))))

(declare-datatypes ((array!20891 0))(
  ( (array!20892 (arr!10171 (Array (_ BitVec 32) (_ BitVec 8))) (size!9079 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14320 0))(
  ( (BitStream!14321 (buf!8221 array!20891) (currentByte!15211 (_ BitVec 32)) (currentBit!15206 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14320)

(declare-fun lt!447194 () (_ BitVec 64))

(assert (=> b!324699 (= res!266482 (and (bvsle ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15211 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle lt!447194 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15211 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge lt!447194 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!324699 (= lt!447194 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15206 thiss!877))))))

(declare-fun b!324700 () Bool)

(declare-fun e!234057 () Bool)

(declare-fun array_inv!8631 (array!20891) Bool)

(assert (=> b!324700 (= e!234057 (array_inv!8631 (buf!8221 thiss!877)))))

(declare-fun res!266485 () Bool)

(assert (=> start!72866 (=> (not res!266485) (not e!234056))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72866 (= res!266485 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877))) ((_ sign_extend 32) (currentByte!15211 thiss!877)) ((_ sign_extend 32) (currentBit!15206 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72866 e!234056))

(declare-fun inv!12 (BitStream!14320) Bool)

(assert (=> start!72866 (and (inv!12 thiss!877) e!234057)))

(declare-fun b!324701 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324701 (= e!234055 (not (invariant!0 ((_ extract 31 0) lt!447194) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15211 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877)))))))))

(declare-fun b!324702 () Bool)

(declare-fun res!266484 () Bool)

(assert (=> b!324702 (=> (not res!266484) (not e!234056))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324702 (= res!266484 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9079 (buf!8221 thiss!877)) (currentByte!15211 thiss!877) (currentBit!15206 thiss!877))) (bitIndex!0 (size!9079 (buf!8221 thiss!877)) (currentByte!15211 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15206 thiss!877)))))))

(declare-fun b!324703 () Bool)

(declare-fun res!266483 () Bool)

(assert (=> b!324703 (=> (not res!266483) (not e!234056))))

(assert (=> b!324703 (= res!266483 (bvslt (currentBit!15206 thiss!877) #b00000000000000000000000000000111))))

(assert (= (and start!72866 res!266485) b!324703))

(assert (= (and b!324703 res!266483) b!324702))

(assert (= (and b!324702 res!266484) b!324699))

(assert (= (and b!324699 res!266482) b!324701))

(assert (= start!72866 b!324700))

(declare-fun m!462769 () Bool)

(assert (=> b!324700 m!462769))

(declare-fun m!462771 () Bool)

(assert (=> start!72866 m!462771))

(declare-fun m!462773 () Bool)

(assert (=> start!72866 m!462773))

(declare-fun m!462775 () Bool)

(assert (=> b!324701 m!462775))

(declare-fun m!462777 () Bool)

(assert (=> b!324702 m!462777))

(declare-fun m!462779 () Bool)

(assert (=> b!324702 m!462779))

(push 1)

(assert (not start!72866))

(assert (not b!324702))

(assert (not b!324700))

(assert (not b!324701))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106800 () Bool)

(assert (=> d!106800 (= (remainingBits!0 ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877))) ((_ sign_extend 32) (currentByte!15211 thiss!877)) ((_ sign_extend 32) (currentBit!15206 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15211 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15206 thiss!877)))))))

(assert (=> start!72866 d!106800))

(declare-fun d!106802 () Bool)

(assert (=> d!106802 (= (inv!12 thiss!877) (invariant!0 (currentBit!15206 thiss!877) (currentByte!15211 thiss!877) (size!9079 (buf!8221 thiss!877))))))

(declare-fun bs!28125 () Bool)

(assert (= bs!28125 d!106802))

(declare-fun m!462807 () Bool)

(assert (=> bs!28125 m!462807))

(assert (=> start!72866 d!106802))

(declare-fun d!106804 () Bool)

(declare-fun e!234088 () Bool)

(assert (=> d!106804 e!234088))

(declare-fun res!266523 () Bool)

(assert (=> d!106804 (=> (not res!266523) (not e!234088))))

(declare-fun lt!447239 () (_ BitVec 64))

(declare-fun lt!447241 () (_ BitVec 64))

(declare-fun lt!447237 () (_ BitVec 64))

(assert (=> d!106804 (= res!266523 (= lt!447241 (bvsub lt!447237 lt!447239)))))

(assert (=> d!106804 (or (= (bvand lt!447237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447239 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447237 lt!447239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106804 (= lt!447239 (remainingBits!0 ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877))) ((_ sign_extend 32) (currentByte!15211 thiss!877)) ((_ sign_extend 32) (currentBit!15206 thiss!877))))))

(declare-fun lt!447240 () (_ BitVec 64))

(declare-fun lt!447242 () (_ BitVec 64))

(assert (=> d!106804 (= lt!447237 (bvmul lt!447240 lt!447242))))

(assert (=> d!106804 (or (= lt!447240 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447242 (bvsdiv (bvmul lt!447240 lt!447242) lt!447240)))))

(assert (=> d!106804 (= lt!447242 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106804 (= lt!447240 ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877))))))

(assert (=> d!106804 (= lt!447241 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15211 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15206 thiss!877))))))

(assert (=> d!106804 (invariant!0 (currentBit!15206 thiss!877) (currentByte!15211 thiss!877) (size!9079 (buf!8221 thiss!877)))))

(assert (=> d!106804 (= (bitIndex!0 (size!9079 (buf!8221 thiss!877)) (currentByte!15211 thiss!877) (currentBit!15206 thiss!877)) lt!447241)))

(declare-fun b!324746 () Bool)

(declare-fun res!266522 () Bool)

(assert (=> b!324746 (=> (not res!266522) (not e!234088))))

(assert (=> b!324746 (= res!266522 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447241))))

(declare-fun b!324747 () Bool)

(declare-fun lt!447238 () (_ BitVec 64))

(assert (=> b!324747 (= e!234088 (bvsle lt!447241 (bvmul lt!447238 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324747 (or (= lt!447238 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447238 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447238)))))

(assert (=> b!324747 (= lt!447238 ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877))))))

(assert (= (and d!106804 res!266523) b!324746))

(assert (= (and b!324746 res!266522) b!324747))

(assert (=> d!106804 m!462771))

(assert (=> d!106804 m!462807))

(assert (=> b!324702 d!106804))

(declare-fun d!106814 () Bool)

(declare-fun e!234089 () Bool)

(assert (=> d!106814 e!234089))

(declare-fun res!266525 () Bool)

(assert (=> d!106814 (=> (not res!266525) (not e!234089))))

(declare-fun lt!447245 () (_ BitVec 64))

(declare-fun lt!447247 () (_ BitVec 64))

(declare-fun lt!447243 () (_ BitVec 64))

(assert (=> d!106814 (= res!266525 (= lt!447247 (bvsub lt!447243 lt!447245)))))

(assert (=> d!106814 (or (= (bvand lt!447243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447245 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447243 lt!447245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106814 (= lt!447245 (remainingBits!0 ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877))) ((_ sign_extend 32) (currentByte!15211 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15206 thiss!877)))))))

(declare-fun lt!447246 () (_ BitVec 64))

(declare-fun lt!447248 () (_ BitVec 64))

(assert (=> d!106814 (= lt!447243 (bvmul lt!447246 lt!447248))))

(assert (=> d!106814 (or (= lt!447246 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447248 (bvsdiv (bvmul lt!447246 lt!447248) lt!447246)))))

(assert (=> d!106814 (= lt!447248 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106814 (= lt!447246 ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877))))))

(assert (=> d!106814 (= lt!447247 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15211 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15206 thiss!877)))))))

(assert (=> d!106814 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15206 thiss!877)) (currentByte!15211 thiss!877) (size!9079 (buf!8221 thiss!877)))))

(assert (=> d!106814 (= (bitIndex!0 (size!9079 (buf!8221 thiss!877)) (currentByte!15211 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15206 thiss!877))) lt!447247)))

(declare-fun b!324748 () Bool)

(declare-fun res!266524 () Bool)

(assert (=> b!324748 (=> (not res!266524) (not e!234089))))

(assert (=> b!324748 (= res!266524 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447247))))

(declare-fun b!324749 () Bool)

(declare-fun lt!447244 () (_ BitVec 64))

(assert (=> b!324749 (= e!234089 (bvsle lt!447247 (bvmul lt!447244 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324749 (or (= lt!447244 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447244 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447244)))))

(assert (=> b!324749 (= lt!447244 ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877))))))

(assert (= (and d!106814 res!266525) b!324748))

(assert (= (and b!324748 res!266524) b!324749))

(declare-fun m!462813 () Bool)

(assert (=> d!106814 m!462813))

(declare-fun m!462815 () Bool)

(assert (=> d!106814 m!462815))

(assert (=> b!324702 d!106814))

(declare-fun d!106816 () Bool)

(assert (=> d!106816 (= (array_inv!8631 (buf!8221 thiss!877)) (bvsge (size!9079 (buf!8221 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324700 d!106816))

(declare-fun d!106818 () Bool)

(assert (=> d!106818 (= (invariant!0 ((_ extract 31 0) lt!447194) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15211 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877))))) (and (bvsge ((_ extract 31 0) lt!447194) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) lt!447194) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15211 thiss!877))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15211 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877))))) (and (= ((_ extract 31 0) lt!447194) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15211 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9079 (buf!8221 thiss!877)))))))))))

(assert (=> b!324701 d!106818))

(push 1)

(assert (not d!106814))

(assert (not d!106802))

(assert (not d!106804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

