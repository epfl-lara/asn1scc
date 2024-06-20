; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37366 () Bool)

(assert start!37366)

(declare-fun b!169599 () Bool)

(declare-fun e!118293 () Bool)

(declare-datatypes ((array!9003 0))(
  ( (array!9004 (arr!4912 (Array (_ BitVec 32) (_ BitVec 8))) (size!3988 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7114 0))(
  ( (BitStream!7115 (buf!4431 array!9003) (currentByte!8415 (_ BitVec 32)) (currentBit!8410 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7114)

(declare-fun array_inv!3729 (array!9003) Bool)

(assert (=> b!169599 (= e!118293 (array_inv!3729 (buf!4431 thiss!1565)))))

(declare-fun b!169596 () Bool)

(declare-fun res!140968 () Bool)

(declare-fun e!118290 () Bool)

(assert (=> b!169596 (=> (not res!140968) (not e!118290))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-fun arr2!28 () array!9003)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!9003)

(declare-datatypes ((List!944 0))(
  ( (Nil!941) (Cons!940 (h!1059 Bool) (t!1763 List!944)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7114 array!9003 (_ BitVec 64) (_ BitVec 64)) List!944)

(assert (=> b!169596 (= res!140968 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun res!140967 () Bool)

(assert (=> start!37366 (=> (not res!140967) (not e!118290))))

(assert (=> start!37366 (= res!140967 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3988 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3988 arr2!28))))))))

(assert (=> start!37366 e!118290))

(assert (=> start!37366 true))

(assert (=> start!37366 (array_inv!3729 arr2!28)))

(assert (=> start!37366 (array_inv!3729 arr1!28)))

(declare-fun inv!12 (BitStream!7114) Bool)

(assert (=> start!37366 (and (inv!12 thiss!1565) e!118293)))

(declare-fun b!169598 () Bool)

(declare-fun checkByteArrayBitContent!0 (BitStream!7114 array!9003 array!9003 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!169598 (= e!118290 (not (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 fromArr1!3 fromArr2!3 nBits!499)))))

(declare-datatypes ((Unit!11855 0))(
  ( (Unit!11856) )
))
(declare-fun lt!262249 () Unit!11855)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7114 array!9003 array!9003 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11855)

(assert (=> b!169598 (= lt!262249 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169597 () Bool)

(declare-fun res!140969 () Bool)

(assert (=> b!169597 (=> (not res!140969) (not e!118290))))

(assert (=> b!169597 (= res!140969 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!37366 res!140967) b!169596))

(assert (= (and b!169596 res!140968) b!169597))

(assert (= (and b!169597 res!140969) b!169598))

(assert (= start!37366 b!169599))

(declare-fun m!269331 () Bool)

(assert (=> b!169599 m!269331))

(declare-fun m!269333 () Bool)

(assert (=> b!169596 m!269333))

(declare-fun m!269335 () Bool)

(assert (=> b!169596 m!269335))

(declare-fun m!269337 () Bool)

(assert (=> start!37366 m!269337))

(declare-fun m!269339 () Bool)

(assert (=> start!37366 m!269339))

(declare-fun m!269341 () Bool)

(assert (=> start!37366 m!269341))

(declare-fun m!269343 () Bool)

(assert (=> b!169598 m!269343))

(declare-fun m!269345 () Bool)

(assert (=> b!169598 m!269345))

(push 1)

(assert (not b!169598))

(assert (not start!37366))

(assert (not b!169596))

(assert (not b!169599))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59889 () Bool)

(declare-fun res!140992 () Bool)

(declare-fun e!118328 () Bool)

(assert (=> d!59889 (=> res!140992 e!118328)))

(assert (=> d!59889 (= res!140992 (= nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59889 (= (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 fromArr1!3 fromArr2!3 nBits!499) e!118328)))

(declare-fun b!169628 () Bool)

(declare-fun e!118329 () Bool)

(assert (=> b!169628 (= e!118328 e!118329)))

(declare-fun res!140993 () Bool)

(assert (=> b!169628 (=> (not res!140993) (not e!118329))))

(assert (=> b!169628 (= res!140993 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!4912 arr1!28) ((_ extract 31 0) (bvsdiv fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!4912 arr2!28) ((_ extract 31 0) (bvsdiv fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!169629 () Bool)

(assert (=> b!169629 (= e!118329 (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!59889 (not res!140992)) b!169628))

(assert (= (and b!169628 res!140993) b!169629))

(declare-fun m!269379 () Bool)

(assert (=> b!169628 m!269379))

(declare-fun m!269381 () Bool)

(assert (=> b!169628 m!269381))

(declare-fun m!269383 () Bool)

(assert (=> b!169628 m!269383))

(declare-fun m!269385 () Bool)

(assert (=> b!169628 m!269385))

(declare-fun m!269387 () Bool)

(assert (=> b!169629 m!269387))

(assert (=> b!169598 d!59889))

(declare-fun d!59897 () Bool)

(assert (=> d!59897 (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!262258 () Unit!11855)

(declare-fun choose!65 (BitStream!7114 array!9003 array!9003 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11855)

(assert (=> d!59897 (= lt!262258 (choose!65 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!59897 (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!59897 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!262258)))

(declare-fun bs!14901 () Bool)

(assert (= bs!14901 d!59897))

(declare-fun m!269389 () Bool)

(assert (=> bs!14901 m!269389))

(declare-fun m!269391 () Bool)

(assert (=> bs!14901 m!269391))

(assert (=> b!169598 d!59897))

(declare-fun d!59901 () Bool)

(assert (=> d!59901 (= (array_inv!3729 arr2!28) (bvsge (size!3988 arr2!28) #b00000000000000000000000000000000))))

(assert (=> start!37366 d!59901))

(declare-fun d!59903 () Bool)

(assert (=> d!59903 (= (array_inv!3729 arr1!28) (bvsge (size!3988 arr1!28) #b00000000000000000000000000000000))))

(assert (=> start!37366 d!59903))

(declare-fun d!59905 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59905 (= (inv!12 thiss!1565) (invariant!0 (currentBit!8410 thiss!1565) (currentByte!8415 thiss!1565) (size!3988 (buf!4431 thiss!1565))))))

(declare-fun bs!14902 () Bool)

(assert (= bs!14902 d!59905))

(declare-fun m!269403 () Bool)

(assert (=> bs!14902 m!269403))

(assert (=> start!37366 d!59905))

(declare-fun d!59909 () Bool)

(declare-fun c!8744 () Bool)

(assert (=> d!59909 (= c!8744 (= nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118342 () List!944)

(assert (=> d!59909 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) e!118342)))

(declare-fun b!169644 () Bool)

(assert (=> b!169644 (= e!118342 Nil!941)))

(declare-fun b!169645 () Bool)

(assert (=> b!169645 (= e!118342 (Cons!940 (not (= (bvand ((_ sign_extend 24) (select (arr!4912 arr2!28) ((_ extract 31 0) (bvsdiv fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 thiss!1565 arr2!28 (bvadd fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!59909 c!8744) b!169644))

(assert (= (and d!59909 (not c!8744)) b!169645))

(assert (=> b!169645 m!269383))

(assert (=> b!169645 m!269385))

(declare-fun m!269411 () Bool)

(assert (=> b!169645 m!269411))

(assert (=> b!169596 d!59909))

(declare-fun d!59919 () Bool)

(declare-fun c!8745 () Bool)

(assert (=> d!59919 (= c!8745 (= nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118345 () List!944)

(assert (=> d!59919 (= (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499) e!118345)))

(declare-fun b!169648 () Bool)

(assert (=> b!169648 (= e!118345 Nil!941)))

(declare-fun b!169649 () Bool)

(assert (=> b!169649 (= e!118345 (Cons!940 (not (= (bvand ((_ sign_extend 24) (select (arr!4912 arr1!28) ((_ extract 31 0) (bvsdiv fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 thiss!1565 arr1!28 (bvadd fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!59919 c!8745) b!169648))

(assert (= (and d!59919 (not c!8745)) b!169649))

(assert (=> b!169649 m!269379))

(assert (=> b!169649 m!269381))

(declare-fun m!269423 () Bool)

(assert (=> b!169649 m!269423))

(assert (=> b!169596 d!59919))

(declare-fun d!59923 () Bool)

(assert (=> d!59923 (= (array_inv!3729 (buf!4431 thiss!1565)) (bvsge (size!3988 (buf!4431 thiss!1565)) #b00000000000000000000000000000000))))

(assert (=> b!169599 d!59923))

(push 1)

(assert (not b!169645))

(assert (not d!59897))

(assert (not b!169629))

(assert (not b!169649))

(assert (not d!59905))

(check-sat)

(pop 1)

(push 1)

(check-sat)

