; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18526 () Bool)

(assert start!18526)

(declare-fun b!91894 () Bool)

(declare-fun e!60418 () Bool)

(declare-datatypes ((array!4299 0))(
  ( (array!4300 (arr!2571 (Array (_ BitVec 32) (_ BitVec 8))) (size!1940 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3430 0))(
  ( (BitStream!3431 (buf!2324 array!4299) (currentByte!4632 (_ BitVec 32)) (currentBit!4627 (_ BitVec 32))) )
))
(declare-fun base!8 () BitStream!3430)

(declare-fun array_inv!1780 (array!4299) Bool)

(assert (=> b!91894 (= e!60418 (array_inv!1780 (buf!2324 base!8)))))

(declare-fun b!91895 () Bool)

(declare-fun res!75874 () Bool)

(declare-fun e!60419 () Bool)

(assert (=> b!91895 (=> (not res!75874) (not e!60419))))

(declare-fun bitStream2!8 () BitStream!3430)

(declare-fun isPrefixOf!0 (BitStream!3430 BitStream!3430) Bool)

(assert (=> b!91895 (= res!75874 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!91896 () Bool)

(declare-fun res!75873 () Bool)

(assert (=> b!91896 (=> (not res!75873) (not e!60419))))

(declare-fun bitStream1!8 () BitStream!3430)

(assert (=> b!91896 (= res!75873 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!91897 () Bool)

(declare-fun e!60417 () Bool)

(assert (=> b!91897 (= e!60417 (array_inv!1780 (buf!2324 bitStream2!8)))))

(declare-fun b!91898 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91898 (= e!60419 (not (invariant!0 (currentBit!4627 bitStream2!8) (currentByte!4632 bitStream2!8) (size!1940 (buf!2324 bitStream2!8)))))))

(declare-fun b!91899 () Bool)

(declare-fun res!75877 () Bool)

(assert (=> b!91899 (=> (not res!75877) (not e!60419))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91899 (= res!75877 (bvslt (bitIndex!0 (size!1940 (buf!2324 base!8)) (currentByte!4632 base!8) (currentBit!4627 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!91901 () Bool)

(declare-fun e!60415 () Bool)

(assert (=> b!91901 (= e!60415 (array_inv!1780 (buf!2324 bitStream1!8)))))

(declare-fun b!91902 () Bool)

(declare-fun res!75875 () Bool)

(assert (=> b!91902 (=> (not res!75875) (not e!60419))))

(assert (=> b!91902 (= res!75875 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!91903 () Bool)

(declare-fun res!75872 () Bool)

(assert (=> b!91903 (=> (not res!75872) (not e!60419))))

(assert (=> b!91903 (= res!75872 (and (= (buf!2324 bitStream1!8) (buf!2324 bitStream2!8)) (= (buf!2324 bitStream1!8) (buf!2324 base!8))))))

(declare-fun res!75876 () Bool)

(assert (=> start!18526 (=> (not res!75876) (not e!60419))))

(assert (=> start!18526 (= res!75876 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18526 e!60419))

(assert (=> start!18526 true))

(declare-fun inv!12 (BitStream!3430) Bool)

(assert (=> start!18526 (and (inv!12 bitStream1!8) e!60415)))

(assert (=> start!18526 (and (inv!12 bitStream2!8) e!60417)))

(assert (=> start!18526 (and (inv!12 base!8) e!60418)))

(declare-fun b!91900 () Bool)

(declare-fun res!75871 () Bool)

(assert (=> b!91900 (=> (not res!75871) (not e!60419))))

(declare-datatypes ((List!821 0))(
  ( (Nil!818) (Cons!817 (h!936 Bool) (t!1571 List!821)) )
))
(declare-fun listBits!13 () List!821)

(declare-fun length!412 (List!821) Int)

(assert (=> b!91900 (= res!75871 (> (length!412 listBits!13) 0))))

(assert (= (and start!18526 res!75876) b!91900))

(assert (= (and b!91900 res!75871) b!91896))

(assert (= (and b!91896 res!75873) b!91895))

(assert (= (and b!91895 res!75874) b!91902))

(assert (= (and b!91902 res!75875) b!91903))

(assert (= (and b!91903 res!75872) b!91899))

(assert (= (and b!91899 res!75877) b!91898))

(assert (= start!18526 b!91901))

(assert (= start!18526 b!91897))

(assert (= start!18526 b!91894))

(declare-fun m!135971 () Bool)

(assert (=> b!91897 m!135971))

(declare-fun m!135973 () Bool)

(assert (=> b!91899 m!135973))

(declare-fun m!135975 () Bool)

(assert (=> b!91895 m!135975))

(declare-fun m!135977 () Bool)

(assert (=> b!91894 m!135977))

(declare-fun m!135979 () Bool)

(assert (=> b!91896 m!135979))

(declare-fun m!135981 () Bool)

(assert (=> b!91898 m!135981))

(declare-fun m!135983 () Bool)

(assert (=> b!91901 m!135983))

(declare-fun m!135985 () Bool)

(assert (=> start!18526 m!135985))

(declare-fun m!135987 () Bool)

(assert (=> start!18526 m!135987))

(declare-fun m!135989 () Bool)

(assert (=> start!18526 m!135989))

(declare-fun m!135991 () Bool)

(assert (=> b!91902 m!135991))

(declare-fun m!135993 () Bool)

(assert (=> b!91900 m!135993))

(push 1)

(assert (not b!91900))

(assert (not b!91902))

(assert (not start!18526))

(assert (not b!91898))

(assert (not b!91901))

(assert (not b!91896))

(assert (not b!91897))

(assert (not b!91894))

(assert (not b!91899))

(assert (not b!91895))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28634 () Bool)

(assert (=> d!28634 (= (invariant!0 (currentBit!4627 bitStream2!8) (currentByte!4632 bitStream2!8) (size!1940 (buf!2324 bitStream2!8))) (and (bvsge (currentBit!4627 bitStream2!8) #b00000000000000000000000000000000) (bvslt (currentBit!4627 bitStream2!8) #b00000000000000000000000000001000) (bvsge (currentByte!4632 bitStream2!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4632 bitStream2!8) (size!1940 (buf!2324 bitStream2!8))) (and (= (currentBit!4627 bitStream2!8) #b00000000000000000000000000000000) (= (currentByte!4632 bitStream2!8) (size!1940 (buf!2324 bitStream2!8)))))))))

(assert (=> b!91898 d!28634))

(declare-fun d!28636 () Bool)

(declare-fun e!60478 () Bool)

(assert (=> d!28636 e!60478))

(declare-fun res!75946 () Bool)

(assert (=> d!28636 (=> (not res!75946) (not e!60478))))

(declare-fun lt!138007 () (_ BitVec 64))

(declare-fun lt!138008 () (_ BitVec 64))

(declare-fun lt!138010 () (_ BitVec 64))

(assert (=> d!28636 (= res!75946 (= lt!138010 (bvsub lt!138008 lt!138007)))))

(assert (=> d!28636 (or (= (bvand lt!138008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138008 lt!138007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28636 (= lt!138007 (remainingBits!0 ((_ sign_extend 32) (size!1940 (buf!2324 base!8))) ((_ sign_extend 32) (currentByte!4632 base!8)) ((_ sign_extend 32) (currentBit!4627 base!8))))))

(declare-fun lt!138011 () (_ BitVec 64))

(declare-fun lt!138012 () (_ BitVec 64))

(assert (=> d!28636 (= lt!138008 (bvmul lt!138011 lt!138012))))

(assert (=> d!28636 (or (= lt!138011 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138012 (bvsdiv (bvmul lt!138011 lt!138012) lt!138011)))))

(assert (=> d!28636 (= lt!138012 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28636 (= lt!138011 ((_ sign_extend 32) (size!1940 (buf!2324 base!8))))))

(assert (=> d!28636 (= lt!138010 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4632 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4627 base!8))))))

(assert (=> d!28636 (invariant!0 (currentBit!4627 base!8) (currentByte!4632 base!8) (size!1940 (buf!2324 base!8)))))

(assert (=> d!28636 (= (bitIndex!0 (size!1940 (buf!2324 base!8)) (currentByte!4632 base!8) (currentBit!4627 base!8)) lt!138010)))

(declare-fun b!91989 () Bool)

(declare-fun res!75945 () Bool)

(assert (=> b!91989 (=> (not res!75945) (not e!60478))))

(assert (=> b!91989 (= res!75945 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138010))))

(declare-fun b!91990 () Bool)

(declare-fun lt!138009 () (_ BitVec 64))

(assert (=> b!91990 (= e!60478 (bvsle lt!138010 (bvmul lt!138009 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91990 (or (= lt!138009 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138009 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138009)))))

(assert (=> b!91990 (= lt!138009 ((_ sign_extend 32) (size!1940 (buf!2324 base!8))))))

(assert (= (and d!28636 res!75946) b!91989))

(assert (= (and b!91989 res!75945) b!91990))

(declare-fun m!136061 () Bool)

(assert (=> d!28636 m!136061))

(declare-fun m!136063 () Bool)

(assert (=> d!28636 m!136063))

(assert (=> b!91899 d!28636))

(declare-fun d!28652 () Bool)

(assert (=> d!28652 (= (array_inv!1780 (buf!2324 base!8)) (bvsge (size!1940 (buf!2324 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!91894 d!28652))

(declare-fun d!28654 () Bool)

(declare-fun size!1944 (List!821) Int)

(assert (=> d!28654 (= (length!412 listBits!13) (size!1944 listBits!13))))

(declare-fun bs!7065 () Bool)

(assert (= bs!7065 d!28654))

(declare-fun m!136065 () Bool)

(assert (=> bs!7065 m!136065))

(assert (=> b!91900 d!28654))

(declare-fun d!28656 () Bool)

(declare-fun res!75953 () Bool)

(declare-fun e!60483 () Bool)

(assert (=> d!28656 (=> (not res!75953) (not e!60483))))

(assert (=> d!28656 (= res!75953 (= (size!1940 (buf!2324 bitStream2!8)) (size!1940 (buf!2324 base!8))))))

(assert (=> d!28656 (= (isPrefixOf!0 bitStream2!8 base!8) e!60483)))

(declare-fun b!91997 () Bool)

(declare-fun res!75954 () Bool)

(assert (=> b!91997 (=> (not res!75954) (not e!60483))))

(assert (=> b!91997 (= res!75954 (bvsle (bitIndex!0 (size!1940 (buf!2324 bitStream2!8)) (currentByte!4632 bitStream2!8) (currentBit!4627 bitStream2!8)) (bitIndex!0 (size!1940 (buf!2324 base!8)) (currentByte!4632 base!8) (currentBit!4627 base!8))))))

(declare-fun b!91998 () Bool)

(declare-fun e!60484 () Bool)

(assert (=> b!91998 (= e!60483 e!60484)))

(declare-fun res!75955 () Bool)

(assert (=> b!91998 (=> res!75955 e!60484)))

(assert (=> b!91998 (= res!75955 (= (size!1940 (buf!2324 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!91999 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4299 array!4299 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91999 (= e!60484 (arrayBitRangesEq!0 (buf!2324 bitStream2!8) (buf!2324 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1940 (buf!2324 bitStream2!8)) (currentByte!4632 bitStream2!8) (currentBit!4627 bitStream2!8))))))

(assert (= (and d!28656 res!75953) b!91997))

(assert (= (and b!91997 res!75954) b!91998))

(assert (= (and b!91998 (not res!75955)) b!91999))

(declare-fun m!136067 () Bool)

(assert (=> b!91997 m!136067))

(assert (=> b!91997 m!135973))

(assert (=> b!91999 m!136067))

(assert (=> b!91999 m!136067))

(declare-fun m!136069 () Bool)

(assert (=> b!91999 m!136069))

(assert (=> b!91895 d!28656))

(declare-fun d!28658 () Bool)

(assert (=> d!28658 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4627 bitStream1!8) (currentByte!4632 bitStream1!8) (size!1940 (buf!2324 bitStream1!8))))))

(declare-fun bs!7066 () Bool)

(assert (= bs!7066 d!28658))

(declare-fun m!136071 () Bool)

(assert (=> bs!7066 m!136071))

(assert (=> start!18526 d!28658))

(declare-fun d!28660 () Bool)

(assert (=> d!28660 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4627 bitStream2!8) (currentByte!4632 bitStream2!8) (size!1940 (buf!2324 bitStream2!8))))))

(declare-fun bs!7067 () Bool)

(assert (= bs!7067 d!28660))

(assert (=> bs!7067 m!135981))

(assert (=> start!18526 d!28660))

(declare-fun d!28662 () Bool)

(assert (=> d!28662 (= (inv!12 base!8) (invariant!0 (currentBit!4627 base!8) (currentByte!4632 base!8) (size!1940 (buf!2324 base!8))))))

(declare-fun bs!7068 () Bool)

(assert (= bs!7068 d!28662))

(assert (=> bs!7068 m!136063))

(assert (=> start!18526 d!28662))

(declare-fun d!28664 () Bool)

(assert (=> d!28664 (= (array_inv!1780 (buf!2324 bitStream1!8)) (bvsge (size!1940 (buf!2324 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!91901 d!28664))

(declare-fun d!28666 () Bool)

(declare-fun res!75956 () Bool)

(declare-fun e!60485 () Bool)

(assert (=> d!28666 (=> (not res!75956) (not e!60485))))

(assert (=> d!28666 (= res!75956 (= (size!1940 (buf!2324 bitStream1!8)) (size!1940 (buf!2324 base!8))))))

(assert (=> d!28666 (= (isPrefixOf!0 bitStream1!8 base!8) e!60485)))

(declare-fun b!92000 () Bool)

(declare-fun res!75957 () Bool)

(assert (=> b!92000 (=> (not res!75957) (not e!60485))))

(assert (=> b!92000 (= res!75957 (bvsle (bitIndex!0 (size!1940 (buf!2324 bitStream1!8)) (currentByte!4632 bitStream1!8) (currentBit!4627 bitStream1!8)) (bitIndex!0 (size!1940 (buf!2324 base!8)) (currentByte!4632 base!8) (currentBit!4627 base!8))))))

(declare-fun b!92001 () Bool)

(declare-fun e!60486 () Bool)

(assert (=> b!92001 (= e!60485 e!60486)))

(declare-fun res!75958 () Bool)

(assert (=> b!92001 (=> res!75958 e!60486)))

(assert (=> b!92001 (= res!75958 (= (size!1940 (buf!2324 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92002 () Bool)

(assert (=> b!92002 (= e!60486 (arrayBitRangesEq!0 (buf!2324 bitStream1!8) (buf!2324 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1940 (buf!2324 bitStream1!8)) (currentByte!4632 bitStream1!8) (currentBit!4627 bitStream1!8))))))

(assert (= (and d!28666 res!75956) b!92000))

(assert (= (and b!92000 res!75957) b!92001))

(assert (= (and b!92001 (not res!75958)) b!92002))

(declare-fun m!136073 () Bool)

(assert (=> b!92000 m!136073))

(assert (=> b!92000 m!135973))

(assert (=> b!92002 m!136073))

(assert (=> b!92002 m!136073))

(declare-fun m!136075 () Bool)

(assert (=> b!92002 m!136075))

(assert (=> b!91896 d!28666))

(declare-fun d!28668 () Bool)

(declare-fun res!75959 () Bool)

(declare-fun e!60487 () Bool)

(assert (=> d!28668 (=> (not res!75959) (not e!60487))))

(assert (=> d!28668 (= res!75959 (= (size!1940 (buf!2324 bitStream1!8)) (size!1940 (buf!2324 bitStream2!8))))))

(assert (=> d!28668 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!60487)))

(declare-fun b!92003 () Bool)

(declare-fun res!75960 () Bool)

(assert (=> b!92003 (=> (not res!75960) (not e!60487))))

(assert (=> b!92003 (= res!75960 (bvsle (bitIndex!0 (size!1940 (buf!2324 bitStream1!8)) (currentByte!4632 bitStream1!8) (currentBit!4627 bitStream1!8)) (bitIndex!0 (size!1940 (buf!2324 bitStream2!8)) (currentByte!4632 bitStream2!8) (currentBit!4627 bitStream2!8))))))

(declare-fun b!92004 () Bool)

(declare-fun e!60488 () Bool)

(assert (=> b!92004 (= e!60487 e!60488)))

(declare-fun res!75961 () Bool)

(assert (=> b!92004 (=> res!75961 e!60488)))

(assert (=> b!92004 (= res!75961 (= (size!1940 (buf!2324 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92005 () Bool)

(assert (=> b!92005 (= e!60488 (arrayBitRangesEq!0 (buf!2324 bitStream1!8) (buf!2324 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1940 (buf!2324 bitStream1!8)) (currentByte!4632 bitStream1!8) (currentBit!4627 bitStream1!8))))))

(assert (= (and d!28668 res!75959) b!92003))

(assert (= (and b!92003 res!75960) b!92004))

(assert (= (and b!92004 (not res!75961)) b!92005))

(assert (=> b!92003 m!136073))

(assert (=> b!92003 m!136067))

(assert (=> b!92005 m!136073))

(assert (=> b!92005 m!136073))

(declare-fun m!136077 () Bool)

(assert (=> b!92005 m!136077))

(assert (=> b!91902 d!28668))

(declare-fun d!28670 () Bool)

(assert (=> d!28670 (= (array_inv!1780 (buf!2324 bitStream2!8)) (bvsge (size!1940 (buf!2324 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!91897 d!28670))

(push 1)

(assert (not d!28658))

(assert (not b!92003))

(assert (not b!91999))

(assert (not d!28662))

(assert (not b!92000))

(assert (not b!91997))

(assert (not d!28636))

(assert (not d!28654))

(assert (not d!28660))

(assert (not b!92002))

(assert (not b!92005))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

