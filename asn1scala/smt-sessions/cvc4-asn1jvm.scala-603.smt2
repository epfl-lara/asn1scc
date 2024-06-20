; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17246 () Bool)

(assert start!17246)

(declare-fun b!83935 () Bool)

(declare-fun res!68979 () Bool)

(declare-fun e!55995 () Bool)

(assert (=> b!83935 (=> (not res!68979) (not e!55995))))

(declare-datatypes ((array!3891 0))(
  ( (array!3892 (arr!2405 (Array (_ BitVec 32) (_ BitVec 8))) (size!1768 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3098 0))(
  ( (BitStream!3099 (buf!2158 array!3891) (currentByte!4288 (_ BitVec 32)) (currentBit!4283 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3098)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83935 (= res!68979 (validate_offset_bits!1 ((_ sign_extend 32) (size!1768 (buf!2158 b1!98))) ((_ sign_extend 32) (currentByte!4288 b1!98)) ((_ sign_extend 32) (currentBit!4283 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83936 () Bool)

(declare-fun e!55997 () Bool)

(assert (=> b!83936 (= e!55995 e!55997)))

(declare-fun res!68977 () Bool)

(assert (=> b!83936 (=> (not res!68977) (not e!55997))))

(declare-fun lt!133893 () (_ BitVec 64))

(declare-fun lt!133891 () (_ BitVec 64))

(assert (=> b!83936 (= res!68977 (= lt!133893 lt!133891))))

(declare-fun b2!98 () BitStream!3098)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83936 (= lt!133891 (bitIndex!0 (size!1768 (buf!2158 b2!98)) (currentByte!4288 b2!98) (currentBit!4283 b2!98)))))

(declare-fun lt!133888 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!83936 (= lt!133893 (bvadd lt!133888 b1b2Diff!1))))

(assert (=> b!83936 (= lt!133888 (bitIndex!0 (size!1768 (buf!2158 b1!98)) (currentByte!4288 b1!98) (currentBit!4283 b1!98)))))

(declare-fun b!83937 () Bool)

(declare-fun e!55994 () Bool)

(declare-fun array_inv!1614 (array!3891) Bool)

(assert (=> b!83937 (= e!55994 (array_inv!1614 (buf!2158 b2!98)))))

(declare-fun b!83938 () Bool)

(declare-fun e!55996 () Bool)

(declare-fun e!56001 () Bool)

(assert (=> b!83938 (= e!55996 e!56001)))

(declare-fun res!68980 () Bool)

(assert (=> b!83938 (=> res!68980 e!56001)))

(declare-fun lt!133886 () (_ BitVec 64))

(declare-fun lt!133887 () (_ BitVec 64))

(assert (=> b!83938 (= res!68980 (or (not (= lt!133886 (bvsub lt!133887 lt!133893))) (bvslt lt!133886 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1))))))

(assert (=> b!83938 (= lt!133886 (bvsub lt!133887 lt!133891))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83938 (= lt!133886 (remainingBits!0 ((_ sign_extend 32) (size!1768 (buf!2158 b2!98))) ((_ sign_extend 32) (currentByte!4288 b2!98)) ((_ sign_extend 32) (currentBit!4283 b2!98))))))

(assert (=> b!83938 (= lt!133887 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1768 (buf!2158 b2!98)))))))

(declare-datatypes ((Unit!5639 0))(
  ( (Unit!5640) )
))
(declare-fun lt!133889 () Unit!5639)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3098) Unit!5639)

(assert (=> b!83938 (= lt!133889 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83939 () Bool)

(assert (=> b!83939 (= e!55997 (not e!55996))))

(declare-fun res!68976 () Bool)

(assert (=> b!83939 (=> res!68976 e!55996)))

(declare-fun lt!133890 () (_ BitVec 64))

(assert (=> b!83939 (= res!68976 (bvsgt lt!133888 (bvsub lt!133890 b1ValidateOffsetBits!11)))))

(assert (=> b!83939 (= (remainingBits!0 ((_ sign_extend 32) (size!1768 (buf!2158 b1!98))) ((_ sign_extend 32) (currentByte!4288 b1!98)) ((_ sign_extend 32) (currentBit!4283 b1!98))) (bvsub lt!133890 lt!133888))))

(assert (=> b!83939 (= lt!133890 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1768 (buf!2158 b1!98)))))))

(declare-fun lt!133892 () Unit!5639)

(assert (=> b!83939 (= lt!133892 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83940 () Bool)

(assert (=> b!83940 (= e!56001 (validate_offset_bits!1 ((_ sign_extend 32) (size!1768 (buf!2158 b2!98))) ((_ sign_extend 32) (currentByte!4288 b2!98)) ((_ sign_extend 32) (currentBit!4283 b2!98)) (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)))))

(declare-fun res!68978 () Bool)

(assert (=> start!17246 (=> (not res!68978) (not e!55995))))

(assert (=> start!17246 (= res!68978 (and (= (size!1768 (buf!2158 b1!98)) (size!1768 (buf!2158 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17246 e!55995))

(declare-fun e!55998 () Bool)

(declare-fun inv!12 (BitStream!3098) Bool)

(assert (=> start!17246 (and (inv!12 b1!98) e!55998)))

(assert (=> start!17246 (and (inv!12 b2!98) e!55994)))

(assert (=> start!17246 true))

(declare-fun b!83941 () Bool)

(assert (=> b!83941 (= e!55998 (array_inv!1614 (buf!2158 b1!98)))))

(assert (= (and start!17246 res!68978) b!83935))

(assert (= (and b!83935 res!68979) b!83936))

(assert (= (and b!83936 res!68977) b!83939))

(assert (= (and b!83939 (not res!68976)) b!83938))

(assert (= (and b!83938 (not res!68980)) b!83940))

(assert (= start!17246 b!83941))

(assert (= start!17246 b!83937))

(declare-fun m!130587 () Bool)

(assert (=> b!83939 m!130587))

(declare-fun m!130589 () Bool)

(assert (=> b!83939 m!130589))

(declare-fun m!130591 () Bool)

(assert (=> b!83941 m!130591))

(declare-fun m!130593 () Bool)

(assert (=> start!17246 m!130593))

(declare-fun m!130595 () Bool)

(assert (=> start!17246 m!130595))

(declare-fun m!130597 () Bool)

(assert (=> b!83936 m!130597))

(declare-fun m!130599 () Bool)

(assert (=> b!83936 m!130599))

(declare-fun m!130601 () Bool)

(assert (=> b!83937 m!130601))

(declare-fun m!130603 () Bool)

(assert (=> b!83935 m!130603))

(declare-fun m!130605 () Bool)

(assert (=> b!83938 m!130605))

(declare-fun m!130607 () Bool)

(assert (=> b!83938 m!130607))

(declare-fun m!130609 () Bool)

(assert (=> b!83940 m!130609))

(push 1)

(assert (not b!83936))

(assert (not b!83939))

(assert (not b!83937))

(assert (not b!83935))

(assert (not b!83941))

(assert (not b!83940))

(assert (not b!83938))

(assert (not start!17246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26916 () Bool)

(assert (=> d!26916 (= (remainingBits!0 ((_ sign_extend 32) (size!1768 (buf!2158 b2!98))) ((_ sign_extend 32) (currentByte!4288 b2!98)) ((_ sign_extend 32) (currentBit!4283 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1768 (buf!2158 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4288 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4283 b2!98)))))))

(assert (=> b!83938 d!26916))

(declare-fun d!26918 () Bool)

(declare-fun lt!133951 () (_ BitVec 64))

(declare-fun lt!133950 () (_ BitVec 64))

(assert (=> d!26918 (= (remainingBits!0 ((_ sign_extend 32) (size!1768 (buf!2158 b2!98))) ((_ sign_extend 32) (currentByte!4288 b2!98)) ((_ sign_extend 32) (currentBit!4283 b2!98))) (bvsub lt!133951 lt!133950))))

(assert (=> d!26918 (or (= (bvand lt!133951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133950 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133951 lt!133950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26918 (= lt!133950 (bitIndex!0 (size!1768 (buf!2158 b2!98)) (currentByte!4288 b2!98) (currentBit!4283 b2!98)))))

(declare-fun lt!133948 () (_ BitVec 64))

(declare-fun lt!133949 () (_ BitVec 64))

(assert (=> d!26918 (= lt!133951 (bvmul lt!133948 lt!133949))))

(assert (=> d!26918 (or (= lt!133948 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133949 (bvsdiv (bvmul lt!133948 lt!133949) lt!133948)))))

(assert (=> d!26918 (= lt!133949 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26918 (= lt!133948 ((_ sign_extend 32) (size!1768 (buf!2158 b2!98))))))

(declare-fun lt!133952 () Unit!5639)

(declare-fun choose!23 (BitStream!3098) Unit!5639)

(assert (=> d!26918 (= lt!133952 (choose!23 b2!98))))

(assert (=> d!26918 (= (remainingBitsBitIndexLemma!0 b2!98) lt!133952)))

(declare-fun bs!6637 () Bool)

(assert (= bs!6637 d!26918))

(assert (=> bs!6637 m!130605))

(assert (=> bs!6637 m!130597))

(declare-fun m!130619 () Bool)

(assert (=> bs!6637 m!130619))

(assert (=> b!83938 d!26918))

(declare-fun d!26920 () Bool)

(assert (=> d!26920 (= (remainingBits!0 ((_ sign_extend 32) (size!1768 (buf!2158 b1!98))) ((_ sign_extend 32) (currentByte!4288 b1!98)) ((_ sign_extend 32) (currentBit!4283 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1768 (buf!2158 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4288 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4283 b1!98)))))))

(assert (=> b!83939 d!26920))

(declare-fun d!26922 () Bool)

(declare-fun lt!133956 () (_ BitVec 64))

(declare-fun lt!133955 () (_ BitVec 64))

(assert (=> d!26922 (= (remainingBits!0 ((_ sign_extend 32) (size!1768 (buf!2158 b1!98))) ((_ sign_extend 32) (currentByte!4288 b1!98)) ((_ sign_extend 32) (currentBit!4283 b1!98))) (bvsub lt!133956 lt!133955))))

(assert (=> d!26922 (or (= (bvand lt!133956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133955 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133956 lt!133955) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26922 (= lt!133955 (bitIndex!0 (size!1768 (buf!2158 b1!98)) (currentByte!4288 b1!98) (currentBit!4283 b1!98)))))

(declare-fun lt!133953 () (_ BitVec 64))

(declare-fun lt!133954 () (_ BitVec 64))

(assert (=> d!26922 (= lt!133956 (bvmul lt!133953 lt!133954))))

(assert (=> d!26922 (or (= lt!133953 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133954 (bvsdiv (bvmul lt!133953 lt!133954) lt!133953)))))

(assert (=> d!26922 (= lt!133954 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26922 (= lt!133953 ((_ sign_extend 32) (size!1768 (buf!2158 b1!98))))))

(declare-fun lt!133957 () Unit!5639)

(assert (=> d!26922 (= lt!133957 (choose!23 b1!98))))

(assert (=> d!26922 (= (remainingBitsBitIndexLemma!0 b1!98) lt!133957)))

(declare-fun bs!6638 () Bool)

(assert (= bs!6638 d!26922))

(assert (=> bs!6638 m!130587))

(assert (=> bs!6638 m!130599))

(declare-fun m!130621 () Bool)

(assert (=> bs!6638 m!130621))

(assert (=> b!83939 d!26922))

(declare-fun d!26924 () Bool)

(assert (=> d!26924 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1768 (buf!2158 b2!98))) ((_ sign_extend 32) (currentByte!4288 b2!98)) ((_ sign_extend 32) (currentBit!4283 b2!98)) (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1768 (buf!2158 b2!98))) ((_ sign_extend 32) (currentByte!4288 b2!98)) ((_ sign_extend 32) (currentBit!4283 b2!98))) (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)))))

(declare-fun bs!6639 () Bool)

(assert (= bs!6639 d!26924))

(assert (=> bs!6639 m!130605))

(assert (=> b!83940 d!26924))

(declare-fun d!26926 () Bool)

(assert (=> d!26926 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1768 (buf!2158 b1!98))) ((_ sign_extend 32) (currentByte!4288 b1!98)) ((_ sign_extend 32) (currentBit!4283 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1768 (buf!2158 b1!98))) ((_ sign_extend 32) (currentByte!4288 b1!98)) ((_ sign_extend 32) (currentBit!4283 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6640 () Bool)

(assert (= bs!6640 d!26926))

(assert (=> bs!6640 m!130587))

(assert (=> b!83935 d!26926))

(declare-fun d!26928 () Bool)

(declare-fun e!56008 () Bool)

(assert (=> d!26928 e!56008))

(declare-fun res!68994 () Bool)

(assert (=> d!26928 (=> (not res!68994) (not e!56008))))

(declare-fun lt!133988 () (_ BitVec 64))

(declare-fun lt!133989 () (_ BitVec 64))

(declare-fun lt!133990 () (_ BitVec 64))

(assert (=> d!26928 (= res!68994 (= lt!133988 (bvsub lt!133990 lt!133989)))))

(assert (=> d!26928 (or (= (bvand lt!133990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133989 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133990 lt!133989) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26928 (= lt!133989 (remainingBits!0 ((_ sign_extend 32) (size!1768 (buf!2158 b2!98))) ((_ sign_extend 32) (currentByte!4288 b2!98)) ((_ sign_extend 32) (currentBit!4283 b2!98))))))

(declare-fun lt!133986 () (_ BitVec 64))

(declare-fun lt!133987 () (_ BitVec 64))

(assert (=> d!26928 (= lt!133990 (bvmul lt!133986 lt!133987))))

(assert (=> d!26928 (or (= lt!133986 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133987 (bvsdiv (bvmul lt!133986 lt!133987) lt!133986)))))

(assert (=> d!26928 (= lt!133987 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26928 (= lt!133986 ((_ sign_extend 32) (size!1768 (buf!2158 b2!98))))))

(assert (=> d!26928 (= lt!133988 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4288 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4283 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26928 (invariant!0 (currentBit!4283 b2!98) (currentByte!4288 b2!98) (size!1768 (buf!2158 b2!98)))))

(assert (=> d!26928 (= (bitIndex!0 (size!1768 (buf!2158 b2!98)) (currentByte!4288 b2!98) (currentBit!4283 b2!98)) lt!133988)))

(declare-fun b!83957 () Bool)

(declare-fun res!68993 () Bool)

(assert (=> b!83957 (=> (not res!68993) (not e!56008))))

(assert (=> b!83957 (= res!68993 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133988))))

(declare-fun b!83958 () Bool)

(declare-fun lt!133985 () (_ BitVec 64))

(assert (=> b!83958 (= e!56008 (bvsle lt!133988 (bvmul lt!133985 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83958 (or (= lt!133985 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133985 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133985)))))

(assert (=> b!83958 (= lt!133985 ((_ sign_extend 32) (size!1768 (buf!2158 b2!98))))))

(assert (= (and d!26928 res!68994) b!83957))

(assert (= (and b!83957 res!68993) b!83958))

(assert (=> d!26928 m!130605))

(declare-fun m!130629 () Bool)

(assert (=> d!26928 m!130629))

(assert (=> b!83936 d!26928))

(declare-fun d!26944 () Bool)

(declare-fun e!56009 () Bool)

(assert (=> d!26944 e!56009))

(declare-fun res!68996 () Bool)

(assert (=> d!26944 (=> (not res!68996) (not e!56009))))

(declare-fun lt!133995 () (_ BitVec 64))

(declare-fun lt!133996 () (_ BitVec 64))

(declare-fun lt!133994 () (_ BitVec 64))

(assert (=> d!26944 (= res!68996 (= lt!133994 (bvsub lt!133996 lt!133995)))))

(assert (=> d!26944 (or (= (bvand lt!133996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133995 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133996 lt!133995) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26944 (= lt!133995 (remainingBits!0 ((_ sign_extend 32) (size!1768 (buf!2158 b1!98))) ((_ sign_extend 32) (currentByte!4288 b1!98)) ((_ sign_extend 32) (currentBit!4283 b1!98))))))

(declare-fun lt!133992 () (_ BitVec 64))

(declare-fun lt!133993 () (_ BitVec 64))

(assert (=> d!26944 (= lt!133996 (bvmul lt!133992 lt!133993))))

(assert (=> d!26944 (or (= lt!133992 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133993 (bvsdiv (bvmul lt!133992 lt!133993) lt!133992)))))

(assert (=> d!26944 (= lt!133993 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26944 (= lt!133992 ((_ sign_extend 32) (size!1768 (buf!2158 b1!98))))))

(assert (=> d!26944 (= lt!133994 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4288 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4283 b1!98))))))

(assert (=> d!26944 (invariant!0 (currentBit!4283 b1!98) (currentByte!4288 b1!98) (size!1768 (buf!2158 b1!98)))))

(assert (=> d!26944 (= (bitIndex!0 (size!1768 (buf!2158 b1!98)) (currentByte!4288 b1!98) (currentBit!4283 b1!98)) lt!133994)))

(declare-fun b!83959 () Bool)

(declare-fun res!68995 () Bool)

(assert (=> b!83959 (=> (not res!68995) (not e!56009))))

(assert (=> b!83959 (= res!68995 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133994))))

(declare-fun b!83960 () Bool)

(declare-fun lt!133991 () (_ BitVec 64))

(assert (=> b!83960 (= e!56009 (bvsle lt!133994 (bvmul lt!133991 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83960 (or (= lt!133991 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133991 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133991)))))

(assert (=> b!83960 (= lt!133991 ((_ sign_extend 32) (size!1768 (buf!2158 b1!98))))))

(assert (= (and d!26944 res!68996) b!83959))

(assert (= (and b!83959 res!68995) b!83960))

(assert (=> d!26944 m!130587))

(declare-fun m!130631 () Bool)

(assert (=> d!26944 m!130631))

(assert (=> b!83936 d!26944))

(declare-fun d!26946 () Bool)

(assert (=> d!26946 (= (array_inv!1614 (buf!2158 b1!98)) (bvsge (size!1768 (buf!2158 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83941 d!26946))

(declare-fun d!26952 () Bool)

(assert (=> d!26952 (= (array_inv!1614 (buf!2158 b2!98)) (bvsge (size!1768 (buf!2158 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83937 d!26952))

(declare-fun d!26954 () Bool)

(assert (=> d!26954 (= (inv!12 b1!98) (invariant!0 (currentBit!4283 b1!98) (currentByte!4288 b1!98) (size!1768 (buf!2158 b1!98))))))

(declare-fun bs!6647 () Bool)

(assert (= bs!6647 d!26954))

(assert (=> bs!6647 m!130631))

(assert (=> start!17246 d!26954))

(declare-fun d!26960 () Bool)

(assert (=> d!26960 (= (inv!12 b2!98) (invariant!0 (currentBit!4283 b2!98) (currentByte!4288 b2!98) (size!1768 (buf!2158 b2!98))))))

(declare-fun bs!6648 () Bool)

(assert (= bs!6648 d!26960))

(assert (=> bs!6648 m!130629))

(assert (=> start!17246 d!26960))

(push 1)

(assert (not d!26922))

(assert (not d!26954))

(assert (not d!26926))

(assert (not d!26924))

(assert (not d!26928))

(assert (not d!26960))

(assert (not d!26918))

(assert (not d!26944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

