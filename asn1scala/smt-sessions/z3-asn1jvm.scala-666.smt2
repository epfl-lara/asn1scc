; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18724 () Bool)

(assert start!18724)

(declare-fun b!93038 () Bool)

(declare-fun res!76789 () Bool)

(declare-fun e!61117 () Bool)

(assert (=> b!93038 (=> (not res!76789) (not e!61117))))

(declare-datatypes ((array!4355 0))(
  ( (array!4356 (arr!2593 (Array (_ BitVec 32) (_ BitVec 8))) (size!1973 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3474 0))(
  ( (BitStream!3475 (buf!2346 array!4355) (currentByte!4679 (_ BitVec 32)) (currentBit!4674 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3474)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93038 (= res!76789 (validate_offset_bits!1 ((_ sign_extend 32) (size!1973 (buf!2346 bitStream1!8))) ((_ sign_extend 32) (currentByte!4679 bitStream1!8)) ((_ sign_extend 32) (currentBit!4674 bitStream1!8)) nBits!484))))

(declare-fun b!93039 () Bool)

(declare-fun res!76785 () Bool)

(assert (=> b!93039 (=> (not res!76785) (not e!61117))))

(declare-fun bitStream2!8 () BitStream!3474)

(assert (=> b!93039 (= res!76785 (and (bvsle ((_ sign_extend 32) (size!1973 (buf!2346 bitStream2!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4679 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4674 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1973 (buf!2346 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4679 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4674 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!93040 () Bool)

(declare-fun res!76794 () Bool)

(assert (=> b!93040 (=> (not res!76794) (not e!61117))))

(declare-fun base!8 () BitStream!3474)

(assert (=> b!93040 (= res!76794 (and (= (buf!2346 bitStream1!8) (buf!2346 bitStream2!8)) (= (buf!2346 bitStream1!8) (buf!2346 base!8))))))

(declare-fun b!93041 () Bool)

(declare-fun res!76792 () Bool)

(assert (=> b!93041 (=> (not res!76792) (not e!61117))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93041 (= res!76792 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1973 (buf!2346 bitStream1!8)) (currentByte!4679 bitStream1!8) (currentBit!4674 bitStream1!8))) (bitIndex!0 (size!1973 (buf!2346 bitStream2!8)) (currentByte!4679 bitStream2!8) (currentBit!4674 bitStream2!8))))))

(declare-fun b!93042 () Bool)

(declare-fun e!61119 () Bool)

(declare-fun array_inv!1802 (array!4355) Bool)

(assert (=> b!93042 (= e!61119 (array_inv!1802 (buf!2346 bitStream2!8)))))

(declare-fun b!93043 () Bool)

(declare-fun res!76791 () Bool)

(assert (=> b!93043 (=> (not res!76791) (not e!61117))))

(declare-fun isPrefixOf!0 (BitStream!3474 BitStream!3474) Bool)

(assert (=> b!93043 (= res!76791 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93044 () Bool)

(declare-fun res!76788 () Bool)

(assert (=> b!93044 (=> (not res!76788) (not e!61117))))

(declare-datatypes ((List!843 0))(
  ( (Nil!840) (Cons!839 (h!958 Bool) (t!1593 List!843)) )
))
(declare-fun listBits!13 () List!843)

(declare-fun length!434 (List!843) Int)

(assert (=> b!93044 (= res!76788 (> (length!434 listBits!13) 0))))

(declare-fun b!93045 () Bool)

(declare-fun res!76787 () Bool)

(assert (=> b!93045 (=> (not res!76787) (not e!61117))))

(assert (=> b!93045 (= res!76787 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93047 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!93047 (= e!61117 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4674 bitStream2!8))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4679 bitStream2!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1973 (buf!2346 bitStream2!8)))))))))

(declare-fun b!93048 () Bool)

(declare-fun e!61121 () Bool)

(assert (=> b!93048 (= e!61121 (array_inv!1802 (buf!2346 base!8)))))

(declare-fun b!93049 () Bool)

(declare-fun res!76793 () Bool)

(assert (=> b!93049 (=> (not res!76793) (not e!61117))))

(assert (=> b!93049 (= res!76793 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93050 () Bool)

(declare-fun e!61120 () Bool)

(assert (=> b!93050 (= e!61120 (array_inv!1802 (buf!2346 bitStream1!8)))))

(declare-fun b!93046 () Bool)

(declare-fun res!76790 () Bool)

(assert (=> b!93046 (=> (not res!76790) (not e!61117))))

(assert (=> b!93046 (= res!76790 (bvslt (bitIndex!0 (size!1973 (buf!2346 base!8)) (currentByte!4679 base!8) (currentBit!4674 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun res!76786 () Bool)

(assert (=> start!18724 (=> (not res!76786) (not e!61117))))

(assert (=> start!18724 (= res!76786 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18724 e!61117))

(assert (=> start!18724 true))

(declare-fun inv!12 (BitStream!3474) Bool)

(assert (=> start!18724 (and (inv!12 bitStream1!8) e!61120)))

(assert (=> start!18724 (and (inv!12 bitStream2!8) e!61119)))

(assert (=> start!18724 (and (inv!12 base!8) e!61121)))

(assert (= (and start!18724 res!76786) b!93044))

(assert (= (and b!93044 res!76788) b!93049))

(assert (= (and b!93049 res!76793) b!93045))

(assert (= (and b!93045 res!76787) b!93043))

(assert (= (and b!93043 res!76791) b!93040))

(assert (= (and b!93040 res!76794) b!93046))

(assert (= (and b!93046 res!76790) b!93041))

(assert (= (and b!93041 res!76792) b!93038))

(assert (= (and b!93038 res!76789) b!93039))

(assert (= (and b!93039 res!76785) b!93047))

(assert (= start!18724 b!93050))

(assert (= start!18724 b!93042))

(assert (= start!18724 b!93048))

(declare-fun m!136895 () Bool)

(assert (=> start!18724 m!136895))

(declare-fun m!136897 () Bool)

(assert (=> start!18724 m!136897))

(declare-fun m!136899 () Bool)

(assert (=> start!18724 m!136899))

(declare-fun m!136901 () Bool)

(assert (=> b!93048 m!136901))

(declare-fun m!136903 () Bool)

(assert (=> b!93045 m!136903))

(declare-fun m!136905 () Bool)

(assert (=> b!93043 m!136905))

(declare-fun m!136907 () Bool)

(assert (=> b!93046 m!136907))

(declare-fun m!136909 () Bool)

(assert (=> b!93049 m!136909))

(declare-fun m!136911 () Bool)

(assert (=> b!93041 m!136911))

(declare-fun m!136913 () Bool)

(assert (=> b!93041 m!136913))

(declare-fun m!136915 () Bool)

(assert (=> b!93044 m!136915))

(declare-fun m!136917 () Bool)

(assert (=> b!93038 m!136917))

(declare-fun m!136919 () Bool)

(assert (=> b!93042 m!136919))

(declare-fun m!136921 () Bool)

(assert (=> b!93047 m!136921))

(declare-fun m!136923 () Bool)

(assert (=> b!93050 m!136923))

(check-sat (not b!93050) (not b!93046) (not b!93047) (not b!93049) (not b!93041) (not b!93043) (not b!93044) (not b!93038) (not b!93045) (not b!93048) (not b!93042) (not start!18724))
(check-sat)
(get-model)

(declare-fun d!28996 () Bool)

(assert (=> d!28996 (= (array_inv!1802 (buf!2346 bitStream1!8)) (bvsge (size!1973 (buf!2346 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!93050 d!28996))

(declare-fun d!28998 () Bool)

(declare-fun e!61146 () Bool)

(assert (=> d!28998 e!61146))

(declare-fun res!76829 () Bool)

(assert (=> d!28998 (=> (not res!76829) (not e!61146))))

(declare-fun lt!138349 () (_ BitVec 64))

(declare-fun lt!138353 () (_ BitVec 64))

(declare-fun lt!138354 () (_ BitVec 64))

(assert (=> d!28998 (= res!76829 (= lt!138353 (bvsub lt!138354 lt!138349)))))

(assert (=> d!28998 (or (= (bvand lt!138354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138349 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138354 lt!138349) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28998 (= lt!138349 (remainingBits!0 ((_ sign_extend 32) (size!1973 (buf!2346 bitStream1!8))) ((_ sign_extend 32) (currentByte!4679 bitStream1!8)) ((_ sign_extend 32) (currentBit!4674 bitStream1!8))))))

(declare-fun lt!138352 () (_ BitVec 64))

(declare-fun lt!138350 () (_ BitVec 64))

(assert (=> d!28998 (= lt!138354 (bvmul lt!138352 lt!138350))))

(assert (=> d!28998 (or (= lt!138352 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138350 (bvsdiv (bvmul lt!138352 lt!138350) lt!138352)))))

(assert (=> d!28998 (= lt!138350 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28998 (= lt!138352 ((_ sign_extend 32) (size!1973 (buf!2346 bitStream1!8))))))

(assert (=> d!28998 (= lt!138353 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4679 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4674 bitStream1!8))))))

(assert (=> d!28998 (invariant!0 (currentBit!4674 bitStream1!8) (currentByte!4679 bitStream1!8) (size!1973 (buf!2346 bitStream1!8)))))

(assert (=> d!28998 (= (bitIndex!0 (size!1973 (buf!2346 bitStream1!8)) (currentByte!4679 bitStream1!8) (currentBit!4674 bitStream1!8)) lt!138353)))

(declare-fun b!93094 () Bool)

(declare-fun res!76830 () Bool)

(assert (=> b!93094 (=> (not res!76830) (not e!61146))))

(assert (=> b!93094 (= res!76830 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138353))))

(declare-fun b!93095 () Bool)

(declare-fun lt!138351 () (_ BitVec 64))

(assert (=> b!93095 (= e!61146 (bvsle lt!138353 (bvmul lt!138351 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93095 (or (= lt!138351 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138351 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138351)))))

(assert (=> b!93095 (= lt!138351 ((_ sign_extend 32) (size!1973 (buf!2346 bitStream1!8))))))

(assert (= (and d!28998 res!76829) b!93094))

(assert (= (and b!93094 res!76830) b!93095))

(declare-fun m!136955 () Bool)

(assert (=> d!28998 m!136955))

(declare-fun m!136957 () Bool)

(assert (=> d!28998 m!136957))

(assert (=> b!93041 d!28998))

(declare-fun d!29000 () Bool)

(declare-fun e!61147 () Bool)

(assert (=> d!29000 e!61147))

(declare-fun res!76831 () Bool)

(assert (=> d!29000 (=> (not res!76831) (not e!61147))))

(declare-fun lt!138355 () (_ BitVec 64))

(declare-fun lt!138360 () (_ BitVec 64))

(declare-fun lt!138359 () (_ BitVec 64))

(assert (=> d!29000 (= res!76831 (= lt!138359 (bvsub lt!138360 lt!138355)))))

(assert (=> d!29000 (or (= (bvand lt!138360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138355 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138360 lt!138355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29000 (= lt!138355 (remainingBits!0 ((_ sign_extend 32) (size!1973 (buf!2346 bitStream2!8))) ((_ sign_extend 32) (currentByte!4679 bitStream2!8)) ((_ sign_extend 32) (currentBit!4674 bitStream2!8))))))

(declare-fun lt!138358 () (_ BitVec 64))

(declare-fun lt!138356 () (_ BitVec 64))

(assert (=> d!29000 (= lt!138360 (bvmul lt!138358 lt!138356))))

(assert (=> d!29000 (or (= lt!138358 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138356 (bvsdiv (bvmul lt!138358 lt!138356) lt!138358)))))

(assert (=> d!29000 (= lt!138356 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29000 (= lt!138358 ((_ sign_extend 32) (size!1973 (buf!2346 bitStream2!8))))))

(assert (=> d!29000 (= lt!138359 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4679 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4674 bitStream2!8))))))

(assert (=> d!29000 (invariant!0 (currentBit!4674 bitStream2!8) (currentByte!4679 bitStream2!8) (size!1973 (buf!2346 bitStream2!8)))))

(assert (=> d!29000 (= (bitIndex!0 (size!1973 (buf!2346 bitStream2!8)) (currentByte!4679 bitStream2!8) (currentBit!4674 bitStream2!8)) lt!138359)))

(declare-fun b!93096 () Bool)

(declare-fun res!76832 () Bool)

(assert (=> b!93096 (=> (not res!76832) (not e!61147))))

(assert (=> b!93096 (= res!76832 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138359))))

(declare-fun b!93097 () Bool)

(declare-fun lt!138357 () (_ BitVec 64))

(assert (=> b!93097 (= e!61147 (bvsle lt!138359 (bvmul lt!138357 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93097 (or (= lt!138357 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138357 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138357)))))

(assert (=> b!93097 (= lt!138357 ((_ sign_extend 32) (size!1973 (buf!2346 bitStream2!8))))))

(assert (= (and d!29000 res!76831) b!93096))

(assert (= (and b!93096 res!76832) b!93097))

(declare-fun m!136959 () Bool)

(assert (=> d!29000 m!136959))

(declare-fun m!136961 () Bool)

(assert (=> d!29000 m!136961))

(assert (=> b!93041 d!29000))

(declare-fun d!29002 () Bool)

(assert (=> d!29002 (= (array_inv!1802 (buf!2346 base!8)) (bvsge (size!1973 (buf!2346 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!93048 d!29002))

(declare-fun d!29004 () Bool)

(assert (=> d!29004 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4674 bitStream2!8))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4679 bitStream2!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1973 (buf!2346 bitStream2!8))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4674 bitStream2!8))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4674 bitStream2!8))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4679 bitStream2!8))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4679 bitStream2!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1973 (buf!2346 bitStream2!8))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4674 bitStream2!8))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4679 bitStream2!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1973 (buf!2346 bitStream2!8)))))))))))

(assert (=> b!93047 d!29004))

(declare-fun d!29008 () Bool)

(declare-fun res!76840 () Bool)

(declare-fun e!61153 () Bool)

(assert (=> d!29008 (=> (not res!76840) (not e!61153))))

(assert (=> d!29008 (= res!76840 (= (size!1973 (buf!2346 bitStream1!8)) (size!1973 (buf!2346 base!8))))))

(assert (=> d!29008 (= (isPrefixOf!0 bitStream1!8 base!8) e!61153)))

(declare-fun b!93104 () Bool)

(declare-fun res!76841 () Bool)

(assert (=> b!93104 (=> (not res!76841) (not e!61153))))

(assert (=> b!93104 (= res!76841 (bvsle (bitIndex!0 (size!1973 (buf!2346 bitStream1!8)) (currentByte!4679 bitStream1!8) (currentBit!4674 bitStream1!8)) (bitIndex!0 (size!1973 (buf!2346 base!8)) (currentByte!4679 base!8) (currentBit!4674 base!8))))))

(declare-fun b!93105 () Bool)

(declare-fun e!61152 () Bool)

(assert (=> b!93105 (= e!61153 e!61152)))

(declare-fun res!76839 () Bool)

(assert (=> b!93105 (=> res!76839 e!61152)))

(assert (=> b!93105 (= res!76839 (= (size!1973 (buf!2346 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!93106 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4355 array!4355 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93106 (= e!61152 (arrayBitRangesEq!0 (buf!2346 bitStream1!8) (buf!2346 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1973 (buf!2346 bitStream1!8)) (currentByte!4679 bitStream1!8) (currentBit!4674 bitStream1!8))))))

(assert (= (and d!29008 res!76840) b!93104))

(assert (= (and b!93104 res!76841) b!93105))

(assert (= (and b!93105 (not res!76839)) b!93106))

(assert (=> b!93104 m!136911))

(assert (=> b!93104 m!136907))

(assert (=> b!93106 m!136911))

(assert (=> b!93106 m!136911))

(declare-fun m!136963 () Bool)

(assert (=> b!93106 m!136963))

(assert (=> b!93049 d!29008))

(declare-fun d!29010 () Bool)

(assert (=> d!29010 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1973 (buf!2346 bitStream1!8))) ((_ sign_extend 32) (currentByte!4679 bitStream1!8)) ((_ sign_extend 32) (currentBit!4674 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1973 (buf!2346 bitStream1!8))) ((_ sign_extend 32) (currentByte!4679 bitStream1!8)) ((_ sign_extend 32) (currentBit!4674 bitStream1!8))) nBits!484))))

(declare-fun bs!7133 () Bool)

(assert (= bs!7133 d!29010))

(assert (=> bs!7133 m!136955))

(assert (=> b!93038 d!29010))

(declare-fun d!29012 () Bool)

(declare-fun res!76843 () Bool)

(declare-fun e!61155 () Bool)

(assert (=> d!29012 (=> (not res!76843) (not e!61155))))

(assert (=> d!29012 (= res!76843 (= (size!1973 (buf!2346 bitStream2!8)) (size!1973 (buf!2346 base!8))))))

(assert (=> d!29012 (= (isPrefixOf!0 bitStream2!8 base!8) e!61155)))

(declare-fun b!93107 () Bool)

(declare-fun res!76844 () Bool)

(assert (=> b!93107 (=> (not res!76844) (not e!61155))))

(assert (=> b!93107 (= res!76844 (bvsle (bitIndex!0 (size!1973 (buf!2346 bitStream2!8)) (currentByte!4679 bitStream2!8) (currentBit!4674 bitStream2!8)) (bitIndex!0 (size!1973 (buf!2346 base!8)) (currentByte!4679 base!8) (currentBit!4674 base!8))))))

(declare-fun b!93108 () Bool)

(declare-fun e!61154 () Bool)

(assert (=> b!93108 (= e!61155 e!61154)))

(declare-fun res!76842 () Bool)

(assert (=> b!93108 (=> res!76842 e!61154)))

(assert (=> b!93108 (= res!76842 (= (size!1973 (buf!2346 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!93109 () Bool)

(assert (=> b!93109 (= e!61154 (arrayBitRangesEq!0 (buf!2346 bitStream2!8) (buf!2346 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1973 (buf!2346 bitStream2!8)) (currentByte!4679 bitStream2!8) (currentBit!4674 bitStream2!8))))))

(assert (= (and d!29012 res!76843) b!93107))

(assert (= (and b!93107 res!76844) b!93108))

(assert (= (and b!93108 (not res!76842)) b!93109))

(assert (=> b!93107 m!136913))

(assert (=> b!93107 m!136907))

(assert (=> b!93109 m!136913))

(assert (=> b!93109 m!136913))

(declare-fun m!136965 () Bool)

(assert (=> b!93109 m!136965))

(assert (=> b!93045 d!29012))

(declare-fun d!29014 () Bool)

(assert (=> d!29014 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4674 bitStream1!8) (currentByte!4679 bitStream1!8) (size!1973 (buf!2346 bitStream1!8))))))

(declare-fun bs!7134 () Bool)

(assert (= bs!7134 d!29014))

(assert (=> bs!7134 m!136957))

(assert (=> start!18724 d!29014))

(declare-fun d!29016 () Bool)

(assert (=> d!29016 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4674 bitStream2!8) (currentByte!4679 bitStream2!8) (size!1973 (buf!2346 bitStream2!8))))))

(declare-fun bs!7135 () Bool)

(assert (= bs!7135 d!29016))

(assert (=> bs!7135 m!136961))

(assert (=> start!18724 d!29016))

(declare-fun d!29018 () Bool)

(assert (=> d!29018 (= (inv!12 base!8) (invariant!0 (currentBit!4674 base!8) (currentByte!4679 base!8) (size!1973 (buf!2346 base!8))))))

(declare-fun bs!7136 () Bool)

(assert (= bs!7136 d!29018))

(declare-fun m!136967 () Bool)

(assert (=> bs!7136 m!136967))

(assert (=> start!18724 d!29018))

(declare-fun d!29020 () Bool)

(declare-fun e!61156 () Bool)

(assert (=> d!29020 e!61156))

(declare-fun res!76845 () Bool)

(assert (=> d!29020 (=> (not res!76845) (not e!61156))))

(declare-fun lt!138361 () (_ BitVec 64))

(declare-fun lt!138365 () (_ BitVec 64))

(declare-fun lt!138366 () (_ BitVec 64))

(assert (=> d!29020 (= res!76845 (= lt!138365 (bvsub lt!138366 lt!138361)))))

(assert (=> d!29020 (or (= (bvand lt!138366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138361 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138366 lt!138361) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29020 (= lt!138361 (remainingBits!0 ((_ sign_extend 32) (size!1973 (buf!2346 base!8))) ((_ sign_extend 32) (currentByte!4679 base!8)) ((_ sign_extend 32) (currentBit!4674 base!8))))))

(declare-fun lt!138364 () (_ BitVec 64))

(declare-fun lt!138362 () (_ BitVec 64))

(assert (=> d!29020 (= lt!138366 (bvmul lt!138364 lt!138362))))

(assert (=> d!29020 (or (= lt!138364 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138362 (bvsdiv (bvmul lt!138364 lt!138362) lt!138364)))))

(assert (=> d!29020 (= lt!138362 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29020 (= lt!138364 ((_ sign_extend 32) (size!1973 (buf!2346 base!8))))))

(assert (=> d!29020 (= lt!138365 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4679 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4674 base!8))))))

(assert (=> d!29020 (invariant!0 (currentBit!4674 base!8) (currentByte!4679 base!8) (size!1973 (buf!2346 base!8)))))

(assert (=> d!29020 (= (bitIndex!0 (size!1973 (buf!2346 base!8)) (currentByte!4679 base!8) (currentBit!4674 base!8)) lt!138365)))

(declare-fun b!93110 () Bool)

(declare-fun res!76846 () Bool)

(assert (=> b!93110 (=> (not res!76846) (not e!61156))))

(assert (=> b!93110 (= res!76846 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138365))))

(declare-fun b!93111 () Bool)

(declare-fun lt!138363 () (_ BitVec 64))

(assert (=> b!93111 (= e!61156 (bvsle lt!138365 (bvmul lt!138363 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93111 (or (= lt!138363 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138363 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138363)))))

(assert (=> b!93111 (= lt!138363 ((_ sign_extend 32) (size!1973 (buf!2346 base!8))))))

(assert (= (and d!29020 res!76845) b!93110))

(assert (= (and b!93110 res!76846) b!93111))

(declare-fun m!136969 () Bool)

(assert (=> d!29020 m!136969))

(assert (=> d!29020 m!136967))

(assert (=> b!93046 d!29020))

(declare-fun d!29022 () Bool)

(assert (=> d!29022 (= (array_inv!1802 (buf!2346 bitStream2!8)) (bvsge (size!1973 (buf!2346 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!93042 d!29022))

(declare-fun d!29024 () Bool)

(declare-fun size!1975 (List!843) Int)

(assert (=> d!29024 (= (length!434 listBits!13) (size!1975 listBits!13))))

(declare-fun bs!7137 () Bool)

(assert (= bs!7137 d!29024))

(declare-fun m!136971 () Bool)

(assert (=> bs!7137 m!136971))

(assert (=> b!93044 d!29024))

(declare-fun d!29026 () Bool)

(declare-fun res!76848 () Bool)

(declare-fun e!61158 () Bool)

(assert (=> d!29026 (=> (not res!76848) (not e!61158))))

(assert (=> d!29026 (= res!76848 (= (size!1973 (buf!2346 bitStream1!8)) (size!1973 (buf!2346 bitStream2!8))))))

(assert (=> d!29026 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61158)))

(declare-fun b!93112 () Bool)

(declare-fun res!76849 () Bool)

(assert (=> b!93112 (=> (not res!76849) (not e!61158))))

(assert (=> b!93112 (= res!76849 (bvsle (bitIndex!0 (size!1973 (buf!2346 bitStream1!8)) (currentByte!4679 bitStream1!8) (currentBit!4674 bitStream1!8)) (bitIndex!0 (size!1973 (buf!2346 bitStream2!8)) (currentByte!4679 bitStream2!8) (currentBit!4674 bitStream2!8))))))

(declare-fun b!93113 () Bool)

(declare-fun e!61157 () Bool)

(assert (=> b!93113 (= e!61158 e!61157)))

(declare-fun res!76847 () Bool)

(assert (=> b!93113 (=> res!76847 e!61157)))

(assert (=> b!93113 (= res!76847 (= (size!1973 (buf!2346 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!93114 () Bool)

(assert (=> b!93114 (= e!61157 (arrayBitRangesEq!0 (buf!2346 bitStream1!8) (buf!2346 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1973 (buf!2346 bitStream1!8)) (currentByte!4679 bitStream1!8) (currentBit!4674 bitStream1!8))))))

(assert (= (and d!29026 res!76848) b!93112))

(assert (= (and b!93112 res!76849) b!93113))

(assert (= (and b!93113 (not res!76847)) b!93114))

(assert (=> b!93112 m!136911))

(assert (=> b!93112 m!136913))

(assert (=> b!93114 m!136911))

(assert (=> b!93114 m!136911))

(declare-fun m!136973 () Bool)

(assert (=> b!93114 m!136973))

(assert (=> b!93043 d!29026))

(check-sat (not d!29024) (not d!29000) (not d!29020) (not b!93109) (not b!93104) (not d!29018) (not d!29016) (not b!93106) (not b!93112) (not d!29014) (not d!29010) (not b!93107) (not d!28998) (not b!93114))
