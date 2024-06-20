; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37402 () Bool)

(assert start!37402)

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun b!169676 () Bool)

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!9012 0))(
  ( (array!9013 (arr!4918 (Array (_ BitVec 32) (_ BitVec 8))) (size!3991 (_ BitVec 32))) )
))
(declare-fun arr2!28 () array!9012)

(declare-fun e!118364 () Bool)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!9012)

(declare-datatypes ((BitStream!7120 0))(
  ( (BitStream!7121 (buf!4434 array!9012) (currentByte!8418 (_ BitVec 32)) (currentBit!8413 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7120)

(declare-fun checkByteArrayBitContent!0 (BitStream!7120 array!9012 array!9012 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!169676 (= e!118364 (not (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 fromArr1!3 fromArr2!3 nBits!499)))))

(declare-fun b!169677 () Bool)

(declare-fun e!118366 () Bool)

(declare-fun array_inv!3732 (array!9012) Bool)

(assert (=> b!169677 (= e!118366 (array_inv!3732 (buf!4434 thiss!1565)))))

(declare-fun b!169674 () Bool)

(declare-fun res!141013 () Bool)

(assert (=> b!169674 (=> (not res!141013) (not e!118364))))

(declare-datatypes ((List!947 0))(
  ( (Nil!944) (Cons!943 (h!1062 Bool) (t!1766 List!947)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7120 array!9012 (_ BitVec 64) (_ BitVec 64)) List!947)

(assert (=> b!169674 (= res!141013 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun res!141014 () Bool)

(assert (=> start!37402 (=> (not res!141014) (not e!118364))))

(assert (=> start!37402 (= res!141014 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3991 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3991 arr2!28))))))))

(assert (=> start!37402 e!118364))

(assert (=> start!37402 true))

(assert (=> start!37402 (array_inv!3732 arr2!28)))

(assert (=> start!37402 (array_inv!3732 arr1!28)))

(declare-fun inv!12 (BitStream!7120) Bool)

(assert (=> start!37402 (and (inv!12 thiss!1565) e!118366)))

(declare-fun b!169675 () Bool)

(declare-fun res!141012 () Bool)

(assert (=> b!169675 (=> (not res!141012) (not e!118364))))

(assert (=> b!169675 (= res!141012 (bvsle nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!37402 res!141014) b!169674))

(assert (= (and b!169674 res!141013) b!169675))

(assert (= (and b!169675 res!141012) b!169676))

(assert (= start!37402 b!169677))

(declare-fun m!269439 () Bool)

(assert (=> b!169676 m!269439))

(declare-fun m!269441 () Bool)

(assert (=> b!169677 m!269441))

(declare-fun m!269443 () Bool)

(assert (=> b!169674 m!269443))

(declare-fun m!269445 () Bool)

(assert (=> b!169674 m!269445))

(declare-fun m!269447 () Bool)

(assert (=> start!37402 m!269447))

(declare-fun m!269449 () Bool)

(assert (=> start!37402 m!269449))

(declare-fun m!269451 () Bool)

(assert (=> start!37402 m!269451))

(push 1)

(assert (not start!37402))

(assert (not b!169677))

(assert (not b!169676))

(assert (not b!169674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59941 () Bool)

(assert (=> d!59941 (= (array_inv!3732 arr2!28) (bvsge (size!3991 arr2!28) #b00000000000000000000000000000000))))

(assert (=> start!37402 d!59941))

(declare-fun d!59945 () Bool)

(assert (=> d!59945 (= (array_inv!3732 arr1!28) (bvsge (size!3991 arr1!28) #b00000000000000000000000000000000))))

(assert (=> start!37402 d!59945))

(declare-fun d!59949 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59949 (= (inv!12 thiss!1565) (invariant!0 (currentBit!8413 thiss!1565) (currentByte!8418 thiss!1565) (size!3991 (buf!4434 thiss!1565))))))

(declare-fun bs!14910 () Bool)

(assert (= bs!14910 d!59949))

(declare-fun m!269493 () Bool)

(assert (=> bs!14910 m!269493))

(assert (=> start!37402 d!59949))

(declare-fun d!59956 () Bool)

(assert (=> d!59956 (= (array_inv!3732 (buf!4434 thiss!1565)) (bvsge (size!3991 (buf!4434 thiss!1565)) #b00000000000000000000000000000000))))

(assert (=> b!169677 d!59956))

(declare-fun d!59961 () Bool)

(declare-fun res!141043 () Bool)

(declare-fun e!118413 () Bool)

(assert (=> d!59961 (=> res!141043 e!118413)))

(assert (=> d!59961 (= res!141043 (= nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59961 (= (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 fromArr1!3 fromArr2!3 nBits!499) e!118413)))

(declare-fun b!169720 () Bool)

(declare-fun e!118414 () Bool)

(assert (=> b!169720 (= e!118413 e!118414)))

(declare-fun res!141044 () Bool)

(assert (=> b!169720 (=> (not res!141044) (not e!118414))))

(assert (=> b!169720 (= res!141044 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!4918 arr1!28) ((_ extract 31 0) (bvsdiv fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!4918 arr2!28) ((_ extract 31 0) (bvsdiv fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!169721 () Bool)

(assert (=> b!169721 (= e!118414 (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!59961 (not res!141043)) b!169720))

(assert (= (and b!169720 res!141044) b!169721))

(declare-fun m!269499 () Bool)

(assert (=> b!169720 m!269499))

(declare-fun m!269501 () Bool)

(assert (=> b!169720 m!269501))

(declare-fun m!269503 () Bool)

(assert (=> b!169720 m!269503))

(declare-fun m!269505 () Bool)

(assert (=> b!169720 m!269505))

(declare-fun m!269507 () Bool)

(assert (=> b!169721 m!269507))

(assert (=> b!169676 d!59961))

(declare-fun d!59967 () Bool)

(declare-fun c!8760 () Bool)

(assert (=> d!59967 (= c!8760 (= nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118423 () List!947)

(assert (=> d!59967 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) e!118423)))

(declare-fun b!169732 () Bool)

(assert (=> b!169732 (= e!118423 Nil!944)))

(declare-fun b!169733 () Bool)

(assert (=> b!169733 (= e!118423 (Cons!943 (not (= (bvand ((_ sign_extend 24) (select (arr!4918 arr2!28) ((_ extract 31 0) (bvsdiv fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 thiss!1565 arr2!28 (bvadd fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!59967 c!8760) b!169732))

