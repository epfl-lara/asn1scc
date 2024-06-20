; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17242 () Bool)

(assert start!17242)

(declare-fun b!83893 () Bool)

(declare-fun e!55950 () Bool)

(declare-fun e!55948 () Bool)

(assert (=> b!83893 (= e!55950 e!55948)))

(declare-fun res!68949 () Bool)

(assert (=> b!83893 (=> res!68949 e!55948)))

(declare-fun lt!133840 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!133844 () (_ BitVec 64))

(declare-fun lt!133845 () (_ BitVec 64))

(assert (=> b!83893 (= res!68949 (or (not (= lt!133840 (bvsub lt!133844 lt!133845))) (bvslt lt!133840 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1))))))

(declare-fun lt!133843 () (_ BitVec 64))

(assert (=> b!83893 (= lt!133840 (bvsub lt!133844 lt!133843))))

(declare-datatypes ((array!3887 0))(
  ( (array!3888 (arr!2403 (Array (_ BitVec 32) (_ BitVec 8))) (size!1766 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3094 0))(
  ( (BitStream!3095 (buf!2156 array!3887) (currentByte!4286 (_ BitVec 32)) (currentBit!4281 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3094)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83893 (= lt!133840 (remainingBits!0 ((_ sign_extend 32) (size!1766 (buf!2156 b2!98))) ((_ sign_extend 32) (currentByte!4286 b2!98)) ((_ sign_extend 32) (currentBit!4281 b2!98))))))

(assert (=> b!83893 (= lt!133844 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1766 (buf!2156 b2!98)))))))

(declare-datatypes ((Unit!5635 0))(
  ( (Unit!5636) )
))
(declare-fun lt!133839 () Unit!5635)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3094) Unit!5635)

(assert (=> b!83893 (= lt!133839 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun res!68950 () Bool)

(declare-fun e!55946 () Bool)

(assert (=> start!17242 (=> (not res!68950) (not e!55946))))

(declare-fun b1!98 () BitStream!3094)

(assert (=> start!17242 (= res!68950 (and (= (size!1766 (buf!2156 b1!98)) (size!1766 (buf!2156 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17242 e!55946))

(declare-fun e!55947 () Bool)

(declare-fun inv!12 (BitStream!3094) Bool)

(assert (=> start!17242 (and (inv!12 b1!98) e!55947)))

(declare-fun e!55949 () Bool)

(assert (=> start!17242 (and (inv!12 b2!98) e!55949)))

(assert (=> start!17242 true))

(declare-fun b!83894 () Bool)

(declare-fun res!68946 () Bool)

(assert (=> b!83894 (=> (not res!68946) (not e!55946))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83894 (= res!68946 (validate_offset_bits!1 ((_ sign_extend 32) (size!1766 (buf!2156 b1!98))) ((_ sign_extend 32) (currentByte!4286 b1!98)) ((_ sign_extend 32) (currentBit!4281 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83895 () Bool)

(declare-fun e!55951 () Bool)

(assert (=> b!83895 (= e!55951 (not e!55950))))

(declare-fun res!68947 () Bool)

(assert (=> b!83895 (=> res!68947 e!55950)))

(declare-fun lt!133838 () (_ BitVec 64))

(declare-fun lt!133841 () (_ BitVec 64))

(assert (=> b!83895 (= res!68947 (bvsgt lt!133841 (bvsub lt!133838 b1ValidateOffsetBits!11)))))

(assert (=> b!83895 (= (remainingBits!0 ((_ sign_extend 32) (size!1766 (buf!2156 b1!98))) ((_ sign_extend 32) (currentByte!4286 b1!98)) ((_ sign_extend 32) (currentBit!4281 b1!98))) (bvsub lt!133838 lt!133841))))

(assert (=> b!83895 (= lt!133838 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1766 (buf!2156 b1!98)))))))

(declare-fun lt!133842 () Unit!5635)

(assert (=> b!83895 (= lt!133842 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83896 () Bool)

(declare-fun array_inv!1612 (array!3887) Bool)

(assert (=> b!83896 (= e!55947 (array_inv!1612 (buf!2156 b1!98)))))

(declare-fun b!83897 () Bool)

(assert (=> b!83897 (= e!55949 (array_inv!1612 (buf!2156 b2!98)))))

(declare-fun b!83898 () Bool)

(assert (=> b!83898 (= e!55948 (validate_offset_bits!1 ((_ sign_extend 32) (size!1766 (buf!2156 b2!98))) ((_ sign_extend 32) (currentByte!4286 b2!98)) ((_ sign_extend 32) (currentBit!4281 b2!98)) (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)))))

(declare-fun b!83899 () Bool)

(assert (=> b!83899 (= e!55946 e!55951)))

(declare-fun res!68948 () Bool)

(assert (=> b!83899 (=> (not res!68948) (not e!55951))))

(assert (=> b!83899 (= res!68948 (= lt!133845 lt!133843))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83899 (= lt!133843 (bitIndex!0 (size!1766 (buf!2156 b2!98)) (currentByte!4286 b2!98) (currentBit!4281 b2!98)))))

(assert (=> b!83899 (= lt!133845 (bvadd lt!133841 b1b2Diff!1))))

(assert (=> b!83899 (= lt!133841 (bitIndex!0 (size!1766 (buf!2156 b1!98)) (currentByte!4286 b1!98) (currentBit!4281 b1!98)))))

(assert (= (and start!17242 res!68950) b!83894))

(assert (= (and b!83894 res!68946) b!83899))

(assert (= (and b!83899 res!68948) b!83895))

(assert (= (and b!83895 (not res!68947)) b!83893))

(assert (= (and b!83893 (not res!68949)) b!83898))

(assert (= start!17242 b!83896))

(assert (= start!17242 b!83897))

(declare-fun m!130539 () Bool)

(assert (=> b!83897 m!130539))

(declare-fun m!130541 () Bool)

(assert (=> start!17242 m!130541))

(declare-fun m!130543 () Bool)

(assert (=> start!17242 m!130543))

(declare-fun m!130545 () Bool)

(assert (=> b!83893 m!130545))

(declare-fun m!130547 () Bool)

(assert (=> b!83893 m!130547))

(declare-fun m!130549 () Bool)

(assert (=> b!83895 m!130549))

(declare-fun m!130551 () Bool)

(assert (=> b!83895 m!130551))

(declare-fun m!130553 () Bool)

(assert (=> b!83899 m!130553))

(declare-fun m!130555 () Bool)

(assert (=> b!83899 m!130555))

(declare-fun m!130557 () Bool)

(assert (=> b!83898 m!130557))

(declare-fun m!130559 () Bool)

(assert (=> b!83894 m!130559))

(declare-fun m!130561 () Bool)

(assert (=> b!83896 m!130561))

(push 1)

(assert (not b!83893))

(assert (not b!83899))

(assert (not b!83895))

(assert (not start!17242))

(assert (not b!83897))

(assert (not b!83894))

(assert (not b!83898))

(assert (not b!83896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26930 () Bool)

(assert (=> d!26930 (= (remainingBits!0 ((_ sign_extend 32) (size!1766 (buf!2156 b1!98))) ((_ sign_extend 32) (currentByte!4286 b1!98)) ((_ sign_extend 32) (currentBit!4281 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1766 (buf!2156 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4286 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4281 b1!98)))))))

(assert (=> b!83895 d!26930))

(declare-fun d!26932 () Bool)

(declare-fun lt!133978 () (_ BitVec 64))

(declare-fun lt!133975 () (_ BitVec 64))

(assert (=> d!26932 (= (remainingBits!0 ((_ sign_extend 32) (size!1766 (buf!2156 b1!98))) ((_ sign_extend 32) (currentByte!4286 b1!98)) ((_ sign_extend 32) (currentBit!4281 b1!98))) (bvsub lt!133978 lt!133975))))

(assert (=> d!26932 (or (= (bvand lt!133978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133975 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133978 lt!133975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26932 (= lt!133975 (bitIndex!0 (size!1766 (buf!2156 b1!98)) (currentByte!4286 b1!98) (currentBit!4281 b1!98)))))

(declare-fun lt!133974 () (_ BitVec 64))

(declare-fun lt!133976 () (_ BitVec 64))

(assert (=> d!26932 (= lt!133978 (bvmul lt!133974 lt!133976))))

(assert (=> d!26932 (or (= lt!133974 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133976 (bvsdiv (bvmul lt!133974 lt!133976) lt!133974)))))

(assert (=> d!26932 (= lt!133976 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26932 (= lt!133974 ((_ sign_extend 32) (size!1766 (buf!2156 b1!98))))))

(declare-fun lt!133977 () Unit!5635)

(declare-fun choose!23 (BitStream!3094) Unit!5635)

(assert (=> d!26932 (= lt!133977 (choose!23 b1!98))))

(assert (=> d!26932 (= (remainingBitsBitIndexLemma!0 b1!98) lt!133977)))

(declare-fun bs!6641 () Bool)

(assert (= bs!6641 d!26932))

(assert (=> bs!6641 m!130549))

(assert (=> bs!6641 m!130555))

(declare-fun m!130623 () Bool)

(assert (=> bs!6641 m!130623))

(assert (=> b!83895 d!26932))

(declare-fun d!26934 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26934 (= (inv!12 b1!98) (invariant!0 (currentBit!4281 b1!98) (currentByte!4286 b1!98) (size!1766 (buf!2156 b1!98))))))

(declare-fun bs!6642 () Bool)

(assert (= bs!6642 d!26934))

(declare-fun m!130625 () Bool)

(assert (=> bs!6642 m!130625))

(assert (=> start!17242 d!26934))

(declare-fun d!26936 () Bool)

(assert (=> d!26936 (= (inv!12 b2!98) (invariant!0 (currentBit!4281 b2!98) (currentByte!4286 b2!98) (size!1766 (buf!2156 b2!98))))))

(declare-fun bs!6643 () Bool)

(assert (= bs!6643 d!26936))

(declare-fun m!130627 () Bool)

(assert (=> bs!6643 m!130627))

(assert (=> start!17242 d!26936))

(declare-fun d!26938 () Bool)

(assert (=> d!26938 (= (array_inv!1612 (buf!2156 b1!98)) (bvsge (size!1766 (buf!2156 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83896 d!26938))

(declare-fun d!26940 () Bool)

(assert (=> d!26940 (= (array_inv!1612 (buf!2156 b2!98)) (bvsge (size!1766 (buf!2156 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83897 d!26940))

(declare-fun d!26942 () Bool)

(assert (=> d!26942 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1766 (buf!2156 b2!98))) ((_ sign_extend 32) (currentByte!4286 b2!98)) ((_ sign_extend 32) (currentBit!4281 b2!98)) (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1766 (buf!2156 b2!98))) ((_ sign_extend 32) (currentByte!4286 b2!98)) ((_ sign_extend 32) (currentBit!4281 b2!98))) (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)))))

(declare-fun bs!6644 () Bool)

(assert (= bs!6644 d!26942))

(assert (=> bs!6644 m!130545))

(assert (=> b!83898 d!26942))

(declare-fun d!26948 () Bool)

(assert (=> d!26948 (= (remainingBits!0 ((_ sign_extend 32) (size!1766 (buf!2156 b2!98))) ((_ sign_extend 32) (currentByte!4286 b2!98)) ((_ sign_extend 32) (currentBit!4281 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1766 (buf!2156 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4286 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4281 b2!98)))))))

(assert (=> b!83893 d!26948))

(declare-fun d!26950 () Bool)

(declare-fun lt!134001 () (_ BitVec 64))

(declare-fun lt!133998 () (_ BitVec 64))

(assert (=> d!26950 (= (remainingBits!0 ((_ sign_extend 32) (size!1766 (buf!2156 b2!98))) ((_ sign_extend 32) (currentByte!4286 b2!98)) ((_ sign_extend 32) (currentBit!4281 b2!98))) (bvsub lt!134001 lt!133998))))

(assert (=> d!26950 (or (= (bvand lt!134001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133998 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134001 lt!133998) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26950 (= lt!133998 (bitIndex!0 (size!1766 (buf!2156 b2!98)) (currentByte!4286 b2!98) (currentBit!4281 b2!98)))))

(declare-fun lt!133997 () (_ BitVec 64))

(declare-fun lt!133999 () (_ BitVec 64))

(assert (=> d!26950 (= lt!134001 (bvmul lt!133997 lt!133999))))

(assert (=> d!26950 (or (= lt!133997 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133999 (bvsdiv (bvmul lt!133997 lt!133999) lt!133997)))))

(assert (=> d!26950 (= lt!133999 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26950 (= lt!133997 ((_ sign_extend 32) (size!1766 (buf!2156 b2!98))))))

(declare-fun lt!134000 () Unit!5635)

(assert (=> d!26950 (= lt!134000 (choose!23 b2!98))))

(assert (=> d!26950 (= (remainingBitsBitIndexLemma!0 b2!98) lt!134000)))

(declare-fun bs!6645 () Bool)

(assert (= bs!6645 d!26950))

(assert (=> bs!6645 m!130545))

(assert (=> bs!6645 m!130553))

(declare-fun m!130633 () Bool)

(assert (=> bs!6645 m!130633))

(assert (=> b!83893 d!26950))

(declare-fun d!26956 () Bool)

(assert (=> d!26956 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1766 (buf!2156 b1!98))) ((_ sign_extend 32) (currentByte!4286 b1!98)) ((_ sign_extend 32) (currentBit!4281 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1766 (buf!2156 b1!98))) ((_ sign_extend 32) (currentByte!4286 b1!98)) ((_ sign_extend 32) (currentBit!4281 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6646 () Bool)

(assert (= bs!6646 d!26956))

(assert (=> bs!6646 m!130549))

(assert (=> b!83894 d!26956))

(declare-fun d!26958 () Bool)

(declare-fun e!56012 () Bool)

(assert (=> d!26958 e!56012))

(declare-fun res!69002 () Bool)

(assert (=> d!26958 (=> (not res!69002) (not e!56012))))

(declare-fun lt!134014 () (_ BitVec 64))

(declare-fun lt!134019 () (_ BitVec 64))

(declare-fun lt!134017 () (_ BitVec 64))

(assert (=> d!26958 (= res!69002 (= lt!134014 (bvsub lt!134017 lt!134019)))))

(assert (=> d!26958 (or (= (bvand lt!134017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134019 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134017 lt!134019) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26958 (= lt!134019 (remainingBits!0 ((_ sign_extend 32) (size!1766 (buf!2156 b2!98))) ((_ sign_extend 32) (currentByte!4286 b2!98)) ((_ sign_extend 32) (currentBit!4281 b2!98))))))

(declare-fun lt!134018 () (_ BitVec 64))

(declare-fun lt!134015 () (_ BitVec 64))

(assert (=> d!26958 (= lt!134017 (bvmul lt!134018 lt!134015))))

(assert (=> d!26958 (or (= lt!134018 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134015 (bvsdiv (bvmul lt!134018 lt!134015) lt!134018)))))

(assert (=> d!26958 (= lt!134015 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26958 (= lt!134018 ((_ sign_extend 32) (size!1766 (buf!2156 b2!98))))))

(assert (=> d!26958 (= lt!134014 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4286 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4281 b2!98))))))

(assert (=> d!26958 (invariant!0 (currentBit!4281 b2!98) (currentByte!4286 b2!98) (size!1766 (buf!2156 b2!98)))))

(assert (=> d!26958 (= (bitIndex!0 (size!1766 (buf!2156 b2!98)) (currentByte!4286 b2!98) (currentBit!4281 b2!98)) lt!134014)))

(declare-fun b!83965 () Bool)

(declare-fun res!69001 () Bool)

(assert (=> b!83965 (=> (not res!69001) (not e!56012))))

(assert (=> b!83965 (= res!69001 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134014))))

(declare-fun b!83966 () Bool)

(declare-fun lt!134016 () (_ BitVec 64))

(assert (=> b!83966 (= e!56012 (bvsle lt!134014 (bvmul lt!134016 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83966 (or (= lt!134016 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134016 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134016)))))

(assert (=> b!83966 (= lt!134016 ((_ sign_extend 32) (size!1766 (buf!2156 b2!98))))))

(assert (= (and d!26958 res!69002) b!83965))

(assert (= (and b!83965 res!69001) b!83966))

(assert (=> d!26958 m!130545))

(assert (=> d!26958 m!130627))

(assert (=> b!83899 d!26958))

(declare-fun d!26962 () Bool)

(declare-fun e!56013 () Bool)

(assert (=> d!26962 e!56013))

(declare-fun res!69004 () Bool)

(assert (=> d!26962 (=> (not res!69004) (not e!56013))))

(declare-fun lt!134020 () (_ BitVec 64))

(declare-fun lt!134023 () (_ BitVec 64))

(declare-fun lt!134025 () (_ BitVec 64))

(assert (=> d!26962 (= res!69004 (= lt!134020 (bvsub lt!134023 lt!134025)))))

(assert (=> d!26962 (or (= (bvand lt!134023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134025 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134023 lt!134025) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26962 (= lt!134025 (remainingBits!0 ((_ sign_extend 32) (size!1766 (buf!2156 b1!98))) ((_ sign_extend 32) (currentByte!4286 b1!98)) ((_ sign_extend 32) (currentBit!4281 b1!98))))))

(declare-fun lt!134024 () (_ BitVec 64))

(declare-fun lt!134021 () (_ BitVec 64))

(assert (=> d!26962 (= lt!134023 (bvmul lt!134024 lt!134021))))

(assert (=> d!26962 (or (= lt!134024 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134021 (bvsdiv (bvmul lt!134024 lt!134021) lt!134024)))))

(assert (=> d!26962 (= lt!134021 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26962 (= lt!134024 ((_ sign_extend 32) (size!1766 (buf!2156 b1!98))))))

(assert (=> d!26962 (= lt!134020 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4286 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4281 b1!98))))))

(assert (=> d!26962 (invariant!0 (currentBit!4281 b1!98) (currentByte!4286 b1!98) (size!1766 (buf!2156 b1!98)))))

(assert (=> d!26962 (= (bitIndex!0 (size!1766 (buf!2156 b1!98)) (currentByte!4286 b1!98) (currentBit!4281 b1!98)) lt!134020)))

(declare-fun b!83967 () Bool)

(declare-fun res!69003 () Bool)

(assert (=> b!83967 (=> (not res!69003) (not e!56013))))

(assert (=> b!83967 (= res!69003 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134020))))

(declare-fun b!83968 () Bool)

(declare-fun lt!134022 () (_ BitVec 64))

(assert (=> b!83968 (= e!56013 (bvsle lt!134020 (bvmul lt!134022 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83968 (or (= lt!134022 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134022 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134022)))))

(assert (=> b!83968 (= lt!134022 ((_ sign_extend 32) (size!1766 (buf!2156 b1!98))))))

(assert (= (and d!26962 res!69004) b!83967))

(assert (= (and b!83967 res!69003) b!83968))

(assert (=> d!26962 m!130549))

(assert (=> d!26962 m!130625))

(assert (=> b!83899 d!26962))

(push 1)

(assert (not d!26958))

(assert (not d!26936))

(assert (not d!26942))

(assert (not d!26934))

(assert (not d!26956))

(assert (not d!26950))

(assert (not d!26962))

(assert (not d!26932))

(check-sat)

(pop 1)

(push 1)

(check-sat)

