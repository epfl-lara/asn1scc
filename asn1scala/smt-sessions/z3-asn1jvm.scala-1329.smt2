; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37404 () Bool)

(assert start!37404)

(declare-fun b!169689 () Bool)

(declare-fun e!118380 () Bool)

(declare-datatypes ((array!9014 0))(
  ( (array!9015 (arr!4919 (Array (_ BitVec 32) (_ BitVec 8))) (size!3992 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7122 0))(
  ( (BitStream!7123 (buf!4435 array!9014) (currentByte!8419 (_ BitVec 32)) (currentBit!8414 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7122)

(declare-fun array_inv!3733 (array!9014) Bool)

(assert (=> b!169689 (= e!118380 (array_inv!3733 (buf!4435 thiss!1565)))))

(declare-fun b!169686 () Bool)

(declare-fun res!141023 () Bool)

(declare-fun e!118383 () Bool)

(assert (=> b!169686 (=> (not res!141023) (not e!118383))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-fun arr2!28 () array!9014)

(declare-fun arr1!28 () array!9014)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-datatypes ((List!948 0))(
  ( (Nil!945) (Cons!944 (h!1063 Bool) (t!1767 List!948)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7122 array!9014 (_ BitVec 64) (_ BitVec 64)) List!948)

(assert (=> b!169686 (= res!141023 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun res!141021 () Bool)

(assert (=> start!37404 (=> (not res!141021) (not e!118383))))

(assert (=> start!37404 (= res!141021 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3992 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3992 arr2!28))))))))

(assert (=> start!37404 e!118383))

(assert (=> start!37404 true))

(assert (=> start!37404 (array_inv!3733 arr2!28)))

(assert (=> start!37404 (array_inv!3733 arr1!28)))

(declare-fun inv!12 (BitStream!7122) Bool)

(assert (=> start!37404 (and (inv!12 thiss!1565) e!118380)))

(declare-fun b!169687 () Bool)

(declare-fun res!141022 () Bool)

(assert (=> b!169687 (=> (not res!141022) (not e!118383))))

(assert (=> b!169687 (= res!141022 (bvsle nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!169688 () Bool)

(declare-fun checkByteArrayBitContent!0 (BitStream!7122 array!9014 array!9014 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!169688 (= e!118383 (not (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 fromArr1!3 fromArr2!3 nBits!499)))))

(assert (= (and start!37404 res!141021) b!169686))

(assert (= (and b!169686 res!141023) b!169687))

(assert (= (and b!169687 res!141022) b!169688))

(assert (= start!37404 b!169689))

(declare-fun m!269453 () Bool)

(assert (=> b!169689 m!269453))

(declare-fun m!269455 () Bool)

(assert (=> b!169686 m!269455))

(declare-fun m!269457 () Bool)

(assert (=> b!169686 m!269457))

(declare-fun m!269459 () Bool)

(assert (=> start!37404 m!269459))

(declare-fun m!269461 () Bool)

(assert (=> start!37404 m!269461))

(declare-fun m!269463 () Bool)

(assert (=> start!37404 m!269463))

(declare-fun m!269465 () Bool)

(assert (=> b!169688 m!269465))

(check-sat (not b!169686) (not start!37404) (not b!169689) (not b!169688))
(check-sat)
(get-model)

(declare-fun d!59939 () Bool)

(declare-fun c!8756 () Bool)

(assert (=> d!59939 (= c!8756 (= nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118401 () List!948)

(assert (=> d!59939 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) e!118401)))

(declare-fun b!169706 () Bool)

(assert (=> b!169706 (= e!118401 Nil!945)))

(declare-fun b!169707 () Bool)

(assert (=> b!169707 (= e!118401 (Cons!944 (not (= (bvand ((_ sign_extend 24) (select (arr!4919 arr2!28) ((_ extract 31 0) (bvsdiv fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 thiss!1565 arr2!28 (bvadd fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!59939 c!8756) b!169706))

(assert (= (and d!59939 (not c!8756)) b!169707))

(declare-fun m!269481 () Bool)

(assert (=> b!169707 m!269481))

(declare-fun m!269483 () Bool)

(assert (=> b!169707 m!269483))

(declare-fun m!269485 () Bool)

(assert (=> b!169707 m!269485))

(assert (=> b!169686 d!59939))

(declare-fun d!59943 () Bool)

(declare-fun c!8757 () Bool)

(assert (=> d!59943 (= c!8757 (= nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118402 () List!948)

(assert (=> d!59943 (= (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499) e!118402)))

(declare-fun b!169708 () Bool)

(assert (=> b!169708 (= e!118402 Nil!945)))

(declare-fun b!169709 () Bool)

(assert (=> b!169709 (= e!118402 (Cons!944 (not (= (bvand ((_ sign_extend 24) (select (arr!4919 arr1!28) ((_ extract 31 0) (bvsdiv fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 thiss!1565 arr1!28 (bvadd fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!59943 c!8757) b!169708))

(assert (= (and d!59943 (not c!8757)) b!169709))

(declare-fun m!269487 () Bool)

(assert (=> b!169709 m!269487))

(declare-fun m!269489 () Bool)

(assert (=> b!169709 m!269489))

(declare-fun m!269491 () Bool)

(assert (=> b!169709 m!269491))

(assert (=> b!169686 d!59943))

(declare-fun d!59947 () Bool)

(assert (=> d!59947 (= (array_inv!3733 arr2!28) (bvsge (size!3992 arr2!28) #b00000000000000000000000000000000))))

(assert (=> start!37404 d!59947))

(declare-fun d!59951 () Bool)

(assert (=> d!59951 (= (array_inv!3733 arr1!28) (bvsge (size!3992 arr1!28) #b00000000000000000000000000000000))))

(assert (=> start!37404 d!59951))

(declare-fun d!59953 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59953 (= (inv!12 thiss!1565) (invariant!0 (currentBit!8414 thiss!1565) (currentByte!8419 thiss!1565) (size!3992 (buf!4435 thiss!1565))))))

(declare-fun bs!14911 () Bool)

(assert (= bs!14911 d!59953))

(declare-fun m!269495 () Bool)

(assert (=> bs!14911 m!269495))

(assert (=> start!37404 d!59953))

(declare-fun d!59957 () Bool)

(assert (=> d!59957 (= (array_inv!3733 (buf!4435 thiss!1565)) (bvsge (size!3992 (buf!4435 thiss!1565)) #b00000000000000000000000000000000))))

(assert (=> b!169689 d!59957))

(declare-fun d!59959 () Bool)

(declare-fun res!141037 () Bool)

(declare-fun e!118407 () Bool)

(assert (=> d!59959 (=> res!141037 e!118407)))

(assert (=> d!59959 (= res!141037 (= nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59959 (= (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 fromArr1!3 fromArr2!3 nBits!499) e!118407)))

(declare-fun b!169714 () Bool)

(declare-fun e!118408 () Bool)

(assert (=> b!169714 (= e!118407 e!118408)))

(declare-fun res!141038 () Bool)

(assert (=> b!169714 (=> (not res!141038) (not e!118408))))

(assert (=> b!169714 (= res!141038 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!4919 arr1!28) ((_ extract 31 0) (bvsdiv fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!4919 arr2!28) ((_ extract 31 0) (bvsdiv fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!169715 () Bool)

(assert (=> b!169715 (= e!118408 (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!59959 (not res!141037)) b!169714))

(assert (= (and b!169714 res!141038) b!169715))

(assert (=> b!169714 m!269487))

(assert (=> b!169714 m!269489))

(assert (=> b!169714 m!269481))

(assert (=> b!169714 m!269483))

(declare-fun m!269497 () Bool)

(assert (=> b!169715 m!269497))

(assert (=> b!169688 d!59959))

(check-sat (not d!59953) (not b!169715) (not b!169709) (not b!169707))
(check-sat)
