; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37368 () Bool)

(assert start!37368)

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-fun b!169610 () Bool)

(declare-fun e!118305 () Bool)

(declare-datatypes ((array!9005 0))(
  ( (array!9006 (arr!4913 (Array (_ BitVec 32) (_ BitVec 8))) (size!3989 (_ BitVec 32))) )
))
(declare-fun arr2!28 () array!9005)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!9005)

(declare-datatypes ((BitStream!7116 0))(
  ( (BitStream!7117 (buf!4432 array!9005) (currentByte!8416 (_ BitVec 32)) (currentBit!8411 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7116)

(declare-fun checkByteArrayBitContent!0 (BitStream!7116 array!9005 array!9005 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!169610 (= e!118305 (not (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 fromArr1!3 fromArr2!3 nBits!499)))))

(declare-datatypes ((Unit!11857 0))(
  ( (Unit!11858) )
))
(declare-fun lt!262252 () Unit!11857)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7116 array!9005 array!9005 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11857)

(assert (=> b!169610 (= lt!262252 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169608 () Bool)

(declare-fun res!140977 () Bool)

(assert (=> b!169608 (=> (not res!140977) (not e!118305))))

(declare-datatypes ((List!945 0))(
  ( (Nil!942) (Cons!941 (h!1060 Bool) (t!1764 List!945)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7116 array!9005 (_ BitVec 64) (_ BitVec 64)) List!945)

(assert (=> b!169608 (= res!140977 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169611 () Bool)

(declare-fun e!118306 () Bool)

(declare-fun array_inv!3730 (array!9005) Bool)

(assert (=> b!169611 (= e!118306 (array_inv!3730 (buf!4432 thiss!1565)))))

(declare-fun b!169609 () Bool)

(declare-fun res!140976 () Bool)

(assert (=> b!169609 (=> (not res!140976) (not e!118305))))

(assert (=> b!169609 (= res!140976 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!140978 () Bool)

(assert (=> start!37368 (=> (not res!140978) (not e!118305))))

(assert (=> start!37368 (= res!140978 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3989 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3989 arr2!28))))))))

(assert (=> start!37368 e!118305))

(assert (=> start!37368 true))

(assert (=> start!37368 (array_inv!3730 arr2!28)))

(assert (=> start!37368 (array_inv!3730 arr1!28)))

(declare-fun inv!12 (BitStream!7116) Bool)

(assert (=> start!37368 (and (inv!12 thiss!1565) e!118306)))

(assert (= (and start!37368 res!140978) b!169608))

(assert (= (and b!169608 res!140977) b!169609))

(assert (= (and b!169609 res!140976) b!169610))

(assert (= start!37368 b!169611))

(declare-fun m!269347 () Bool)

(assert (=> b!169610 m!269347))

(declare-fun m!269349 () Bool)

(assert (=> b!169610 m!269349))

(declare-fun m!269351 () Bool)

(assert (=> b!169608 m!269351))

(declare-fun m!269353 () Bool)

(assert (=> b!169608 m!269353))

(declare-fun m!269355 () Bool)

(assert (=> b!169611 m!269355))

(declare-fun m!269357 () Bool)

(assert (=> start!37368 m!269357))

(declare-fun m!269359 () Bool)

(assert (=> start!37368 m!269359))

(declare-fun m!269361 () Bool)

(assert (=> start!37368 m!269361))

(check-sat (not b!169611) (not b!169610) (not start!37368) (not b!169608))
(check-sat)
(get-model)

(declare-fun d!59891 () Bool)

(assert (=> d!59891 (= (array_inv!3730 (buf!4432 thiss!1565)) (bvsge (size!3989 (buf!4432 thiss!1565)) #b00000000000000000000000000000000))))

(assert (=> b!169611 d!59891))

(declare-fun d!59893 () Bool)

(declare-fun res!140998 () Bool)

(declare-fun e!118334 () Bool)

(assert (=> d!59893 (=> res!140998 e!118334)))

(assert (=> d!59893 (= res!140998 (= nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59893 (= (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 fromArr1!3 fromArr2!3 nBits!499) e!118334)))

(declare-fun b!169634 () Bool)

(declare-fun e!118335 () Bool)

(assert (=> b!169634 (= e!118334 e!118335)))

(declare-fun res!140999 () Bool)

(assert (=> b!169634 (=> (not res!140999) (not e!118335))))

(assert (=> b!169634 (= res!140999 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!4913 arr1!28) ((_ extract 31 0) (bvsdiv fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!4913 arr2!28) ((_ extract 31 0) (bvsdiv fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!169635 () Bool)

(assert (=> b!169635 (= e!118335 (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!59893 (not res!140998)) b!169634))

(assert (= (and b!169634 res!140999) b!169635))

(declare-fun m!269393 () Bool)

(assert (=> b!169634 m!269393))

(declare-fun m!269395 () Bool)

(assert (=> b!169634 m!269395))

(declare-fun m!269397 () Bool)

(assert (=> b!169634 m!269397))

(declare-fun m!269399 () Bool)

(assert (=> b!169634 m!269399))

(declare-fun m!269401 () Bool)

(assert (=> b!169635 m!269401))

(assert (=> b!169610 d!59893))

(declare-fun d!59907 () Bool)

(assert (=> d!59907 (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!262261 () Unit!11857)

(declare-fun choose!65 (BitStream!7116 array!9005 array!9005 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11857)

(assert (=> d!59907 (= lt!262261 (choose!65 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!59907 (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!59907 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!262261)))

(declare-fun bs!14903 () Bool)

(assert (= bs!14903 d!59907))

(declare-fun m!269405 () Bool)

(assert (=> bs!14903 m!269405))

(declare-fun m!269407 () Bool)

(assert (=> bs!14903 m!269407))

(assert (=> b!169610 d!59907))

(declare-fun d!59911 () Bool)

(assert (=> d!59911 (= (array_inv!3730 arr2!28) (bvsge (size!3989 arr2!28) #b00000000000000000000000000000000))))

(assert (=> start!37368 d!59911))

(declare-fun d!59913 () Bool)

(assert (=> d!59913 (= (array_inv!3730 arr1!28) (bvsge (size!3989 arr1!28) #b00000000000000000000000000000000))))

(assert (=> start!37368 d!59913))

(declare-fun d!59915 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59915 (= (inv!12 thiss!1565) (invariant!0 (currentBit!8411 thiss!1565) (currentByte!8416 thiss!1565) (size!3989 (buf!4432 thiss!1565))))))

(declare-fun bs!14904 () Bool)

(assert (= bs!14904 d!59915))

(declare-fun m!269409 () Bool)

(assert (=> bs!14904 m!269409))

(assert (=> start!37368 d!59915))

(declare-fun d!59917 () Bool)

(declare-fun c!8748 () Bool)

(assert (=> d!59917 (= c!8748 (= nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118348 () List!945)

(assert (=> d!59917 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) e!118348)))

(declare-fun b!169654 () Bool)

(assert (=> b!169654 (= e!118348 Nil!942)))

(declare-fun b!169655 () Bool)

(assert (=> b!169655 (= e!118348 (Cons!941 (not (= (bvand ((_ sign_extend 24) (select (arr!4913 arr2!28) ((_ extract 31 0) (bvsdiv fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 thiss!1565 arr2!28 (bvadd fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!59917 c!8748) b!169654))

(assert (= (and d!59917 (not c!8748)) b!169655))

(assert (=> b!169655 m!269397))

(assert (=> b!169655 m!269399))

(declare-fun m!269429 () Bool)

(assert (=> b!169655 m!269429))

(assert (=> b!169608 d!59917))

(declare-fun d!59931 () Bool)

(declare-fun c!8749 () Bool)

(assert (=> d!59931 (= c!8749 (= nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118349 () List!945)

(assert (=> d!59931 (= (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499) e!118349)))

(declare-fun b!169656 () Bool)

(assert (=> b!169656 (= e!118349 Nil!942)))

(declare-fun b!169657 () Bool)

(assert (=> b!169657 (= e!118349 (Cons!941 (not (= (bvand ((_ sign_extend 24) (select (arr!4913 arr1!28) ((_ extract 31 0) (bvsdiv fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 thiss!1565 arr1!28 (bvadd fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!59931 c!8749) b!169656))

(assert (= (and d!59931 (not c!8749)) b!169657))

(assert (=> b!169657 m!269393))

(assert (=> b!169657 m!269395))

(declare-fun m!269431 () Bool)

(assert (=> b!169657 m!269431))

(assert (=> b!169608 d!59931))

(check-sat (not b!169635) (not d!59915) (not b!169657) (not b!169655) (not d!59907))
(check-sat)
