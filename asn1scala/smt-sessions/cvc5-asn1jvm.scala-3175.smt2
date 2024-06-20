; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72968 () Bool)

(assert start!72968)

(declare-fun b!324856 () Bool)

(declare-fun res!266603 () Bool)

(declare-fun e!234182 () Bool)

(assert (=> b!324856 (=> (not res!266603) (not e!234182))))

(declare-datatypes ((array!20924 0))(
  ( (array!20925 (arr!10183 (Array (_ BitVec 32) (_ BitVec 8))) (size!9091 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14344 0))(
  ( (BitStream!14345 (buf!8233 array!20924) (currentByte!15244 (_ BitVec 32)) (currentBit!15239 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14344)

(assert (=> b!324856 (= res!266603 (bvsge (currentBit!15239 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324859 () Bool)

(declare-fun e!234183 () Bool)

(declare-fun array_inv!8643 (array!20924) Bool)

(assert (=> b!324859 (= e!234183 (array_inv!8643 (buf!8233 thiss!877)))))

(declare-fun b!324858 () Bool)

(assert (=> b!324858 (= e!234182 (and (bvsle ((_ sign_extend 32) (size!9091 (buf!8233 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15244 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15239 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9091 (buf!8233 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15244 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15239 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!324857 () Bool)

(declare-fun res!266604 () Bool)

(assert (=> b!324857 (=> (not res!266604) (not e!234182))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324857 (= res!266604 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9091 (buf!8233 thiss!877)) (currentByte!15244 thiss!877) (currentBit!15239 thiss!877))) (bitIndex!0 (size!9091 (buf!8233 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15244 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun res!266605 () Bool)

(assert (=> start!72968 (=> (not res!266605) (not e!234182))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72968 (= res!266605 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9091 (buf!8233 thiss!877))) ((_ sign_extend 32) (currentByte!15244 thiss!877)) ((_ sign_extend 32) (currentBit!15239 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72968 e!234182))

(declare-fun inv!12 (BitStream!14344) Bool)

(assert (=> start!72968 (and (inv!12 thiss!877) e!234183)))

(assert (= (and start!72968 res!266605) b!324856))

(assert (= (and b!324856 res!266603) b!324857))

(assert (= (and b!324857 res!266604) b!324858))

(assert (= start!72968 b!324859))

(declare-fun m!462907 () Bool)

(assert (=> b!324859 m!462907))

(declare-fun m!462909 () Bool)

(assert (=> b!324857 m!462909))

(declare-fun m!462911 () Bool)

(assert (=> b!324857 m!462911))

(declare-fun m!462913 () Bool)

(assert (=> start!72968 m!462913))

(declare-fun m!462915 () Bool)

(assert (=> start!72968 m!462915))

(push 1)

(assert (not b!324859))

(assert (not start!72968))

(assert (not b!324857))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106896 () Bool)

(assert (=> d!106896 (= (array_inv!8643 (buf!8233 thiss!877)) (bvsge (size!9091 (buf!8233 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324859 d!106896))

(declare-fun d!106898 () Bool)

(assert (=> d!106898 (= (remainingBits!0 ((_ sign_extend 32) (size!9091 (buf!8233 thiss!877))) ((_ sign_extend 32) (currentByte!15244 thiss!877)) ((_ sign_extend 32) (currentBit!15239 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9091 (buf!8233 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15244 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15239 thiss!877)))))))

(assert (=> start!72968 d!106898))

(declare-fun d!106900 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106900 (= (inv!12 thiss!877) (invariant!0 (currentBit!15239 thiss!877) (currentByte!15244 thiss!877) (size!9091 (buf!8233 thiss!877))))))

(declare-fun bs!28146 () Bool)

(assert (= bs!28146 d!106900))

(declare-fun m!462939 () Bool)

(assert (=> bs!28146 m!462939))

(assert (=> start!72968 d!106900))

(declare-fun d!106902 () Bool)

(declare-fun e!234208 () Bool)

(assert (=> d!106902 e!234208))

(declare-fun res!266637 () Bool)

(assert (=> d!106902 (=> (not res!266637) (not e!234208))))

(declare-fun lt!447311 () (_ BitVec 64))

(declare-fun lt!447310 () (_ BitVec 64))

(declare-fun lt!447309 () (_ BitVec 64))

(assert (=> d!106902 (= res!266637 (= lt!447311 (bvsub lt!447309 lt!447310)))))

(assert (=> d!106902 (or (= (bvand lt!447309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447310 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447309 lt!447310) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106902 (= lt!447310 (remainingBits!0 ((_ sign_extend 32) (size!9091 (buf!8233 thiss!877))) ((_ sign_extend 32) (currentByte!15244 thiss!877)) ((_ sign_extend 32) (currentBit!15239 thiss!877))))))

(declare-fun lt!447313 () (_ BitVec 64))

(declare-fun lt!447314 () (_ BitVec 64))

(assert (=> d!106902 (= lt!447309 (bvmul lt!447313 lt!447314))))

(assert (=> d!106902 (or (= lt!447313 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447314 (bvsdiv (bvmul lt!447313 lt!447314) lt!447313)))))

(assert (=> d!106902 (= lt!447314 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106902 (= lt!447313 ((_ sign_extend 32) (size!9091 (buf!8233 thiss!877))))))

(assert (=> d!106902 (= lt!447311 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15244 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15239 thiss!877))))))

(assert (=> d!106902 (invariant!0 (currentBit!15239 thiss!877) (currentByte!15244 thiss!877) (size!9091 (buf!8233 thiss!877)))))

(assert (=> d!106902 (= (bitIndex!0 (size!9091 (buf!8233 thiss!877)) (currentByte!15244 thiss!877) (currentBit!15239 thiss!877)) lt!447311)))

(declare-fun b!324896 () Bool)

(declare-fun res!266636 () Bool)

(assert (=> b!324896 (=> (not res!266636) (not e!234208))))

(assert (=> b!324896 (= res!266636 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447311))))

(declare-fun b!324897 () Bool)

(declare-fun lt!447312 () (_ BitVec 64))

(assert (=> b!324897 (= e!234208 (bvsle lt!447311 (bvmul lt!447312 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324897 (or (= lt!447312 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447312 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447312)))))

(assert (=> b!324897 (= lt!447312 ((_ sign_extend 32) (size!9091 (buf!8233 thiss!877))))))

(assert (= (and d!106902 res!266637) b!324896))

(assert (= (and b!324896 res!266636) b!324897))

(assert (=> d!106902 m!462913))

(assert (=> d!106902 m!462939))

(assert (=> b!324857 d!106902))

(declare-fun d!106910 () Bool)

(declare-fun e!234209 () Bool)

(assert (=> d!106910 e!234209))

(declare-fun res!266639 () Bool)

(assert (=> d!106910 (=> (not res!266639) (not e!234209))))

(declare-fun lt!447316 () (_ BitVec 64))

(declare-fun lt!447315 () (_ BitVec 64))

(declare-fun lt!447317 () (_ BitVec 64))

(assert (=> d!106910 (= res!266639 (= lt!447317 (bvsub lt!447315 lt!447316)))))

(assert (=> d!106910 (or (= (bvand lt!447315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447315 lt!447316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106910 (= lt!447316 (remainingBits!0 ((_ sign_extend 32) (size!9091 (buf!8233 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15244 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!447319 () (_ BitVec 64))

(declare-fun lt!447320 () (_ BitVec 64))

(assert (=> d!106910 (= lt!447315 (bvmul lt!447319 lt!447320))))

(assert (=> d!106910 (or (= lt!447319 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447320 (bvsdiv (bvmul lt!447319 lt!447320) lt!447319)))))

(assert (=> d!106910 (= lt!447320 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106910 (= lt!447319 ((_ sign_extend 32) (size!9091 (buf!8233 thiss!877))))))

(assert (=> d!106910 (= lt!447317 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15244 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!106910 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15244 thiss!877)) (size!9091 (buf!8233 thiss!877)))))

(assert (=> d!106910 (= (bitIndex!0 (size!9091 (buf!8233 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15244 thiss!877)) #b00000000000000000000000000000000) lt!447317)))

(declare-fun b!324898 () Bool)

(declare-fun res!266638 () Bool)

(assert (=> b!324898 (=> (not res!266638) (not e!234209))))

(assert (=> b!324898 (= res!266638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447317))))

(declare-fun b!324899 () Bool)

(declare-fun lt!447318 () (_ BitVec 64))

(assert (=> b!324899 (= e!234209 (bvsle lt!447317 (bvmul lt!447318 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324899 (or (= lt!447318 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447318 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447318)))))

(assert (=> b!324899 (= lt!447318 ((_ sign_extend 32) (size!9091 (buf!8233 thiss!877))))))

(assert (= (and d!106910 res!266639) b!324898))

(assert (= (and b!324898 res!266638) b!324899))

(declare-fun m!462945 () Bool)

(assert (=> d!106910 m!462945))

(declare-fun m!462947 () Bool)

(assert (=> d!106910 m!462947))

(assert (=> b!324857 d!106910))

(push 1)

(assert (not d!106900))

(assert (not d!106910))

(assert (not d!106902))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

