; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72422 () Bool)

(assert start!72422)

(declare-fun res!265989 () Bool)

(declare-fun e!233520 () Bool)

(assert (=> start!72422 (=> (not res!265989) (not e!233520))))

(declare-datatypes ((array!20758 0))(
  ( (array!20759 (arr!10123 (Array (_ BitVec 32) (_ BitVec 8))) (size!9031 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14224 0))(
  ( (BitStream!14225 (buf!8173 array!20758) (currentByte!15077 (_ BitVec 32)) (currentBit!15072 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14224)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72422 (= res!265989 (validate_offset_bit!0 ((_ sign_extend 32) (size!9031 (buf!8173 thiss!1702))) ((_ sign_extend 32) (currentByte!15077 thiss!1702)) ((_ sign_extend 32) (currentBit!15072 thiss!1702))))))

(assert (=> start!72422 e!233520))

(declare-fun e!233517 () Bool)

(declare-fun inv!12 (BitStream!14224) Bool)

(assert (=> start!72422 (and (inv!12 thiss!1702) e!233517)))

(declare-fun b!324062 () Bool)

(declare-fun e!233518 () Bool)

(assert (=> b!324062 (= e!233520 e!233518)))

(declare-fun res!265990 () Bool)

(assert (=> b!324062 (=> (not res!265990) (not e!233518))))

(declare-datatypes ((Unit!22056 0))(
  ( (Unit!22057) )
))
(declare-datatypes ((tuple2!23744 0))(
  ( (tuple2!23745 (_1!13501 Unit!22056) (_2!13501 BitStream!14224)) )
))
(declare-fun lt!446555 () tuple2!23744)

(assert (=> b!324062 (= res!265990 (= (buf!8173 (_2!13501 lt!446555)) (buf!8173 thiss!1702)))))

(declare-fun increaseBitIndex!0 (BitStream!14224) tuple2!23744)

(assert (=> b!324062 (= lt!446555 (increaseBitIndex!0 thiss!1702))))

(declare-fun b!324063 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324063 (= e!233518 (not (invariant!0 (currentBit!15072 (_2!13501 lt!446555)) (currentByte!15077 (_2!13501 lt!446555)) (size!9031 (buf!8173 (_2!13501 lt!446555))))))))

(declare-fun b!324064 () Bool)

(declare-fun array_inv!8583 (array!20758) Bool)

(assert (=> b!324064 (= e!233517 (array_inv!8583 (buf!8173 thiss!1702)))))

(assert (= (and start!72422 res!265989) b!324062))

(assert (= (and b!324062 res!265990) b!324063))

(assert (= start!72422 b!324064))

(declare-fun m!462149 () Bool)

(assert (=> start!72422 m!462149))

(declare-fun m!462151 () Bool)

(assert (=> start!72422 m!462151))

(declare-fun m!462153 () Bool)

(assert (=> b!324062 m!462153))

(declare-fun m!462155 () Bool)

(assert (=> b!324063 m!462155))

(declare-fun m!462157 () Bool)

(assert (=> b!324064 m!462157))

(push 1)

(assert (not b!324063))

(assert (not b!324064))

(assert (not start!72422))

(assert (not b!324062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106360 () Bool)

(assert (=> d!106360 (= (invariant!0 (currentBit!15072 (_2!13501 lt!446555)) (currentByte!15077 (_2!13501 lt!446555)) (size!9031 (buf!8173 (_2!13501 lt!446555)))) (and (bvsge (currentBit!15072 (_2!13501 lt!446555)) #b00000000000000000000000000000000) (bvslt (currentBit!15072 (_2!13501 lt!446555)) #b00000000000000000000000000001000) (bvsge (currentByte!15077 (_2!13501 lt!446555)) #b00000000000000000000000000000000) (or (bvslt (currentByte!15077 (_2!13501 lt!446555)) (size!9031 (buf!8173 (_2!13501 lt!446555)))) (and (= (currentBit!15072 (_2!13501 lt!446555)) #b00000000000000000000000000000000) (= (currentByte!15077 (_2!13501 lt!446555)) (size!9031 (buf!8173 (_2!13501 lt!446555))))))))))

(assert (=> b!324063 d!106360))

(declare-fun d!106370 () Bool)

(assert (=> d!106370 (= (array_inv!8583 (buf!8173 thiss!1702)) (bvsge (size!9031 (buf!8173 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324064 d!106370))

(declare-fun d!106372 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106372 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9031 (buf!8173 thiss!1702))) ((_ sign_extend 32) (currentByte!15077 thiss!1702)) ((_ sign_extend 32) (currentBit!15072 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9031 (buf!8173 thiss!1702))) ((_ sign_extend 32) (currentByte!15077 thiss!1702)) ((_ sign_extend 32) (currentBit!15072 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28023 () Bool)

(assert (= bs!28023 d!106372))

(declare-fun m!462183 () Bool)

(assert (=> bs!28023 m!462183))

(assert (=> start!72422 d!106372))

(declare-fun d!106376 () Bool)

(assert (=> d!106376 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15072 thiss!1702) (currentByte!15077 thiss!1702) (size!9031 (buf!8173 thiss!1702))))))

(declare-fun bs!28025 () Bool)

(assert (= bs!28025 d!106376))

(declare-fun m!462187 () Bool)

(assert (=> bs!28025 m!462187))

(assert (=> start!72422 d!106376))

(declare-fun d!106380 () Bool)

(declare-fun e!233552 () Bool)

(assert (=> d!106380 e!233552))

(declare-fun res!266018 () Bool)

(assert (=> d!106380 (=> (not res!266018) (not e!233552))))

(declare-fun lt!446597 () (_ BitVec 64))

(declare-fun lt!446598 () (_ BitVec 64))

(declare-fun lt!446601 () tuple2!23744)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!106380 (= res!266018 (= (bvadd lt!446597 lt!446598) (bitIndex!0 (size!9031 (buf!8173 (_2!13501 lt!446601))) (currentByte!15077 (_2!13501 lt!446601)) (currentBit!15072 (_2!13501 lt!446601)))))))

(assert (=> d!106380 (or (not (= (bvand lt!446597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446598 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446597 lt!446598) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106380 (= lt!446598 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106380 (= lt!446597 (bitIndex!0 (size!9031 (buf!8173 thiss!1702)) (currentByte!15077 thiss!1702) (currentBit!15072 thiss!1702)))))

(declare-fun Unit!22062 () Unit!22056)

(declare-fun Unit!22064 () Unit!22056)

(assert (=> d!106380 (= lt!446601 (ite (bvslt (currentBit!15072 thiss!1702) #b00000000000000000000000000000111) (tuple2!23745 Unit!22062 (BitStream!14225 (buf!8173 thiss!1702) (currentByte!15077 thiss!1702) (bvadd (currentBit!15072 thiss!1702) #b00000000000000000000000000000001))) (tuple2!23745 Unit!22064 (BitStream!14225 (buf!8173 thiss!1702) (bvadd (currentByte!15077 thiss!1702) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!106380 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9031 (buf!8173 thiss!1702))) ((_ sign_extend 32) (currentByte!15077 thiss!1702)) ((_ sign_extend 32) (currentBit!15072 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!106380 (= (increaseBitIndex!0 thiss!1702) lt!446601)))

(declare-fun b!324097 () Bool)

(declare-fun res!266017 () Bool)

(assert (=> b!324097 (=> (not res!266017) (not e!233552))))

(declare-fun lt!446600 () (_ BitVec 64))

(declare-fun lt!446599 () (_ BitVec 64))

(assert (=> b!324097 (= res!266017 (= (bvsub lt!446600 lt!446599) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!324097 (or (= (bvand lt!446600 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446599 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446600 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446600 lt!446599) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!324097 (= lt!446599 (remainingBits!0 ((_ sign_extend 32) (size!9031 (buf!8173 (_2!13501 lt!446601)))) ((_ sign_extend 32) (currentByte!15077 (_2!13501 lt!446601))) ((_ sign_extend 32) (currentBit!15072 (_2!13501 lt!446601)))))))

(assert (=> b!324097 (= lt!446600 (remainingBits!0 ((_ sign_extend 32) (size!9031 (buf!8173 thiss!1702))) ((_ sign_extend 32) (currentByte!15077 thiss!1702)) ((_ sign_extend 32) (currentBit!15072 thiss!1702))))))

(declare-fun b!324098 () Bool)

(assert (=> b!324098 (= e!233552 (= (size!9031 (buf!8173 thiss!1702)) (size!9031 (buf!8173 (_2!13501 lt!446601)))))))

(assert (= (and d!106380 res!266018) b!324097))

(assert (= (and b!324097 res!266017) b!324098))

(declare-fun m!462197 () Bool)

(assert (=> d!106380 m!462197))

(declare-fun m!462199 () Bool)

(assert (=> d!106380 m!462199))

(assert (=> d!106380 m!462183))

(declare-fun m!462201 () Bool)

(assert (=> b!324097 m!462201))

(assert (=> b!324097 m!462183))

(assert (=> b!324062 d!106380))

(push 1)

(assert (not d!106380))

(assert (not b!324097))

(assert (not d!106372))

(assert (not d!106376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106396 () Bool)

(declare-fun e!233560 () Bool)

(assert (=> d!106396 e!233560))

(declare-fun res!266034 () Bool)

(assert (=> d!106396 (=> (not res!266034) (not e!233560))))

(declare-fun lt!446644 () (_ BitVec 64))

(declare-fun lt!446648 () (_ BitVec 64))

(declare-fun lt!446645 () (_ BitVec 64))

(assert (=> d!106396 (= res!266034 (= lt!446644 (bvsub lt!446648 lt!446645)))))

(assert (=> d!106396 (or (= (bvand lt!446648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446645 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446648 lt!446645) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106396 (= lt!446645 (remainingBits!0 ((_ sign_extend 32) (size!9031 (buf!8173 (_2!13501 lt!446601)))) ((_ sign_extend 32) (currentByte!15077 (_2!13501 lt!446601))) ((_ sign_extend 32) (currentBit!15072 (_2!13501 lt!446601)))))))

(declare-fun lt!446646 () (_ BitVec 64))

(declare-fun lt!446643 () (_ BitVec 64))

(assert (=> d!106396 (= lt!446648 (bvmul lt!446646 lt!446643))))

(assert (=> d!106396 (or (= lt!446646 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446643 (bvsdiv (bvmul lt!446646 lt!446643) lt!446646)))))

(assert (=> d!106396 (= lt!446643 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106396 (= lt!446646 ((_ sign_extend 32) (size!9031 (buf!8173 (_2!13501 lt!446601)))))))

(assert (=> d!106396 (= lt!446644 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15077 (_2!13501 lt!446601))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15072 (_2!13501 lt!446601)))))))

(assert (=> d!106396 (invariant!0 (currentBit!15072 (_2!13501 lt!446601)) (currentByte!15077 (_2!13501 lt!446601)) (size!9031 (buf!8173 (_2!13501 lt!446601))))))

(assert (=> d!106396 (= (bitIndex!0 (size!9031 (buf!8173 (_2!13501 lt!446601))) (currentByte!15077 (_2!13501 lt!446601)) (currentBit!15072 (_2!13501 lt!446601))) lt!446644)))

(declare-fun b!324113 () Bool)

(declare-fun res!266033 () Bool)

(assert (=> b!324113 (=> (not res!266033) (not e!233560))))

(assert (=> b!324113 (= res!266033 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446644))))

(declare-fun b!324114 () Bool)

(declare-fun lt!446647 () (_ BitVec 64))

(assert (=> b!324114 (= e!233560 (bvsle lt!446644 (bvmul lt!446647 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324114 (or (= lt!446647 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446647 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446647)))))

(assert (=> b!324114 (= lt!446647 ((_ sign_extend 32) (size!9031 (buf!8173 (_2!13501 lt!446601)))))))

(assert (= (and d!106396 res!266034) b!324113))

(assert (= (and b!324113 res!266033) b!324114))

(assert (=> d!106396 m!462201))

(declare-fun m!462211 () Bool)

(assert (=> d!106396 m!462211))

(assert (=> d!106380 d!106396))

(declare-fun d!106398 () Bool)

(declare-fun e!233561 () Bool)

(assert (=> d!106398 e!233561))

(declare-fun res!266036 () Bool)

(assert (=> d!106398 (=> (not res!266036) (not e!233561))))

(declare-fun lt!446654 () (_ BitVec 64))

(declare-fun lt!446651 () (_ BitVec 64))

(declare-fun lt!446650 () (_ BitVec 64))

(assert (=> d!106398 (= res!266036 (= lt!446650 (bvsub lt!446654 lt!446651)))))

(assert (=> d!106398 (or (= (bvand lt!446654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446651 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446654 lt!446651) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106398 (= lt!446651 (remainingBits!0 ((_ sign_extend 32) (size!9031 (buf!8173 thiss!1702))) ((_ sign_extend 32) (currentByte!15077 thiss!1702)) ((_ sign_extend 32) (currentBit!15072 thiss!1702))))))

(declare-fun lt!446652 () (_ BitVec 64))

(declare-fun lt!446649 () (_ BitVec 64))

(assert (=> d!106398 (= lt!446654 (bvmul lt!446652 lt!446649))))

(assert (=> d!106398 (or (= lt!446652 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446649 (bvsdiv (bvmul lt!446652 lt!446649) lt!446652)))))

(assert (=> d!106398 (= lt!446649 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106398 (= lt!446652 ((_ sign_extend 32) (size!9031 (buf!8173 thiss!1702))))))

(assert (=> d!106398 (= lt!446650 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15077 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15072 thiss!1702))))))

(assert (=> d!106398 (invariant!0 (currentBit!15072 thiss!1702) (currentByte!15077 thiss!1702) (size!9031 (buf!8173 thiss!1702)))))

(assert (=> d!106398 (= (bitIndex!0 (size!9031 (buf!8173 thiss!1702)) (currentByte!15077 thiss!1702) (currentBit!15072 thiss!1702)) lt!446650)))

(declare-fun b!324115 () Bool)

(declare-fun res!266035 () Bool)

(assert (=> b!324115 (=> (not res!266035) (not e!233561))))

(assert (=> b!324115 (= res!266035 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446650))))

(declare-fun b!324116 () Bool)

(declare-fun lt!446653 () (_ BitVec 64))

(assert (=> b!324116 (= e!233561 (bvsle lt!446650 (bvmul lt!446653 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324116 (or (= lt!446653 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446653 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446653)))))

(assert (=> b!324116 (= lt!446653 ((_ sign_extend 32) (size!9031 (buf!8173 thiss!1702))))))

(assert (= (and d!106398 res!266036) b!324115))

(assert (= (and b!324115 res!266035) b!324116))

(assert (=> d!106398 m!462183))

(assert (=> d!106398 m!462187))

(assert (=> d!106380 d!106398))

(declare-fun d!106400 () Bool)

(assert (=> d!106400 (= (remainingBits!0 ((_ sign_extend 32) (size!9031 (buf!8173 thiss!1702))) ((_ sign_extend 32) (currentByte!15077 thiss!1702)) ((_ sign_extend 32) (currentBit!15072 thiss!1702))) (bvsub (bvmul ((_ sign_extend 32) (size!9031 (buf!8173 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15077 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15072 thiss!1702)))))))

(assert (=> d!106380 d!106400))

(declare-fun d!106402 () Bool)

(assert (=> d!106402 (= (remainingBits!0 ((_ sign_extend 32) (size!9031 (buf!8173 (_2!13501 lt!446601)))) ((_ sign_extend 32) (currentByte!15077 (_2!13501 lt!446601))) ((_ sign_extend 32) (currentBit!15072 (_2!13501 lt!446601)))) (bvsub (bvmul ((_ sign_extend 32) (size!9031 (buf!8173 (_2!13501 lt!446601)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15077 (_2!13501 lt!446601))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15072 (_2!13501 lt!446601))))))))

(assert (=> b!324097 d!106402))

(assert (=> b!324097 d!106400))

(assert (=> d!106372 d!106400))

(declare-fun d!106404 () Bool)

(assert (=> d!106404 (= (invariant!0 (currentBit!15072 thiss!1702) (currentByte!15077 thiss!1702) (size!9031 (buf!8173 thiss!1702))) (and (bvsge (currentBit!15072 thiss!1702) #b00000000000000000000000000000000) (bvslt (currentBit!15072 thiss!1702) #b00000000000000000000000000001000) (bvsge (currentByte!15077 thiss!1702) #b00000000000000000000000000000000) (or (bvslt (currentByte!15077 thiss!1702) (size!9031 (buf!8173 thiss!1702))) (and (= (currentBit!15072 thiss!1702) #b00000000000000000000000000000000) (= (currentByte!15077 thiss!1702) (size!9031 (buf!8173 thiss!1702)))))))))

(assert (=> d!106376 d!106404))

(push 1)

(assert (not d!106398))

(assert (not d!106396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

