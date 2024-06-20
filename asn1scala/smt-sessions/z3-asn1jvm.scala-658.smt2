; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18486 () Bool)

(assert start!18486)

(declare-fun b!91771 () Bool)

(declare-fun res!75767 () Bool)

(declare-fun e!60335 () Bool)

(assert (=> b!91771 (=> (not res!75767) (not e!60335))))

(declare-datatypes ((array!4292 0))(
  ( (array!4293 (arr!2569 (Array (_ BitVec 32) (_ BitVec 8))) (size!1935 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3426 0))(
  ( (BitStream!3427 (buf!2322 array!4292) (currentByte!4624 (_ BitVec 32)) (currentBit!4619 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3426)

(declare-fun bitStream2!8 () BitStream!3426)

(declare-fun base!8 () BitStream!3426)

(assert (=> b!91771 (= res!75767 (and (= (buf!2322 bitStream1!8) (buf!2322 bitStream2!8)) (= (buf!2322 bitStream1!8) (buf!2322 base!8))))))

(declare-fun b!91772 () Bool)

(declare-fun e!60339 () Bool)

(declare-fun array_inv!1778 (array!4292) Bool)

(assert (=> b!91772 (= e!60339 (array_inv!1778 (buf!2322 bitStream2!8)))))

(declare-fun b!91773 () Bool)

(declare-fun e!60333 () Bool)

(assert (=> b!91773 (= e!60333 (array_inv!1778 (buf!2322 bitStream1!8)))))

(declare-fun b!91774 () Bool)

(declare-fun e!60334 () Bool)

(assert (=> b!91774 (= e!60334 (array_inv!1778 (buf!2322 base!8)))))

(declare-fun b!91775 () Bool)

(declare-fun res!75769 () Bool)

(assert (=> b!91775 (=> (not res!75769) (not e!60335))))

(declare-fun isPrefixOf!0 (BitStream!3426 BitStream!3426) Bool)

(assert (=> b!91775 (= res!75769 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!91776 () Bool)

(declare-fun res!75768 () Bool)

(assert (=> b!91776 (=> (not res!75768) (not e!60335))))

(assert (=> b!91776 (= res!75768 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!91777 () Bool)

(declare-fun res!75770 () Bool)

(assert (=> b!91777 (=> (not res!75770) (not e!60335))))

(assert (=> b!91777 (= res!75770 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!91778 () Bool)

(declare-fun res!75771 () Bool)

(assert (=> b!91778 (=> (not res!75771) (not e!60335))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91778 (= res!75771 (bvslt (bitIndex!0 (size!1935 (buf!2322 base!8)) (currentByte!4624 base!8) (currentBit!4619 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun res!75772 () Bool)

(assert (=> start!18486 (=> (not res!75772) (not e!60335))))

(assert (=> start!18486 (= res!75772 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18486 e!60335))

(assert (=> start!18486 true))

(declare-fun inv!12 (BitStream!3426) Bool)

(assert (=> start!18486 (and (inv!12 bitStream1!8) e!60333)))

(assert (=> start!18486 (and (inv!12 bitStream2!8) e!60339)))

(assert (=> start!18486 (and (inv!12 base!8) e!60334)))

(declare-fun b!91779 () Bool)

(declare-fun res!75766 () Bool)

(assert (=> b!91779 (=> (not res!75766) (not e!60335))))

(declare-datatypes ((List!819 0))(
  ( (Nil!816) (Cons!815 (h!934 Bool) (t!1569 List!819)) )
))
(declare-fun listBits!13 () List!819)

(declare-fun length!410 (List!819) Int)

(assert (=> b!91779 (= res!75766 (> (length!410 listBits!13) 0))))

(declare-fun b!91780 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91780 (= e!60335 (not (invariant!0 (currentBit!4619 bitStream1!8) (currentByte!4624 bitStream1!8) (size!1935 (buf!2322 bitStream1!8)))))))

(assert (= (and start!18486 res!75772) b!91779))

(assert (= (and b!91779 res!75766) b!91775))

(assert (= (and b!91775 res!75769) b!91776))

(assert (= (and b!91776 res!75768) b!91777))

(assert (= (and b!91777 res!75770) b!91771))

(assert (= (and b!91771 res!75767) b!91778))

(assert (= (and b!91778 res!75771) b!91780))

(assert (= start!18486 b!91773))

(assert (= start!18486 b!91772))

(assert (= start!18486 b!91774))

(declare-fun m!135869 () Bool)

(assert (=> b!91772 m!135869))

(declare-fun m!135871 () Bool)

(assert (=> b!91778 m!135871))

(declare-fun m!135873 () Bool)

(assert (=> b!91774 m!135873))

(declare-fun m!135875 () Bool)

(assert (=> b!91773 m!135875))

(declare-fun m!135877 () Bool)

(assert (=> b!91775 m!135877))

(declare-fun m!135879 () Bool)

(assert (=> b!91780 m!135879))

(declare-fun m!135881 () Bool)

(assert (=> start!18486 m!135881))

(declare-fun m!135883 () Bool)

(assert (=> start!18486 m!135883))

(declare-fun m!135885 () Bool)

(assert (=> start!18486 m!135885))

(declare-fun m!135887 () Bool)

(assert (=> b!91776 m!135887))

(declare-fun m!135889 () Bool)

(assert (=> b!91779 m!135889))

(declare-fun m!135891 () Bool)

(assert (=> b!91777 m!135891))

(check-sat (not b!91779) (not b!91775) (not start!18486) (not b!91773) (not b!91778) (not b!91776) (not b!91777) (not b!91774) (not b!91772) (not b!91780))
(check-sat)
(get-model)

(declare-fun d!28550 () Bool)

(declare-fun res!75811 () Bool)

(declare-fun e!60372 () Bool)

(assert (=> d!28550 (=> (not res!75811) (not e!60372))))

(assert (=> d!28550 (= res!75811 (= (size!1935 (buf!2322 bitStream1!8)) (size!1935 (buf!2322 base!8))))))

(assert (=> d!28550 (= (isPrefixOf!0 bitStream1!8 base!8) e!60372)))

(declare-fun b!91826 () Bool)

(declare-fun res!75810 () Bool)

(assert (=> b!91826 (=> (not res!75810) (not e!60372))))

(assert (=> b!91826 (= res!75810 (bvsle (bitIndex!0 (size!1935 (buf!2322 bitStream1!8)) (currentByte!4624 bitStream1!8) (currentBit!4619 bitStream1!8)) (bitIndex!0 (size!1935 (buf!2322 base!8)) (currentByte!4624 base!8) (currentBit!4619 base!8))))))

(declare-fun b!91827 () Bool)

(declare-fun e!60371 () Bool)

(assert (=> b!91827 (= e!60372 e!60371)))

(declare-fun res!75809 () Bool)

(assert (=> b!91827 (=> res!75809 e!60371)))

(assert (=> b!91827 (= res!75809 (= (size!1935 (buf!2322 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!91828 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4292 array!4292 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91828 (= e!60371 (arrayBitRangesEq!0 (buf!2322 bitStream1!8) (buf!2322 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1935 (buf!2322 bitStream1!8)) (currentByte!4624 bitStream1!8) (currentBit!4619 bitStream1!8))))))

(assert (= (and d!28550 res!75811) b!91826))

(assert (= (and b!91826 res!75810) b!91827))

(assert (= (and b!91827 (not res!75809)) b!91828))

(declare-fun m!135927 () Bool)

(assert (=> b!91826 m!135927))

(assert (=> b!91826 m!135871))

(assert (=> b!91828 m!135927))

(assert (=> b!91828 m!135927))

(declare-fun m!135929 () Bool)

(assert (=> b!91828 m!135929))

(assert (=> b!91775 d!28550))

(declare-fun d!28568 () Bool)

(assert (=> d!28568 (= (invariant!0 (currentBit!4619 bitStream1!8) (currentByte!4624 bitStream1!8) (size!1935 (buf!2322 bitStream1!8))) (and (bvsge (currentBit!4619 bitStream1!8) #b00000000000000000000000000000000) (bvslt (currentBit!4619 bitStream1!8) #b00000000000000000000000000001000) (bvsge (currentByte!4624 bitStream1!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4624 bitStream1!8) (size!1935 (buf!2322 bitStream1!8))) (and (= (currentBit!4619 bitStream1!8) #b00000000000000000000000000000000) (= (currentByte!4624 bitStream1!8) (size!1935 (buf!2322 bitStream1!8)))))))))

(assert (=> b!91780 d!28568))

(declare-fun d!28572 () Bool)

(declare-fun res!75816 () Bool)

(declare-fun e!60376 () Bool)

(assert (=> d!28572 (=> (not res!75816) (not e!60376))))

(assert (=> d!28572 (= res!75816 (= (size!1935 (buf!2322 bitStream2!8)) (size!1935 (buf!2322 base!8))))))

(assert (=> d!28572 (= (isPrefixOf!0 bitStream2!8 base!8) e!60376)))

(declare-fun b!91829 () Bool)

(declare-fun res!75814 () Bool)

(assert (=> b!91829 (=> (not res!75814) (not e!60376))))

(assert (=> b!91829 (= res!75814 (bvsle (bitIndex!0 (size!1935 (buf!2322 bitStream2!8)) (currentByte!4624 bitStream2!8) (currentBit!4619 bitStream2!8)) (bitIndex!0 (size!1935 (buf!2322 base!8)) (currentByte!4624 base!8) (currentBit!4619 base!8))))))

(declare-fun b!91830 () Bool)

(declare-fun e!60373 () Bool)

(assert (=> b!91830 (= e!60376 e!60373)))

(declare-fun res!75812 () Bool)

(assert (=> b!91830 (=> res!75812 e!60373)))

(assert (=> b!91830 (= res!75812 (= (size!1935 (buf!2322 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!91831 () Bool)

(assert (=> b!91831 (= e!60373 (arrayBitRangesEq!0 (buf!2322 bitStream2!8) (buf!2322 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1935 (buf!2322 bitStream2!8)) (currentByte!4624 bitStream2!8) (currentBit!4619 bitStream2!8))))))

(assert (= (and d!28572 res!75816) b!91829))

(assert (= (and b!91829 res!75814) b!91830))

(assert (= (and b!91830 (not res!75812)) b!91831))

(declare-fun m!135931 () Bool)

(assert (=> b!91829 m!135931))

(assert (=> b!91829 m!135871))

(assert (=> b!91831 m!135931))

(assert (=> b!91831 m!135931))

(declare-fun m!135933 () Bool)

(assert (=> b!91831 m!135933))

(assert (=> b!91776 d!28572))

(declare-fun d!28574 () Bool)

(declare-fun res!75823 () Bool)

(declare-fun e!60380 () Bool)

(assert (=> d!28574 (=> (not res!75823) (not e!60380))))

(assert (=> d!28574 (= res!75823 (= (size!1935 (buf!2322 bitStream1!8)) (size!1935 (buf!2322 bitStream2!8))))))

(assert (=> d!28574 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!60380)))

(declare-fun b!91838 () Bool)

(declare-fun res!75822 () Bool)

(assert (=> b!91838 (=> (not res!75822) (not e!60380))))

(assert (=> b!91838 (= res!75822 (bvsle (bitIndex!0 (size!1935 (buf!2322 bitStream1!8)) (currentByte!4624 bitStream1!8) (currentBit!4619 bitStream1!8)) (bitIndex!0 (size!1935 (buf!2322 bitStream2!8)) (currentByte!4624 bitStream2!8) (currentBit!4619 bitStream2!8))))))

(declare-fun b!91839 () Bool)

(declare-fun e!60379 () Bool)

(assert (=> b!91839 (= e!60380 e!60379)))

(declare-fun res!75821 () Bool)

(assert (=> b!91839 (=> res!75821 e!60379)))

(assert (=> b!91839 (= res!75821 (= (size!1935 (buf!2322 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!91840 () Bool)

(assert (=> b!91840 (= e!60379 (arrayBitRangesEq!0 (buf!2322 bitStream1!8) (buf!2322 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1935 (buf!2322 bitStream1!8)) (currentByte!4624 bitStream1!8) (currentBit!4619 bitStream1!8))))))

(assert (= (and d!28574 res!75823) b!91838))

(assert (= (and b!91838 res!75822) b!91839))

(assert (= (and b!91839 (not res!75821)) b!91840))

(assert (=> b!91838 m!135927))

(assert (=> b!91838 m!135931))

(assert (=> b!91840 m!135927))

(assert (=> b!91840 m!135927))

(declare-fun m!135935 () Bool)

(assert (=> b!91840 m!135935))

(assert (=> b!91777 d!28574))

(declare-fun d!28576 () Bool)

(assert (=> d!28576 (= (array_inv!1778 (buf!2322 bitStream2!8)) (bvsge (size!1935 (buf!2322 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!91772 d!28576))

(declare-fun d!28578 () Bool)

(assert (=> d!28578 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4619 bitStream1!8) (currentByte!4624 bitStream1!8) (size!1935 (buf!2322 bitStream1!8))))))

(declare-fun bs!7050 () Bool)

(assert (= bs!7050 d!28578))

(assert (=> bs!7050 m!135879))

(assert (=> start!18486 d!28578))

(declare-fun d!28582 () Bool)

(assert (=> d!28582 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4619 bitStream2!8) (currentByte!4624 bitStream2!8) (size!1935 (buf!2322 bitStream2!8))))))

(declare-fun bs!7051 () Bool)

(assert (= bs!7051 d!28582))

(declare-fun m!135941 () Bool)

(assert (=> bs!7051 m!135941))

(assert (=> start!18486 d!28582))

(declare-fun d!28584 () Bool)

(assert (=> d!28584 (= (inv!12 base!8) (invariant!0 (currentBit!4619 base!8) (currentByte!4624 base!8) (size!1935 (buf!2322 base!8))))))

(declare-fun bs!7052 () Bool)

(assert (= bs!7052 d!28584))

(declare-fun m!135943 () Bool)

(assert (=> bs!7052 m!135943))

(assert (=> start!18486 d!28584))

(declare-fun d!28586 () Bool)

(assert (=> d!28586 (= (array_inv!1778 (buf!2322 bitStream1!8)) (bvsge (size!1935 (buf!2322 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!91773 d!28586))

(declare-fun d!28588 () Bool)

(declare-fun e!60394 () Bool)

(assert (=> d!28588 e!60394))

(declare-fun res!75846 () Bool)

(assert (=> d!28588 (=> (not res!75846) (not e!60394))))

(declare-fun lt!137958 () (_ BitVec 64))

(declare-fun lt!137956 () (_ BitVec 64))

(declare-fun lt!137954 () (_ BitVec 64))

(assert (=> d!28588 (= res!75846 (= lt!137958 (bvsub lt!137956 lt!137954)))))

(assert (=> d!28588 (or (= (bvand lt!137956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137954 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137956 lt!137954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28588 (= lt!137954 (remainingBits!0 ((_ sign_extend 32) (size!1935 (buf!2322 base!8))) ((_ sign_extend 32) (currentByte!4624 base!8)) ((_ sign_extend 32) (currentBit!4619 base!8))))))

(declare-fun lt!137957 () (_ BitVec 64))

(declare-fun lt!137953 () (_ BitVec 64))

(assert (=> d!28588 (= lt!137956 (bvmul lt!137957 lt!137953))))

(assert (=> d!28588 (or (= lt!137957 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137953 (bvsdiv (bvmul lt!137957 lt!137953) lt!137957)))))

(assert (=> d!28588 (= lt!137953 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28588 (= lt!137957 ((_ sign_extend 32) (size!1935 (buf!2322 base!8))))))

(assert (=> d!28588 (= lt!137958 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4624 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4619 base!8))))))

(assert (=> d!28588 (invariant!0 (currentBit!4619 base!8) (currentByte!4624 base!8) (size!1935 (buf!2322 base!8)))))

(assert (=> d!28588 (= (bitIndex!0 (size!1935 (buf!2322 base!8)) (currentByte!4624 base!8) (currentBit!4619 base!8)) lt!137958)))

(declare-fun b!91863 () Bool)

(declare-fun res!75847 () Bool)

(assert (=> b!91863 (=> (not res!75847) (not e!60394))))

(assert (=> b!91863 (= res!75847 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137958))))

(declare-fun b!91864 () Bool)

(declare-fun lt!137955 () (_ BitVec 64))

(assert (=> b!91864 (= e!60394 (bvsle lt!137958 (bvmul lt!137955 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91864 (or (= lt!137955 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137955 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137955)))))

(assert (=> b!91864 (= lt!137955 ((_ sign_extend 32) (size!1935 (buf!2322 base!8))))))

(assert (= (and d!28588 res!75846) b!91863))

(assert (= (and b!91863 res!75847) b!91864))

(declare-fun m!135959 () Bool)

(assert (=> d!28588 m!135959))

(assert (=> d!28588 m!135943))

(assert (=> b!91778 d!28588))

(declare-fun d!28606 () Bool)

(declare-fun size!1939 (List!819) Int)

(assert (=> d!28606 (= (length!410 listBits!13) (size!1939 listBits!13))))

(declare-fun bs!7054 () Bool)

(assert (= bs!7054 d!28606))

(declare-fun m!135961 () Bool)

(assert (=> bs!7054 m!135961))

(assert (=> b!91779 d!28606))

(declare-fun d!28608 () Bool)

(assert (=> d!28608 (= (array_inv!1778 (buf!2322 base!8)) (bvsge (size!1935 (buf!2322 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!91774 d!28608))

(check-sat (not b!91828) (not d!28606) (not d!28588) (not b!91840) (not b!91826) (not d!28584) (not d!28578) (not d!28582) (not b!91831) (not b!91829) (not b!91838))
