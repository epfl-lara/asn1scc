; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16620 () Bool)

(assert start!16620)

(declare-fun b!82395 () Bool)

(declare-fun e!54441 () Bool)

(declare-datatypes ((array!3714 0))(
  ( (array!3715 (arr!2336 (Array (_ BitVec 32) (_ BitVec 8))) (size!1699 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2960 0))(
  ( (BitStream!2961 (buf!2089 array!3714) (currentByte!4091 (_ BitVec 32)) (currentBit!4086 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2960)

(declare-fun array_inv!1545 (array!3714) Bool)

(assert (=> b!82395 (= e!54441 (array_inv!1545 (buf!2089 b2!98)))))

(declare-fun b!82396 () Bool)

(declare-fun e!54440 () Bool)

(declare-fun e!54442 () Bool)

(assert (=> b!82396 (= e!54440 e!54442)))

(declare-fun res!67887 () Bool)

(assert (=> b!82396 (=> (not res!67887) (not e!54442))))

(declare-fun lt!131027 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun lt!131031 () (_ BitVec 64))

(assert (=> b!82396 (= res!67887 (= (bvadd lt!131027 b1b2Diff!1) lt!131031))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82396 (= lt!131031 (bitIndex!0 (size!1699 (buf!2089 b2!98)) (currentByte!4091 b2!98) (currentBit!4086 b2!98)))))

(declare-fun b1!98 () BitStream!2960)

(assert (=> b!82396 (= lt!131027 (bitIndex!0 (size!1699 (buf!2089 b1!98)) (currentByte!4091 b1!98) (currentBit!4086 b1!98)))))

(declare-fun b!82397 () Bool)

(declare-fun e!54444 () Bool)

(assert (=> b!82397 (= e!54444 (array_inv!1545 (buf!2089 b1!98)))))

(declare-fun b!82398 () Bool)

(declare-fun e!54437 () Bool)

(assert (=> b!82398 (= e!54442 (not e!54437))))

(declare-fun res!67888 () Bool)

(assert (=> b!82398 (=> res!67888 e!54437)))

(declare-fun lt!131029 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> b!82398 (= res!67888 (bvsgt lt!131027 (bvsub lt!131029 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82398 (= (remainingBits!0 ((_ sign_extend 32) (size!1699 (buf!2089 b1!98))) ((_ sign_extend 32) (currentByte!4091 b1!98)) ((_ sign_extend 32) (currentBit!4086 b1!98))) (bvsub lt!131029 lt!131027))))

(assert (=> b!82398 (= lt!131029 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1699 (buf!2089 b1!98)))))))

(declare-datatypes ((Unit!5507 0))(
  ( (Unit!5508) )
))
(declare-fun lt!131030 () Unit!5507)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2960) Unit!5507)

(assert (=> b!82398 (= lt!131030 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82399 () Bool)

(declare-fun res!67890 () Bool)

(assert (=> b!82399 (=> (not res!67890) (not e!54440))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82399 (= res!67890 (validate_offset_bits!1 ((_ sign_extend 32) (size!1699 (buf!2089 b1!98))) ((_ sign_extend 32) (currentByte!4091 b1!98)) ((_ sign_extend 32) (currentBit!4086 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82400 () Bool)

(declare-fun e!54439 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82400 (= e!54439 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4086 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4091 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1699 (buf!2089 b2!98))))))))

(declare-fun res!67889 () Bool)

(assert (=> start!16620 (=> (not res!67889) (not e!54440))))

(assert (=> start!16620 (= res!67889 (and (= (size!1699 (buf!2089 b1!98)) (size!1699 (buf!2089 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16620 e!54440))

(declare-fun inv!12 (BitStream!2960) Bool)

(assert (=> start!16620 (and (inv!12 b1!98) e!54444)))

(assert (=> start!16620 (and (inv!12 b2!98) e!54441)))

(assert (=> start!16620 true))

(declare-fun b!82394 () Bool)

(assert (=> b!82394 (= e!54437 e!54439)))

(declare-fun res!67891 () Bool)

(assert (=> b!82394 (=> res!67891 e!54439)))

(assert (=> b!82394 (= res!67891 (or (bvsgt ((_ sign_extend 32) (size!1699 (buf!2089 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4091 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4086 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1699 (buf!2089 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4091 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4086 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!82394 (= (remainingBits!0 ((_ sign_extend 32) (size!1699 (buf!2089 b2!98))) ((_ sign_extend 32) (currentByte!4091 b2!98)) ((_ sign_extend 32) (currentBit!4086 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1699 (buf!2089 b2!98)))) lt!131031))))

(declare-fun lt!131028 () Unit!5507)

(assert (=> b!82394 (= lt!131028 (remainingBitsBitIndexLemma!0 b2!98))))

(assert (= (and start!16620 res!67889) b!82399))

(assert (= (and b!82399 res!67890) b!82396))

(assert (= (and b!82396 res!67887) b!82398))

(assert (= (and b!82398 (not res!67888)) b!82394))

(assert (= (and b!82394 (not res!67891)) b!82400))

(assert (= start!16620 b!82397))

(assert (= start!16620 b!82395))

(declare-fun m!128847 () Bool)

(assert (=> b!82399 m!128847))

(declare-fun m!128849 () Bool)

(assert (=> start!16620 m!128849))

(declare-fun m!128851 () Bool)

(assert (=> start!16620 m!128851))

(declare-fun m!128853 () Bool)

(assert (=> b!82394 m!128853))

(declare-fun m!128855 () Bool)

(assert (=> b!82394 m!128855))

(declare-fun m!128857 () Bool)

(assert (=> b!82395 m!128857))

(declare-fun m!128859 () Bool)

(assert (=> b!82400 m!128859))

(declare-fun m!128861 () Bool)

(assert (=> b!82396 m!128861))

(declare-fun m!128863 () Bool)

(assert (=> b!82396 m!128863))

(declare-fun m!128865 () Bool)

(assert (=> b!82398 m!128865))

(declare-fun m!128867 () Bool)

(assert (=> b!82398 m!128867))

(declare-fun m!128869 () Bool)

(assert (=> b!82397 m!128869))

(push 1)

(assert (not b!82394))

(assert (not start!16620))

(assert (not b!82399))

(assert (not b!82400))

(assert (not b!82395))

(assert (not b!82396))

(assert (not b!82398))

(assert (not b!82397))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26042 () Bool)

(declare-fun e!54453 () Bool)

(assert (=> d!26042 e!54453))

(declare-fun res!67907 () Bool)

(assert (=> d!26042 (=> (not res!67907) (not e!54453))))

(declare-fun lt!131111 () (_ BitVec 64))

(declare-fun lt!131112 () (_ BitVec 64))

(declare-fun lt!131115 () (_ BitVec 64))

(assert (=> d!26042 (= res!67907 (= lt!131115 (bvsub lt!131111 lt!131112)))))

(assert (=> d!26042 (or (= (bvand lt!131111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131112 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131111 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131111 lt!131112) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26042 (= lt!131112 (remainingBits!0 ((_ sign_extend 32) (size!1699 (buf!2089 b2!98))) ((_ sign_extend 32) (currentByte!4091 b2!98)) ((_ sign_extend 32) (currentBit!4086 b2!98))))))

(declare-fun lt!131116 () (_ BitVec 64))

(declare-fun lt!131113 () (_ BitVec 64))

(assert (=> d!26042 (= lt!131111 (bvmul lt!131116 lt!131113))))

(assert (=> d!26042 (or (= lt!131116 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131113 (bvsdiv (bvmul lt!131116 lt!131113) lt!131116)))))

(assert (=> d!26042 (= lt!131113 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26042 (= lt!131116 ((_ sign_extend 32) (size!1699 (buf!2089 b2!98))))))

(assert (=> d!26042 (= lt!131115 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4091 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4086 b2!98))))))

(assert (=> d!26042 (invariant!0 (currentBit!4086 b2!98) (currentByte!4091 b2!98) (size!1699 (buf!2089 b2!98)))))

(assert (=> d!26042 (= (bitIndex!0 (size!1699 (buf!2089 b2!98)) (currentByte!4091 b2!98) (currentBit!4086 b2!98)) lt!131115)))

(declare-fun b!82415 () Bool)

(declare-fun res!67906 () Bool)

(assert (=> b!82415 (=> (not res!67906) (not e!54453))))

(assert (=> b!82415 (= res!67906 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131115))))

(declare-fun b!82416 () Bool)

(declare-fun lt!131114 () (_ BitVec 64))

(assert (=> b!82416 (= e!54453 (bvsle lt!131115 (bvmul lt!131114 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82416 (or (= lt!131114 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131114 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131114)))))

(assert (=> b!82416 (= lt!131114 ((_ sign_extend 32) (size!1699 (buf!2089 b2!98))))))

(assert (= (and d!26042 res!67907) b!82415))

(assert (= (and b!82415 res!67906) b!82416))

(assert (=> d!26042 m!128853))

(declare-fun m!128881 () Bool)

(assert (=> d!26042 m!128881))

(assert (=> b!82396 d!26042))

(declare-fun d!26050 () Bool)

(declare-fun e!54454 () Bool)

(assert (=> d!26050 e!54454))

(declare-fun res!67911 () Bool)

(assert (=> d!26050 (=> (not res!67911) (not e!54454))))

(declare-fun lt!131122 () (_ BitVec 64))

(declare-fun lt!131121 () (_ BitVec 64))

(declare-fun lt!131125 () (_ BitVec 64))

(assert (=> d!26050 (= res!67911 (= lt!131125 (bvsub lt!131121 lt!131122)))))

(assert (=> d!26050 (or (= (bvand lt!131121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131122 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131121 lt!131122) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26050 (= lt!131122 (remainingBits!0 ((_ sign_extend 32) (size!1699 (buf!2089 b1!98))) ((_ sign_extend 32) (currentByte!4091 b1!98)) ((_ sign_extend 32) (currentBit!4086 b1!98))))))

(declare-fun lt!131126 () (_ BitVec 64))

(declare-fun lt!131123 () (_ BitVec 64))

(assert (=> d!26050 (= lt!131121 (bvmul lt!131126 lt!131123))))

(assert (=> d!26050 (or (= lt!131126 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131123 (bvsdiv (bvmul lt!131126 lt!131123) lt!131126)))))

(assert (=> d!26050 (= lt!131123 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26050 (= lt!131126 ((_ sign_extend 32) (size!1699 (buf!2089 b1!98))))))

(assert (=> d!26050 (= lt!131125 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4091 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4086 b1!98))))))

(assert (=> d!26050 (invariant!0 (currentBit!4086 b1!98) (currentByte!4091 b1!98) (size!1699 (buf!2089 b1!98)))))

(assert (=> d!26050 (= (bitIndex!0 (size!1699 (buf!2089 b1!98)) (currentByte!4091 b1!98) (currentBit!4086 b1!98)) lt!131125)))

(declare-fun b!82421 () Bool)

(declare-fun res!67910 () Bool)

(assert (=> b!82421 (=> (not res!67910) (not e!54454))))

(assert (=> b!82421 (= res!67910 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131125))))

(declare-fun b!82422 () Bool)

(declare-fun lt!131124 () (_ BitVec 64))

(assert (=> b!82422 (= e!54454 (bvsle lt!131125 (bvmul lt!131124 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82422 (or (= lt!131124 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131124 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131124)))))

(assert (=> b!82422 (= lt!131124 ((_ sign_extend 32) (size!1699 (buf!2089 b1!98))))))

(assert (= (and d!26050 res!67911) b!82421))

(assert (= (and b!82421 res!67910) b!82422))

(assert (=> d!26050 m!128865))

(declare-fun m!128883 () Bool)

(assert (=> d!26050 m!128883))

(assert (=> b!82396 d!26050))

(declare-fun d!26052 () Bool)

(assert (=> d!26052 (= (array_inv!1545 (buf!2089 b2!98)) (bvsge (size!1699 (buf!2089 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82395 d!26052))

(declare-fun d!26054 () Bool)

(assert (=> d!26054 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4086 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4091 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1699 (buf!2089 b2!98))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4086 b2!98))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4086 b2!98))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4091 b2!98))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4091 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1699 (buf!2089 b2!98))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4086 b2!98))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4091 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1699 (buf!2089 b2!98)))))))))))

(assert (=> b!82400 d!26054))

(declare-fun d!26062 () Bool)

(assert (=> d!26062 (= (inv!12 b1!98) (invariant!0 (currentBit!4086 b1!98) (currentByte!4091 b1!98) (size!1699 (buf!2089 b1!98))))))

(declare-fun bs!6386 () Bool)

(assert (= bs!6386 d!26062))

(assert (=> bs!6386 m!128883))

(assert (=> start!16620 d!26062))

(declare-fun d!26068 () Bool)

(assert (=> d!26068 (= (inv!12 b2!98) (invariant!0 (currentBit!4086 b2!98) (currentByte!4091 b2!98) (size!1699 (buf!2089 b2!98))))))

(declare-fun bs!6387 () Bool)

(assert (= bs!6387 d!26068))

(assert (=> bs!6387 m!128881))

(assert (=> start!16620 d!26068))

(declare-fun d!26070 () Bool)

(assert (=> d!26070 (= (remainingBits!0 ((_ sign_extend 32) (size!1699 (buf!2089 b2!98))) ((_ sign_extend 32) (currentByte!4091 b2!98)) ((_ sign_extend 32) (currentBit!4086 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1699 (buf!2089 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4091 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4086 b2!98)))))))

(assert (=> b!82394 d!26070))

(declare-fun d!26076 () Bool)

(declare-fun lt!131157 () (_ BitVec 64))

(declare-fun lt!131154 () (_ BitVec 64))

(assert (=> d!26076 (= (remainingBits!0 ((_ sign_extend 32) (size!1699 (buf!2089 b2!98))) ((_ sign_extend 32) (currentByte!4091 b2!98)) ((_ sign_extend 32) (currentBit!4086 b2!98))) (bvsub lt!131157 lt!131154))))

(assert (=> d!26076 (or (= (bvand lt!131157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131154 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131157 lt!131154) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26076 (= lt!131154 (bitIndex!0 (size!1699 (buf!2089 b2!98)) (currentByte!4091 b2!98) (currentBit!4086 b2!98)))))

(declare-fun lt!131156 () (_ BitVec 64))

(declare-fun lt!131155 () (_ BitVec 64))

(assert (=> d!26076 (= lt!131157 (bvmul lt!131156 lt!131155))))

(assert (=> d!26076 (or (= lt!131156 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131155 (bvsdiv (bvmul lt!131156 lt!131155) lt!131156)))))

(assert (=> d!26076 (= lt!131155 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26076 (= lt!131156 ((_ sign_extend 32) (size!1699 (buf!2089 b2!98))))))

(declare-fun lt!131158 () Unit!5507)

(declare-fun choose!23 (BitStream!2960) Unit!5507)

(assert (=> d!26076 (= lt!131158 (choose!23 b2!98))))

(assert (=> d!26076 (= (remainingBitsBitIndexLemma!0 b2!98) lt!131158)))

(declare-fun bs!6390 () Bool)

(assert (= bs!6390 d!26076))

(assert (=> bs!6390 m!128853))

(assert (=> bs!6390 m!128861))

(declare-fun m!128891 () Bool)

(assert (=> bs!6390 m!128891))

(assert (=> b!82394 d!26076))

(declare-fun d!26078 () Bool)

(assert (=> d!26078 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1699 (buf!2089 b1!98))) ((_ sign_extend 32) (currentByte!4091 b1!98)) ((_ sign_extend 32) (currentBit!4086 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1699 (buf!2089 b1!98))) ((_ sign_extend 32) (currentByte!4091 b1!98)) ((_ sign_extend 32) (currentBit!4086 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6391 () Bool)

(assert (= bs!6391 d!26078))

(assert (=> bs!6391 m!128865))

(assert (=> b!82399 d!26078))

(declare-fun d!26080 () Bool)

(assert (=> d!26080 (= (remainingBits!0 ((_ sign_extend 32) (size!1699 (buf!2089 b1!98))) ((_ sign_extend 32) (currentByte!4091 b1!98)) ((_ sign_extend 32) (currentBit!4086 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1699 (buf!2089 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4091 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4086 b1!98)))))))

(assert (=> b!82398 d!26080))

(declare-fun d!26082 () Bool)

(declare-fun lt!131162 () (_ BitVec 64))

(declare-fun lt!131159 () (_ BitVec 64))

(assert (=> d!26082 (= (remainingBits!0 ((_ sign_extend 32) (size!1699 (buf!2089 b1!98))) ((_ sign_extend 32) (currentByte!4091 b1!98)) ((_ sign_extend 32) (currentBit!4086 b1!98))) (bvsub lt!131162 lt!131159))))

(assert (=> d!26082 (or (= (bvand lt!131162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131159 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131162 lt!131159) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26082 (= lt!131159 (bitIndex!0 (size!1699 (buf!2089 b1!98)) (currentByte!4091 b1!98) (currentBit!4086 b1!98)))))

(declare-fun lt!131161 () (_ BitVec 64))

