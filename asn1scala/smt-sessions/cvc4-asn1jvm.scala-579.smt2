; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16574 () Bool)

(assert start!16574)

(declare-fun b!82304 () Bool)

(declare-fun res!67819 () Bool)

(declare-fun e!54356 () Bool)

(assert (=> b!82304 (=> (not res!67819) (not e!54356))))

(declare-datatypes ((array!3705 0))(
  ( (array!3706 (arr!2333 (Array (_ BitVec 32) (_ BitVec 8))) (size!1696 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2954 0))(
  ( (BitStream!2955 (buf!2086 array!3705) (currentByte!4078 (_ BitVec 32)) (currentBit!4073 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2954)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82304 (= res!67819 (validate_offset_bits!1 ((_ sign_extend 32) (size!1696 (buf!2086 b1!98))) ((_ sign_extend 32) (currentByte!4078 b1!98)) ((_ sign_extend 32) (currentBit!4073 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82305 () Bool)

(declare-fun e!54357 () Bool)

(declare-fun b2!98 () BitStream!2954)

(declare-fun array_inv!1542 (array!3705) Bool)

(assert (=> b!82305 (= e!54357 (array_inv!1542 (buf!2086 b2!98)))))

(declare-fun b!82306 () Bool)

(declare-fun e!54360 () Bool)

(assert (=> b!82306 (= e!54356 e!54360)))

(declare-fun res!67822 () Bool)

(assert (=> b!82306 (=> (not res!67822) (not e!54360))))

(declare-fun lt!130850 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun lt!130851 () (_ BitVec 64))

(assert (=> b!82306 (= res!67822 (= (bvadd lt!130850 b1b2Diff!1) lt!130851))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82306 (= lt!130851 (bitIndex!0 (size!1696 (buf!2086 b2!98)) (currentByte!4078 b2!98) (currentBit!4073 b2!98)))))

(assert (=> b!82306 (= lt!130850 (bitIndex!0 (size!1696 (buf!2086 b1!98)) (currentByte!4078 b1!98) (currentBit!4073 b1!98)))))

(declare-fun b!82307 () Bool)

(declare-fun e!54358 () Bool)

(assert (=> b!82307 (= e!54358 (or (bvsgt ((_ sign_extend 32) (size!1696 (buf!2086 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4078 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4073 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1696 (buf!2086 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4078 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4073 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82307 (= (remainingBits!0 ((_ sign_extend 32) (size!1696 (buf!2086 b2!98))) ((_ sign_extend 32) (currentByte!4078 b2!98)) ((_ sign_extend 32) (currentBit!4073 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1696 (buf!2086 b2!98)))) lt!130851))))

(declare-datatypes ((Unit!5501 0))(
  ( (Unit!5502) )
))
(declare-fun lt!130853 () Unit!5501)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2954) Unit!5501)

(assert (=> b!82307 (= lt!130853 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun res!67821 () Bool)

(assert (=> start!16574 (=> (not res!67821) (not e!54356))))

(assert (=> start!16574 (= res!67821 (and (= (size!1696 (buf!2086 b1!98)) (size!1696 (buf!2086 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16574 e!54356))

(declare-fun e!54359 () Bool)

(declare-fun inv!12 (BitStream!2954) Bool)

(assert (=> start!16574 (and (inv!12 b1!98) e!54359)))

(assert (=> start!16574 (and (inv!12 b2!98) e!54357)))

(assert (=> start!16574 true))

(declare-fun b!82308 () Bool)

(assert (=> b!82308 (= e!54360 (not e!54358))))

(declare-fun res!67820 () Bool)

(assert (=> b!82308 (=> res!67820 e!54358)))

(declare-fun lt!130852 () (_ BitVec 64))

(assert (=> b!82308 (= res!67820 (bvsgt lt!130850 (bvsub lt!130852 b1ValidateOffsetBits!11)))))

(assert (=> b!82308 (= (remainingBits!0 ((_ sign_extend 32) (size!1696 (buf!2086 b1!98))) ((_ sign_extend 32) (currentByte!4078 b1!98)) ((_ sign_extend 32) (currentBit!4073 b1!98))) (bvsub lt!130852 lt!130850))))

(assert (=> b!82308 (= lt!130852 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1696 (buf!2086 b1!98)))))))

(declare-fun lt!130854 () Unit!5501)

(assert (=> b!82308 (= lt!130854 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82309 () Bool)

(assert (=> b!82309 (= e!54359 (array_inv!1542 (buf!2086 b1!98)))))

(assert (= (and start!16574 res!67821) b!82304))

(assert (= (and b!82304 res!67819) b!82306))

(assert (= (and b!82306 res!67822) b!82308))

(assert (= (and b!82308 (not res!67820)) b!82307))

(assert (= start!16574 b!82309))

(assert (= start!16574 b!82305))

(declare-fun m!128753 () Bool)

(assert (=> b!82306 m!128753))

(declare-fun m!128755 () Bool)

(assert (=> b!82306 m!128755))

(declare-fun m!128757 () Bool)

(assert (=> b!82305 m!128757))

(declare-fun m!128759 () Bool)

(assert (=> b!82308 m!128759))

(declare-fun m!128761 () Bool)

(assert (=> b!82308 m!128761))

(declare-fun m!128763 () Bool)

(assert (=> start!16574 m!128763))

(declare-fun m!128765 () Bool)

(assert (=> start!16574 m!128765))

(declare-fun m!128767 () Bool)

(assert (=> b!82309 m!128767))

(declare-fun m!128769 () Bool)

(assert (=> b!82307 m!128769))

(declare-fun m!128771 () Bool)

(assert (=> b!82307 m!128771))

(declare-fun m!128773 () Bool)

(assert (=> b!82304 m!128773))

(push 1)

(assert (not b!82309))

(assert (not b!82307))

(assert (not b!82305))

(assert (not b!82308))

(assert (not start!16574))

(assert (not b!82304))

(assert (not b!82306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25970 () Bool)

(assert (=> d!25970 (= (array_inv!1542 (buf!2086 b2!98)) (bvsge (size!1696 (buf!2086 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82305 d!25970))

(declare-fun d!25972 () Bool)

(declare-fun e!54367 () Bool)

(assert (=> d!25972 e!54367))

(declare-fun res!67836 () Bool)

(assert (=> d!25972 (=> (not res!67836) (not e!54367))))

(declare-fun lt!130926 () (_ BitVec 64))

(declare-fun lt!130931 () (_ BitVec 64))

(declare-fun lt!130928 () (_ BitVec 64))

(assert (=> d!25972 (= res!67836 (= lt!130926 (bvsub lt!130928 lt!130931)))))

(assert (=> d!25972 (or (= (bvand lt!130928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130931 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130928 lt!130931) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25972 (= lt!130931 (remainingBits!0 ((_ sign_extend 32) (size!1696 (buf!2086 b2!98))) ((_ sign_extend 32) (currentByte!4078 b2!98)) ((_ sign_extend 32) (currentBit!4073 b2!98))))))

(declare-fun lt!130929 () (_ BitVec 64))

(declare-fun lt!130927 () (_ BitVec 64))

(assert (=> d!25972 (= lt!130928 (bvmul lt!130929 lt!130927))))

(assert (=> d!25972 (or (= lt!130929 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130927 (bvsdiv (bvmul lt!130929 lt!130927) lt!130929)))))

(assert (=> d!25972 (= lt!130927 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25972 (= lt!130929 ((_ sign_extend 32) (size!1696 (buf!2086 b2!98))))))

(assert (=> d!25972 (= lt!130926 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4078 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4073 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!25972 (invariant!0 (currentBit!4073 b2!98) (currentByte!4078 b2!98) (size!1696 (buf!2086 b2!98)))))

(assert (=> d!25972 (= (bitIndex!0 (size!1696 (buf!2086 b2!98)) (currentByte!4078 b2!98) (currentBit!4073 b2!98)) lt!130926)))

(declare-fun b!82324 () Bool)

(declare-fun res!67835 () Bool)

(assert (=> b!82324 (=> (not res!67835) (not e!54367))))

(assert (=> b!82324 (= res!67835 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130926))))

(declare-fun b!82325 () Bool)

(declare-fun lt!130930 () (_ BitVec 64))

(assert (=> b!82325 (= e!54367 (bvsle lt!130926 (bvmul lt!130930 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82325 (or (= lt!130930 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130930 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130930)))))

(assert (=> b!82325 (= lt!130930 ((_ sign_extend 32) (size!1696 (buf!2086 b2!98))))))

(assert (= (and d!25972 res!67836) b!82324))

(assert (= (and b!82324 res!67835) b!82325))

(assert (=> d!25972 m!128769))

(declare-fun m!128789 () Bool)

(assert (=> d!25972 m!128789))

(assert (=> b!82306 d!25972))

(declare-fun d!25976 () Bool)

(declare-fun e!54368 () Bool)

(assert (=> d!25976 e!54368))

(declare-fun res!67838 () Bool)

(assert (=> d!25976 (=> (not res!67838) (not e!54368))))

(declare-fun lt!130937 () (_ BitVec 64))

(declare-fun lt!130932 () (_ BitVec 64))

(declare-fun lt!130934 () (_ BitVec 64))

(assert (=> d!25976 (= res!67838 (= lt!130932 (bvsub lt!130934 lt!130937)))))

(assert (=> d!25976 (or (= (bvand lt!130934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130937 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130934 lt!130937) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25976 (= lt!130937 (remainingBits!0 ((_ sign_extend 32) (size!1696 (buf!2086 b1!98))) ((_ sign_extend 32) (currentByte!4078 b1!98)) ((_ sign_extend 32) (currentBit!4073 b1!98))))))

(declare-fun lt!130935 () (_ BitVec 64))

(declare-fun lt!130933 () (_ BitVec 64))

(assert (=> d!25976 (= lt!130934 (bvmul lt!130935 lt!130933))))

(assert (=> d!25976 (or (= lt!130935 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130933 (bvsdiv (bvmul lt!130935 lt!130933) lt!130935)))))

(assert (=> d!25976 (= lt!130933 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25976 (= lt!130935 ((_ sign_extend 32) (size!1696 (buf!2086 b1!98))))))

(assert (=> d!25976 (= lt!130932 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4078 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4073 b1!98))))))

(assert (=> d!25976 (invariant!0 (currentBit!4073 b1!98) (currentByte!4078 b1!98) (size!1696 (buf!2086 b1!98)))))

(assert (=> d!25976 (= (bitIndex!0 (size!1696 (buf!2086 b1!98)) (currentByte!4078 b1!98) (currentBit!4073 b1!98)) lt!130932)))

(declare-fun b!82326 () Bool)

(declare-fun res!67837 () Bool)

(assert (=> b!82326 (=> (not res!67837) (not e!54368))))

(assert (=> b!82326 (= res!67837 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130932))))

(declare-fun b!82327 () Bool)

(declare-fun lt!130936 () (_ BitVec 64))

(assert (=> b!82327 (= e!54368 (bvsle lt!130932 (bvmul lt!130936 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82327 (or (= lt!130936 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130936 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130936)))))

(assert (=> b!82327 (= lt!130936 ((_ sign_extend 32) (size!1696 (buf!2086 b1!98))))))

(assert (= (and d!25976 res!67838) b!82326))

(assert (= (and b!82326 res!67837) b!82327))

(assert (=> d!25976 m!128759))

(declare-fun m!128791 () Bool)

(assert (=> d!25976 m!128791))

(assert (=> b!82306 d!25976))

(declare-fun d!25978 () Bool)

(assert (=> d!25978 (= (remainingBits!0 ((_ sign_extend 32) (size!1696 (buf!2086 b2!98))) ((_ sign_extend 32) (currentByte!4078 b2!98)) ((_ sign_extend 32) (currentBit!4073 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1696 (buf!2086 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4078 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4073 b2!98)))))))

(assert (=> b!82307 d!25978))

(declare-fun d!25980 () Bool)

(declare-fun lt!130977 () (_ BitVec 64))

(declare-fun lt!130978 () (_ BitVec 64))

(assert (=> d!25980 (= (remainingBits!0 ((_ sign_extend 32) (size!1696 (buf!2086 b2!98))) ((_ sign_extend 32) (currentByte!4078 b2!98)) ((_ sign_extend 32) (currentBit!4073 b2!98))) (bvsub lt!130977 lt!130978))))

(assert (=> d!25980 (or (= (bvand lt!130977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130978 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130977 lt!130978) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25980 (= lt!130978 (bitIndex!0 (size!1696 (buf!2086 b2!98)) (currentByte!4078 b2!98) (currentBit!4073 b2!98)))))

(declare-fun lt!130981 () (_ BitVec 64))

(declare-fun lt!130980 () (_ BitVec 64))

(assert (=> d!25980 (= lt!130977 (bvmul lt!130981 lt!130980))))

(assert (=> d!25980 (or (= lt!130981 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130980 (bvsdiv (bvmul lt!130981 lt!130980) lt!130981)))))

(assert (=> d!25980 (= lt!130980 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25980 (= lt!130981 ((_ sign_extend 32) (size!1696 (buf!2086 b2!98))))))

(declare-fun lt!130979 () Unit!5501)

(declare-fun choose!23 (BitStream!2954) Unit!5501)

(assert (=> d!25980 (= lt!130979 (choose!23 b2!98))))

(assert (=> d!25980 (= (remainingBitsBitIndexLemma!0 b2!98) lt!130979)))

(declare-fun bs!6368 () Bool)

(assert (= bs!6368 d!25980))

(assert (=> bs!6368 m!128769))

(assert (=> bs!6368 m!128753))

(declare-fun m!128795 () Bool)

(assert (=> bs!6368 m!128795))

(assert (=> b!82307 d!25980))

(declare-fun d!25992 () Bool)

(assert (=> d!25992 (= (inv!12 b1!98) (invariant!0 (currentBit!4073 b1!98) (currentByte!4078 b1!98) (size!1696 (buf!2086 b1!98))))))

(declare-fun bs!6369 () Bool)

(assert (= bs!6369 d!25992))

(assert (=> bs!6369 m!128791))

(assert (=> start!16574 d!25992))

(declare-fun d!25994 () Bool)

(assert (=> d!25994 (= (inv!12 b2!98) (invariant!0 (currentBit!4073 b2!98) (currentByte!4078 b2!98) (size!1696 (buf!2086 b2!98))))))

(declare-fun bs!6370 () Bool)

(assert (= bs!6370 d!25994))

(assert (=> bs!6370 m!128789))

(assert (=> start!16574 d!25994))

(declare-fun d!25996 () Bool)

(assert (=> d!25996 (= (remainingBits!0 ((_ sign_extend 32) (size!1696 (buf!2086 b1!98))) ((_ sign_extend 32) (currentByte!4078 b1!98)) ((_ sign_extend 32) (currentBit!4073 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1696 (buf!2086 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4078 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4073 b1!98)))))))

(assert (=> b!82308 d!25996))

(declare-fun d!25998 () Bool)

(declare-fun lt!130982 () (_ BitVec 64))

(declare-fun lt!130983 () (_ BitVec 64))

(assert (=> d!25998 (= (remainingBits!0 ((_ sign_extend 32) (size!1696 (buf!2086 b1!98))) ((_ sign_extend 32) (currentByte!4078 b1!98)) ((_ sign_extend 32) (currentBit!4073 b1!98))) (bvsub lt!130982 lt!130983))))

(assert (=> d!25998 (or (= (bvand lt!130982 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130983 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130982 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130982 lt!130983) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25998 (= lt!130983 (bitIndex!0 (size!1696 (buf!2086 b1!98)) (currentByte!4078 b1!98) (currentBit!4073 b1!98)))))

(declare-fun lt!130986 () (_ BitVec 64))

(declare-fun lt!130985 () (_ BitVec 64))

(assert (=> d!25998 (= lt!130982 (bvmul lt!130986 lt!130985))))

(assert (=> d!25998 (or (= lt!130986 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130985 (bvsdiv (bvmul lt!130986 lt!130985) lt!130986)))))

(assert (=> d!25998 (= lt!130985 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25998 (= lt!130986 ((_ sign_extend 32) (size!1696 (buf!2086 b1!98))))))

(declare-fun lt!130984 () Unit!5501)

(assert (=> d!25998 (= lt!130984 (choose!23 b1!98))))

(assert (=> d!25998 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130984)))

(declare-fun bs!6371 () Bool)

(assert (= bs!6371 d!25998))

(assert (=> bs!6371 m!128759))

(assert (=> bs!6371 m!128755))

(declare-fun m!128797 () Bool)

(assert (=> bs!6371 m!128797))

(assert (=> b!82308 d!25998))

(declare-fun d!26000 () Bool)

(assert (=> d!26000 (= (array_inv!1542 (buf!2086 b1!98)) (bvsge (size!1696 (buf!2086 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82309 d!26000))

(declare-fun d!26002 () Bool)

(assert (=> d!26002 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1696 (buf!2086 b1!98))) ((_ sign_extend 32) (currentByte!4078 b1!98)) ((_ sign_extend 32) (currentBit!4073 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1696 (buf!2086 b1!98))) ((_ sign_extend 32) (currentByte!4078 b1!98)) ((_ sign_extend 32) (currentBit!4073 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6372 () Bool)

(assert (= bs!6372 d!26002))

(assert (=> bs!6372 m!128759))

(assert (=> b!82304 d!26002))

(push 1)

(assert (not d!25998))

(assert (not d!26002))

(assert (not d!25976))

(assert (not d!25994))

(assert (not d!25992))

(assert (not d!25980))

(assert (not d!25972))

(check-sat)

(pop 1)

(push 1)

(check-sat)

