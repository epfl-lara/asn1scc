; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22768 () Bool)

(assert start!22768)

(declare-fun b!114962 () Bool)

(declare-fun res!94990 () Bool)

(declare-fun e!75380 () Bool)

(assert (=> b!114962 (=> (not res!94990) (not e!75380))))

(declare-datatypes ((array!5194 0))(
  ( (array!5195 (arr!2950 (Array (_ BitVec 32) (_ BitVec 8))) (size!2357 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4188 0))(
  ( (BitStream!4189 (buf!2767 array!5194) (currentByte!5386 (_ BitVec 32)) (currentBit!5381 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4188)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!114962 (= res!94990 (validate_offset_bits!1 ((_ sign_extend 32) (size!2357 (buf!2767 thiss!1305))) ((_ sign_extend 32) (currentByte!5386 thiss!1305)) ((_ sign_extend 32) (currentBit!5381 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!114963 () Bool)

(declare-fun res!94989 () Bool)

(declare-fun e!75382 () Bool)

(assert (=> b!114963 (=> (not res!94989) (not e!75382))))

(declare-datatypes ((Unit!7071 0))(
  ( (Unit!7072) )
))
(declare-datatypes ((tuple2!9466 0))(
  ( (tuple2!9467 (_1!4998 Unit!7071) (_2!4998 BitStream!4188)) )
))
(declare-fun lt!175171 () tuple2!9466)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!114963 (= res!94989 (invariant!0 (currentBit!5381 thiss!1305) (currentByte!5386 thiss!1305) (size!2357 (buf!2767 (_2!4998 lt!175171)))))))

(declare-fun b!114964 () Bool)

(declare-fun e!75385 () Bool)

(declare-fun e!75384 () Bool)

(assert (=> b!114964 (= e!75385 e!75384)))

(declare-fun res!94986 () Bool)

(assert (=> b!114964 (=> (not res!94986) (not e!75384))))

(declare-datatypes ((tuple2!9468 0))(
  ( (tuple2!9469 (_1!4999 BitStream!4188) (_2!4999 Bool)) )
))
(declare-fun lt!175175 () tuple2!9468)

(declare-fun lt!175174 () Bool)

(assert (=> b!114964 (= res!94986 (and (= (_2!4999 lt!175175) lt!175174) (= (_1!4999 lt!175175) (_2!4998 lt!175171))))))

(declare-fun readBitPure!0 (BitStream!4188) tuple2!9468)

(declare-fun readerFrom!0 (BitStream!4188 (_ BitVec 32) (_ BitVec 32)) BitStream!4188)

(assert (=> b!114964 (= lt!175175 (readBitPure!0 (readerFrom!0 (_2!4998 lt!175171) (currentBit!5381 thiss!1305) (currentByte!5386 thiss!1305))))))

(declare-fun b!114965 () Bool)

(declare-fun lt!175172 () tuple2!9466)

(assert (=> b!114965 (= e!75382 (invariant!0 (currentBit!5381 thiss!1305) (currentByte!5386 thiss!1305) (size!2357 (buf!2767 (_2!4998 lt!175172)))))))

(declare-fun b!114966 () Bool)

(declare-fun res!94991 () Bool)

(assert (=> b!114966 (=> (not res!94991) (not e!75380))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!114966 (= res!94991 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!114967 () Bool)

(declare-fun e!75383 () Bool)

(assert (=> b!114967 (= e!75383 e!75385)))

(declare-fun res!94995 () Bool)

(assert (=> b!114967 (=> (not res!94995) (not e!75385))))

(declare-fun lt!175177 () (_ BitVec 64))

(declare-fun lt!175173 () (_ BitVec 64))

(assert (=> b!114967 (= res!94995 (= lt!175177 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!175173)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!114967 (= lt!175177 (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175171))) (currentByte!5386 (_2!4998 lt!175171)) (currentBit!5381 (_2!4998 lt!175171))))))

(assert (=> b!114967 (= lt!175173 (bitIndex!0 (size!2357 (buf!2767 thiss!1305)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305)))))

(declare-fun b!114968 () Bool)

(declare-fun res!94992 () Bool)

(assert (=> b!114968 (=> (not res!94992) (not e!75385))))

(declare-fun isPrefixOf!0 (BitStream!4188 BitStream!4188) Bool)

(assert (=> b!114968 (= res!94992 (isPrefixOf!0 thiss!1305 (_2!4998 lt!175171)))))

(declare-fun b!114969 () Bool)

(assert (=> b!114969 (= e!75384 (= (bitIndex!0 (size!2357 (buf!2767 (_1!4999 lt!175175))) (currentByte!5386 (_1!4999 lt!175175)) (currentBit!5381 (_1!4999 lt!175175))) lt!175177))))

(declare-fun b!114970 () Bool)

(declare-datatypes ((tuple2!9470 0))(
  ( (tuple2!9471 (_1!5000 BitStream!4188) (_2!5000 BitStream!4188)) )
))
(declare-fun lt!175168 () tuple2!9470)

(assert (=> b!114970 (= e!75380 (not (= (_2!4999 (readBitPure!0 (_1!5000 lt!175168))) lt!175174)))))

(declare-fun lt!175178 () tuple2!9470)

(declare-fun reader!0 (BitStream!4188 BitStream!4188) tuple2!9470)

(assert (=> b!114970 (= lt!175178 (reader!0 (_2!4998 lt!175171) (_2!4998 lt!175172)))))

(assert (=> b!114970 (= lt!175168 (reader!0 thiss!1305 (_2!4998 lt!175172)))))

(declare-fun e!75386 () Bool)

(assert (=> b!114970 e!75386))

(declare-fun res!94987 () Bool)

(assert (=> b!114970 (=> (not res!94987) (not e!75386))))

(declare-fun lt!175169 () tuple2!9468)

(declare-fun lt!175167 () tuple2!9468)

(assert (=> b!114970 (= res!94987 (= (bitIndex!0 (size!2357 (buf!2767 (_1!4999 lt!175169))) (currentByte!5386 (_1!4999 lt!175169)) (currentBit!5381 (_1!4999 lt!175169))) (bitIndex!0 (size!2357 (buf!2767 (_1!4999 lt!175167))) (currentByte!5386 (_1!4999 lt!175167)) (currentBit!5381 (_1!4999 lt!175167)))))))

(declare-fun lt!175179 () Unit!7071)

(declare-fun lt!175170 () BitStream!4188)

(declare-fun readBitPrefixLemma!0 (BitStream!4188 BitStream!4188) Unit!7071)

(assert (=> b!114970 (= lt!175179 (readBitPrefixLemma!0 lt!175170 (_2!4998 lt!175172)))))

(assert (=> b!114970 (= lt!175167 (readBitPure!0 (BitStream!4189 (buf!2767 (_2!4998 lt!175172)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305))))))

(assert (=> b!114970 (= lt!175169 (readBitPure!0 lt!175170))))

(assert (=> b!114970 (= lt!175170 (BitStream!4189 (buf!2767 (_2!4998 lt!175171)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305)))))

(assert (=> b!114970 e!75382))

(declare-fun res!94985 () Bool)

(assert (=> b!114970 (=> (not res!94985) (not e!75382))))

(assert (=> b!114970 (= res!94985 (isPrefixOf!0 thiss!1305 (_2!4998 lt!175172)))))

(declare-fun lt!175176 () Unit!7071)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4188 BitStream!4188 BitStream!4188) Unit!7071)

(assert (=> b!114970 (= lt!175176 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4998 lt!175171) (_2!4998 lt!175172)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4188 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9466)

(assert (=> b!114970 (= lt!175172 (appendNLeastSignificantBitsLoop!0 (_2!4998 lt!175171) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!114970 e!75383))

(declare-fun res!94988 () Bool)

(assert (=> b!114970 (=> (not res!94988) (not e!75383))))

(assert (=> b!114970 (= res!94988 (= (size!2357 (buf!2767 thiss!1305)) (size!2357 (buf!2767 (_2!4998 lt!175171)))))))

(declare-fun appendBit!0 (BitStream!4188 Bool) tuple2!9466)

(assert (=> b!114970 (= lt!175171 (appendBit!0 thiss!1305 lt!175174))))

(assert (=> b!114970 (= lt!175174 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114971 () Bool)

(declare-fun e!75387 () Bool)

(declare-fun array_inv!2159 (array!5194) Bool)

(assert (=> b!114971 (= e!75387 (array_inv!2159 (buf!2767 thiss!1305)))))

(declare-fun res!94993 () Bool)

(assert (=> start!22768 (=> (not res!94993) (not e!75380))))

(assert (=> start!22768 (= res!94993 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22768 e!75380))

(assert (=> start!22768 true))

(declare-fun inv!12 (BitStream!4188) Bool)

(assert (=> start!22768 (and (inv!12 thiss!1305) e!75387)))

(declare-fun b!114972 () Bool)

(declare-fun res!94994 () Bool)

(assert (=> b!114972 (=> (not res!94994) (not e!75380))))

(assert (=> b!114972 (= res!94994 (bvslt i!615 nBits!396))))

(declare-fun b!114973 () Bool)

(assert (=> b!114973 (= e!75386 (= (_2!4999 lt!175169) (_2!4999 lt!175167)))))

(assert (= (and start!22768 res!94993) b!114962))

(assert (= (and b!114962 res!94990) b!114966))

(assert (= (and b!114966 res!94991) b!114972))

(assert (= (and b!114972 res!94994) b!114970))

(assert (= (and b!114970 res!94988) b!114967))

(assert (= (and b!114967 res!94995) b!114968))

(assert (= (and b!114968 res!94992) b!114964))

(assert (= (and b!114964 res!94986) b!114969))

(assert (= (and b!114970 res!94985) b!114963))

(assert (= (and b!114963 res!94989) b!114965))

(assert (= (and b!114970 res!94987) b!114973))

(assert (= start!22768 b!114971))

(declare-fun m!171971 () Bool)

(assert (=> b!114968 m!171971))

(declare-fun m!171973 () Bool)

(assert (=> start!22768 m!171973))

(declare-fun m!171975 () Bool)

(assert (=> b!114971 m!171975))

(declare-fun m!171977 () Bool)

(assert (=> b!114962 m!171977))

(declare-fun m!171979 () Bool)

(assert (=> b!114965 m!171979))

(declare-fun m!171981 () Bool)

(assert (=> b!114966 m!171981))

(declare-fun m!171983 () Bool)

(assert (=> b!114970 m!171983))

(declare-fun m!171985 () Bool)

(assert (=> b!114970 m!171985))

(declare-fun m!171987 () Bool)

(assert (=> b!114970 m!171987))

(declare-fun m!171989 () Bool)

(assert (=> b!114970 m!171989))

(declare-fun m!171991 () Bool)

(assert (=> b!114970 m!171991))

(declare-fun m!171993 () Bool)

(assert (=> b!114970 m!171993))

(declare-fun m!171995 () Bool)

(assert (=> b!114970 m!171995))

(declare-fun m!171997 () Bool)

(assert (=> b!114970 m!171997))

(declare-fun m!171999 () Bool)

(assert (=> b!114970 m!171999))

(declare-fun m!172001 () Bool)

(assert (=> b!114970 m!172001))

(declare-fun m!172003 () Bool)

(assert (=> b!114970 m!172003))

(declare-fun m!172005 () Bool)

(assert (=> b!114970 m!172005))

(declare-fun m!172007 () Bool)

(assert (=> b!114969 m!172007))

(declare-fun m!172009 () Bool)

(assert (=> b!114963 m!172009))

(declare-fun m!172011 () Bool)

(assert (=> b!114967 m!172011))

(declare-fun m!172013 () Bool)

(assert (=> b!114967 m!172013))

(declare-fun m!172015 () Bool)

(assert (=> b!114964 m!172015))

(assert (=> b!114964 m!172015))

(declare-fun m!172017 () Bool)

(assert (=> b!114964 m!172017))

(check-sat (not start!22768) (not b!114964) (not b!114962) (not b!114963) (not b!114969) (not b!114965) (not b!114971) (not b!114968) (not b!114966) (not b!114970) (not b!114967))
(check-sat)
(get-model)

(declare-fun d!37042 () Bool)

(assert (=> d!37042 (= (array_inv!2159 (buf!2767 thiss!1305)) (bvsge (size!2357 (buf!2767 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!114971 d!37042))

(declare-fun d!37044 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37044 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2357 (buf!2767 thiss!1305))) ((_ sign_extend 32) (currentByte!5386 thiss!1305)) ((_ sign_extend 32) (currentBit!5381 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2357 (buf!2767 thiss!1305))) ((_ sign_extend 32) (currentByte!5386 thiss!1305)) ((_ sign_extend 32) (currentBit!5381 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8972 () Bool)

(assert (= bs!8972 d!37044))

(declare-fun m!172067 () Bool)

(assert (=> bs!8972 m!172067))

(assert (=> b!114962 d!37044))

(declare-fun d!37046 () Bool)

(declare-fun e!75414 () Bool)

(assert (=> d!37046 e!75414))

(declare-fun res!95034 () Bool)

(assert (=> d!37046 (=> (not res!95034) (not e!75414))))

(declare-fun lt!175234 () (_ BitVec 64))

(declare-fun lt!175235 () (_ BitVec 64))

(declare-fun lt!175232 () (_ BitVec 64))

(assert (=> d!37046 (= res!95034 (= lt!175235 (bvsub lt!175234 lt!175232)))))

(assert (=> d!37046 (or (= (bvand lt!175234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175232 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175234 lt!175232) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37046 (= lt!175232 (remainingBits!0 ((_ sign_extend 32) (size!2357 (buf!2767 (_1!4999 lt!175175)))) ((_ sign_extend 32) (currentByte!5386 (_1!4999 lt!175175))) ((_ sign_extend 32) (currentBit!5381 (_1!4999 lt!175175)))))))

(declare-fun lt!175231 () (_ BitVec 64))

(declare-fun lt!175233 () (_ BitVec 64))

(assert (=> d!37046 (= lt!175234 (bvmul lt!175231 lt!175233))))

(assert (=> d!37046 (or (= lt!175231 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175233 (bvsdiv (bvmul lt!175231 lt!175233) lt!175231)))))

(assert (=> d!37046 (= lt!175233 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37046 (= lt!175231 ((_ sign_extend 32) (size!2357 (buf!2767 (_1!4999 lt!175175)))))))

(assert (=> d!37046 (= lt!175235 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5386 (_1!4999 lt!175175))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5381 (_1!4999 lt!175175)))))))

(assert (=> d!37046 (invariant!0 (currentBit!5381 (_1!4999 lt!175175)) (currentByte!5386 (_1!4999 lt!175175)) (size!2357 (buf!2767 (_1!4999 lt!175175))))))

(assert (=> d!37046 (= (bitIndex!0 (size!2357 (buf!2767 (_1!4999 lt!175175))) (currentByte!5386 (_1!4999 lt!175175)) (currentBit!5381 (_1!4999 lt!175175))) lt!175235)))

(declare-fun b!115014 () Bool)

(declare-fun res!95033 () Bool)

(assert (=> b!115014 (=> (not res!95033) (not e!75414))))

(assert (=> b!115014 (= res!95033 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175235))))

(declare-fun b!115015 () Bool)

(declare-fun lt!175236 () (_ BitVec 64))

(assert (=> b!115015 (= e!75414 (bvsle lt!175235 (bvmul lt!175236 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115015 (or (= lt!175236 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175236 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175236)))))

(assert (=> b!115015 (= lt!175236 ((_ sign_extend 32) (size!2357 (buf!2767 (_1!4999 lt!175175)))))))

(assert (= (and d!37046 res!95034) b!115014))

(assert (= (and b!115014 res!95033) b!115015))

(declare-fun m!172069 () Bool)

(assert (=> d!37046 m!172069))

(declare-fun m!172071 () Bool)

(assert (=> d!37046 m!172071))

(assert (=> b!114969 d!37046))

(declare-fun d!37048 () Bool)

(declare-fun res!95041 () Bool)

(declare-fun e!75420 () Bool)

(assert (=> d!37048 (=> (not res!95041) (not e!75420))))

(assert (=> d!37048 (= res!95041 (= (size!2357 (buf!2767 thiss!1305)) (size!2357 (buf!2767 (_2!4998 lt!175171)))))))

(assert (=> d!37048 (= (isPrefixOf!0 thiss!1305 (_2!4998 lt!175171)) e!75420)))

(declare-fun b!115022 () Bool)

(declare-fun res!95042 () Bool)

(assert (=> b!115022 (=> (not res!95042) (not e!75420))))

(assert (=> b!115022 (= res!95042 (bvsle (bitIndex!0 (size!2357 (buf!2767 thiss!1305)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305)) (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175171))) (currentByte!5386 (_2!4998 lt!175171)) (currentBit!5381 (_2!4998 lt!175171)))))))

(declare-fun b!115023 () Bool)

(declare-fun e!75419 () Bool)

(assert (=> b!115023 (= e!75420 e!75419)))

(declare-fun res!95043 () Bool)

(assert (=> b!115023 (=> res!95043 e!75419)))

(assert (=> b!115023 (= res!95043 (= (size!2357 (buf!2767 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!115024 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5194 array!5194 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115024 (= e!75419 (arrayBitRangesEq!0 (buf!2767 thiss!1305) (buf!2767 (_2!4998 lt!175171)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2357 (buf!2767 thiss!1305)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305))))))

(assert (= (and d!37048 res!95041) b!115022))

(assert (= (and b!115022 res!95042) b!115023))

(assert (= (and b!115023 (not res!95043)) b!115024))

(assert (=> b!115022 m!172013))

(assert (=> b!115022 m!172011))

(assert (=> b!115024 m!172013))

(assert (=> b!115024 m!172013))

(declare-fun m!172073 () Bool)

(assert (=> b!115024 m!172073))

(assert (=> b!114968 d!37048))

(declare-fun d!37050 () Bool)

(assert (=> d!37050 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5381 thiss!1305) (currentByte!5386 thiss!1305) (size!2357 (buf!2767 thiss!1305))))))

(declare-fun bs!8973 () Bool)

(assert (= bs!8973 d!37050))

(declare-fun m!172075 () Bool)

(assert (=> bs!8973 m!172075))

(assert (=> start!22768 d!37050))

(declare-fun d!37052 () Bool)

(declare-fun e!75421 () Bool)

(assert (=> d!37052 e!75421))

(declare-fun res!95045 () Bool)

(assert (=> d!37052 (=> (not res!95045) (not e!75421))))

(declare-fun lt!175240 () (_ BitVec 64))

(declare-fun lt!175241 () (_ BitVec 64))

(declare-fun lt!175238 () (_ BitVec 64))

(assert (=> d!37052 (= res!95045 (= lt!175241 (bvsub lt!175240 lt!175238)))))

(assert (=> d!37052 (or (= (bvand lt!175240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175238 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175240 lt!175238) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37052 (= lt!175238 (remainingBits!0 ((_ sign_extend 32) (size!2357 (buf!2767 (_1!4999 lt!175169)))) ((_ sign_extend 32) (currentByte!5386 (_1!4999 lt!175169))) ((_ sign_extend 32) (currentBit!5381 (_1!4999 lt!175169)))))))

(declare-fun lt!175237 () (_ BitVec 64))

(declare-fun lt!175239 () (_ BitVec 64))

(assert (=> d!37052 (= lt!175240 (bvmul lt!175237 lt!175239))))

(assert (=> d!37052 (or (= lt!175237 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175239 (bvsdiv (bvmul lt!175237 lt!175239) lt!175237)))))

(assert (=> d!37052 (= lt!175239 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37052 (= lt!175237 ((_ sign_extend 32) (size!2357 (buf!2767 (_1!4999 lt!175169)))))))

(assert (=> d!37052 (= lt!175241 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5386 (_1!4999 lt!175169))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5381 (_1!4999 lt!175169)))))))

(assert (=> d!37052 (invariant!0 (currentBit!5381 (_1!4999 lt!175169)) (currentByte!5386 (_1!4999 lt!175169)) (size!2357 (buf!2767 (_1!4999 lt!175169))))))

(assert (=> d!37052 (= (bitIndex!0 (size!2357 (buf!2767 (_1!4999 lt!175169))) (currentByte!5386 (_1!4999 lt!175169)) (currentBit!5381 (_1!4999 lt!175169))) lt!175241)))

(declare-fun b!115025 () Bool)

(declare-fun res!95044 () Bool)

(assert (=> b!115025 (=> (not res!95044) (not e!75421))))

(assert (=> b!115025 (= res!95044 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175241))))

(declare-fun b!115026 () Bool)

(declare-fun lt!175242 () (_ BitVec 64))

(assert (=> b!115026 (= e!75421 (bvsle lt!175241 (bvmul lt!175242 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115026 (or (= lt!175242 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175242 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175242)))))

(assert (=> b!115026 (= lt!175242 ((_ sign_extend 32) (size!2357 (buf!2767 (_1!4999 lt!175169)))))))

(assert (= (and d!37052 res!95045) b!115025))

(assert (= (and b!115025 res!95044) b!115026))

(declare-fun m!172077 () Bool)

(assert (=> d!37052 m!172077))

(declare-fun m!172079 () Bool)

(assert (=> d!37052 m!172079))

(assert (=> b!114970 d!37052))

(declare-fun d!37054 () Bool)

(declare-fun e!75424 () Bool)

(assert (=> d!37054 e!75424))

(declare-fun res!95048 () Bool)

(assert (=> d!37054 (=> (not res!95048) (not e!75424))))

(declare-fun lt!175254 () tuple2!9468)

(declare-fun lt!175253 () tuple2!9468)

(assert (=> d!37054 (= res!95048 (= (bitIndex!0 (size!2357 (buf!2767 (_1!4999 lt!175254))) (currentByte!5386 (_1!4999 lt!175254)) (currentBit!5381 (_1!4999 lt!175254))) (bitIndex!0 (size!2357 (buf!2767 (_1!4999 lt!175253))) (currentByte!5386 (_1!4999 lt!175253)) (currentBit!5381 (_1!4999 lt!175253)))))))

(declare-fun lt!175251 () Unit!7071)

(declare-fun lt!175252 () BitStream!4188)

(declare-fun choose!50 (BitStream!4188 BitStream!4188 BitStream!4188 tuple2!9468 tuple2!9468 BitStream!4188 Bool tuple2!9468 tuple2!9468 BitStream!4188 Bool) Unit!7071)

(assert (=> d!37054 (= lt!175251 (choose!50 lt!175170 (_2!4998 lt!175172) lt!175252 lt!175254 (tuple2!9469 (_1!4999 lt!175254) (_2!4999 lt!175254)) (_1!4999 lt!175254) (_2!4999 lt!175254) lt!175253 (tuple2!9469 (_1!4999 lt!175253) (_2!4999 lt!175253)) (_1!4999 lt!175253) (_2!4999 lt!175253)))))

(assert (=> d!37054 (= lt!175253 (readBitPure!0 lt!175252))))

(assert (=> d!37054 (= lt!175254 (readBitPure!0 lt!175170))))

(assert (=> d!37054 (= lt!175252 (BitStream!4189 (buf!2767 (_2!4998 lt!175172)) (currentByte!5386 lt!175170) (currentBit!5381 lt!175170)))))

(assert (=> d!37054 (invariant!0 (currentBit!5381 lt!175170) (currentByte!5386 lt!175170) (size!2357 (buf!2767 (_2!4998 lt!175172))))))

(assert (=> d!37054 (= (readBitPrefixLemma!0 lt!175170 (_2!4998 lt!175172)) lt!175251)))

(declare-fun b!115029 () Bool)

(assert (=> b!115029 (= e!75424 (= (_2!4999 lt!175254) (_2!4999 lt!175253)))))

(assert (= (and d!37054 res!95048) b!115029))

(declare-fun m!172081 () Bool)

(assert (=> d!37054 m!172081))

(declare-fun m!172083 () Bool)

(assert (=> d!37054 m!172083))

(declare-fun m!172085 () Bool)

(assert (=> d!37054 m!172085))

(assert (=> d!37054 m!171993))

(declare-fun m!172087 () Bool)

(assert (=> d!37054 m!172087))

(declare-fun m!172089 () Bool)

(assert (=> d!37054 m!172089))

(assert (=> b!114970 d!37054))

(declare-fun d!37056 () Bool)

(declare-fun e!75425 () Bool)

(assert (=> d!37056 e!75425))

(declare-fun res!95050 () Bool)

(assert (=> d!37056 (=> (not res!95050) (not e!75425))))

(declare-fun lt!175258 () (_ BitVec 64))

(declare-fun lt!175256 () (_ BitVec 64))

(declare-fun lt!175259 () (_ BitVec 64))

(assert (=> d!37056 (= res!95050 (= lt!175259 (bvsub lt!175258 lt!175256)))))

(assert (=> d!37056 (or (= (bvand lt!175258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175256 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175258 lt!175256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37056 (= lt!175256 (remainingBits!0 ((_ sign_extend 32) (size!2357 (buf!2767 (_1!4999 lt!175167)))) ((_ sign_extend 32) (currentByte!5386 (_1!4999 lt!175167))) ((_ sign_extend 32) (currentBit!5381 (_1!4999 lt!175167)))))))

(declare-fun lt!175255 () (_ BitVec 64))

(declare-fun lt!175257 () (_ BitVec 64))

(assert (=> d!37056 (= lt!175258 (bvmul lt!175255 lt!175257))))

(assert (=> d!37056 (or (= lt!175255 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175257 (bvsdiv (bvmul lt!175255 lt!175257) lt!175255)))))

(assert (=> d!37056 (= lt!175257 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37056 (= lt!175255 ((_ sign_extend 32) (size!2357 (buf!2767 (_1!4999 lt!175167)))))))

(assert (=> d!37056 (= lt!175259 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5386 (_1!4999 lt!175167))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5381 (_1!4999 lt!175167)))))))

(assert (=> d!37056 (invariant!0 (currentBit!5381 (_1!4999 lt!175167)) (currentByte!5386 (_1!4999 lt!175167)) (size!2357 (buf!2767 (_1!4999 lt!175167))))))

(assert (=> d!37056 (= (bitIndex!0 (size!2357 (buf!2767 (_1!4999 lt!175167))) (currentByte!5386 (_1!4999 lt!175167)) (currentBit!5381 (_1!4999 lt!175167))) lt!175259)))

(declare-fun b!115030 () Bool)

(declare-fun res!95049 () Bool)

(assert (=> b!115030 (=> (not res!95049) (not e!75425))))

(assert (=> b!115030 (= res!95049 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175259))))

(declare-fun b!115031 () Bool)

(declare-fun lt!175260 () (_ BitVec 64))

(assert (=> b!115031 (= e!75425 (bvsle lt!175259 (bvmul lt!175260 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115031 (or (= lt!175260 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175260 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175260)))))

(assert (=> b!115031 (= lt!175260 ((_ sign_extend 32) (size!2357 (buf!2767 (_1!4999 lt!175167)))))))

(assert (= (and d!37056 res!95050) b!115030))

(assert (= (and b!115030 res!95049) b!115031))

(declare-fun m!172091 () Bool)

(assert (=> d!37056 m!172091))

(declare-fun m!172093 () Bool)

(assert (=> d!37056 m!172093))

(assert (=> b!114970 d!37056))

(declare-fun d!37058 () Bool)

(declare-datatypes ((tuple2!9478 0))(
  ( (tuple2!9479 (_1!5004 Bool) (_2!5004 BitStream!4188)) )
))
(declare-fun lt!175263 () tuple2!9478)

(declare-fun readBit!0 (BitStream!4188) tuple2!9478)

(assert (=> d!37058 (= lt!175263 (readBit!0 lt!175170))))

(assert (=> d!37058 (= (readBitPure!0 lt!175170) (tuple2!9469 (_2!5004 lt!175263) (_1!5004 lt!175263)))))

(declare-fun bs!8974 () Bool)

(assert (= bs!8974 d!37058))

(declare-fun m!172095 () Bool)

(assert (=> bs!8974 m!172095))

(assert (=> b!114970 d!37058))

(declare-fun d!37060 () Bool)

(declare-fun e!75482 () Bool)

(assert (=> d!37060 e!75482))

(declare-fun res!95133 () Bool)

(assert (=> d!37060 (=> (not res!95133) (not e!75482))))

(declare-fun lt!175536 () tuple2!9466)

(assert (=> d!37060 (= res!95133 (= (size!2357 (buf!2767 (_2!4998 lt!175171))) (size!2357 (buf!2767 (_2!4998 lt!175536)))))))

(declare-fun e!75484 () tuple2!9466)

(assert (=> d!37060 (= lt!175536 e!75484)))

(declare-fun c!6979 () Bool)

(assert (=> d!37060 (= c!6979 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37060 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37060 (= (appendNLeastSignificantBitsLoop!0 (_2!4998 lt!175171) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!175536)))

(declare-fun b!115122 () Bool)

(declare-fun res!95135 () Bool)

(declare-fun call!1493 () Bool)

(assert (=> b!115122 (= res!95135 call!1493)))

(declare-fun e!75479 () Bool)

(assert (=> b!115122 (=> (not res!95135) (not e!75479))))

(declare-fun b!115123 () Bool)

(declare-fun lt!175534 () Unit!7071)

(assert (=> b!115123 (= e!75484 (tuple2!9467 lt!175534 (_2!4998 lt!175171)))))

(declare-fun lt!175548 () BitStream!4188)

(assert (=> b!115123 (= lt!175548 (_2!4998 lt!175171))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4188) Unit!7071)

(assert (=> b!115123 (= lt!175534 (lemmaIsPrefixRefl!0 lt!175548))))

(assert (=> b!115123 call!1493))

(declare-fun b!115124 () Bool)

(declare-fun res!95137 () Bool)

(assert (=> b!115124 (=> (not res!95137) (not e!75482))))

(declare-fun lt!175529 () (_ BitVec 64))

(declare-fun lt!175524 () (_ BitVec 64))

(assert (=> b!115124 (= res!95137 (= (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175536))) (currentByte!5386 (_2!4998 lt!175536)) (currentBit!5381 (_2!4998 lt!175536))) (bvadd lt!175529 lt!175524)))))

(assert (=> b!115124 (or (not (= (bvand lt!175529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175524 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!175529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!175529 lt!175524) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115124 (= lt!175524 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!115124 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115124 (= lt!175529 (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175171))) (currentByte!5386 (_2!4998 lt!175171)) (currentBit!5381 (_2!4998 lt!175171))))))

(declare-fun b!115125 () Bool)

(declare-fun lt!175521 () tuple2!9466)

(declare-fun Unit!7075 () Unit!7071)

(assert (=> b!115125 (= e!75484 (tuple2!9467 Unit!7075 (_2!4998 lt!175521)))))

(declare-fun lt!175540 () Bool)

(assert (=> b!115125 (= lt!175540 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!175520 () tuple2!9466)

(assert (=> b!115125 (= lt!175520 (appendBit!0 (_2!4998 lt!175171) lt!175540))))

(declare-fun res!95136 () Bool)

(assert (=> b!115125 (= res!95136 (= (size!2357 (buf!2767 (_2!4998 lt!175171))) (size!2357 (buf!2767 (_2!4998 lt!175520)))))))

(assert (=> b!115125 (=> (not res!95136) (not e!75479))))

(assert (=> b!115125 e!75479))

(declare-fun lt!175515 () tuple2!9466)

(assert (=> b!115125 (= lt!175515 lt!175520)))

(assert (=> b!115125 (= lt!175521 (appendNLeastSignificantBitsLoop!0 (_2!4998 lt!175515) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!175546 () Unit!7071)

(assert (=> b!115125 (= lt!175546 (lemmaIsPrefixTransitive!0 (_2!4998 lt!175171) (_2!4998 lt!175515) (_2!4998 lt!175521)))))

(assert (=> b!115125 (isPrefixOf!0 (_2!4998 lt!175171) (_2!4998 lt!175521))))

(declare-fun lt!175538 () Unit!7071)

(assert (=> b!115125 (= lt!175538 lt!175546)))

(assert (=> b!115125 (invariant!0 (currentBit!5381 (_2!4998 lt!175171)) (currentByte!5386 (_2!4998 lt!175171)) (size!2357 (buf!2767 (_2!4998 lt!175515))))))

(declare-fun lt!175507 () BitStream!4188)

(assert (=> b!115125 (= lt!175507 (BitStream!4189 (buf!2767 (_2!4998 lt!175515)) (currentByte!5386 (_2!4998 lt!175171)) (currentBit!5381 (_2!4998 lt!175171))))))

(assert (=> b!115125 (invariant!0 (currentBit!5381 lt!175507) (currentByte!5386 lt!175507) (size!2357 (buf!2767 (_2!4998 lt!175521))))))

(declare-fun lt!175537 () BitStream!4188)

(assert (=> b!115125 (= lt!175537 (BitStream!4189 (buf!2767 (_2!4998 lt!175521)) (currentByte!5386 lt!175507) (currentBit!5381 lt!175507)))))

(declare-fun lt!175541 () tuple2!9468)

(assert (=> b!115125 (= lt!175541 (readBitPure!0 lt!175507))))

(declare-fun lt!175527 () tuple2!9468)

(assert (=> b!115125 (= lt!175527 (readBitPure!0 lt!175537))))

(declare-fun lt!175513 () Unit!7071)

(assert (=> b!115125 (= lt!175513 (readBitPrefixLemma!0 lt!175507 (_2!4998 lt!175521)))))

(declare-fun res!95134 () Bool)

(assert (=> b!115125 (= res!95134 (= (bitIndex!0 (size!2357 (buf!2767 (_1!4999 lt!175541))) (currentByte!5386 (_1!4999 lt!175541)) (currentBit!5381 (_1!4999 lt!175541))) (bitIndex!0 (size!2357 (buf!2767 (_1!4999 lt!175527))) (currentByte!5386 (_1!4999 lt!175527)) (currentBit!5381 (_1!4999 lt!175527)))))))

(declare-fun e!75478 () Bool)

(assert (=> b!115125 (=> (not res!95134) (not e!75478))))

(assert (=> b!115125 e!75478))

(declare-fun lt!175516 () Unit!7071)

(assert (=> b!115125 (= lt!175516 lt!175513)))

(declare-fun lt!175514 () tuple2!9470)

(assert (=> b!115125 (= lt!175514 (reader!0 (_2!4998 lt!175171) (_2!4998 lt!175521)))))

(declare-fun lt!175523 () tuple2!9470)

(assert (=> b!115125 (= lt!175523 (reader!0 (_2!4998 lt!175515) (_2!4998 lt!175521)))))

(declare-fun lt!175528 () tuple2!9468)

(assert (=> b!115125 (= lt!175528 (readBitPure!0 (_1!5000 lt!175514)))))

(assert (=> b!115125 (= (_2!4999 lt!175528) lt!175540)))

(declare-fun lt!175510 () Unit!7071)

(declare-fun Unit!7076 () Unit!7071)

(assert (=> b!115125 (= lt!175510 Unit!7076)))

(declare-fun lt!175504 () (_ BitVec 64))

(assert (=> b!115125 (= lt!175504 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!175526 () (_ BitVec 64))

(assert (=> b!115125 (= lt!175526 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!175533 () Unit!7071)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4188 array!5194 (_ BitVec 64)) Unit!7071)

(assert (=> b!115125 (= lt!175533 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4998 lt!175171) (buf!2767 (_2!4998 lt!175521)) lt!175526))))

(assert (=> b!115125 (validate_offset_bits!1 ((_ sign_extend 32) (size!2357 (buf!2767 (_2!4998 lt!175521)))) ((_ sign_extend 32) (currentByte!5386 (_2!4998 lt!175171))) ((_ sign_extend 32) (currentBit!5381 (_2!4998 lt!175171))) lt!175526)))

(declare-fun lt!175511 () Unit!7071)

(assert (=> b!115125 (= lt!175511 lt!175533)))

(declare-datatypes ((tuple2!9480 0))(
  ( (tuple2!9481 (_1!5005 BitStream!4188) (_2!5005 (_ BitVec 64))) )
))
(declare-fun lt!175530 () tuple2!9480)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9480)

(assert (=> b!115125 (= lt!175530 (readNLeastSignificantBitsLoopPure!0 (_1!5000 lt!175514) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!175504))))

(declare-fun lt!175543 () (_ BitVec 64))

(assert (=> b!115125 (= lt!175543 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!175532 () Unit!7071)

(assert (=> b!115125 (= lt!175532 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4998 lt!175515) (buf!2767 (_2!4998 lt!175521)) lt!175543))))

(assert (=> b!115125 (validate_offset_bits!1 ((_ sign_extend 32) (size!2357 (buf!2767 (_2!4998 lt!175521)))) ((_ sign_extend 32) (currentByte!5386 (_2!4998 lt!175515))) ((_ sign_extend 32) (currentBit!5381 (_2!4998 lt!175515))) lt!175543)))

(declare-fun lt!175542 () Unit!7071)

(assert (=> b!115125 (= lt!175542 lt!175532)))

(declare-fun lt!175545 () tuple2!9480)

(assert (=> b!115125 (= lt!175545 (readNLeastSignificantBitsLoopPure!0 (_1!5000 lt!175523) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!175504 (ite (_2!4999 lt!175528) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!175539 () tuple2!9480)

(assert (=> b!115125 (= lt!175539 (readNLeastSignificantBitsLoopPure!0 (_1!5000 lt!175514) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!175504))))

(declare-fun c!6978 () Bool)

(assert (=> b!115125 (= c!6978 (_2!4999 (readBitPure!0 (_1!5000 lt!175514))))))

(declare-fun e!75483 () (_ BitVec 64))

(declare-fun lt!175508 () tuple2!9480)

(declare-fun withMovedBitIndex!0 (BitStream!4188 (_ BitVec 64)) BitStream!4188)

(assert (=> b!115125 (= lt!175508 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5000 lt!175514) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!175504 e!75483)))))

(declare-fun lt!175512 () Unit!7071)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7071)

(assert (=> b!115125 (= lt!175512 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5000 lt!175514) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!175504))))

(assert (=> b!115125 (and (= (_2!5005 lt!175539) (_2!5005 lt!175508)) (= (_1!5005 lt!175539) (_1!5005 lt!175508)))))

(declare-fun lt!175519 () Unit!7071)

(assert (=> b!115125 (= lt!175519 lt!175512)))

(assert (=> b!115125 (= (_1!5000 lt!175514) (withMovedBitIndex!0 (_2!5000 lt!175514) (bvsub (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175171))) (currentByte!5386 (_2!4998 lt!175171)) (currentBit!5381 (_2!4998 lt!175171))) (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175521))) (currentByte!5386 (_2!4998 lt!175521)) (currentBit!5381 (_2!4998 lt!175521))))))))

(declare-fun lt!175506 () Unit!7071)

(declare-fun Unit!7077 () Unit!7071)

(assert (=> b!115125 (= lt!175506 Unit!7077)))

(assert (=> b!115125 (= (_1!5000 lt!175523) (withMovedBitIndex!0 (_2!5000 lt!175523) (bvsub (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175515))) (currentByte!5386 (_2!4998 lt!175515)) (currentBit!5381 (_2!4998 lt!175515))) (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175521))) (currentByte!5386 (_2!4998 lt!175521)) (currentBit!5381 (_2!4998 lt!175521))))))))

(declare-fun lt!175505 () Unit!7071)

(declare-fun Unit!7078 () Unit!7071)

(assert (=> b!115125 (= lt!175505 Unit!7078)))

(assert (=> b!115125 (= (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175171))) (currentByte!5386 (_2!4998 lt!175171)) (currentBit!5381 (_2!4998 lt!175171))) (bvsub (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175515))) (currentByte!5386 (_2!4998 lt!175515)) (currentBit!5381 (_2!4998 lt!175515))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!175509 () Unit!7071)

(declare-fun Unit!7079 () Unit!7071)

(assert (=> b!115125 (= lt!175509 Unit!7079)))

(assert (=> b!115125 (= (_2!5005 lt!175530) (_2!5005 lt!175545))))

(declare-fun lt!175525 () Unit!7071)

(declare-fun Unit!7080 () Unit!7071)

(assert (=> b!115125 (= lt!175525 Unit!7080)))

(assert (=> b!115125 (= (_1!5005 lt!175530) (_2!5000 lt!175514))))

(declare-fun b!115126 () Bool)

(assert (=> b!115126 (= e!75483 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!115127 () Bool)

(assert (=> b!115127 (= e!75478 (= (_2!4999 lt!175541) (_2!4999 lt!175527)))))

(declare-fun bm!1490 () Bool)

(assert (=> bm!1490 (= call!1493 (isPrefixOf!0 (ite c!6979 (_2!4998 lt!175171) lt!175548) (ite c!6979 (_2!4998 lt!175520) lt!175548)))))

(declare-fun b!115128 () Bool)

(declare-fun e!75481 () Bool)

(declare-fun lt!175547 () tuple2!9468)

(assert (=> b!115128 (= e!75481 (= (bitIndex!0 (size!2357 (buf!2767 (_1!4999 lt!175547))) (currentByte!5386 (_1!4999 lt!175547)) (currentBit!5381 (_1!4999 lt!175547))) (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175520))) (currentByte!5386 (_2!4998 lt!175520)) (currentBit!5381 (_2!4998 lt!175520)))))))

(declare-fun lt!175518 () tuple2!9480)

(declare-fun b!115129 () Bool)

(declare-fun lt!175522 () tuple2!9470)

(assert (=> b!115129 (= e!75482 (and (= (_2!5005 lt!175518) v!199) (= (_1!5005 lt!175518) (_2!5000 lt!175522))))))

(declare-fun lt!175544 () (_ BitVec 64))

(assert (=> b!115129 (= lt!175518 (readNLeastSignificantBitsLoopPure!0 (_1!5000 lt!175522) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!175544))))

(declare-fun lt!175517 () Unit!7071)

(declare-fun lt!175535 () Unit!7071)

(assert (=> b!115129 (= lt!175517 lt!175535)))

(declare-fun lt!175531 () (_ BitVec 64))

(assert (=> b!115129 (validate_offset_bits!1 ((_ sign_extend 32) (size!2357 (buf!2767 (_2!4998 lt!175536)))) ((_ sign_extend 32) (currentByte!5386 (_2!4998 lt!175171))) ((_ sign_extend 32) (currentBit!5381 (_2!4998 lt!175171))) lt!175531)))

(assert (=> b!115129 (= lt!175535 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4998 lt!175171) (buf!2767 (_2!4998 lt!175536)) lt!175531))))

(declare-fun e!75480 () Bool)

(assert (=> b!115129 e!75480))

(declare-fun res!95131 () Bool)

(assert (=> b!115129 (=> (not res!95131) (not e!75480))))

(assert (=> b!115129 (= res!95131 (and (= (size!2357 (buf!2767 (_2!4998 lt!175171))) (size!2357 (buf!2767 (_2!4998 lt!175536)))) (bvsge lt!175531 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115129 (= lt!175531 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!115129 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115129 (= lt!175544 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!115129 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115129 (= lt!175522 (reader!0 (_2!4998 lt!175171) (_2!4998 lt!175536)))))

(declare-fun b!115130 () Bool)

(declare-fun res!95132 () Bool)

(assert (=> b!115130 (= res!95132 (= (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175520))) (currentByte!5386 (_2!4998 lt!175520)) (currentBit!5381 (_2!4998 lt!175520))) (bvadd (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175171))) (currentByte!5386 (_2!4998 lt!175171)) (currentBit!5381 (_2!4998 lt!175171))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!115130 (=> (not res!95132) (not e!75479))))

(declare-fun b!115131 () Bool)

(assert (=> b!115131 (= lt!175547 (readBitPure!0 (readerFrom!0 (_2!4998 lt!175520) (currentBit!5381 (_2!4998 lt!175171)) (currentByte!5386 (_2!4998 lt!175171)))))))

(declare-fun res!95129 () Bool)

(assert (=> b!115131 (= res!95129 (and (= (_2!4999 lt!175547) lt!175540) (= (_1!4999 lt!175547) (_2!4998 lt!175520))))))

(assert (=> b!115131 (=> (not res!95129) (not e!75481))))

(assert (=> b!115131 (= e!75479 e!75481)))

(declare-fun b!115132 () Bool)

(declare-fun res!95130 () Bool)

(assert (=> b!115132 (=> (not res!95130) (not e!75482))))

(assert (=> b!115132 (= res!95130 (isPrefixOf!0 (_2!4998 lt!175171) (_2!4998 lt!175536)))))

(declare-fun b!115133 () Bool)

(assert (=> b!115133 (= e!75480 (validate_offset_bits!1 ((_ sign_extend 32) (size!2357 (buf!2767 (_2!4998 lt!175171)))) ((_ sign_extend 32) (currentByte!5386 (_2!4998 lt!175171))) ((_ sign_extend 32) (currentBit!5381 (_2!4998 lt!175171))) lt!175531))))

(declare-fun b!115134 () Bool)

(assert (=> b!115134 (= e!75483 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(assert (= (and d!37060 c!6979) b!115125))

(assert (= (and d!37060 (not c!6979)) b!115123))

(assert (= (and b!115125 res!95136) b!115130))

(assert (= (and b!115130 res!95132) b!115122))

(assert (= (and b!115122 res!95135) b!115131))

(assert (= (and b!115131 res!95129) b!115128))

(assert (= (and b!115125 res!95134) b!115127))

(assert (= (and b!115125 c!6978) b!115134))

(assert (= (and b!115125 (not c!6978)) b!115126))

(assert (= (or b!115122 b!115123) bm!1490))

(assert (= (and d!37060 res!95133) b!115124))

(assert (= (and b!115124 res!95137) b!115132))

(assert (= (and b!115132 res!95130) b!115129))

(assert (= (and b!115129 res!95131) b!115133))

(declare-fun m!172189 () Bool)

(assert (=> bm!1490 m!172189))

(declare-fun m!172191 () Bool)

(assert (=> b!115130 m!172191))

(assert (=> b!115130 m!172011))

(declare-fun m!172193 () Bool)

(assert (=> b!115123 m!172193))

(declare-fun m!172195 () Bool)

(assert (=> b!115133 m!172195))

(declare-fun m!172197 () Bool)

(assert (=> b!115131 m!172197))

(assert (=> b!115131 m!172197))

(declare-fun m!172199 () Bool)

(assert (=> b!115131 m!172199))

(declare-fun m!172201 () Bool)

(assert (=> b!115129 m!172201))

(declare-fun m!172203 () Bool)

(assert (=> b!115129 m!172203))

(declare-fun m!172205 () Bool)

(assert (=> b!115129 m!172205))

(declare-fun m!172207 () Bool)

(assert (=> b!115129 m!172207))

(declare-fun m!172209 () Bool)

(assert (=> b!115129 m!172209))

(declare-fun m!172211 () Bool)

(assert (=> b!115128 m!172211))

(assert (=> b!115128 m!172191))

(declare-fun m!172213 () Bool)

(assert (=> b!115124 m!172213))

(assert (=> b!115124 m!172011))

(declare-fun m!172215 () Bool)

(assert (=> b!115132 m!172215))

(assert (=> b!115125 m!172203))

(declare-fun m!172217 () Bool)

(assert (=> b!115125 m!172217))

(declare-fun m!172219 () Bool)

(assert (=> b!115125 m!172219))

(declare-fun m!172221 () Bool)

(assert (=> b!115125 m!172221))

(declare-fun m!172223 () Bool)

(assert (=> b!115125 m!172223))

(declare-fun m!172225 () Bool)

(assert (=> b!115125 m!172225))

(declare-fun m!172227 () Bool)

(assert (=> b!115125 m!172227))

(declare-fun m!172229 () Bool)

(assert (=> b!115125 m!172229))

(declare-fun m!172231 () Bool)

(assert (=> b!115125 m!172231))

(declare-fun m!172233 () Bool)

(assert (=> b!115125 m!172233))

(declare-fun m!172235 () Bool)

(assert (=> b!115125 m!172235))

(declare-fun m!172237 () Bool)

(assert (=> b!115125 m!172237))

(declare-fun m!172239 () Bool)

(assert (=> b!115125 m!172239))

(declare-fun m!172241 () Bool)

(assert (=> b!115125 m!172241))

(declare-fun m!172243 () Bool)

(assert (=> b!115125 m!172243))

(declare-fun m!172245 () Bool)

(assert (=> b!115125 m!172245))

(declare-fun m!172247 () Bool)

(assert (=> b!115125 m!172247))

(declare-fun m!172249 () Bool)

(assert (=> b!115125 m!172249))

(declare-fun m!172251 () Bool)

(assert (=> b!115125 m!172251))

(declare-fun m!172253 () Bool)

(assert (=> b!115125 m!172253))

(declare-fun m!172255 () Bool)

(assert (=> b!115125 m!172255))

(declare-fun m!172257 () Bool)

(assert (=> b!115125 m!172257))

(assert (=> b!115125 m!172255))

(assert (=> b!115125 m!172011))

(declare-fun m!172259 () Bool)

(assert (=> b!115125 m!172259))

(declare-fun m!172261 () Bool)

(assert (=> b!115125 m!172261))

(declare-fun m!172263 () Bool)

(assert (=> b!115125 m!172263))

(declare-fun m!172265 () Bool)

(assert (=> b!115125 m!172265))

(declare-fun m!172267 () Bool)

(assert (=> b!115125 m!172267))

(declare-fun m!172269 () Bool)

(assert (=> b!115125 m!172269))

(assert (=> b!114970 d!37060))

(declare-fun d!37120 () Bool)

(assert (=> d!37120 (isPrefixOf!0 thiss!1305 (_2!4998 lt!175172))))

(declare-fun lt!175551 () Unit!7071)

(declare-fun choose!30 (BitStream!4188 BitStream!4188 BitStream!4188) Unit!7071)

(assert (=> d!37120 (= lt!175551 (choose!30 thiss!1305 (_2!4998 lt!175171) (_2!4998 lt!175172)))))

(assert (=> d!37120 (isPrefixOf!0 thiss!1305 (_2!4998 lt!175171))))

(assert (=> d!37120 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4998 lt!175171) (_2!4998 lt!175172)) lt!175551)))

(declare-fun bs!8984 () Bool)

(assert (= bs!8984 d!37120))

(assert (=> bs!8984 m!171991))

(declare-fun m!172271 () Bool)

(assert (=> bs!8984 m!172271))

(assert (=> bs!8984 m!171971))

(assert (=> b!114970 d!37120))

(declare-fun d!37122 () Bool)

(declare-fun e!75489 () Bool)

(assert (=> d!37122 e!75489))

(declare-fun res!95144 () Bool)

(assert (=> d!37122 (=> (not res!95144) (not e!75489))))

(declare-fun lt!175601 () tuple2!9470)

(assert (=> d!37122 (= res!95144 (isPrefixOf!0 (_1!5000 lt!175601) (_2!5000 lt!175601)))))

(declare-fun lt!175592 () BitStream!4188)

(assert (=> d!37122 (= lt!175601 (tuple2!9471 lt!175592 (_2!4998 lt!175172)))))

(declare-fun lt!175610 () Unit!7071)

(declare-fun lt!175596 () Unit!7071)

(assert (=> d!37122 (= lt!175610 lt!175596)))

(assert (=> d!37122 (isPrefixOf!0 lt!175592 (_2!4998 lt!175172))))

(assert (=> d!37122 (= lt!175596 (lemmaIsPrefixTransitive!0 lt!175592 (_2!4998 lt!175172) (_2!4998 lt!175172)))))

(declare-fun lt!175602 () Unit!7071)

(declare-fun lt!175593 () Unit!7071)

(assert (=> d!37122 (= lt!175602 lt!175593)))

(assert (=> d!37122 (isPrefixOf!0 lt!175592 (_2!4998 lt!175172))))

(assert (=> d!37122 (= lt!175593 (lemmaIsPrefixTransitive!0 lt!175592 thiss!1305 (_2!4998 lt!175172)))))

(declare-fun lt!175599 () Unit!7071)

(declare-fun e!75490 () Unit!7071)

(assert (=> d!37122 (= lt!175599 e!75490)))

(declare-fun c!6982 () Bool)

(assert (=> d!37122 (= c!6982 (not (= (size!2357 (buf!2767 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!175605 () Unit!7071)

(declare-fun lt!175609 () Unit!7071)

(assert (=> d!37122 (= lt!175605 lt!175609)))

(assert (=> d!37122 (isPrefixOf!0 (_2!4998 lt!175172) (_2!4998 lt!175172))))

(assert (=> d!37122 (= lt!175609 (lemmaIsPrefixRefl!0 (_2!4998 lt!175172)))))

(declare-fun lt!175606 () Unit!7071)

(declare-fun lt!175594 () Unit!7071)

(assert (=> d!37122 (= lt!175606 lt!175594)))

(assert (=> d!37122 (= lt!175594 (lemmaIsPrefixRefl!0 (_2!4998 lt!175172)))))

(declare-fun lt!175611 () Unit!7071)

(declare-fun lt!175595 () Unit!7071)

(assert (=> d!37122 (= lt!175611 lt!175595)))

(assert (=> d!37122 (isPrefixOf!0 lt!175592 lt!175592)))

(assert (=> d!37122 (= lt!175595 (lemmaIsPrefixRefl!0 lt!175592))))

(declare-fun lt!175600 () Unit!7071)

(declare-fun lt!175608 () Unit!7071)

(assert (=> d!37122 (= lt!175600 lt!175608)))

(assert (=> d!37122 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37122 (= lt!175608 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37122 (= lt!175592 (BitStream!4189 (buf!2767 (_2!4998 lt!175172)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305)))))

(assert (=> d!37122 (isPrefixOf!0 thiss!1305 (_2!4998 lt!175172))))

(assert (=> d!37122 (= (reader!0 thiss!1305 (_2!4998 lt!175172)) lt!175601)))

(declare-fun b!115145 () Bool)

(declare-fun lt!175604 () (_ BitVec 64))

(declare-fun lt!175607 () (_ BitVec 64))

(assert (=> b!115145 (= e!75489 (= (_1!5000 lt!175601) (withMovedBitIndex!0 (_2!5000 lt!175601) (bvsub lt!175604 lt!175607))))))

(assert (=> b!115145 (or (= (bvand lt!175604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175607 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175604 lt!175607) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115145 (= lt!175607 (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175172))) (currentByte!5386 (_2!4998 lt!175172)) (currentBit!5381 (_2!4998 lt!175172))))))

(assert (=> b!115145 (= lt!175604 (bitIndex!0 (size!2357 (buf!2767 thiss!1305)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305)))))

(declare-fun b!115146 () Bool)

(declare-fun Unit!7081 () Unit!7071)

(assert (=> b!115146 (= e!75490 Unit!7081)))

(declare-fun b!115147 () Bool)

(declare-fun res!95145 () Bool)

(assert (=> b!115147 (=> (not res!95145) (not e!75489))))

(assert (=> b!115147 (= res!95145 (isPrefixOf!0 (_2!5000 lt!175601) (_2!4998 lt!175172)))))

(declare-fun b!115148 () Bool)

(declare-fun lt!175598 () Unit!7071)

(assert (=> b!115148 (= e!75490 lt!175598)))

(declare-fun lt!175603 () (_ BitVec 64))

(assert (=> b!115148 (= lt!175603 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!175597 () (_ BitVec 64))

(assert (=> b!115148 (= lt!175597 (bitIndex!0 (size!2357 (buf!2767 thiss!1305)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5194 array!5194 (_ BitVec 64) (_ BitVec 64)) Unit!7071)

(assert (=> b!115148 (= lt!175598 (arrayBitRangesEqSymmetric!0 (buf!2767 thiss!1305) (buf!2767 (_2!4998 lt!175172)) lt!175603 lt!175597))))

(assert (=> b!115148 (arrayBitRangesEq!0 (buf!2767 (_2!4998 lt!175172)) (buf!2767 thiss!1305) lt!175603 lt!175597)))

(declare-fun b!115149 () Bool)

(declare-fun res!95146 () Bool)

(assert (=> b!115149 (=> (not res!95146) (not e!75489))))

(assert (=> b!115149 (= res!95146 (isPrefixOf!0 (_1!5000 lt!175601) thiss!1305))))

(assert (= (and d!37122 c!6982) b!115148))

(assert (= (and d!37122 (not c!6982)) b!115146))

(assert (= (and d!37122 res!95144) b!115149))

(assert (= (and b!115149 res!95146) b!115147))

(assert (= (and b!115147 res!95145) b!115145))

(declare-fun m!172273 () Bool)

(assert (=> b!115145 m!172273))

(declare-fun m!172275 () Bool)

(assert (=> b!115145 m!172275))

(assert (=> b!115145 m!172013))

(declare-fun m!172277 () Bool)

(assert (=> b!115147 m!172277))

(declare-fun m!172279 () Bool)

(assert (=> b!115149 m!172279))

(declare-fun m!172281 () Bool)

(assert (=> d!37122 m!172281))

(declare-fun m!172283 () Bool)

(assert (=> d!37122 m!172283))

(declare-fun m!172285 () Bool)

(assert (=> d!37122 m!172285))

(declare-fun m!172287 () Bool)

(assert (=> d!37122 m!172287))

(declare-fun m!172289 () Bool)

(assert (=> d!37122 m!172289))

(declare-fun m!172291 () Bool)

(assert (=> d!37122 m!172291))

(declare-fun m!172293 () Bool)

(assert (=> d!37122 m!172293))

(assert (=> d!37122 m!171991))

(declare-fun m!172295 () Bool)

(assert (=> d!37122 m!172295))

(declare-fun m!172297 () Bool)

(assert (=> d!37122 m!172297))

(declare-fun m!172299 () Bool)

(assert (=> d!37122 m!172299))

(assert (=> b!115148 m!172013))

(declare-fun m!172301 () Bool)

(assert (=> b!115148 m!172301))

(declare-fun m!172303 () Bool)

(assert (=> b!115148 m!172303))

(assert (=> b!114970 d!37122))

(declare-fun d!37124 () Bool)

(declare-fun e!75491 () Bool)

(assert (=> d!37124 e!75491))

(declare-fun res!95147 () Bool)

(assert (=> d!37124 (=> (not res!95147) (not e!75491))))

(declare-fun lt!175621 () tuple2!9470)

(assert (=> d!37124 (= res!95147 (isPrefixOf!0 (_1!5000 lt!175621) (_2!5000 lt!175621)))))

(declare-fun lt!175612 () BitStream!4188)

(assert (=> d!37124 (= lt!175621 (tuple2!9471 lt!175612 (_2!4998 lt!175172)))))

(declare-fun lt!175630 () Unit!7071)

(declare-fun lt!175616 () Unit!7071)

(assert (=> d!37124 (= lt!175630 lt!175616)))

(assert (=> d!37124 (isPrefixOf!0 lt!175612 (_2!4998 lt!175172))))

(assert (=> d!37124 (= lt!175616 (lemmaIsPrefixTransitive!0 lt!175612 (_2!4998 lt!175172) (_2!4998 lt!175172)))))

(declare-fun lt!175622 () Unit!7071)

(declare-fun lt!175613 () Unit!7071)

(assert (=> d!37124 (= lt!175622 lt!175613)))

(assert (=> d!37124 (isPrefixOf!0 lt!175612 (_2!4998 lt!175172))))

(assert (=> d!37124 (= lt!175613 (lemmaIsPrefixTransitive!0 lt!175612 (_2!4998 lt!175171) (_2!4998 lt!175172)))))

(declare-fun lt!175619 () Unit!7071)

(declare-fun e!75492 () Unit!7071)

(assert (=> d!37124 (= lt!175619 e!75492)))

(declare-fun c!6983 () Bool)

(assert (=> d!37124 (= c!6983 (not (= (size!2357 (buf!2767 (_2!4998 lt!175171))) #b00000000000000000000000000000000)))))

(declare-fun lt!175625 () Unit!7071)

(declare-fun lt!175629 () Unit!7071)

(assert (=> d!37124 (= lt!175625 lt!175629)))

(assert (=> d!37124 (isPrefixOf!0 (_2!4998 lt!175172) (_2!4998 lt!175172))))

(assert (=> d!37124 (= lt!175629 (lemmaIsPrefixRefl!0 (_2!4998 lt!175172)))))

(declare-fun lt!175626 () Unit!7071)

(declare-fun lt!175614 () Unit!7071)

(assert (=> d!37124 (= lt!175626 lt!175614)))

(assert (=> d!37124 (= lt!175614 (lemmaIsPrefixRefl!0 (_2!4998 lt!175172)))))

(declare-fun lt!175631 () Unit!7071)

(declare-fun lt!175615 () Unit!7071)

(assert (=> d!37124 (= lt!175631 lt!175615)))

(assert (=> d!37124 (isPrefixOf!0 lt!175612 lt!175612)))

(assert (=> d!37124 (= lt!175615 (lemmaIsPrefixRefl!0 lt!175612))))

(declare-fun lt!175620 () Unit!7071)

(declare-fun lt!175628 () Unit!7071)

(assert (=> d!37124 (= lt!175620 lt!175628)))

(assert (=> d!37124 (isPrefixOf!0 (_2!4998 lt!175171) (_2!4998 lt!175171))))

(assert (=> d!37124 (= lt!175628 (lemmaIsPrefixRefl!0 (_2!4998 lt!175171)))))

(assert (=> d!37124 (= lt!175612 (BitStream!4189 (buf!2767 (_2!4998 lt!175172)) (currentByte!5386 (_2!4998 lt!175171)) (currentBit!5381 (_2!4998 lt!175171))))))

(assert (=> d!37124 (isPrefixOf!0 (_2!4998 lt!175171) (_2!4998 lt!175172))))

(assert (=> d!37124 (= (reader!0 (_2!4998 lt!175171) (_2!4998 lt!175172)) lt!175621)))

(declare-fun lt!175627 () (_ BitVec 64))

(declare-fun b!115150 () Bool)

(declare-fun lt!175624 () (_ BitVec 64))

(assert (=> b!115150 (= e!75491 (= (_1!5000 lt!175621) (withMovedBitIndex!0 (_2!5000 lt!175621) (bvsub lt!175624 lt!175627))))))

(assert (=> b!115150 (or (= (bvand lt!175624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175627 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175624 lt!175627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115150 (= lt!175627 (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175172))) (currentByte!5386 (_2!4998 lt!175172)) (currentBit!5381 (_2!4998 lt!175172))))))

(assert (=> b!115150 (= lt!175624 (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175171))) (currentByte!5386 (_2!4998 lt!175171)) (currentBit!5381 (_2!4998 lt!175171))))))

(declare-fun b!115151 () Bool)

(declare-fun Unit!7082 () Unit!7071)

(assert (=> b!115151 (= e!75492 Unit!7082)))

(declare-fun b!115152 () Bool)

(declare-fun res!95148 () Bool)

(assert (=> b!115152 (=> (not res!95148) (not e!75491))))

(assert (=> b!115152 (= res!95148 (isPrefixOf!0 (_2!5000 lt!175621) (_2!4998 lt!175172)))))

(declare-fun b!115153 () Bool)

(declare-fun lt!175618 () Unit!7071)

(assert (=> b!115153 (= e!75492 lt!175618)))

(declare-fun lt!175623 () (_ BitVec 64))

(assert (=> b!115153 (= lt!175623 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!175617 () (_ BitVec 64))

(assert (=> b!115153 (= lt!175617 (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175171))) (currentByte!5386 (_2!4998 lt!175171)) (currentBit!5381 (_2!4998 lt!175171))))))

(assert (=> b!115153 (= lt!175618 (arrayBitRangesEqSymmetric!0 (buf!2767 (_2!4998 lt!175171)) (buf!2767 (_2!4998 lt!175172)) lt!175623 lt!175617))))

(assert (=> b!115153 (arrayBitRangesEq!0 (buf!2767 (_2!4998 lt!175172)) (buf!2767 (_2!4998 lt!175171)) lt!175623 lt!175617)))

(declare-fun b!115154 () Bool)

(declare-fun res!95149 () Bool)

(assert (=> b!115154 (=> (not res!95149) (not e!75491))))

(assert (=> b!115154 (= res!95149 (isPrefixOf!0 (_1!5000 lt!175621) (_2!4998 lt!175171)))))

(assert (= (and d!37124 c!6983) b!115153))

(assert (= (and d!37124 (not c!6983)) b!115151))

(assert (= (and d!37124 res!95147) b!115154))

(assert (= (and b!115154 res!95149) b!115152))

(assert (= (and b!115152 res!95148) b!115150))

(declare-fun m!172305 () Bool)

(assert (=> b!115150 m!172305))

(assert (=> b!115150 m!172275))

(assert (=> b!115150 m!172011))

(declare-fun m!172307 () Bool)

(assert (=> b!115152 m!172307))

(declare-fun m!172309 () Bool)

(assert (=> b!115154 m!172309))

(declare-fun m!172311 () Bool)

(assert (=> d!37124 m!172311))

(declare-fun m!172313 () Bool)

(assert (=> d!37124 m!172313))

(declare-fun m!172315 () Bool)

(assert (=> d!37124 m!172315))

(assert (=> d!37124 m!172287))

(declare-fun m!172317 () Bool)

(assert (=> d!37124 m!172317))

(declare-fun m!172319 () Bool)

(assert (=> d!37124 m!172319))

(declare-fun m!172321 () Bool)

(assert (=> d!37124 m!172321))

(declare-fun m!172323 () Bool)

(assert (=> d!37124 m!172323))

(assert (=> d!37124 m!172295))

(declare-fun m!172325 () Bool)

(assert (=> d!37124 m!172325))

(declare-fun m!172327 () Bool)

(assert (=> d!37124 m!172327))

(assert (=> b!115153 m!172011))

(declare-fun m!172329 () Bool)

(assert (=> b!115153 m!172329))

(declare-fun m!172331 () Bool)

(assert (=> b!115153 m!172331))

(assert (=> b!114970 d!37124))

(declare-fun d!37126 () Bool)

(declare-fun lt!175632 () tuple2!9478)

(assert (=> d!37126 (= lt!175632 (readBit!0 (BitStream!4189 (buf!2767 (_2!4998 lt!175172)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305))))))

(assert (=> d!37126 (= (readBitPure!0 (BitStream!4189 (buf!2767 (_2!4998 lt!175172)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305))) (tuple2!9469 (_2!5004 lt!175632) (_1!5004 lt!175632)))))

(declare-fun bs!8985 () Bool)

(assert (= bs!8985 d!37126))

(declare-fun m!172333 () Bool)

(assert (=> bs!8985 m!172333))

(assert (=> b!114970 d!37126))

(declare-fun d!37128 () Bool)

(declare-fun lt!175633 () tuple2!9478)

(assert (=> d!37128 (= lt!175633 (readBit!0 (_1!5000 lt!175168)))))

(assert (=> d!37128 (= (readBitPure!0 (_1!5000 lt!175168)) (tuple2!9469 (_2!5004 lt!175633) (_1!5004 lt!175633)))))

(declare-fun bs!8986 () Bool)

(assert (= bs!8986 d!37128))

(declare-fun m!172335 () Bool)

(assert (=> bs!8986 m!172335))

(assert (=> b!114970 d!37128))

(declare-fun b!115167 () Bool)

(declare-fun e!75497 () Bool)

(declare-fun lt!175642 () tuple2!9468)

(declare-fun lt!175643 () tuple2!9466)

(assert (=> b!115167 (= e!75497 (= (bitIndex!0 (size!2357 (buf!2767 (_1!4999 lt!175642))) (currentByte!5386 (_1!4999 lt!175642)) (currentBit!5381 (_1!4999 lt!175642))) (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175643))) (currentByte!5386 (_2!4998 lt!175643)) (currentBit!5381 (_2!4998 lt!175643)))))))

(declare-fun d!37130 () Bool)

(declare-fun e!75498 () Bool)

(assert (=> d!37130 e!75498))

(declare-fun res!95161 () Bool)

(assert (=> d!37130 (=> (not res!95161) (not e!75498))))

(assert (=> d!37130 (= res!95161 (= (size!2357 (buf!2767 thiss!1305)) (size!2357 (buf!2767 (_2!4998 lt!175643)))))))

(declare-fun choose!16 (BitStream!4188 Bool) tuple2!9466)

(assert (=> d!37130 (= lt!175643 (choose!16 thiss!1305 lt!175174))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37130 (validate_offset_bit!0 ((_ sign_extend 32) (size!2357 (buf!2767 thiss!1305))) ((_ sign_extend 32) (currentByte!5386 thiss!1305)) ((_ sign_extend 32) (currentBit!5381 thiss!1305)))))

(assert (=> d!37130 (= (appendBit!0 thiss!1305 lt!175174) lt!175643)))

(declare-fun b!115165 () Bool)

(declare-fun res!95160 () Bool)

(assert (=> b!115165 (=> (not res!95160) (not e!75498))))

(assert (=> b!115165 (= res!95160 (isPrefixOf!0 thiss!1305 (_2!4998 lt!175643)))))

(declare-fun b!115164 () Bool)

(declare-fun res!95159 () Bool)

(assert (=> b!115164 (=> (not res!95159) (not e!75498))))

(declare-fun lt!175644 () (_ BitVec 64))

(declare-fun lt!175645 () (_ BitVec 64))

(assert (=> b!115164 (= res!95159 (= (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175643))) (currentByte!5386 (_2!4998 lt!175643)) (currentBit!5381 (_2!4998 lt!175643))) (bvadd lt!175644 lt!175645)))))

(assert (=> b!115164 (or (not (= (bvand lt!175644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175645 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!175644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!175644 lt!175645) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115164 (= lt!175645 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!115164 (= lt!175644 (bitIndex!0 (size!2357 (buf!2767 thiss!1305)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305)))))

(declare-fun b!115166 () Bool)

(assert (=> b!115166 (= e!75498 e!75497)))

(declare-fun res!95158 () Bool)

(assert (=> b!115166 (=> (not res!95158) (not e!75497))))

(assert (=> b!115166 (= res!95158 (and (= (_2!4999 lt!175642) lt!175174) (= (_1!4999 lt!175642) (_2!4998 lt!175643))))))

(assert (=> b!115166 (= lt!175642 (readBitPure!0 (readerFrom!0 (_2!4998 lt!175643) (currentBit!5381 thiss!1305) (currentByte!5386 thiss!1305))))))

(assert (= (and d!37130 res!95161) b!115164))

(assert (= (and b!115164 res!95159) b!115165))

(assert (= (and b!115165 res!95160) b!115166))

(assert (= (and b!115166 res!95158) b!115167))

(declare-fun m!172337 () Bool)

(assert (=> b!115165 m!172337))

(declare-fun m!172339 () Bool)

(assert (=> b!115164 m!172339))

(assert (=> b!115164 m!172013))

(declare-fun m!172341 () Bool)

(assert (=> b!115167 m!172341))

(assert (=> b!115167 m!172339))

(declare-fun m!172343 () Bool)

(assert (=> d!37130 m!172343))

(declare-fun m!172345 () Bool)

(assert (=> d!37130 m!172345))

(declare-fun m!172347 () Bool)

(assert (=> b!115166 m!172347))

(assert (=> b!115166 m!172347))

(declare-fun m!172349 () Bool)

(assert (=> b!115166 m!172349))

(assert (=> b!114970 d!37130))

(declare-fun d!37132 () Bool)

(declare-fun res!95162 () Bool)

(declare-fun e!75500 () Bool)

(assert (=> d!37132 (=> (not res!95162) (not e!75500))))

(assert (=> d!37132 (= res!95162 (= (size!2357 (buf!2767 thiss!1305)) (size!2357 (buf!2767 (_2!4998 lt!175172)))))))

(assert (=> d!37132 (= (isPrefixOf!0 thiss!1305 (_2!4998 lt!175172)) e!75500)))

(declare-fun b!115168 () Bool)

(declare-fun res!95163 () Bool)

(assert (=> b!115168 (=> (not res!95163) (not e!75500))))

(assert (=> b!115168 (= res!95163 (bvsle (bitIndex!0 (size!2357 (buf!2767 thiss!1305)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305)) (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175172))) (currentByte!5386 (_2!4998 lt!175172)) (currentBit!5381 (_2!4998 lt!175172)))))))

(declare-fun b!115169 () Bool)

(declare-fun e!75499 () Bool)

(assert (=> b!115169 (= e!75500 e!75499)))

(declare-fun res!95164 () Bool)

(assert (=> b!115169 (=> res!95164 e!75499)))

(assert (=> b!115169 (= res!95164 (= (size!2357 (buf!2767 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!115170 () Bool)

(assert (=> b!115170 (= e!75499 (arrayBitRangesEq!0 (buf!2767 thiss!1305) (buf!2767 (_2!4998 lt!175172)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2357 (buf!2767 thiss!1305)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305))))))

(assert (= (and d!37132 res!95162) b!115168))

(assert (= (and b!115168 res!95163) b!115169))

(assert (= (and b!115169 (not res!95164)) b!115170))

(assert (=> b!115168 m!172013))

(assert (=> b!115168 m!172275))

(assert (=> b!115170 m!172013))

(assert (=> b!115170 m!172013))

(declare-fun m!172351 () Bool)

(assert (=> b!115170 m!172351))

(assert (=> b!114970 d!37132))

(declare-fun d!37134 () Bool)

(assert (=> d!37134 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!114966 d!37134))

(declare-fun d!37136 () Bool)

(declare-fun e!75501 () Bool)

(assert (=> d!37136 e!75501))

(declare-fun res!95166 () Bool)

(assert (=> d!37136 (=> (not res!95166) (not e!75501))))

(declare-fun lt!175650 () (_ BitVec 64))

(declare-fun lt!175649 () (_ BitVec 64))

(declare-fun lt!175647 () (_ BitVec 64))

(assert (=> d!37136 (= res!95166 (= lt!175650 (bvsub lt!175649 lt!175647)))))

(assert (=> d!37136 (or (= (bvand lt!175649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175647 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175649 lt!175647) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37136 (= lt!175647 (remainingBits!0 ((_ sign_extend 32) (size!2357 (buf!2767 (_2!4998 lt!175171)))) ((_ sign_extend 32) (currentByte!5386 (_2!4998 lt!175171))) ((_ sign_extend 32) (currentBit!5381 (_2!4998 lt!175171)))))))

(declare-fun lt!175646 () (_ BitVec 64))

(declare-fun lt!175648 () (_ BitVec 64))

(assert (=> d!37136 (= lt!175649 (bvmul lt!175646 lt!175648))))

(assert (=> d!37136 (or (= lt!175646 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175648 (bvsdiv (bvmul lt!175646 lt!175648) lt!175646)))))

(assert (=> d!37136 (= lt!175648 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37136 (= lt!175646 ((_ sign_extend 32) (size!2357 (buf!2767 (_2!4998 lt!175171)))))))

(assert (=> d!37136 (= lt!175650 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5386 (_2!4998 lt!175171))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5381 (_2!4998 lt!175171)))))))

(assert (=> d!37136 (invariant!0 (currentBit!5381 (_2!4998 lt!175171)) (currentByte!5386 (_2!4998 lt!175171)) (size!2357 (buf!2767 (_2!4998 lt!175171))))))

(assert (=> d!37136 (= (bitIndex!0 (size!2357 (buf!2767 (_2!4998 lt!175171))) (currentByte!5386 (_2!4998 lt!175171)) (currentBit!5381 (_2!4998 lt!175171))) lt!175650)))

(declare-fun b!115171 () Bool)

(declare-fun res!95165 () Bool)

(assert (=> b!115171 (=> (not res!95165) (not e!75501))))

(assert (=> b!115171 (= res!95165 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175650))))

(declare-fun b!115172 () Bool)

(declare-fun lt!175651 () (_ BitVec 64))

(assert (=> b!115172 (= e!75501 (bvsle lt!175650 (bvmul lt!175651 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115172 (or (= lt!175651 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175651 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175651)))))

(assert (=> b!115172 (= lt!175651 ((_ sign_extend 32) (size!2357 (buf!2767 (_2!4998 lt!175171)))))))

(assert (= (and d!37136 res!95166) b!115171))

(assert (= (and b!115171 res!95165) b!115172))

(declare-fun m!172353 () Bool)

(assert (=> d!37136 m!172353))

(declare-fun m!172355 () Bool)

(assert (=> d!37136 m!172355))

(assert (=> b!114967 d!37136))

(declare-fun d!37138 () Bool)

(declare-fun e!75502 () Bool)

(assert (=> d!37138 e!75502))

(declare-fun res!95168 () Bool)

(assert (=> d!37138 (=> (not res!95168) (not e!75502))))

(declare-fun lt!175653 () (_ BitVec 64))

(declare-fun lt!175656 () (_ BitVec 64))

(declare-fun lt!175655 () (_ BitVec 64))

(assert (=> d!37138 (= res!95168 (= lt!175656 (bvsub lt!175655 lt!175653)))))

(assert (=> d!37138 (or (= (bvand lt!175655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!175653 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!175655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!175655 lt!175653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37138 (= lt!175653 (remainingBits!0 ((_ sign_extend 32) (size!2357 (buf!2767 thiss!1305))) ((_ sign_extend 32) (currentByte!5386 thiss!1305)) ((_ sign_extend 32) (currentBit!5381 thiss!1305))))))

(declare-fun lt!175652 () (_ BitVec 64))

(declare-fun lt!175654 () (_ BitVec 64))

(assert (=> d!37138 (= lt!175655 (bvmul lt!175652 lt!175654))))

(assert (=> d!37138 (or (= lt!175652 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!175654 (bvsdiv (bvmul lt!175652 lt!175654) lt!175652)))))

(assert (=> d!37138 (= lt!175654 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37138 (= lt!175652 ((_ sign_extend 32) (size!2357 (buf!2767 thiss!1305))))))

(assert (=> d!37138 (= lt!175656 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5386 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5381 thiss!1305))))))

(assert (=> d!37138 (invariant!0 (currentBit!5381 thiss!1305) (currentByte!5386 thiss!1305) (size!2357 (buf!2767 thiss!1305)))))

(assert (=> d!37138 (= (bitIndex!0 (size!2357 (buf!2767 thiss!1305)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305)) lt!175656)))

(declare-fun b!115173 () Bool)

(declare-fun res!95167 () Bool)

(assert (=> b!115173 (=> (not res!95167) (not e!75502))))

(assert (=> b!115173 (= res!95167 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!175656))))

(declare-fun b!115174 () Bool)

(declare-fun lt!175657 () (_ BitVec 64))

(assert (=> b!115174 (= e!75502 (bvsle lt!175656 (bvmul lt!175657 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115174 (or (= lt!175657 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!175657 #b0000000000000000000000000000000000000000000000000000000000001000) lt!175657)))))

(assert (=> b!115174 (= lt!175657 ((_ sign_extend 32) (size!2357 (buf!2767 thiss!1305))))))

(assert (= (and d!37138 res!95168) b!115173))

(assert (= (and b!115173 res!95167) b!115174))

(assert (=> d!37138 m!172067))

(assert (=> d!37138 m!172075))

(assert (=> b!114967 d!37138))

(declare-fun d!37140 () Bool)

(assert (=> d!37140 (= (invariant!0 (currentBit!5381 thiss!1305) (currentByte!5386 thiss!1305) (size!2357 (buf!2767 (_2!4998 lt!175171)))) (and (bvsge (currentBit!5381 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5381 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5386 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5386 thiss!1305) (size!2357 (buf!2767 (_2!4998 lt!175171)))) (and (= (currentBit!5381 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5386 thiss!1305) (size!2357 (buf!2767 (_2!4998 lt!175171))))))))))

(assert (=> b!114963 d!37140))

(declare-fun d!37142 () Bool)

(assert (=> d!37142 (= (invariant!0 (currentBit!5381 thiss!1305) (currentByte!5386 thiss!1305) (size!2357 (buf!2767 (_2!4998 lt!175172)))) (and (bvsge (currentBit!5381 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5381 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5386 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5386 thiss!1305) (size!2357 (buf!2767 (_2!4998 lt!175172)))) (and (= (currentBit!5381 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5386 thiss!1305) (size!2357 (buf!2767 (_2!4998 lt!175172))))))))))

(assert (=> b!114965 d!37142))

(declare-fun d!37144 () Bool)

(declare-fun lt!175658 () tuple2!9478)

(assert (=> d!37144 (= lt!175658 (readBit!0 (readerFrom!0 (_2!4998 lt!175171) (currentBit!5381 thiss!1305) (currentByte!5386 thiss!1305))))))

(assert (=> d!37144 (= (readBitPure!0 (readerFrom!0 (_2!4998 lt!175171) (currentBit!5381 thiss!1305) (currentByte!5386 thiss!1305))) (tuple2!9469 (_2!5004 lt!175658) (_1!5004 lt!175658)))))

(declare-fun bs!8987 () Bool)

(assert (= bs!8987 d!37144))

(assert (=> bs!8987 m!172015))

(declare-fun m!172357 () Bool)

(assert (=> bs!8987 m!172357))

(assert (=> b!114964 d!37144))

(declare-fun d!37146 () Bool)

(declare-fun e!75505 () Bool)

(assert (=> d!37146 e!75505))

(declare-fun res!95172 () Bool)

(assert (=> d!37146 (=> (not res!95172) (not e!75505))))

(assert (=> d!37146 (= res!95172 (invariant!0 (currentBit!5381 (_2!4998 lt!175171)) (currentByte!5386 (_2!4998 lt!175171)) (size!2357 (buf!2767 (_2!4998 lt!175171)))))))

(assert (=> d!37146 (= (readerFrom!0 (_2!4998 lt!175171) (currentBit!5381 thiss!1305) (currentByte!5386 thiss!1305)) (BitStream!4189 (buf!2767 (_2!4998 lt!175171)) (currentByte!5386 thiss!1305) (currentBit!5381 thiss!1305)))))

(declare-fun b!115177 () Bool)

(assert (=> b!115177 (= e!75505 (invariant!0 (currentBit!5381 thiss!1305) (currentByte!5386 thiss!1305) (size!2357 (buf!2767 (_2!4998 lt!175171)))))))

(assert (= (and d!37146 res!95172) b!115177))

(assert (=> d!37146 m!172355))

(assert (=> b!115177 m!172009))

(assert (=> b!114964 d!37146))

(check-sat (not b!115124) (not b!115152) (not d!37122) (not b!115165) (not b!115132) (not b!115167) (not b!115150) (not b!115166) (not b!115170) (not d!37146) (not d!37130) (not d!37124) (not b!115131) (not d!37054) (not d!37046) (not b!115133) (not b!115022) (not b!115148) (not d!37120) (not d!37138) (not b!115154) (not d!37044) (not b!115145) (not b!115130) (not b!115123) (not d!37050) (not d!37052) (not bm!1490) (not b!115128) (not d!37144) (not b!115147) (not b!115168) (not b!115153) (not b!115125) (not b!115164) (not b!115024) (not d!37126) (not b!115177) (not b!115149) (not d!37056) (not d!37136) (not d!37128) (not d!37058) (not b!115129))
