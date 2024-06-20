; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18528 () Bool)

(assert start!18528)

(declare-fun b!91924 () Bool)

(declare-fun e!60438 () Bool)

(declare-datatypes ((array!4301 0))(
  ( (array!4302 (arr!2572 (Array (_ BitVec 32) (_ BitVec 8))) (size!1941 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3432 0))(
  ( (BitStream!3433 (buf!2325 array!4301) (currentByte!4633 (_ BitVec 32)) (currentBit!4628 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3432)

(declare-fun array_inv!1781 (array!4301) Bool)

(assert (=> b!91924 (= e!60438 (array_inv!1781 (buf!2325 bitStream1!8)))))

(declare-fun b!91925 () Bool)

(declare-fun res!75896 () Bool)

(declare-fun e!60441 () Bool)

(assert (=> b!91925 (=> (not res!75896) (not e!60441))))

(declare-fun base!8 () BitStream!3432)

(declare-fun isPrefixOf!0 (BitStream!3432 BitStream!3432) Bool)

(assert (=> b!91925 (= res!75896 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!91926 () Bool)

(declare-fun e!60437 () Bool)

(assert (=> b!91926 (= e!60437 (array_inv!1781 (buf!2325 base!8)))))

(declare-fun b!91927 () Bool)

(declare-fun e!60435 () Bool)

(declare-fun bitStream2!8 () BitStream!3432)

(assert (=> b!91927 (= e!60435 (array_inv!1781 (buf!2325 bitStream2!8)))))

(declare-fun b!91928 () Bool)

(declare-fun res!75897 () Bool)

(assert (=> b!91928 (=> (not res!75897) (not e!60441))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91928 (= res!75897 (bvslt (bitIndex!0 (size!1941 (buf!2325 base!8)) (currentByte!4633 base!8) (currentBit!4628 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun res!75892 () Bool)

(assert (=> start!18528 (=> (not res!75892) (not e!60441))))

(assert (=> start!18528 (= res!75892 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18528 e!60441))

(assert (=> start!18528 true))

(declare-fun inv!12 (BitStream!3432) Bool)

(assert (=> start!18528 (and (inv!12 bitStream1!8) e!60438)))

(assert (=> start!18528 (and (inv!12 bitStream2!8) e!60435)))

(assert (=> start!18528 (and (inv!12 base!8) e!60437)))

(declare-fun b!91929 () Bool)

(declare-fun res!75894 () Bool)

(assert (=> b!91929 (=> (not res!75894) (not e!60441))))

(assert (=> b!91929 (= res!75894 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!91930 () Bool)

(declare-fun res!75895 () Bool)

(assert (=> b!91930 (=> (not res!75895) (not e!60441))))

(declare-datatypes ((List!822 0))(
  ( (Nil!819) (Cons!818 (h!937 Bool) (t!1572 List!822)) )
))
(declare-fun listBits!13 () List!822)

(declare-fun length!413 (List!822) Int)

(assert (=> b!91930 (= res!75895 (> (length!413 listBits!13) 0))))

(declare-fun b!91931 () Bool)

(declare-fun res!75893 () Bool)

(assert (=> b!91931 (=> (not res!75893) (not e!60441))))

(assert (=> b!91931 (= res!75893 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!91932 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91932 (= e!60441 (not (invariant!0 (currentBit!4628 bitStream2!8) (currentByte!4633 bitStream2!8) (size!1941 (buf!2325 bitStream2!8)))))))

(declare-fun b!91933 () Bool)

(declare-fun res!75898 () Bool)

(assert (=> b!91933 (=> (not res!75898) (not e!60441))))

(assert (=> b!91933 (= res!75898 (and (= (buf!2325 bitStream1!8) (buf!2325 bitStream2!8)) (= (buf!2325 bitStream1!8) (buf!2325 base!8))))))

(assert (= (and start!18528 res!75892) b!91930))

(assert (= (and b!91930 res!75895) b!91925))

(assert (= (and b!91925 res!75896) b!91929))

(assert (= (and b!91929 res!75894) b!91931))

(assert (= (and b!91931 res!75893) b!91933))

(assert (= (and b!91933 res!75898) b!91928))

(assert (= (and b!91928 res!75897) b!91932))

(assert (= start!18528 b!91924))

(assert (= start!18528 b!91927))

(assert (= start!18528 b!91926))

(declare-fun m!135995 () Bool)

(assert (=> b!91929 m!135995))

(declare-fun m!135997 () Bool)

(assert (=> b!91928 m!135997))

(declare-fun m!135999 () Bool)

(assert (=> b!91926 m!135999))

(declare-fun m!136001 () Bool)

(assert (=> b!91925 m!136001))

(declare-fun m!136003 () Bool)

(assert (=> start!18528 m!136003))

(declare-fun m!136005 () Bool)

(assert (=> start!18528 m!136005))

(declare-fun m!136007 () Bool)

(assert (=> start!18528 m!136007))

(declare-fun m!136009 () Bool)

(assert (=> b!91924 m!136009))

(declare-fun m!136011 () Bool)

(assert (=> b!91932 m!136011))

(declare-fun m!136013 () Bool)

(assert (=> b!91931 m!136013))

(declare-fun m!136015 () Bool)

(assert (=> b!91927 m!136015))

(declare-fun m!136017 () Bool)

(assert (=> b!91930 m!136017))

(check-sat (not b!91926) (not b!91929) (not b!91931) (not b!91927) (not b!91924) (not start!18528) (not b!91930) (not b!91928) (not b!91932) (not b!91925))
(check-sat)
(get-model)

(declare-fun d!28624 () Bool)

(declare-fun res!75926 () Bool)

(declare-fun e!60467 () Bool)

(assert (=> d!28624 (=> (not res!75926) (not e!60467))))

(assert (=> d!28624 (= res!75926 (= (size!1941 (buf!2325 bitStream1!8)) (size!1941 (buf!2325 bitStream2!8))))))

(assert (=> d!28624 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!60467)))

(declare-fun b!91970 () Bool)

(declare-fun res!75927 () Bool)

(assert (=> b!91970 (=> (not res!75927) (not e!60467))))

(assert (=> b!91970 (= res!75927 (bvsle (bitIndex!0 (size!1941 (buf!2325 bitStream1!8)) (currentByte!4633 bitStream1!8) (currentBit!4628 bitStream1!8)) (bitIndex!0 (size!1941 (buf!2325 bitStream2!8)) (currentByte!4633 bitStream2!8) (currentBit!4628 bitStream2!8))))))

(declare-fun b!91971 () Bool)

(declare-fun e!60468 () Bool)

(assert (=> b!91971 (= e!60467 e!60468)))

(declare-fun res!75928 () Bool)

(assert (=> b!91971 (=> res!75928 e!60468)))

(assert (=> b!91971 (= res!75928 (= (size!1941 (buf!2325 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!91972 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4301 array!4301 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91972 (= e!60468 (arrayBitRangesEq!0 (buf!2325 bitStream1!8) (buf!2325 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1941 (buf!2325 bitStream1!8)) (currentByte!4633 bitStream1!8) (currentBit!4628 bitStream1!8))))))

(assert (= (and d!28624 res!75926) b!91970))

(assert (= (and b!91970 res!75927) b!91971))

(assert (= (and b!91971 (not res!75928)) b!91972))

(declare-fun m!136043 () Bool)

(assert (=> b!91970 m!136043))

(declare-fun m!136045 () Bool)

(assert (=> b!91970 m!136045))

(assert (=> b!91972 m!136043))

(assert (=> b!91972 m!136043))

(declare-fun m!136047 () Bool)

(assert (=> b!91972 m!136047))

(assert (=> b!91931 d!28624))

(declare-fun d!28626 () Bool)

(assert (=> d!28626 (= (array_inv!1781 (buf!2325 base!8)) (bvsge (size!1941 (buf!2325 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!91926 d!28626))

(declare-fun d!28628 () Bool)

(assert (=> d!28628 (= (invariant!0 (currentBit!4628 bitStream2!8) (currentByte!4633 bitStream2!8) (size!1941 (buf!2325 bitStream2!8))) (and (bvsge (currentBit!4628 bitStream2!8) #b00000000000000000000000000000000) (bvslt (currentBit!4628 bitStream2!8) #b00000000000000000000000000001000) (bvsge (currentByte!4633 bitStream2!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4633 bitStream2!8) (size!1941 (buf!2325 bitStream2!8))) (and (= (currentBit!4628 bitStream2!8) #b00000000000000000000000000000000) (= (currentByte!4633 bitStream2!8) (size!1941 (buf!2325 bitStream2!8)))))))))

(assert (=> b!91932 d!28628))

(declare-fun d!28630 () Bool)

(assert (=> d!28630 (= (array_inv!1781 (buf!2325 bitStream2!8)) (bvsge (size!1941 (buf!2325 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!91927 d!28630))

(declare-fun d!28632 () Bool)

(declare-fun e!60471 () Bool)

(assert (=> d!28632 e!60471))

(declare-fun res!75934 () Bool)

(assert (=> d!28632 (=> (not res!75934) (not e!60471))))

(declare-fun lt!137992 () (_ BitVec 64))

(declare-fun lt!137989 () (_ BitVec 64))

(declare-fun lt!137994 () (_ BitVec 64))

(assert (=> d!28632 (= res!75934 (= lt!137992 (bvsub lt!137994 lt!137989)))))

(assert (=> d!28632 (or (= (bvand lt!137994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137989 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137994 lt!137989) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28632 (= lt!137989 (remainingBits!0 ((_ sign_extend 32) (size!1941 (buf!2325 base!8))) ((_ sign_extend 32) (currentByte!4633 base!8)) ((_ sign_extend 32) (currentBit!4628 base!8))))))

(declare-fun lt!137991 () (_ BitVec 64))

(declare-fun lt!137993 () (_ BitVec 64))

(assert (=> d!28632 (= lt!137994 (bvmul lt!137991 lt!137993))))

(assert (=> d!28632 (or (= lt!137991 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137993 (bvsdiv (bvmul lt!137991 lt!137993) lt!137991)))))

(assert (=> d!28632 (= lt!137993 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28632 (= lt!137991 ((_ sign_extend 32) (size!1941 (buf!2325 base!8))))))

(assert (=> d!28632 (= lt!137992 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4633 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4628 base!8))))))

(assert (=> d!28632 (invariant!0 (currentBit!4628 base!8) (currentByte!4633 base!8) (size!1941 (buf!2325 base!8)))))

(assert (=> d!28632 (= (bitIndex!0 (size!1941 (buf!2325 base!8)) (currentByte!4633 base!8) (currentBit!4628 base!8)) lt!137992)))

(declare-fun b!91977 () Bool)

(declare-fun res!75933 () Bool)

(assert (=> b!91977 (=> (not res!75933) (not e!60471))))

(assert (=> b!91977 (= res!75933 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137992))))

(declare-fun b!91978 () Bool)

(declare-fun lt!137990 () (_ BitVec 64))

(assert (=> b!91978 (= e!60471 (bvsle lt!137992 (bvmul lt!137990 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91978 (or (= lt!137990 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137990 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137990)))))

(assert (=> b!91978 (= lt!137990 ((_ sign_extend 32) (size!1941 (buf!2325 base!8))))))

(assert (= (and d!28632 res!75934) b!91977))

(assert (= (and b!91977 res!75933) b!91978))

(declare-fun m!136049 () Bool)

(assert (=> d!28632 m!136049))

(declare-fun m!136051 () Bool)

(assert (=> d!28632 m!136051))

(assert (=> b!91928 d!28632))

(declare-fun d!28638 () Bool)

(declare-fun res!75935 () Bool)

(declare-fun e!60472 () Bool)

(assert (=> d!28638 (=> (not res!75935) (not e!60472))))

(assert (=> d!28638 (= res!75935 (= (size!1941 (buf!2325 bitStream2!8)) (size!1941 (buf!2325 base!8))))))

(assert (=> d!28638 (= (isPrefixOf!0 bitStream2!8 base!8) e!60472)))

(declare-fun b!91979 () Bool)

(declare-fun res!75936 () Bool)

(assert (=> b!91979 (=> (not res!75936) (not e!60472))))

(assert (=> b!91979 (= res!75936 (bvsle (bitIndex!0 (size!1941 (buf!2325 bitStream2!8)) (currentByte!4633 bitStream2!8) (currentBit!4628 bitStream2!8)) (bitIndex!0 (size!1941 (buf!2325 base!8)) (currentByte!4633 base!8) (currentBit!4628 base!8))))))

(declare-fun b!91980 () Bool)

(declare-fun e!60473 () Bool)

(assert (=> b!91980 (= e!60472 e!60473)))

(declare-fun res!75937 () Bool)

(assert (=> b!91980 (=> res!75937 e!60473)))

(assert (=> b!91980 (= res!75937 (= (size!1941 (buf!2325 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!91981 () Bool)

(assert (=> b!91981 (= e!60473 (arrayBitRangesEq!0 (buf!2325 bitStream2!8) (buf!2325 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1941 (buf!2325 bitStream2!8)) (currentByte!4633 bitStream2!8) (currentBit!4628 bitStream2!8))))))

(assert (= (and d!28638 res!75935) b!91979))

(assert (= (and b!91979 res!75936) b!91980))

(assert (= (and b!91980 (not res!75937)) b!91981))

(assert (=> b!91979 m!136045))

(assert (=> b!91979 m!135997))

(assert (=> b!91981 m!136045))

(assert (=> b!91981 m!136045))

(declare-fun m!136053 () Bool)

(assert (=> b!91981 m!136053))

(assert (=> b!91929 d!28638))

(declare-fun d!28640 () Bool)

(assert (=> d!28640 (= (array_inv!1781 (buf!2325 bitStream1!8)) (bvsge (size!1941 (buf!2325 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!91924 d!28640))

(declare-fun d!28642 () Bool)

(declare-fun size!1943 (List!822) Int)

(assert (=> d!28642 (= (length!413 listBits!13) (size!1943 listBits!13))))

(declare-fun bs!7061 () Bool)

(assert (= bs!7061 d!28642))

(declare-fun m!136055 () Bool)

(assert (=> bs!7061 m!136055))

(assert (=> b!91930 d!28642))

(declare-fun d!28644 () Bool)

(assert (=> d!28644 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4628 bitStream1!8) (currentByte!4633 bitStream1!8) (size!1941 (buf!2325 bitStream1!8))))))

(declare-fun bs!7062 () Bool)

(assert (= bs!7062 d!28644))

(declare-fun m!136057 () Bool)

(assert (=> bs!7062 m!136057))

(assert (=> start!18528 d!28644))

(declare-fun d!28646 () Bool)

(assert (=> d!28646 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4628 bitStream2!8) (currentByte!4633 bitStream2!8) (size!1941 (buf!2325 bitStream2!8))))))

(declare-fun bs!7063 () Bool)

(assert (= bs!7063 d!28646))

(assert (=> bs!7063 m!136011))

(assert (=> start!18528 d!28646))

(declare-fun d!28648 () Bool)

(assert (=> d!28648 (= (inv!12 base!8) (invariant!0 (currentBit!4628 base!8) (currentByte!4633 base!8) (size!1941 (buf!2325 base!8))))))

(declare-fun bs!7064 () Bool)

(assert (= bs!7064 d!28648))

(assert (=> bs!7064 m!136051))

(assert (=> start!18528 d!28648))

(declare-fun d!28650 () Bool)

(declare-fun res!75938 () Bool)

(declare-fun e!60474 () Bool)

(assert (=> d!28650 (=> (not res!75938) (not e!60474))))

(assert (=> d!28650 (= res!75938 (= (size!1941 (buf!2325 bitStream1!8)) (size!1941 (buf!2325 base!8))))))

(assert (=> d!28650 (= (isPrefixOf!0 bitStream1!8 base!8) e!60474)))

(declare-fun b!91982 () Bool)

(declare-fun res!75939 () Bool)

(assert (=> b!91982 (=> (not res!75939) (not e!60474))))

(assert (=> b!91982 (= res!75939 (bvsle (bitIndex!0 (size!1941 (buf!2325 bitStream1!8)) (currentByte!4633 bitStream1!8) (currentBit!4628 bitStream1!8)) (bitIndex!0 (size!1941 (buf!2325 base!8)) (currentByte!4633 base!8) (currentBit!4628 base!8))))))

(declare-fun b!91983 () Bool)

(declare-fun e!60475 () Bool)

(assert (=> b!91983 (= e!60474 e!60475)))

(declare-fun res!75940 () Bool)

(assert (=> b!91983 (=> res!75940 e!60475)))

(assert (=> b!91983 (= res!75940 (= (size!1941 (buf!2325 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!91984 () Bool)

(assert (=> b!91984 (= e!60475 (arrayBitRangesEq!0 (buf!2325 bitStream1!8) (buf!2325 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1941 (buf!2325 bitStream1!8)) (currentByte!4633 bitStream1!8) (currentBit!4628 bitStream1!8))))))

(assert (= (and d!28650 res!75938) b!91982))

(assert (= (and b!91982 res!75939) b!91983))

(assert (= (and b!91983 (not res!75940)) b!91984))

(assert (=> b!91982 m!136043))

(assert (=> b!91982 m!135997))

(assert (=> b!91984 m!136043))

(assert (=> b!91984 m!136043))

(declare-fun m!136059 () Bool)

(assert (=> b!91984 m!136059))

(assert (=> b!91925 d!28650))

(check-sat (not b!91979) (not b!91972) (not d!28648) (not d!28642) (not d!28646) (not b!91982) (not b!91970) (not b!91984) (not d!28644) (not b!91981) (not d!28632))
