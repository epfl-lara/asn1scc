; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72870 () Bool)

(assert start!72870)

(declare-fun b!324729 () Bool)

(declare-fun e!234081 () Bool)

(declare-fun lt!447200 () (_ BitVec 64))

(declare-datatypes ((array!20895 0))(
  ( (array!20896 (arr!10173 (Array (_ BitVec 32) (_ BitVec 8))) (size!9081 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14324 0))(
  ( (BitStream!14325 (buf!8223 array!20895) (currentByte!15213 (_ BitVec 32)) (currentBit!15208 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14324)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324729 (= e!234081 (not (invariant!0 ((_ extract 31 0) lt!447200) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15213 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877)))))))))

(declare-fun b!324730 () Bool)

(declare-fun e!234078 () Bool)

(declare-fun array_inv!8633 (array!20895) Bool)

(assert (=> b!324730 (= e!234078 (array_inv!8633 (buf!8223 thiss!877)))))

(declare-fun b!324731 () Bool)

(declare-fun e!234079 () Bool)

(assert (=> b!324731 (= e!234079 e!234081)))

(declare-fun res!266508 () Bool)

(assert (=> b!324731 (=> (not res!266508) (not e!234081))))

(assert (=> b!324731 (= res!266508 (and (bvsle ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15213 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle lt!447200 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15213 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge lt!447200 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!324731 (= lt!447200 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15208 thiss!877))))))

(declare-fun b!324733 () Bool)

(declare-fun res!266506 () Bool)

(assert (=> b!324733 (=> (not res!266506) (not e!234079))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324733 (= res!266506 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9081 (buf!8223 thiss!877)) (currentByte!15213 thiss!877) (currentBit!15208 thiss!877))) (bitIndex!0 (size!9081 (buf!8223 thiss!877)) (currentByte!15213 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15208 thiss!877)))))))

(declare-fun res!266509 () Bool)

(assert (=> start!72870 (=> (not res!266509) (not e!234079))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72870 (= res!266509 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877))) ((_ sign_extend 32) (currentByte!15213 thiss!877)) ((_ sign_extend 32) (currentBit!15208 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72870 e!234079))

(declare-fun inv!12 (BitStream!14324) Bool)

(assert (=> start!72870 (and (inv!12 thiss!877) e!234078)))

(declare-fun b!324732 () Bool)

(declare-fun res!266507 () Bool)

(assert (=> b!324732 (=> (not res!266507) (not e!234079))))

(assert (=> b!324732 (= res!266507 (bvslt (currentBit!15208 thiss!877) #b00000000000000000000000000000111))))

(assert (= (and start!72870 res!266509) b!324732))

(assert (= (and b!324732 res!266507) b!324733))

(assert (= (and b!324733 res!266506) b!324731))

(assert (= (and b!324731 res!266508) b!324729))

(assert (= start!72870 b!324730))

(declare-fun m!462793 () Bool)

(assert (=> b!324729 m!462793))

(declare-fun m!462795 () Bool)

(assert (=> b!324730 m!462795))

(declare-fun m!462797 () Bool)

(assert (=> b!324733 m!462797))

(declare-fun m!462799 () Bool)

(assert (=> b!324733 m!462799))

(declare-fun m!462801 () Bool)

(assert (=> start!72870 m!462801))

(declare-fun m!462803 () Bool)

(assert (=> start!72870 m!462803))

(push 1)

(assert (not b!324729))

(assert (not b!324733))

(assert (not start!72870))

(assert (not b!324730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106810 () Bool)

(assert (=> d!106810 (= (invariant!0 ((_ extract 31 0) lt!447200) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15213 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877))))) (and (bvsge ((_ extract 31 0) lt!447200) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) lt!447200) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15213 thiss!877))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15213 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877))))) (and (= ((_ extract 31 0) lt!447200) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15213 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877)))))))))))

(assert (=> b!324729 d!106810))

(declare-fun d!106812 () Bool)

(declare-fun e!234092 () Bool)

(assert (=> d!106812 e!234092))

(declare-fun res!266531 () Bool)

(assert (=> d!106812 (=> (not res!266531) (not e!234092))))

(declare-fun lt!447263 () (_ BitVec 64))

(declare-fun lt!447262 () (_ BitVec 64))

(declare-fun lt!447266 () (_ BitVec 64))

(assert (=> d!106812 (= res!266531 (= lt!447263 (bvsub lt!447266 lt!447262)))))

(assert (=> d!106812 (or (= (bvand lt!447266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447262 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447266 lt!447262) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106812 (= lt!447262 (remainingBits!0 ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877))) ((_ sign_extend 32) (currentByte!15213 thiss!877)) ((_ sign_extend 32) (currentBit!15208 thiss!877))))))

(declare-fun lt!447264 () (_ BitVec 64))

(declare-fun lt!447265 () (_ BitVec 64))

(assert (=> d!106812 (= lt!447266 (bvmul lt!447264 lt!447265))))

(assert (=> d!106812 (or (= lt!447264 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447265 (bvsdiv (bvmul lt!447264 lt!447265) lt!447264)))))

(assert (=> d!106812 (= lt!447265 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106812 (= lt!447264 ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877))))))

(assert (=> d!106812 (= lt!447263 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15213 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15208 thiss!877))))))

(assert (=> d!106812 (invariant!0 (currentBit!15208 thiss!877) (currentByte!15213 thiss!877) (size!9081 (buf!8223 thiss!877)))))

(assert (=> d!106812 (= (bitIndex!0 (size!9081 (buf!8223 thiss!877)) (currentByte!15213 thiss!877) (currentBit!15208 thiss!877)) lt!447263)))

(declare-fun b!324754 () Bool)

(declare-fun res!266530 () Bool)

(assert (=> b!324754 (=> (not res!266530) (not e!234092))))

(assert (=> b!324754 (= res!266530 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447263))))

(declare-fun b!324755 () Bool)

(declare-fun lt!447261 () (_ BitVec 64))

(assert (=> b!324755 (= e!234092 (bvsle lt!447263 (bvmul lt!447261 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324755 (or (= lt!447261 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447261 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447261)))))

(assert (=> b!324755 (= lt!447261 ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877))))))

(assert (= (and d!106812 res!266531) b!324754))

(assert (= (and b!324754 res!266530) b!324755))

(assert (=> d!106812 m!462801))

(declare-fun m!462817 () Bool)

(assert (=> d!106812 m!462817))

(assert (=> b!324733 d!106812))

(declare-fun d!106820 () Bool)

(declare-fun e!234093 () Bool)

(assert (=> d!106820 e!234093))

(declare-fun res!266533 () Bool)

(assert (=> d!106820 (=> (not res!266533) (not e!234093))))

(declare-fun lt!447272 () (_ BitVec 64))

(declare-fun lt!447268 () (_ BitVec 64))

(declare-fun lt!447269 () (_ BitVec 64))

(assert (=> d!106820 (= res!266533 (= lt!447269 (bvsub lt!447272 lt!447268)))))

(assert (=> d!106820 (or (= (bvand lt!447272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447268 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447272 lt!447268) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106820 (= lt!447268 (remainingBits!0 ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877))) ((_ sign_extend 32) (currentByte!15213 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15208 thiss!877)))))))

(declare-fun lt!447270 () (_ BitVec 64))

(declare-fun lt!447271 () (_ BitVec 64))

(assert (=> d!106820 (= lt!447272 (bvmul lt!447270 lt!447271))))

(assert (=> d!106820 (or (= lt!447270 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447271 (bvsdiv (bvmul lt!447270 lt!447271) lt!447270)))))

(assert (=> d!106820 (= lt!447271 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106820 (= lt!447270 ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877))))))

(assert (=> d!106820 (= lt!447269 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15213 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15208 thiss!877)))))))

(assert (=> d!106820 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15208 thiss!877)) (currentByte!15213 thiss!877) (size!9081 (buf!8223 thiss!877)))))

(assert (=> d!106820 (= (bitIndex!0 (size!9081 (buf!8223 thiss!877)) (currentByte!15213 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15208 thiss!877))) lt!447269)))

(declare-fun b!324756 () Bool)

(declare-fun res!266532 () Bool)

(assert (=> b!324756 (=> (not res!266532) (not e!234093))))

(assert (=> b!324756 (= res!266532 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447269))))

(declare-fun b!324757 () Bool)

(declare-fun lt!447267 () (_ BitVec 64))

(assert (=> b!324757 (= e!234093 (bvsle lt!447269 (bvmul lt!447267 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324757 (or (= lt!447267 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447267 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447267)))))

(assert (=> b!324757 (= lt!447267 ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877))))))

(assert (= (and d!106820 res!266533) b!324756))

(assert (= (and b!324756 res!266532) b!324757))

(declare-fun m!462819 () Bool)

(assert (=> d!106820 m!462819))

(declare-fun m!462821 () Bool)

(assert (=> d!106820 m!462821))

(assert (=> b!324733 d!106820))

(declare-fun d!106822 () Bool)

(assert (=> d!106822 (= (remainingBits!0 ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877))) ((_ sign_extend 32) (currentByte!15213 thiss!877)) ((_ sign_extend 32) (currentBit!15208 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9081 (buf!8223 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15213 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15208 thiss!877)))))))

(assert (=> start!72870 d!106822))

