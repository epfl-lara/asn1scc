; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32146 () Bool)

(assert start!32146)

(declare-fun b!159119 () Bool)

(declare-fun e!108552 () Bool)

(declare-datatypes ((array!7551 0))(
  ( (array!7552 (arr!4342 (Array (_ BitVec 32) (_ BitVec 8))) (size!3421 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6010 0))(
  ( (BitStream!6011 (buf!3879 array!7551) (currentByte!7104 (_ BitVec 32)) (currentBit!7099 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6010)

(declare-fun array_inv!3168 (array!7551) Bool)

(assert (=> b!159119 (= e!108552 (array_inv!3168 (buf!3879 thiss!1602)))))

(declare-fun b!159120 () Bool)

(declare-fun e!108551 () Bool)

(declare-fun lt!251065 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159120 (= e!108551 (byteRangesEq!0 (select (arr!4342 (buf!3879 thiss!1602)) (currentByte!7104 thiss!1602)) lt!251065 #b00000000000000000000000000000000 (currentBit!7099 thiss!1602)))))

(declare-fun b!159122 () Bool)

(declare-fun e!108555 () Bool)

(declare-fun e!108553 () Bool)

(assert (=> b!159122 (= e!108555 (not e!108553))))

(declare-fun res!132813 () Bool)

(assert (=> b!159122 (=> res!132813 e!108553)))

(declare-datatypes ((Unit!10775 0))(
  ( (Unit!10776) )
))
(declare-datatypes ((tuple3!744 0))(
  ( (tuple3!745 (_1!7720 Unit!10775) (_2!7720 (_ BitVec 8)) (_3!489 BitStream!6010)) )
))
(declare-fun lt!251070 () tuple3!744)

(declare-fun lt!251067 () array!7551)

(declare-fun arrayRangesEq!472 (array!7551 array!7551 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159122 (= res!132813 (not (arrayRangesEq!472 (buf!3879 thiss!1602) lt!251067 #b00000000000000000000000000000000 (bvsub (currentByte!7104 (_3!489 lt!251070)) #b00000000000000000000000000000001))))))

(declare-fun lt!251073 () (_ BitVec 8))

(assert (=> b!159122 (arrayRangesEq!472 (buf!3879 thiss!1602) (array!7552 (store (arr!4342 (buf!3879 thiss!1602)) (bvsub (currentByte!7104 (_3!489 lt!251070)) #b00000000000000000000000000000001) lt!251073) (size!3421 (buf!3879 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7104 (_3!489 lt!251070)) #b00000000000000000000000000000001))))

(declare-fun lt!251072 () Unit!10775)

(declare-fun arrayUpdatedAtPrefixLemma!80 (array!7551 (_ BitVec 32) (_ BitVec 8)) Unit!10775)

(assert (=> b!159122 (= lt!251072 (arrayUpdatedAtPrefixLemma!80 (buf!3879 thiss!1602) (bvsub (currentByte!7104 (_3!489 lt!251070)) #b00000000000000000000000000000001) lt!251073))))

(assert (=> b!159122 (= lt!251073 (select (arr!4342 (buf!3879 (_3!489 lt!251070))) (bvsub (currentByte!7104 (_3!489 lt!251070)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251071 () (_ BitVec 32))

(declare-fun lt!251069 () (_ BitVec 8))

(declare-fun lt!251066 () (_ BitVec 32))

(declare-fun lt!251064 () (_ BitVec 8))

(declare-fun lt!251063 () (_ BitVec 32))

(declare-fun Unit!10777 () Unit!10775)

(declare-fun Unit!10778 () Unit!10775)

(assert (=> b!159122 (= lt!251070 (ite (bvsgt lt!251071 #b00000000000000000000000000000000) (let ((bdg!9307 ((_ extract 7 0) (bvnot lt!251066)))) (let ((bdg!9308 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4342 (buf!3879 thiss!1602)) (currentByte!7104 thiss!1602) lt!251064) (currentByte!7104 thiss!1602) lt!251065) (bvadd #b00000000000000000000000000000001 (currentByte!7104 thiss!1602)))) ((_ sign_extend 24) bdg!9307))))) (tuple3!745 Unit!10777 bdg!9307 (BitStream!6011 (array!7552 (store (arr!4342 (array!7552 (store (arr!4342 lt!251067) (bvadd #b00000000000000000000000000000001 (currentByte!7104 thiss!1602)) bdg!9308) (size!3421 lt!251067))) (bvadd #b00000000000000000000000000000001 (currentByte!7104 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9308) (bvshl ((_ sign_extend 24) v!222) lt!251063)))) (size!3421 (array!7552 (store (arr!4342 lt!251067) (bvadd #b00000000000000000000000000000001 (currentByte!7104 thiss!1602)) bdg!9308) (size!3421 lt!251067)))) (bvadd #b00000000000000000000000000000001 (currentByte!7104 thiss!1602)) (currentBit!7099 thiss!1602))))) (tuple3!745 Unit!10778 lt!251069 (BitStream!6011 lt!251067 (bvadd #b00000000000000000000000000000001 (currentByte!7104 thiss!1602)) (currentBit!7099 thiss!1602)))))))

(assert (=> b!159122 e!108551))

(declare-fun res!132815 () Bool)

(assert (=> b!159122 (=> res!132815 e!108551)))

(assert (=> b!159122 (= res!132815 (bvsge (currentByte!7104 thiss!1602) (size!3421 (buf!3879 thiss!1602))))))

(assert (=> b!159122 (= lt!251067 (array!7552 (store (store (arr!4342 (buf!3879 thiss!1602)) (currentByte!7104 thiss!1602) lt!251064) (currentByte!7104 thiss!1602) lt!251065) (size!3421 (buf!3879 thiss!1602))))))

(assert (=> b!159122 (= lt!251065 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251064) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251071))))))

(assert (=> b!159122 (= lt!251064 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4342 (buf!3879 thiss!1602)) (currentByte!7104 thiss!1602))) lt!251066)))))

(assert (=> b!159122 (= lt!251066 ((_ sign_extend 24) lt!251069))))

(assert (=> b!159122 (= lt!251069 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251063)))))))

(assert (=> b!159122 (= lt!251063 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251071))))))

(assert (=> b!159122 (= lt!251071 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7099 thiss!1602))))))

(declare-fun b!159123 () Bool)

(declare-fun res!132812 () Bool)

(assert (=> b!159123 (=> res!132812 e!108553)))

(assert (=> b!159123 (= res!132812 (bvsle lt!251071 #b00000000000000000000000000000000))))

(declare-fun res!132814 () Bool)

(assert (=> start!32146 (=> (not res!132814) (not e!108555))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32146 (= res!132814 (validate_offset_byte!0 ((_ sign_extend 32) (size!3421 (buf!3879 thiss!1602))) ((_ sign_extend 32) (currentByte!7104 thiss!1602)) ((_ sign_extend 32) (currentBit!7099 thiss!1602))))))

(assert (=> start!32146 e!108555))

(declare-fun inv!12 (BitStream!6010) Bool)

(assert (=> start!32146 (and (inv!12 thiss!1602) e!108552)))

(assert (=> start!32146 true))

(declare-fun b!159121 () Bool)

(assert (=> b!159121 (= e!108553 true)))

(assert (=> b!159121 (arrayRangesEq!472 lt!251067 (array!7552 (store (store (store (arr!4342 (buf!3879 thiss!1602)) (currentByte!7104 thiss!1602) lt!251064) (currentByte!7104 thiss!1602) lt!251065) (currentByte!7104 (_3!489 lt!251070)) (select (arr!4342 (buf!3879 (_3!489 lt!251070))) (currentByte!7104 (_3!489 lt!251070)))) (size!3421 (buf!3879 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7104 (_3!489 lt!251070)))))

(declare-fun lt!251068 () Unit!10775)

(assert (=> b!159121 (= lt!251068 (arrayUpdatedAtPrefixLemma!80 lt!251067 (currentByte!7104 (_3!489 lt!251070)) (select (arr!4342 (buf!3879 (_3!489 lt!251070))) (currentByte!7104 (_3!489 lt!251070)))))))

(assert (=> b!159121 (arrayRangesEq!472 (buf!3879 thiss!1602) (array!7552 (store (arr!4342 (buf!3879 thiss!1602)) (currentByte!7104 (_3!489 lt!251070)) (select (arr!4342 (buf!3879 (_3!489 lt!251070))) (currentByte!7104 (_3!489 lt!251070)))) (size!3421 (buf!3879 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7104 (_3!489 lt!251070)))))

(declare-fun lt!251062 () Unit!10775)

(assert (=> b!159121 (= lt!251062 (arrayUpdatedAtPrefixLemma!80 (buf!3879 thiss!1602) (currentByte!7104 (_3!489 lt!251070)) (select (arr!4342 (buf!3879 (_3!489 lt!251070))) (currentByte!7104 (_3!489 lt!251070)))))))

(assert (= (and start!32146 res!132814) b!159122))

(assert (= (and b!159122 (not res!132815)) b!159120))

(assert (= (and b!159122 (not res!132813)) b!159123))

(assert (= (and b!159123 (not res!132812)) b!159121))

(assert (= start!32146 b!159119))

(declare-fun m!250321 () Bool)

(assert (=> b!159120 m!250321))

(assert (=> b!159120 m!250321))

(declare-fun m!250323 () Bool)

(assert (=> b!159120 m!250323))

(declare-fun m!250325 () Bool)

(assert (=> start!32146 m!250325))

(declare-fun m!250327 () Bool)

(assert (=> start!32146 m!250327))

(declare-fun m!250329 () Bool)

(assert (=> b!159119 m!250329))

(declare-fun m!250331 () Bool)

(assert (=> b!159121 m!250331))

(declare-fun m!250333 () Bool)

(assert (=> b!159121 m!250333))

(declare-fun m!250335 () Bool)

(assert (=> b!159121 m!250335))

(declare-fun m!250337 () Bool)

(assert (=> b!159121 m!250337))

(declare-fun m!250339 () Bool)

(assert (=> b!159121 m!250339))

(declare-fun m!250341 () Bool)

(assert (=> b!159121 m!250341))

(assert (=> b!159121 m!250333))

(declare-fun m!250343 () Bool)

(assert (=> b!159121 m!250343))

(declare-fun m!250345 () Bool)

(assert (=> b!159121 m!250345))

(assert (=> b!159121 m!250333))

(declare-fun m!250347 () Bool)

(assert (=> b!159121 m!250347))

(declare-fun m!250349 () Bool)

(assert (=> b!159122 m!250349))

(declare-fun m!250351 () Bool)

(assert (=> b!159122 m!250351))

(assert (=> b!159122 m!250341))

(declare-fun m!250353 () Bool)

(assert (=> b!159122 m!250353))

(declare-fun m!250355 () Bool)

(assert (=> b!159122 m!250355))

(assert (=> b!159122 m!250335))

(declare-fun m!250357 () Bool)

(assert (=> b!159122 m!250357))

(declare-fun m!250359 () Bool)

(assert (=> b!159122 m!250359))

(declare-fun m!250361 () Bool)

(assert (=> b!159122 m!250361))

(declare-fun m!250363 () Bool)

(assert (=> b!159122 m!250363))

(declare-fun m!250365 () Bool)

(assert (=> b!159122 m!250365))

(assert (=> b!159122 m!250321))

(push 1)

(assert (not b!159122))

(assert (not b!159119))

(assert (not b!159120))

(assert (not start!32146))

(assert (not b!159121))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

