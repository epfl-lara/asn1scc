; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37370 () Bool)

(assert start!37370)

(declare-fun b!169621 () Bool)

(declare-fun res!140987 () Bool)

(declare-fun e!118320 () Bool)

(assert (=> b!169621 (=> (not res!140987) (not e!118320))))

(declare-fun nBits!499 () (_ BitVec 64))

(assert (=> b!169621 (= res!140987 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!169623 () Bool)

(declare-fun e!118323 () Bool)

(declare-datatypes ((array!9007 0))(
  ( (array!9008 (arr!4914 (Array (_ BitVec 32) (_ BitVec 8))) (size!3990 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7118 0))(
  ( (BitStream!7119 (buf!4433 array!9007) (currentByte!8417 (_ BitVec 32)) (currentBit!8412 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7118)

(declare-fun array_inv!3731 (array!9007) Bool)

(assert (=> b!169623 (= e!118323 (array_inv!3731 (buf!4433 thiss!1565)))))

(declare-fun res!140986 () Bool)

(assert (=> start!37370 (=> (not res!140986) (not e!118320))))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!9007)

(declare-fun arr2!28 () array!9007)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37370 (= res!140986 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3990 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3990 arr2!28))))))))

(assert (=> start!37370 e!118320))

(assert (=> start!37370 true))

(assert (=> start!37370 (array_inv!3731 arr2!28)))

(assert (=> start!37370 (array_inv!3731 arr1!28)))

(declare-fun inv!12 (BitStream!7118) Bool)

(assert (=> start!37370 (and (inv!12 thiss!1565) e!118323)))

(declare-fun b!169620 () Bool)

(declare-fun res!140985 () Bool)

(assert (=> b!169620 (=> (not res!140985) (not e!118320))))

(declare-datatypes ((List!946 0))(
  ( (Nil!943) (Cons!942 (h!1061 Bool) (t!1765 List!946)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7118 array!9007 (_ BitVec 64) (_ BitVec 64)) List!946)

(assert (=> b!169620 (= res!140985 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169622 () Bool)

(declare-fun checkByteArrayBitContent!0 (BitStream!7118 array!9007 array!9007 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!169622 (= e!118320 (not (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 fromArr1!3 fromArr2!3 nBits!499)))))

(declare-datatypes ((Unit!11859 0))(
  ( (Unit!11860) )
))
(declare-fun lt!262255 () Unit!11859)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7118 array!9007 array!9007 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11859)

(assert (=> b!169622 (= lt!262255 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!37370 res!140986) b!169620))

(assert (= (and b!169620 res!140985) b!169621))

(assert (= (and b!169621 res!140987) b!169622))

(assert (= start!37370 b!169623))

(declare-fun m!269363 () Bool)

(assert (=> b!169623 m!269363))

(declare-fun m!269365 () Bool)

(assert (=> start!37370 m!269365))

(declare-fun m!269367 () Bool)

(assert (=> start!37370 m!269367))

(declare-fun m!269369 () Bool)

(assert (=> start!37370 m!269369))

(declare-fun m!269371 () Bool)

(assert (=> b!169620 m!269371))

(declare-fun m!269373 () Bool)

(assert (=> b!169620 m!269373))

(declare-fun m!269375 () Bool)

(assert (=> b!169622 m!269375))

(declare-fun m!269377 () Bool)

(assert (=> b!169622 m!269377))

(push 1)

(assert (not b!169623))

(assert (not b!169622))

(assert (not start!37370))

(assert (not b!169620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59895 () Bool)

(assert (=> d!59895 (= (array_inv!3731 (buf!4433 thiss!1565)) (bvsge (size!3990 (buf!4433 thiss!1565)) #b00000000000000000000000000000000))))

(assert (=> b!169623 d!59895))

(declare-fun d!59899 () Bool)

(declare-fun res!141004 () Bool)

(declare-fun e!118343 () Bool)

(assert (=> d!59899 (=> res!141004 e!118343)))

(assert (=> d!59899 (= res!141004 (= nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59899 (= (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 fromArr1!3 fromArr2!3 nBits!499) e!118343)))

(declare-fun b!169646 () Bool)

(declare-fun e!118344 () Bool)

(assert (=> b!169646 (= e!118343 e!118344)))

(declare-fun res!141005 () Bool)

(assert (=> b!169646 (=> (not res!141005) (not e!118344))))

(assert (=> b!169646 (= res!141005 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!4914 arr1!28) ((_ extract 31 0) (bvsdiv fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!4914 arr2!28) ((_ extract 31 0) (bvsdiv fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!169647 () Bool)

(assert (=> b!169647 (= e!118344 (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!59899 (not res!141004)) b!169646))

(assert (= (and b!169646 res!141005) b!169647))

(declare-fun m!269413 () Bool)

(assert (=> b!169646 m!269413))

(declare-fun m!269415 () Bool)

(assert (=> b!169646 m!269415))

(declare-fun m!269417 () Bool)

(assert (=> b!169646 m!269417))

(declare-fun m!269419 () Bool)

(assert (=> b!169646 m!269419))

(declare-fun m!269421 () Bool)

(assert (=> b!169647 m!269421))

(assert (=> b!169622 d!59899))

(declare-fun d!59921 () Bool)

(assert (=> d!59921 (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!262264 () Unit!11859)

(declare-fun choose!65 (BitStream!7118 array!9007 array!9007 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11859)

(assert (=> d!59921 (= lt!262264 (choose!65 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!59921 (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!59921 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!262264)))

(declare-fun bs!14905 () Bool)

(assert (= bs!14905 d!59921))

(declare-fun m!269425 () Bool)

(assert (=> bs!14905 m!269425))

(declare-fun m!269427 () Bool)

(assert (=> bs!14905 m!269427))

(assert (=> b!169622 d!59921))

(declare-fun d!59925 () Bool)

(assert (=> d!59925 (= (array_inv!3731 arr2!28) (bvsge (size!3990 arr2!28) #b00000000000000000000000000000000))))

(assert (=> start!37370 d!59925))

(declare-fun d!59927 () Bool)

(assert (=> d!59927 (= (array_inv!3731 arr1!28) (bvsge (size!3990 arr1!28) #b00000000000000000000000000000000))))

(assert (=> start!37370 d!59927))

(declare-fun d!59929 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59929 (= (inv!12 thiss!1565) (invariant!0 (currentBit!8412 thiss!1565) (currentByte!8417 thiss!1565) (size!3990 (buf!4433 thiss!1565))))))

(declare-fun bs!14906 () Bool)

(assert (= bs!14906 d!59929))

(declare-fun m!269433 () Bool)

(assert (=> bs!14906 m!269433))

(assert (=> start!37370 d!59929))

(declare-fun d!59933 () Bool)

(declare-fun c!8752 () Bool)

(assert (=> d!59933 (= c!8752 (= nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118352 () List!946)

(assert (=> d!59933 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) e!118352)))

(declare-fun b!169662 () Bool)

(assert (=> b!169662 (= e!118352 Nil!943)))

(declare-fun b!169663 () Bool)

(assert (=> b!169663 (= e!118352 (Cons!942 (not (= (bvand ((_ sign_extend 24) (select (arr!4914 arr2!28) ((_ extract 31 0) (bvsdiv fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 thiss!1565 arr2!28 (bvadd fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!59933 c!8752) b!169662))

(assert (= (and d!59933 (not c!8752)) b!169663))

(assert (=> b!169663 m!269417))

(assert (=> b!169663 m!269419))

(declare-fun m!269435 () Bool)

(assert (=> b!169663 m!269435))

(assert (=> b!169620 d!59933))

(declare-fun d!59935 () Bool)

(declare-fun c!8753 () Bool)

(assert (=> d!59935 (= c!8753 (= nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118353 () List!946)

(assert (=> d!59935 (= (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499) e!118353)))

(declare-fun b!169664 () Bool)

(assert (=> b!169664 (= e!118353 Nil!943)))

(declare-fun b!169665 () Bool)

(assert (=> b!169665 (= e!118353 (Cons!942 (not (= (bvand ((_ sign_extend 24) (select (arr!4914 arr1!28) ((_ extract 31 0) (bvsdiv fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 thiss!1565 arr1!28 (bvadd fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!59935 c!8753) b!169664))

(assert (= (and d!59935 (not c!8753)) b!169665))

(assert (=> b!169665 m!269413))

(assert (=> b!169665 m!269415))

(declare-fun m!269437 () Bool)

(assert (=> b!169665 m!269437))

(assert (=> b!169620 d!59935))

(push 1)

