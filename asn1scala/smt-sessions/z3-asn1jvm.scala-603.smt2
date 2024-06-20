; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17244 () Bool)

(assert start!17244)

(declare-fun res!68961 () Bool)

(declare-fun e!55977 () Bool)

(assert (=> start!17244 (=> (not res!68961) (not e!55977))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3889 0))(
  ( (array!3890 (arr!2404 (Array (_ BitVec 32) (_ BitVec 8))) (size!1767 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3096 0))(
  ( (BitStream!3097 (buf!2157 array!3889) (currentByte!4287 (_ BitVec 32)) (currentBit!4282 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3096)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!3096)

(assert (=> start!17244 (= res!68961 (and (= (size!1767 (buf!2157 b1!98)) (size!1767 (buf!2157 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17244 e!55977))

(declare-fun e!55970 () Bool)

(declare-fun inv!12 (BitStream!3096) Bool)

(assert (=> start!17244 (and (inv!12 b1!98) e!55970)))

(declare-fun e!55976 () Bool)

(assert (=> start!17244 (and (inv!12 b2!98) e!55976)))

(assert (=> start!17244 true))

(declare-fun b!83914 () Bool)

(declare-fun e!55973 () Bool)

(declare-fun e!55972 () Bool)

(assert (=> b!83914 (= e!55973 e!55972)))

(declare-fun res!68964 () Bool)

(assert (=> b!83914 (=> res!68964 e!55972)))

(declare-fun lt!133862 () (_ BitVec 64))

(declare-fun lt!133863 () (_ BitVec 64))

(declare-fun lt!133866 () (_ BitVec 64))

(assert (=> b!83914 (= res!68964 (or (not (= lt!133862 (bvsub lt!133866 lt!133863))) (bvslt lt!133862 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1))))))

(declare-fun lt!133868 () (_ BitVec 64))

(assert (=> b!83914 (= lt!133862 (bvsub lt!133866 lt!133868))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83914 (= lt!133862 (remainingBits!0 ((_ sign_extend 32) (size!1767 (buf!2157 b2!98))) ((_ sign_extend 32) (currentByte!4287 b2!98)) ((_ sign_extend 32) (currentBit!4282 b2!98))))))

(assert (=> b!83914 (= lt!133866 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1767 (buf!2157 b2!98)))))))

(declare-datatypes ((Unit!5637 0))(
  ( (Unit!5638) )
))
(declare-fun lt!133864 () Unit!5637)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3096) Unit!5637)

(assert (=> b!83914 (= lt!133864 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83915 () Bool)

(declare-fun e!55975 () Bool)

(assert (=> b!83915 (= e!55977 e!55975)))

(declare-fun res!68962 () Bool)

(assert (=> b!83915 (=> (not res!68962) (not e!55975))))

(assert (=> b!83915 (= res!68962 (= lt!133863 lt!133868))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83915 (= lt!133868 (bitIndex!0 (size!1767 (buf!2157 b2!98)) (currentByte!4287 b2!98) (currentBit!4282 b2!98)))))

(declare-fun lt!133869 () (_ BitVec 64))

(assert (=> b!83915 (= lt!133863 (bvadd lt!133869 b1b2Diff!1))))

(assert (=> b!83915 (= lt!133869 (bitIndex!0 (size!1767 (buf!2157 b1!98)) (currentByte!4287 b1!98) (currentBit!4282 b1!98)))))

(declare-fun b!83916 () Bool)

(declare-fun array_inv!1613 (array!3889) Bool)

(assert (=> b!83916 (= e!55976 (array_inv!1613 (buf!2157 b2!98)))))

(declare-fun b!83917 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83917 (= e!55972 (validate_offset_bits!1 ((_ sign_extend 32) (size!1767 (buf!2157 b2!98))) ((_ sign_extend 32) (currentByte!4287 b2!98)) ((_ sign_extend 32) (currentBit!4282 b2!98)) (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)))))

(declare-fun b!83918 () Bool)

(assert (=> b!83918 (= e!55970 (array_inv!1613 (buf!2157 b1!98)))))

(declare-fun b!83919 () Bool)

(declare-fun res!68963 () Bool)

(assert (=> b!83919 (=> (not res!68963) (not e!55977))))

(assert (=> b!83919 (= res!68963 (validate_offset_bits!1 ((_ sign_extend 32) (size!1767 (buf!2157 b1!98))) ((_ sign_extend 32) (currentByte!4287 b1!98)) ((_ sign_extend 32) (currentBit!4282 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83920 () Bool)

(assert (=> b!83920 (= e!55975 (not e!55973))))

(declare-fun res!68965 () Bool)

(assert (=> b!83920 (=> res!68965 e!55973)))

(declare-fun lt!133865 () (_ BitVec 64))

(assert (=> b!83920 (= res!68965 (bvsgt lt!133869 (bvsub lt!133865 b1ValidateOffsetBits!11)))))

(assert (=> b!83920 (= (remainingBits!0 ((_ sign_extend 32) (size!1767 (buf!2157 b1!98))) ((_ sign_extend 32) (currentByte!4287 b1!98)) ((_ sign_extend 32) (currentBit!4282 b1!98))) (bvsub lt!133865 lt!133869))))

(assert (=> b!83920 (= lt!133865 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1767 (buf!2157 b1!98)))))))

(declare-fun lt!133867 () Unit!5637)

(assert (=> b!83920 (= lt!133867 (remainingBitsBitIndexLemma!0 b1!98))))

(assert (= (and start!17244 res!68961) b!83919))

(assert (= (and b!83919 res!68963) b!83915))

(assert (= (and b!83915 res!68962) b!83920))

(assert (= (and b!83920 (not res!68965)) b!83914))

(assert (= (and b!83914 (not res!68964)) b!83917))

(assert (= start!17244 b!83918))

(assert (= start!17244 b!83916))

(declare-fun m!130563 () Bool)

(assert (=> b!83914 m!130563))

(declare-fun m!130565 () Bool)

(assert (=> b!83914 m!130565))

(declare-fun m!130567 () Bool)

(assert (=> start!17244 m!130567))

(declare-fun m!130569 () Bool)

(assert (=> start!17244 m!130569))

(declare-fun m!130571 () Bool)

(assert (=> b!83920 m!130571))

(declare-fun m!130573 () Bool)

(assert (=> b!83920 m!130573))

(declare-fun m!130575 () Bool)

(assert (=> b!83919 m!130575))

(declare-fun m!130577 () Bool)

(assert (=> b!83916 m!130577))

(declare-fun m!130579 () Bool)

(assert (=> b!83918 m!130579))

(declare-fun m!130581 () Bool)

(assert (=> b!83917 m!130581))

(declare-fun m!130583 () Bool)

(assert (=> b!83915 m!130583))

(declare-fun m!130585 () Bool)

(assert (=> b!83915 m!130585))

(check-sat (not start!17244) (not b!83915) (not b!83914) (not b!83920) (not b!83917) (not b!83916) (not b!83919) (not b!83918))
(check-sat)
(get-model)

(declare-fun d!26892 () Bool)

(assert (=> d!26892 (= (array_inv!1613 (buf!2157 b2!98)) (bvsge (size!1767 (buf!2157 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83916 d!26892))

(declare-fun d!26894 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26894 (= (inv!12 b1!98) (invariant!0 (currentBit!4282 b1!98) (currentByte!4287 b1!98) (size!1767 (buf!2157 b1!98))))))

(declare-fun bs!6631 () Bool)

(assert (= bs!6631 d!26894))

(declare-fun m!130611 () Bool)

(assert (=> bs!6631 m!130611))

(assert (=> start!17244 d!26894))

(declare-fun d!26896 () Bool)

(assert (=> d!26896 (= (inv!12 b2!98) (invariant!0 (currentBit!4282 b2!98) (currentByte!4287 b2!98) (size!1767 (buf!2157 b2!98))))))

(declare-fun bs!6632 () Bool)

(assert (= bs!6632 d!26896))

(declare-fun m!130613 () Bool)

(assert (=> bs!6632 m!130613))

(assert (=> start!17244 d!26896))

(declare-fun d!26898 () Bool)

(assert (=> d!26898 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1767 (buf!2157 b2!98))) ((_ sign_extend 32) (currentByte!4287 b2!98)) ((_ sign_extend 32) (currentBit!4282 b2!98)) (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1767 (buf!2157 b2!98))) ((_ sign_extend 32) (currentByte!4287 b2!98)) ((_ sign_extend 32) (currentBit!4282 b2!98))) (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)))))

(declare-fun bs!6633 () Bool)

(assert (= bs!6633 d!26898))

(assert (=> bs!6633 m!130563))

(assert (=> b!83917 d!26898))

(declare-fun d!26900 () Bool)

(assert (=> d!26900 (= (array_inv!1613 (buf!2157 b1!98)) (bvsge (size!1767 (buf!2157 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83918 d!26900))

(declare-fun d!26902 () Bool)

(assert (=> d!26902 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1767 (buf!2157 b1!98))) ((_ sign_extend 32) (currentByte!4287 b1!98)) ((_ sign_extend 32) (currentBit!4282 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1767 (buf!2157 b1!98))) ((_ sign_extend 32) (currentByte!4287 b1!98)) ((_ sign_extend 32) (currentBit!4282 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6634 () Bool)

(assert (= bs!6634 d!26902))

(assert (=> bs!6634 m!130571))

(assert (=> b!83919 d!26902))

(declare-fun d!26904 () Bool)

(assert (=> d!26904 (= (remainingBits!0 ((_ sign_extend 32) (size!1767 (buf!2157 b2!98))) ((_ sign_extend 32) (currentByte!4287 b2!98)) ((_ sign_extend 32) (currentBit!4282 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1767 (buf!2157 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4287 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4282 b2!98)))))))

(assert (=> b!83914 d!26904))

(declare-fun d!26906 () Bool)

(declare-fun lt!133905 () (_ BitVec 64))

(declare-fun lt!133906 () (_ BitVec 64))

(assert (=> d!26906 (= (remainingBits!0 ((_ sign_extend 32) (size!1767 (buf!2157 b2!98))) ((_ sign_extend 32) (currentByte!4287 b2!98)) ((_ sign_extend 32) (currentBit!4282 b2!98))) (bvsub lt!133905 lt!133906))))

(assert (=> d!26906 (or (= (bvand lt!133905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133906 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133905 lt!133906) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26906 (= lt!133906 (bitIndex!0 (size!1767 (buf!2157 b2!98)) (currentByte!4287 b2!98) (currentBit!4282 b2!98)))))

(declare-fun lt!133908 () (_ BitVec 64))

(declare-fun lt!133907 () (_ BitVec 64))

(assert (=> d!26906 (= lt!133905 (bvmul lt!133908 lt!133907))))

(assert (=> d!26906 (or (= lt!133908 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133907 (bvsdiv (bvmul lt!133908 lt!133907) lt!133908)))))

(assert (=> d!26906 (= lt!133907 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26906 (= lt!133908 ((_ sign_extend 32) (size!1767 (buf!2157 b2!98))))))

(declare-fun lt!133904 () Unit!5637)

(declare-fun choose!23 (BitStream!3096) Unit!5637)

(assert (=> d!26906 (= lt!133904 (choose!23 b2!98))))

(assert (=> d!26906 (= (remainingBitsBitIndexLemma!0 b2!98) lt!133904)))

(declare-fun bs!6635 () Bool)

(assert (= bs!6635 d!26906))

(assert (=> bs!6635 m!130563))

(assert (=> bs!6635 m!130583))

(declare-fun m!130615 () Bool)

(assert (=> bs!6635 m!130615))

(assert (=> b!83914 d!26906))

(declare-fun d!26908 () Bool)

(declare-fun e!56004 () Bool)

(assert (=> d!26908 e!56004))

(declare-fun res!68985 () Bool)

(assert (=> d!26908 (=> (not res!68985) (not e!56004))))

(declare-fun lt!133925 () (_ BitVec 64))

(declare-fun lt!133924 () (_ BitVec 64))

(declare-fun lt!133923 () (_ BitVec 64))

(assert (=> d!26908 (= res!68985 (= lt!133925 (bvsub lt!133924 lt!133923)))))

(assert (=> d!26908 (or (= (bvand lt!133924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133923 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133924 lt!133923) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26908 (= lt!133923 (remainingBits!0 ((_ sign_extend 32) (size!1767 (buf!2157 b2!98))) ((_ sign_extend 32) (currentByte!4287 b2!98)) ((_ sign_extend 32) (currentBit!4282 b2!98))))))

(declare-fun lt!133922 () (_ BitVec 64))

(declare-fun lt!133921 () (_ BitVec 64))

(assert (=> d!26908 (= lt!133924 (bvmul lt!133922 lt!133921))))

(assert (=> d!26908 (or (= lt!133922 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133921 (bvsdiv (bvmul lt!133922 lt!133921) lt!133922)))))

(assert (=> d!26908 (= lt!133921 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26908 (= lt!133922 ((_ sign_extend 32) (size!1767 (buf!2157 b2!98))))))

(assert (=> d!26908 (= lt!133925 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4287 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4282 b2!98))))))

(assert (=> d!26908 (invariant!0 (currentBit!4282 b2!98) (currentByte!4287 b2!98) (size!1767 (buf!2157 b2!98)))))

(assert (=> d!26908 (= (bitIndex!0 (size!1767 (buf!2157 b2!98)) (currentByte!4287 b2!98) (currentBit!4282 b2!98)) lt!133925)))

(declare-fun b!83947 () Bool)

(declare-fun res!68986 () Bool)

(assert (=> b!83947 (=> (not res!68986) (not e!56004))))

(assert (=> b!83947 (= res!68986 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133925))))

(declare-fun b!83948 () Bool)

(declare-fun lt!133926 () (_ BitVec 64))

(assert (=> b!83948 (= e!56004 (bvsle lt!133925 (bvmul lt!133926 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83948 (or (= lt!133926 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133926 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133926)))))

(assert (=> b!83948 (= lt!133926 ((_ sign_extend 32) (size!1767 (buf!2157 b2!98))))))

(assert (= (and d!26908 res!68985) b!83947))

(assert (= (and b!83947 res!68986) b!83948))

(assert (=> d!26908 m!130563))

(assert (=> d!26908 m!130613))

(assert (=> b!83915 d!26908))

(declare-fun d!26910 () Bool)

(declare-fun e!56005 () Bool)

(assert (=> d!26910 e!56005))

(declare-fun res!68987 () Bool)

(assert (=> d!26910 (=> (not res!68987) (not e!56005))))

(declare-fun lt!133931 () (_ BitVec 64))

(declare-fun lt!133929 () (_ BitVec 64))

(declare-fun lt!133930 () (_ BitVec 64))

(assert (=> d!26910 (= res!68987 (= lt!133931 (bvsub lt!133930 lt!133929)))))

(assert (=> d!26910 (or (= (bvand lt!133930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133929 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133930 lt!133929) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26910 (= lt!133929 (remainingBits!0 ((_ sign_extend 32) (size!1767 (buf!2157 b1!98))) ((_ sign_extend 32) (currentByte!4287 b1!98)) ((_ sign_extend 32) (currentBit!4282 b1!98))))))

(declare-fun lt!133928 () (_ BitVec 64))

(declare-fun lt!133927 () (_ BitVec 64))

(assert (=> d!26910 (= lt!133930 (bvmul lt!133928 lt!133927))))

(assert (=> d!26910 (or (= lt!133928 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133927 (bvsdiv (bvmul lt!133928 lt!133927) lt!133928)))))

(assert (=> d!26910 (= lt!133927 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26910 (= lt!133928 ((_ sign_extend 32) (size!1767 (buf!2157 b1!98))))))

(assert (=> d!26910 (= lt!133931 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4287 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4282 b1!98))))))

(assert (=> d!26910 (invariant!0 (currentBit!4282 b1!98) (currentByte!4287 b1!98) (size!1767 (buf!2157 b1!98)))))

(assert (=> d!26910 (= (bitIndex!0 (size!1767 (buf!2157 b1!98)) (currentByte!4287 b1!98) (currentBit!4282 b1!98)) lt!133931)))

(declare-fun b!83949 () Bool)

(declare-fun res!68988 () Bool)

(assert (=> b!83949 (=> (not res!68988) (not e!56005))))

(assert (=> b!83949 (= res!68988 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133931))))

(declare-fun b!83950 () Bool)

(declare-fun lt!133932 () (_ BitVec 64))

(assert (=> b!83950 (= e!56005 (bvsle lt!133931 (bvmul lt!133932 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83950 (or (= lt!133932 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133932 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133932)))))

(assert (=> b!83950 (= lt!133932 ((_ sign_extend 32) (size!1767 (buf!2157 b1!98))))))

(assert (= (and d!26910 res!68987) b!83949))

(assert (= (and b!83949 res!68988) b!83950))

(assert (=> d!26910 m!130571))

(assert (=> d!26910 m!130611))

(assert (=> b!83915 d!26910))

(declare-fun d!26912 () Bool)

(assert (=> d!26912 (= (remainingBits!0 ((_ sign_extend 32) (size!1767 (buf!2157 b1!98))) ((_ sign_extend 32) (currentByte!4287 b1!98)) ((_ sign_extend 32) (currentBit!4282 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1767 (buf!2157 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4287 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4282 b1!98)))))))

(assert (=> b!83920 d!26912))

(declare-fun d!26914 () Bool)

(declare-fun lt!133934 () (_ BitVec 64))

(declare-fun lt!133935 () (_ BitVec 64))

(assert (=> d!26914 (= (remainingBits!0 ((_ sign_extend 32) (size!1767 (buf!2157 b1!98))) ((_ sign_extend 32) (currentByte!4287 b1!98)) ((_ sign_extend 32) (currentBit!4282 b1!98))) (bvsub lt!133934 lt!133935))))

(assert (=> d!26914 (or (= (bvand lt!133934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133935 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133934 lt!133935) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26914 (= lt!133935 (bitIndex!0 (size!1767 (buf!2157 b1!98)) (currentByte!4287 b1!98) (currentBit!4282 b1!98)))))

(declare-fun lt!133937 () (_ BitVec 64))

(declare-fun lt!133936 () (_ BitVec 64))

(assert (=> d!26914 (= lt!133934 (bvmul lt!133937 lt!133936))))

(assert (=> d!26914 (or (= lt!133937 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133936 (bvsdiv (bvmul lt!133937 lt!133936) lt!133937)))))

(assert (=> d!26914 (= lt!133936 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26914 (= lt!133937 ((_ sign_extend 32) (size!1767 (buf!2157 b1!98))))))

(declare-fun lt!133933 () Unit!5637)

(assert (=> d!26914 (= lt!133933 (choose!23 b1!98))))

(assert (=> d!26914 (= (remainingBitsBitIndexLemma!0 b1!98) lt!133933)))

(declare-fun bs!6636 () Bool)

(assert (= bs!6636 d!26914))

(assert (=> bs!6636 m!130571))

(assert (=> bs!6636 m!130585))

(declare-fun m!130617 () Bool)

(assert (=> bs!6636 m!130617))

(assert (=> b!83920 d!26914))

(check-sat (not d!26910) (not d!26906) (not d!26914) (not d!26898) (not d!26894) (not d!26896) (not d!26902) (not d!26908))
(check-sat)
