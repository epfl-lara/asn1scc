; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18966 () Bool)

(assert start!18966)

(declare-fun b!94885 () Bool)

(declare-fun e!62213 () Bool)

(declare-datatypes ((array!4435 0))(
  ( (array!4436 (arr!2627 (Array (_ BitVec 32) (_ BitVec 8))) (size!2019 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3542 0))(
  ( (BitStream!3543 (buf!2380 array!4435) (currentByte!4743 (_ BitVec 32)) (currentBit!4738 (_ BitVec 32))) )
))
(declare-fun thiss!1534 () BitStream!3542)

(declare-fun array_inv!1836 (array!4435) Bool)

(assert (=> b!94885 (= e!62213 (array_inv!1836 (buf!2380 thiss!1534)))))

(declare-fun b!94886 () Bool)

(declare-fun res!78158 () Bool)

(declare-fun e!62214 () Bool)

(assert (=> b!94886 (=> (not res!78158) (not e!62214))))

(declare-fun bitStream1!8 () BitStream!3542)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94886 (= res!78158 (validate_offset_bits!1 ((_ sign_extend 32) (size!2019 (buf!2380 bitStream1!8))) ((_ sign_extend 32) (currentByte!4743 bitStream1!8)) ((_ sign_extend 32) (currentBit!4738 bitStream1!8)) nBits!484))))

(declare-fun res!78152 () Bool)

(assert (=> start!18966 (=> (not res!78152) (not e!62214))))

(assert (=> start!18966 (= res!78152 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18966 e!62214))

(assert (=> start!18966 true))

(declare-fun e!62211 () Bool)

(declare-fun inv!12 (BitStream!3542) Bool)

(assert (=> start!18966 (and (inv!12 bitStream1!8) e!62211)))

(declare-fun bitStream2!8 () BitStream!3542)

(declare-fun e!62212 () Bool)

(assert (=> start!18966 (and (inv!12 bitStream2!8) e!62212)))

(declare-fun base!8 () BitStream!3542)

(declare-fun e!62206 () Bool)

(assert (=> start!18966 (and (inv!12 base!8) e!62206)))

(assert (=> start!18966 (and (inv!12 thiss!1534) e!62213)))

(declare-fun b!94887 () Bool)

(assert (=> b!94887 (= e!62212 (array_inv!1836 (buf!2380 bitStream2!8)))))

(declare-fun b!94888 () Bool)

(declare-fun res!78147 () Bool)

(assert (=> b!94888 (=> (not res!78147) (not e!62214))))

(declare-datatypes ((List!877 0))(
  ( (Nil!874) (Cons!873 (h!992 Bool) (t!1627 List!877)) )
))
(declare-fun listBits!13 () List!877)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3542 BitStream!3542 (_ BitVec 64)) List!877)

(assert (=> b!94888 (= res!78147 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!94889 () Bool)

(declare-fun res!78150 () Bool)

(assert (=> b!94889 (=> (not res!78150) (not e!62214))))

(declare-fun isPrefixOf!0 (BitStream!3542 BitStream!3542) Bool)

(assert (=> b!94889 (= res!78150 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!94890 () Bool)

(declare-fun res!78157 () Bool)

(assert (=> b!94890 (=> (not res!78157) (not e!62214))))

(assert (=> b!94890 (= res!78157 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94891 () Bool)

(assert (=> b!94891 (= e!62211 (array_inv!1836 (buf!2380 bitStream1!8)))))

(declare-fun b!94892 () Bool)

(declare-fun res!78154 () Bool)

(assert (=> b!94892 (=> (not res!78154) (not e!62214))))

(assert (=> b!94892 (= res!78154 (and (= (buf!2380 bitStream1!8) (buf!2380 bitStream2!8)) (= (buf!2380 bitStream1!8) (buf!2380 base!8))))))

(declare-fun b!94893 () Bool)

(declare-fun res!78155 () Bool)

(assert (=> b!94893 (=> (not res!78155) (not e!62214))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!94893 (= res!78155 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2019 (buf!2380 bitStream1!8)) (currentByte!4743 bitStream1!8) (currentBit!4738 bitStream1!8))) (bitIndex!0 (size!2019 (buf!2380 bitStream2!8)) (currentByte!4743 bitStream2!8) (currentBit!4738 bitStream2!8))))))

(declare-fun b!94894 () Bool)

(assert (=> b!94894 (= e!62206 (array_inv!1836 (buf!2380 base!8)))))

(declare-fun b!94895 () Bool)

(declare-fun res!78151 () Bool)

(assert (=> b!94895 (=> (not res!78151) (not e!62214))))

(assert (=> b!94895 (= res!78151 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!94896 () Bool)

(declare-fun res!78159 () Bool)

(assert (=> b!94896 (=> (not res!78159) (not e!62214))))

(declare-fun length!468 (List!877) Int)

(assert (=> b!94896 (= res!78159 (> (length!468 listBits!13) 0))))

(declare-fun b!94897 () Bool)

(declare-fun res!78153 () Bool)

(assert (=> b!94897 (=> (not res!78153) (not e!62214))))

(declare-datatypes ((tuple2!7670 0))(
  ( (tuple2!7671 (_1!4082 BitStream!3542) (_2!4082 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3542) tuple2!7670)

(declare-fun head!589 (List!877) Bool)

(assert (=> b!94897 (= res!78153 (= (_2!4082 (readBitPure!0 bitStream1!8)) (head!589 listBits!13)))))

(declare-fun b!94898 () Bool)

(assert (=> b!94898 (= e!62214 (= listBits!13 Nil!874))))

(declare-fun b!94899 () Bool)

(declare-fun res!78156 () Bool)

(assert (=> b!94899 (=> (not res!78156) (not e!62214))))

(assert (=> b!94899 (= res!78156 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!94900 () Bool)

(declare-fun res!78148 () Bool)

(assert (=> b!94900 (=> (not res!78148) (not e!62214))))

(assert (=> b!94900 (= res!78148 (bvslt (bitIndex!0 (size!2019 (buf!2380 base!8)) (currentByte!4743 base!8) (currentBit!4738 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!94901 () Bool)

(declare-fun res!78149 () Bool)

(assert (=> b!94901 (=> (not res!78149) (not e!62214))))

(assert (=> b!94901 (= res!78149 (validate_offset_bits!1 ((_ sign_extend 32) (size!2019 (buf!2380 bitStream2!8))) ((_ sign_extend 32) (currentByte!4743 bitStream2!8)) ((_ sign_extend 32) (currentBit!4738 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!18966 res!78152) b!94896))

(assert (= (and b!94896 res!78159) b!94899))

(assert (= (and b!94899 res!78156) b!94889))

(assert (= (and b!94889 res!78150) b!94895))

(assert (= (and b!94895 res!78151) b!94892))

(assert (= (and b!94892 res!78154) b!94900))

(assert (= (and b!94900 res!78148) b!94893))

(assert (= (and b!94893 res!78155) b!94886))

(assert (= (and b!94886 res!78158) b!94901))

(assert (= (and b!94901 res!78149) b!94888))

(assert (= (and b!94888 res!78147) b!94890))

(assert (= (and b!94890 res!78157) b!94897))

(assert (= (and b!94897 res!78153) b!94898))

(assert (= start!18966 b!94891))

(assert (= start!18966 b!94887))

(assert (= start!18966 b!94894))

(assert (= start!18966 b!94885))

(declare-fun m!138385 () Bool)

(assert (=> b!94894 m!138385))

(declare-fun m!138387 () Bool)

(assert (=> b!94897 m!138387))

(declare-fun m!138389 () Bool)

(assert (=> b!94897 m!138389))

(declare-fun m!138391 () Bool)

(assert (=> b!94889 m!138391))

(declare-fun m!138393 () Bool)

(assert (=> b!94888 m!138393))

(declare-fun m!138395 () Bool)

(assert (=> b!94891 m!138395))

(declare-fun m!138397 () Bool)

(assert (=> start!18966 m!138397))

(declare-fun m!138399 () Bool)

(assert (=> start!18966 m!138399))

(declare-fun m!138401 () Bool)

(assert (=> start!18966 m!138401))

(declare-fun m!138403 () Bool)

(assert (=> start!18966 m!138403))

(declare-fun m!138405 () Bool)

(assert (=> b!94885 m!138405))

(declare-fun m!138407 () Bool)

(assert (=> b!94895 m!138407))

(declare-fun m!138409 () Bool)

(assert (=> b!94900 m!138409))

(declare-fun m!138411 () Bool)

(assert (=> b!94886 m!138411))

(declare-fun m!138413 () Bool)

(assert (=> b!94887 m!138413))

(declare-fun m!138415 () Bool)

(assert (=> b!94901 m!138415))

(declare-fun m!138417 () Bool)

(assert (=> b!94899 m!138417))

(declare-fun m!138419 () Bool)

(assert (=> b!94896 m!138419))

(declare-fun m!138421 () Bool)

(assert (=> b!94893 m!138421))

(declare-fun m!138423 () Bool)

(assert (=> b!94893 m!138423))

(push 1)

(assert (not b!94900))

(assert (not b!94888))

(assert (not b!94897))

(assert (not b!94901))

(assert (not b!94886))

(assert (not b!94887))

(assert (not b!94899))

(assert (not b!94895))

(assert (not b!94896))

(assert (not b!94893))

(assert (not b!94889))

(assert (not b!94894))

(assert (not b!94885))

(assert (not b!94891))

(assert (not start!18966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29488 () Bool)

(assert (=> d!29488 (= (array_inv!1836 (buf!2380 bitStream2!8)) (bvsge (size!2019 (buf!2380 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!94887 d!29488))

(declare-fun d!29490 () Bool)

(declare-fun res!78211 () Bool)

(declare-fun e!62252 () Bool)

(assert (=> d!29490 (=> (not res!78211) (not e!62252))))

(assert (=> d!29490 (= res!78211 (= (size!2019 (buf!2380 bitStream2!8)) (size!2019 (buf!2380 base!8))))))

(assert (=> d!29490 (= (isPrefixOf!0 bitStream2!8 base!8) e!62252)))

(declare-fun b!94963 () Bool)

(declare-fun res!78209 () Bool)

(assert (=> b!94963 (=> (not res!78209) (not e!62252))))

(assert (=> b!94963 (= res!78209 (bvsle (bitIndex!0 (size!2019 (buf!2380 bitStream2!8)) (currentByte!4743 bitStream2!8) (currentBit!4738 bitStream2!8)) (bitIndex!0 (size!2019 (buf!2380 base!8)) (currentByte!4743 base!8) (currentBit!4738 base!8))))))

(declare-fun b!94964 () Bool)

(declare-fun e!62251 () Bool)

(assert (=> b!94964 (= e!62252 e!62251)))

(declare-fun res!78210 () Bool)

(assert (=> b!94964 (=> res!78210 e!62251)))

(assert (=> b!94964 (= res!78210 (= (size!2019 (buf!2380 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!94965 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4435 array!4435 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94965 (= e!62251 (arrayBitRangesEq!0 (buf!2380 bitStream2!8) (buf!2380 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2019 (buf!2380 bitStream2!8)) (currentByte!4743 bitStream2!8) (currentBit!4738 bitStream2!8))))))

(assert (= (and d!29490 res!78211) b!94963))

(assert (= (and b!94963 res!78209) b!94964))

(assert (= (and b!94964 (not res!78210)) b!94965))

(assert (=> b!94963 m!138423))

(assert (=> b!94963 m!138409))

(assert (=> b!94965 m!138423))

(assert (=> b!94965 m!138423))

(declare-fun m!138469 () Bool)

(assert (=> b!94965 m!138469))

(assert (=> b!94889 d!29490))

(declare-fun b!94988 () Bool)

(declare-fun e!62263 () Bool)

(declare-fun lt!138927 () List!877)

(declare-fun isEmpty!257 (List!877) Bool)

(assert (=> b!94988 (= e!62263 (isEmpty!257 lt!138927))))

(declare-fun b!94986 () Bool)

(declare-datatypes ((tuple2!7680 0))(
  ( (tuple2!7681 (_1!4087 List!877) (_2!4087 BitStream!3542)) )
))
(declare-fun e!62264 () tuple2!7680)

(assert (=> b!94986 (= e!62264 (tuple2!7681 Nil!874 bitStream1!8))))

(declare-fun d!29498 () Bool)

(assert (=> d!29498 e!62263))

(declare-fun c!5973 () Bool)

(assert (=> d!29498 (= c!5973 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29498 (= lt!138927 (_1!4087 e!62264))))

(declare-fun c!5972 () Bool)

(assert (=> d!29498 (= c!5972 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29498 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29498 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!138927)))

(declare-fun b!94989 () Bool)

(assert (=> b!94989 (= e!62263 (> (length!468 lt!138927) 0))))

(declare-datatypes ((tuple2!7682 0))(
  ( (tuple2!7683 (_1!4088 Bool) (_2!4088 BitStream!3542)) )
))
(declare-fun lt!138925 () tuple2!7682)

(declare-fun lt!138926 () (_ BitVec 64))

(declare-fun b!94987 () Bool)

(assert (=> b!94987 (= e!62264 (tuple2!7681 (Cons!873 (_1!4088 lt!138925) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4088 lt!138925) (bvsub nBits!484 lt!138926))) (_2!4088 lt!138925)))))

(declare-fun readBit!0 (BitStream!3542) tuple2!7682)

(assert (=> b!94987 (= lt!138925 (readBit!0 bitStream1!8))))

(assert (=> b!94987 (= lt!138926 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!29498 c!5972) b!94986))

(assert (= (and d!29498 (not c!5972)) b!94987))

(assert (= (and d!29498 c!5973) b!94988))

(assert (= (and d!29498 (not c!5973)) b!94989))

(declare-fun m!138473 () Bool)

(assert (=> b!94988 m!138473))

(declare-fun m!138477 () Bool)

(assert (=> b!94989 m!138477))

(declare-fun m!138483 () Bool)

(assert (=> b!94987 m!138483))

(declare-fun m!138485 () Bool)

(assert (=> b!94987 m!138485))

(assert (=> b!94888 d!29498))

(declare-fun d!29508 () Bool)

(declare-fun res!78214 () Bool)

(declare-fun e!62266 () Bool)

(assert (=> d!29508 (=> (not res!78214) (not e!62266))))

(assert (=> d!29508 (= res!78214 (= (size!2019 (buf!2380 bitStream1!8)) (size!2019 (buf!2380 base!8))))))

(assert (=> d!29508 (= (isPrefixOf!0 bitStream1!8 base!8) e!62266)))

(declare-fun b!94990 () Bool)

(declare-fun res!78212 () Bool)

(assert (=> b!94990 (=> (not res!78212) (not e!62266))))

(assert (=> b!94990 (= res!78212 (bvsle (bitIndex!0 (size!2019 (buf!2380 bitStream1!8)) (currentByte!4743 bitStream1!8) (currentBit!4738 bitStream1!8)) (bitIndex!0 (size!2019 (buf!2380 base!8)) (currentByte!4743 base!8) (currentBit!4738 base!8))))))

(declare-fun b!94991 () Bool)

(declare-fun e!62265 () Bool)

(assert (=> b!94991 (= e!62266 e!62265)))

(declare-fun res!78213 () Bool)

(assert (=> b!94991 (=> res!78213 e!62265)))

(assert (=> b!94991 (= res!78213 (= (size!2019 (buf!2380 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94992 () Bool)

(assert (=> b!94992 (= e!62265 (arrayBitRangesEq!0 (buf!2380 bitStream1!8) (buf!2380 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2019 (buf!2380 bitStream1!8)) (currentByte!4743 bitStream1!8) (currentBit!4738 bitStream1!8))))))

(assert (= (and d!29508 res!78214) b!94990))

(assert (= (and b!94990 res!78212) b!94991))

(assert (= (and b!94991 (not res!78213)) b!94992))

(assert (=> b!94990 m!138421))

(assert (=> b!94990 m!138409))

(assert (=> b!94992 m!138421))

(assert (=> b!94992 m!138421))

(declare-fun m!138489 () Bool)

(assert (=> b!94992 m!138489))

(assert (=> b!94899 d!29508))

(declare-fun d!29512 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29512 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2019 (buf!2380 bitStream2!8))) ((_ sign_extend 32) (currentByte!4743 bitStream2!8)) ((_ sign_extend 32) (currentBit!4738 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2019 (buf!2380 bitStream2!8))) ((_ sign_extend 32) (currentByte!4743 bitStream2!8)) ((_ sign_extend 32) (currentBit!4738 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7258 () Bool)

(assert (= bs!7258 d!29512))

(declare-fun m!138493 () Bool)

(assert (=> bs!7258 m!138493))

(assert (=> b!94901 d!29512))

(declare-fun d!29516 () Bool)

(declare-fun e!62273 () Bool)

(assert (=> d!29516 e!62273))

(declare-fun res!78227 () Bool)

(assert (=> d!29516 (=> (not res!78227) (not e!62273))))

(declare-fun lt!138958 () (_ BitVec 64))

(declare-fun lt!138959 () (_ BitVec 64))

(declare-fun lt!138956 () (_ BitVec 64))

(assert (=> d!29516 (= res!78227 (= lt!138958 (bvsub lt!138959 lt!138956)))))

(assert (=> d!29516 (or (= (bvand lt!138959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138956 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138959 lt!138956) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29516 (= lt!138956 (remainingBits!0 ((_ sign_extend 32) (size!2019 (buf!2380 base!8))) ((_ sign_extend 32) (currentByte!4743 base!8)) ((_ sign_extend 32) (currentBit!4738 base!8))))))

(declare-fun lt!138955 () (_ BitVec 64))

(declare-fun lt!138957 () (_ BitVec 64))

(assert (=> d!29516 (= lt!138959 (bvmul lt!138955 lt!138957))))

(assert (=> d!29516 (or (= lt!138955 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138957 (bvsdiv (bvmul lt!138955 lt!138957) lt!138955)))))

(assert (=> d!29516 (= lt!138957 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29516 (= lt!138955 ((_ sign_extend 32) (size!2019 (buf!2380 base!8))))))

(assert (=> d!29516 (= lt!138958 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4743 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4738 base!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29516 (invariant!0 (currentBit!4738 base!8) (currentByte!4743 base!8) (size!2019 (buf!2380 base!8)))))

(assert (=> d!29516 (= (bitIndex!0 (size!2019 (buf!2380 base!8)) (currentByte!4743 base!8) (currentBit!4738 base!8)) lt!138958)))

(declare-fun b!95004 () Bool)

(declare-fun res!78226 () Bool)

(assert (=> b!95004 (=> (not res!78226) (not e!62273))))

(assert (=> b!95004 (= res!78226 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138958))))

(declare-fun b!95005 () Bool)

(declare-fun lt!138960 () (_ BitVec 64))

(assert (=> b!95005 (= e!62273 (bvsle lt!138958 (bvmul lt!138960 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95005 (or (= lt!138960 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138960 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138960)))))

(assert (=> b!95005 (= lt!138960 ((_ sign_extend 32) (size!2019 (buf!2380 base!8))))))

(assert (= (and d!29516 res!78227) b!95004))

(assert (= (and b!95004 res!78226) b!95005))

(declare-fun m!138499 () Bool)

(assert (=> d!29516 m!138499))

(declare-fun m!138501 () Bool)

(assert (=> d!29516 m!138501))

(assert (=> b!94900 d!29516))

(declare-fun d!29530 () Bool)

(assert (=> d!29530 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4738 bitStream1!8) (currentByte!4743 bitStream1!8) (size!2019 (buf!2380 bitStream1!8))))))

(declare-fun bs!7264 () Bool)

(assert (= bs!7264 d!29530))

(declare-fun m!138503 () Bool)

(assert (=> bs!7264 m!138503))

(assert (=> start!18966 d!29530))

(declare-fun d!29532 () Bool)

(assert (=> d!29532 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4738 bitStream2!8) (currentByte!4743 bitStream2!8) (size!2019 (buf!2380 bitStream2!8))))))

(declare-fun bs!7265 () Bool)

(assert (= bs!7265 d!29532))

(declare-fun m!138505 () Bool)

(assert (=> bs!7265 m!138505))

(assert (=> start!18966 d!29532))

(declare-fun d!29534 () Bool)

(assert (=> d!29534 (= (inv!12 base!8) (invariant!0 (currentBit!4738 base!8) (currentByte!4743 base!8) (size!2019 (buf!2380 base!8))))))

(declare-fun bs!7266 () Bool)

(assert (= bs!7266 d!29534))

(assert (=> bs!7266 m!138501))

(assert (=> start!18966 d!29534))

(declare-fun d!29536 () Bool)

(assert (=> d!29536 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4738 thiss!1534) (currentByte!4743 thiss!1534) (size!2019 (buf!2380 thiss!1534))))))

(declare-fun bs!7267 () Bool)

(assert (= bs!7267 d!29536))

(declare-fun m!138507 () Bool)

(assert (=> bs!7267 m!138507))

(assert (=> start!18966 d!29536))

(declare-fun d!29538 () Bool)

(assert (=> d!29538 (= (array_inv!1836 (buf!2380 bitStream1!8)) (bvsge (size!2019 (buf!2380 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!94891 d!29538))

(declare-fun d!29540 () Bool)

(declare-fun e!62274 () Bool)

(assert (=> d!29540 e!62274))

(declare-fun res!78229 () Bool)

(assert (=> d!29540 (=> (not res!78229) (not e!62274))))

(declare-fun lt!138965 () (_ BitVec 64))

(declare-fun lt!138962 () (_ BitVec 64))

(declare-fun lt!138964 () (_ BitVec 64))

(assert (=> d!29540 (= res!78229 (= lt!138964 (bvsub lt!138965 lt!138962)))))

(assert (=> d!29540 (or (= (bvand lt!138965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138962 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138965 lt!138962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29540 (= lt!138962 (remainingBits!0 ((_ sign_extend 32) (size!2019 (buf!2380 bitStream1!8))) ((_ sign_extend 32) (currentByte!4743 bitStream1!8)) ((_ sign_extend 32) (currentBit!4738 bitStream1!8))))))

(declare-fun lt!138961 () (_ BitVec 64))

(declare-fun lt!138963 () (_ BitVec 64))

(assert (=> d!29540 (= lt!138965 (bvmul lt!138961 lt!138963))))

(assert (=> d!29540 (or (= lt!138961 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138963 (bvsdiv (bvmul lt!138961 lt!138963) lt!138961)))))

(assert (=> d!29540 (= lt!138963 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29540 (= lt!138961 ((_ sign_extend 32) (size!2019 (buf!2380 bitStream1!8))))))

(assert (=> d!29540 (= lt!138964 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4743 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4738 bitStream1!8))))))

(assert (=> d!29540 (invariant!0 (currentBit!4738 bitStream1!8) (currentByte!4743 bitStream1!8) (size!2019 (buf!2380 bitStream1!8)))))

(assert (=> d!29540 (= (bitIndex!0 (size!2019 (buf!2380 bitStream1!8)) (currentByte!4743 bitStream1!8) (currentBit!4738 bitStream1!8)) lt!138964)))

(declare-fun b!95006 () Bool)

(declare-fun res!78228 () Bool)

(assert (=> b!95006 (=> (not res!78228) (not e!62274))))

(assert (=> b!95006 (= res!78228 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138964))))

(declare-fun b!95007 () Bool)

(declare-fun lt!138966 () (_ BitVec 64))

(assert (=> b!95007 (= e!62274 (bvsle lt!138964 (bvmul lt!138966 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95007 (or (= lt!138966 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138966 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138966)))))

(assert (=> b!95007 (= lt!138966 ((_ sign_extend 32) (size!2019 (buf!2380 bitStream1!8))))))

(assert (= (and d!29540 res!78229) b!95006))

(assert (= (and b!95006 res!78228) b!95007))

(declare-fun m!138509 () Bool)

(assert (=> d!29540 m!138509))

(assert (=> d!29540 m!138503))

(assert (=> b!94893 d!29540))

(declare-fun d!29542 () Bool)

(declare-fun e!62275 () Bool)

(assert (=> d!29542 e!62275))

(declare-fun res!78231 () Bool)

(assert (=> d!29542 (=> (not res!78231) (not e!62275))))

(declare-fun lt!138971 () (_ BitVec 64))

(declare-fun lt!138970 () (_ BitVec 64))

(declare-fun lt!138968 () (_ BitVec 64))

(assert (=> d!29542 (= res!78231 (= lt!138970 (bvsub lt!138971 lt!138968)))))

(assert (=> d!29542 (or (= (bvand lt!138971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138968 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138971 lt!138968) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29542 (= lt!138968 (remainingBits!0 ((_ sign_extend 32) (size!2019 (buf!2380 bitStream2!8))) ((_ sign_extend 32) (currentByte!4743 bitStream2!8)) ((_ sign_extend 32) (currentBit!4738 bitStream2!8))))))

(declare-fun lt!138967 () (_ BitVec 64))

(declare-fun lt!138969 () (_ BitVec 64))

(assert (=> d!29542 (= lt!138971 (bvmul lt!138967 lt!138969))))

(assert (=> d!29542 (or (= lt!138967 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138969 (bvsdiv (bvmul lt!138967 lt!138969) lt!138967)))))

(assert (=> d!29542 (= lt!138969 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29542 (= lt!138967 ((_ sign_extend 32) (size!2019 (buf!2380 bitStream2!8))))))

(assert (=> d!29542 (= lt!138970 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4743 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4738 bitStream2!8))))))

(assert (=> d!29542 (invariant!0 (currentBit!4738 bitStream2!8) (currentByte!4743 bitStream2!8) (size!2019 (buf!2380 bitStream2!8)))))

(assert (=> d!29542 (= (bitIndex!0 (size!2019 (buf!2380 bitStream2!8)) (currentByte!4743 bitStream2!8) (currentBit!4738 bitStream2!8)) lt!138970)))

(declare-fun b!95008 () Bool)

(declare-fun res!78230 () Bool)

(assert (=> b!95008 (=> (not res!78230) (not e!62275))))

(assert (=> b!95008 (= res!78230 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138970))))

(declare-fun b!95009 () Bool)

(declare-fun lt!138972 () (_ BitVec 64))

(assert (=> b!95009 (= e!62275 (bvsle lt!138970 (bvmul lt!138972 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95009 (or (= lt!138972 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138972 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138972)))))

(assert (=> b!95009 (= lt!138972 ((_ sign_extend 32) (size!2019 (buf!2380 bitStream2!8))))))

(assert (= (and d!29542 res!78231) b!95008))

(assert (= (and b!95008 res!78230) b!95009))

(assert (=> d!29542 m!138493))

(assert (=> d!29542 m!138505))

(assert (=> b!94893 d!29542))

(declare-fun d!29544 () Bool)

(assert (=> d!29544 (= (array_inv!1836 (buf!2380 base!8)) (bvsge (size!2019 (buf!2380 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!94894 d!29544))

(declare-fun d!29546 () Bool)

(assert (=> d!29546 (= (array_inv!1836 (buf!2380 thiss!1534)) (bvsge (size!2019 (buf!2380 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!94885 d!29546))

(declare-fun d!29548 () Bool)

(declare-fun res!78234 () Bool)

(declare-fun e!62277 () Bool)

(assert (=> d!29548 (=> (not res!78234) (not e!62277))))

(assert (=> d!29548 (= res!78234 (= (size!2019 (buf!2380 bitStream1!8)) (size!2019 (buf!2380 bitStream2!8))))))

(assert (=> d!29548 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!62277)))

(declare-fun b!95010 () Bool)

(declare-fun res!78232 () Bool)

(assert (=> b!95010 (=> (not res!78232) (not e!62277))))

(assert (=> b!95010 (= res!78232 (bvsle (bitIndex!0 (size!2019 (buf!2380 bitStream1!8)) (currentByte!4743 bitStream1!8) (currentBit!4738 bitStream1!8)) (bitIndex!0 (size!2019 (buf!2380 bitStream2!8)) (currentByte!4743 bitStream2!8) (currentBit!4738 bitStream2!8))))))

(declare-fun b!95011 () Bool)

(declare-fun e!62276 () Bool)

(assert (=> b!95011 (= e!62277 e!62276)))

(declare-fun res!78233 () Bool)

(assert (=> b!95011 (=> res!78233 e!62276)))

(assert (=> b!95011 (= res!78233 (= (size!2019 (buf!2380 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95012 () Bool)

(assert (=> b!95012 (= e!62276 (arrayBitRangesEq!0 (buf!2380 bitStream1!8) (buf!2380 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2019 (buf!2380 bitStream1!8)) (currentByte!4743 bitStream1!8) (currentBit!4738 bitStream1!8))))))

(assert (= (and d!29548 res!78234) b!95010))

(assert (= (and b!95010 res!78232) b!95011))

(assert (= (and b!95011 (not res!78233)) b!95012))

(assert (=> b!95010 m!138421))

(assert (=> b!95010 m!138423))

(assert (=> b!95012 m!138421))

(assert (=> b!95012 m!138421))

(declare-fun m!138511 () Bool)

(assert (=> b!95012 m!138511))

(assert (=> b!94895 d!29548))

(declare-fun d!29550 () Bool)

(assert (=> d!29550 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2019 (buf!2380 bitStream1!8))) ((_ sign_extend 32) (currentByte!4743 bitStream1!8)) ((_ sign_extend 32) (currentBit!4738 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2019 (buf!2380 bitStream1!8))) ((_ sign_extend 32) (currentByte!4743 bitStream1!8)) ((_ sign_extend 32) (currentBit!4738 bitStream1!8))) nBits!484))))

(declare-fun bs!7268 () Bool)

(assert (= bs!7268 d!29550))

(assert (=> bs!7268 m!138509))

(assert (=> b!94886 d!29550))

(declare-fun d!29552 () Bool)

(declare-fun lt!138975 () tuple2!7682)

(assert (=> d!29552 (= lt!138975 (readBit!0 bitStream1!8))))

(assert (=> d!29552 (= (readBitPure!0 bitStream1!8) (tuple2!7671 (_2!4088 lt!138975) (_1!4088 lt!138975)))))

(declare-fun bs!7269 () Bool)

(assert (= bs!7269 d!29552))

(assert (=> bs!7269 m!138485))

(assert (=> b!94897 d!29552))

(declare-fun d!29554 () Bool)

(assert (=> d!29554 (= (head!589 listBits!13) (h!992 listBits!13))))

(assert (=> b!94897 d!29554))

(declare-fun d!29556 () Bool)

(declare-fun size!2022 (List!877) Int)

(assert (=> d!29556 (= (length!468 listBits!13) (size!2022 listBits!13))))

(declare-fun bs!7270 () Bool)

(assert (= bs!7270 d!29556))

(declare-fun m!138513 () Bool)

(assert (=> bs!7270 m!138513))

(assert (=> b!94896 d!29556))

(push 1)

(assert (not b!94992))

(assert (not d!29550))

(assert (not b!94989))

(assert (not b!94965))

(assert (not b!94963))

(assert (not b!95012))

(assert (not d!29552))

(assert (not d!29516))

(assert (not d!29556))

(assert (not b!94987))

(assert (not d!29536))

(assert (not d!29512))

(assert (not b!95010))

(assert (not d!29532))

(assert (not d!29530))

(assert (not d!29540))

(assert (not d!29534))

(assert (not b!94990))

(assert (not d!29542))

(assert (not b!94988))

(check-sat)

(pop 1)

(push 1)

(check-sat)

