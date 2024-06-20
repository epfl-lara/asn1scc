; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72834 () Bool)

(assert start!72834)

(declare-fun b!324639 () Bool)

(declare-fun e!234013 () Bool)

(declare-datatypes ((array!20882 0))(
  ( (array!20883 (arr!10168 (Array (_ BitVec 32) (_ BitVec 8))) (size!9076 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14314 0))(
  ( (BitStream!14315 (buf!8218 array!20882) (currentByte!15201 (_ BitVec 32)) (currentBit!15196 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14314)

(declare-fun lt!447113 () (_ BitVec 64))

(assert (=> b!324639 (= e!234013 (and (bvsle ((_ sign_extend 32) (size!9076 (buf!8218 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15201 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle lt!447113 #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9076 (buf!8218 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15201 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt lt!447113 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!324639 (= lt!447113 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15196 thiss!877))))))

(declare-fun b!324638 () Bool)

(declare-fun res!266431 () Bool)

(assert (=> b!324638 (=> (not res!266431) (not e!234013))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324638 (= res!266431 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9076 (buf!8218 thiss!877)) (currentByte!15201 thiss!877) (currentBit!15196 thiss!877))) (bitIndex!0 (size!9076 (buf!8218 thiss!877)) (currentByte!15201 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15196 thiss!877)))))))

(declare-fun res!266429 () Bool)

(assert (=> start!72834 (=> (not res!266429) (not e!234013))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72834 (= res!266429 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9076 (buf!8218 thiss!877))) ((_ sign_extend 32) (currentByte!15201 thiss!877)) ((_ sign_extend 32) (currentBit!15196 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72834 e!234013))

(declare-fun e!234015 () Bool)

(declare-fun inv!12 (BitStream!14314) Bool)

(assert (=> start!72834 (and (inv!12 thiss!877) e!234015)))

(declare-fun b!324637 () Bool)

(declare-fun res!266430 () Bool)

(assert (=> b!324637 (=> (not res!266430) (not e!234013))))

(assert (=> b!324637 (= res!266430 (bvslt (currentBit!15196 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324640 () Bool)

(declare-fun array_inv!8628 (array!20882) Bool)

(assert (=> b!324640 (= e!234015 (array_inv!8628 (buf!8218 thiss!877)))))

(assert (= (and start!72834 res!266429) b!324637))

(assert (= (and b!324637 res!266430) b!324638))

(assert (= (and b!324638 res!266431) b!324639))

(assert (= start!72834 b!324640))

(declare-fun m!462721 () Bool)

(assert (=> b!324638 m!462721))

(declare-fun m!462723 () Bool)

(assert (=> b!324638 m!462723))

(declare-fun m!462725 () Bool)

(assert (=> start!72834 m!462725))

(declare-fun m!462727 () Bool)

(assert (=> start!72834 m!462727))

(declare-fun m!462729 () Bool)

(assert (=> b!324640 m!462729))

(push 1)

(assert (not b!324640))

(assert (not start!72834))

(assert (not b!324638))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106760 () Bool)

(assert (=> d!106760 (= (array_inv!8628 (buf!8218 thiss!877)) (bvsge (size!9076 (buf!8218 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324640 d!106760))

(declare-fun d!106762 () Bool)

(assert (=> d!106762 (= (remainingBits!0 ((_ sign_extend 32) (size!9076 (buf!8218 thiss!877))) ((_ sign_extend 32) (currentByte!15201 thiss!877)) ((_ sign_extend 32) (currentBit!15196 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9076 (buf!8218 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15201 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15196 thiss!877)))))))

(assert (=> start!72834 d!106762))

(declare-fun d!106764 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106764 (= (inv!12 thiss!877) (invariant!0 (currentBit!15196 thiss!877) (currentByte!15201 thiss!877) (size!9076 (buf!8218 thiss!877))))))

(declare-fun bs!28119 () Bool)

(assert (= bs!28119 d!106764))

(declare-fun m!462753 () Bool)

(assert (=> bs!28119 m!462753))

(assert (=> start!72834 d!106764))

(declare-fun d!106768 () Bool)

(declare-fun e!234040 () Bool)

(assert (=> d!106768 e!234040))

(declare-fun res!266463 () Bool)

(assert (=> d!106768 (=> (not res!266463) (not e!234040))))

(declare-fun lt!447160 () (_ BitVec 64))

(declare-fun lt!447157 () (_ BitVec 64))

(declare-fun lt!447161 () (_ BitVec 64))

(assert (=> d!106768 (= res!266463 (= lt!447160 (bvsub lt!447157 lt!447161)))))

(assert (=> d!106768 (or (= (bvand lt!447157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447161 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447157 lt!447161) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106768 (= lt!447161 (remainingBits!0 ((_ sign_extend 32) (size!9076 (buf!8218 thiss!877))) ((_ sign_extend 32) (currentByte!15201 thiss!877)) ((_ sign_extend 32) (currentBit!15196 thiss!877))))))

(declare-fun lt!447159 () (_ BitVec 64))

(declare-fun lt!447158 () (_ BitVec 64))

(assert (=> d!106768 (= lt!447157 (bvmul lt!447159 lt!447158))))

(assert (=> d!106768 (or (= lt!447159 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447158 (bvsdiv (bvmul lt!447159 lt!447158) lt!447159)))))

(assert (=> d!106768 (= lt!447158 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106768 (= lt!447159 ((_ sign_extend 32) (size!9076 (buf!8218 thiss!877))))))

(assert (=> d!106768 (= lt!447160 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15201 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15196 thiss!877))))))

(assert (=> d!106768 (invariant!0 (currentBit!15196 thiss!877) (currentByte!15201 thiss!877) (size!9076 (buf!8218 thiss!877)))))

(assert (=> d!106768 (= (bitIndex!0 (size!9076 (buf!8218 thiss!877)) (currentByte!15201 thiss!877) (currentBit!15196 thiss!877)) lt!447160)))

(declare-fun b!324677 () Bool)

(declare-fun res!266462 () Bool)

(assert (=> b!324677 (=> (not res!266462) (not e!234040))))

(assert (=> b!324677 (= res!266462 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447160))))

(declare-fun b!324678 () Bool)

(declare-fun lt!447156 () (_ BitVec 64))

(assert (=> b!324678 (= e!234040 (bvsle lt!447160 (bvmul lt!447156 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324678 (or (= lt!447156 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447156 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447156)))))

(assert (=> b!324678 (= lt!447156 ((_ sign_extend 32) (size!9076 (buf!8218 thiss!877))))))

(assert (= (and d!106768 res!266463) b!324677))

(assert (= (and b!324677 res!266462) b!324678))

(assert (=> d!106768 m!462725))

(assert (=> d!106768 m!462753))

(assert (=> b!324638 d!106768))

(declare-fun d!106776 () Bool)

(declare-fun e!234041 () Bool)

(assert (=> d!106776 e!234041))

(declare-fun res!266465 () Bool)

(assert (=> d!106776 (=> (not res!266465) (not e!234041))))

(declare-fun lt!447163 () (_ BitVec 64))

(declare-fun lt!447167 () (_ BitVec 64))

(declare-fun lt!447166 () (_ BitVec 64))

(assert (=> d!106776 (= res!266465 (= lt!447166 (bvsub lt!447163 lt!447167)))))

(assert (=> d!106776 (or (= (bvand lt!447163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447167 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447163 lt!447167) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106776 (= lt!447167 (remainingBits!0 ((_ sign_extend 32) (size!9076 (buf!8218 thiss!877))) ((_ sign_extend 32) (currentByte!15201 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15196 thiss!877)))))))

(declare-fun lt!447165 () (_ BitVec 64))

(declare-fun lt!447164 () (_ BitVec 64))

(assert (=> d!106776 (= lt!447163 (bvmul lt!447165 lt!447164))))

(assert (=> d!106776 (or (= lt!447165 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447164 (bvsdiv (bvmul lt!447165 lt!447164) lt!447165)))))

(assert (=> d!106776 (= lt!447164 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106776 (= lt!447165 ((_ sign_extend 32) (size!9076 (buf!8218 thiss!877))))))

(assert (=> d!106776 (= lt!447166 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15201 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15196 thiss!877)))))))

(assert (=> d!106776 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15196 thiss!877)) (currentByte!15201 thiss!877) (size!9076 (buf!8218 thiss!877)))))

(assert (=> d!106776 (= (bitIndex!0 (size!9076 (buf!8218 thiss!877)) (currentByte!15201 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15196 thiss!877))) lt!447166)))

(declare-fun b!324679 () Bool)

(declare-fun res!266464 () Bool)

(assert (=> b!324679 (=> (not res!266464) (not e!234041))))

(assert (=> b!324679 (= res!266464 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447166))))

(declare-fun b!324680 () Bool)

(declare-fun lt!447162 () (_ BitVec 64))

(assert (=> b!324680 (= e!234041 (bvsle lt!447166 (bvmul lt!447162 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324680 (or (= lt!447162 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447162 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447162)))))

(assert (=> b!324680 (= lt!447162 ((_ sign_extend 32) (size!9076 (buf!8218 thiss!877))))))

(assert (= (and d!106776 res!266465) b!324679))

(assert (= (and b!324679 res!266464) b!324680))

(declare-fun m!462759 () Bool)

(assert (=> d!106776 m!462759))

(declare-fun m!462761 () Bool)

(assert (=> d!106776 m!462761))

(assert (=> b!324638 d!106776))

(push 1)

(assert (not d!106776))

(assert (not d!106768))

(assert (not d!106764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

