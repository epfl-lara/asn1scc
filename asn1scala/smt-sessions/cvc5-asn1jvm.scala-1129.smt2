; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32080 () Bool)

(assert start!32080)

(declare-fun res!132593 () Bool)

(declare-fun e!108243 () Bool)

(assert (=> start!32080 (=> (not res!132593) (not e!108243))))

(declare-datatypes ((array!7506 0))(
  ( (array!7507 (arr!4321 (Array (_ BitVec 32) (_ BitVec 8))) (size!3400 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5968 0))(
  ( (BitStream!5969 (buf!3858 array!7506) (currentByte!7082 (_ BitVec 32)) (currentBit!7077 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5968)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32080 (= res!132593 (validate_offset_byte!0 ((_ sign_extend 32) (size!3400 (buf!3858 thiss!1602))) ((_ sign_extend 32) (currentByte!7082 thiss!1602)) ((_ sign_extend 32) (currentBit!7077 thiss!1602))))))

(assert (=> start!32080 e!108243))

(declare-fun e!108246 () Bool)

(declare-fun inv!12 (BitStream!5968) Bool)

(assert (=> start!32080 (and (inv!12 thiss!1602) e!108246)))

(assert (=> start!32080 true))

(declare-fun b!158836 () Bool)

(assert (=> b!158836 (= e!108243 (not true))))

(declare-datatypes ((Unit!10691 0))(
  ( (Unit!10692) )
))
(declare-datatypes ((tuple3!702 0))(
  ( (tuple3!703 (_1!7699 Unit!10691) (_2!7699 (_ BitVec 8)) (_3!468 BitStream!5968)) )
))
(declare-fun lt!250365 () tuple3!702)

(declare-fun lt!250367 () (_ BitVec 8))

(declare-fun arrayRangesEq!451 (array!7506 array!7506 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158836 (arrayRangesEq!451 (buf!3858 thiss!1602) (array!7507 (store (arr!4321 (buf!3858 thiss!1602)) (bvsub (currentByte!7082 (_3!468 lt!250365)) #b00000000000000000000000000000001) lt!250367) (size!3400 (buf!3858 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7082 (_3!468 lt!250365)) #b00000000000000000000000000000001))))

(declare-fun lt!250362 () Unit!10691)

(declare-fun arrayUpdatedAtPrefixLemma!59 (array!7506 (_ BitVec 32) (_ BitVec 8)) Unit!10691)

(assert (=> b!158836 (= lt!250362 (arrayUpdatedAtPrefixLemma!59 (buf!3858 thiss!1602) (bvsub (currentByte!7082 (_3!468 lt!250365)) #b00000000000000000000000000000001) lt!250367))))

(assert (=> b!158836 (= lt!250367 (select (arr!4321 (buf!3858 (_3!468 lt!250365))) (bvsub (currentByte!7082 (_3!468 lt!250365)) #b00000000000000000000000000000001)))))

(declare-fun lt!250364 () array!7506)

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250363 () (_ BitVec 8))

(declare-fun lt!250360 () (_ BitVec 8))

(declare-fun lt!250361 () (_ BitVec 8))

(declare-fun lt!250366 () (_ BitVec 32))

(declare-fun lt!250368 () (_ BitVec 32))

(declare-fun lt!250359 () (_ BitVec 32))

(declare-fun Unit!10693 () Unit!10691)

(declare-fun Unit!10694 () Unit!10691)

(assert (=> b!158836 (= lt!250365 (ite (bvsgt lt!250368 #b00000000000000000000000000000000) (let ((bdg!9216 ((_ extract 7 0) (bvnot lt!250359)))) (let ((bdg!9217 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4321 (buf!3858 thiss!1602)) (currentByte!7082 thiss!1602) lt!250363) (currentByte!7082 thiss!1602) lt!250361) (bvadd #b00000000000000000000000000000001 (currentByte!7082 thiss!1602)))) ((_ sign_extend 24) bdg!9216))))) (tuple3!703 Unit!10693 bdg!9216 (BitStream!5969 (array!7507 (store (arr!4321 (array!7507 (store (arr!4321 lt!250364) (bvadd #b00000000000000000000000000000001 (currentByte!7082 thiss!1602)) bdg!9217) (size!3400 lt!250364))) (bvadd #b00000000000000000000000000000001 (currentByte!7082 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9217) (bvshl ((_ sign_extend 24) v!222) lt!250366)))) (size!3400 (array!7507 (store (arr!4321 lt!250364) (bvadd #b00000000000000000000000000000001 (currentByte!7082 thiss!1602)) bdg!9217) (size!3400 lt!250364)))) (bvadd #b00000000000000000000000000000001 (currentByte!7082 thiss!1602)) (currentBit!7077 thiss!1602))))) (tuple3!703 Unit!10694 lt!250360 (BitStream!5969 lt!250364 (bvadd #b00000000000000000000000000000001 (currentByte!7082 thiss!1602)) (currentBit!7077 thiss!1602)))))))

(declare-fun e!108244 () Bool)

(assert (=> b!158836 e!108244))

(declare-fun res!132592 () Bool)

(assert (=> b!158836 (=> res!132592 e!108244)))

(assert (=> b!158836 (= res!132592 (bvsge (currentByte!7082 thiss!1602) (size!3400 (buf!3858 thiss!1602))))))

(assert (=> b!158836 (= lt!250364 (array!7507 (store (store (arr!4321 (buf!3858 thiss!1602)) (currentByte!7082 thiss!1602) lt!250363) (currentByte!7082 thiss!1602) lt!250361) (size!3400 (buf!3858 thiss!1602))))))

(assert (=> b!158836 (= lt!250361 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250363) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250368))))))

(assert (=> b!158836 (= lt!250363 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4321 (buf!3858 thiss!1602)) (currentByte!7082 thiss!1602))) lt!250359)))))

(assert (=> b!158836 (= lt!250359 ((_ sign_extend 24) lt!250360))))

(assert (=> b!158836 (= lt!250360 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250366)))))))

(assert (=> b!158836 (= lt!250366 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250368))))))

(assert (=> b!158836 (= lt!250368 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7077 thiss!1602))))))

(declare-fun b!158837 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158837 (= e!108244 (byteRangesEq!0 (select (arr!4321 (buf!3858 thiss!1602)) (currentByte!7082 thiss!1602)) lt!250361 #b00000000000000000000000000000000 (currentBit!7077 thiss!1602)))))

(declare-fun b!158838 () Bool)

(declare-fun array_inv!3147 (array!7506) Bool)

(assert (=> b!158838 (= e!108246 (array_inv!3147 (buf!3858 thiss!1602)))))

(assert (= (and start!32080 res!132593) b!158836))

(assert (= (and b!158836 (not res!132592)) b!158837))

(assert (= start!32080 b!158838))

(declare-fun m!249491 () Bool)

(assert (=> start!32080 m!249491))

(declare-fun m!249493 () Bool)

(assert (=> start!32080 m!249493))

(declare-fun m!249495 () Bool)

(assert (=> b!158836 m!249495))

(declare-fun m!249497 () Bool)

(assert (=> b!158836 m!249497))

(declare-fun m!249499 () Bool)

(assert (=> b!158836 m!249499))

(declare-fun m!249501 () Bool)

(assert (=> b!158836 m!249501))

(declare-fun m!249503 () Bool)

(assert (=> b!158836 m!249503))

(declare-fun m!249505 () Bool)

(assert (=> b!158836 m!249505))

(declare-fun m!249507 () Bool)

(assert (=> b!158836 m!249507))

(declare-fun m!249509 () Bool)

(assert (=> b!158836 m!249509))

(declare-fun m!249511 () Bool)

(assert (=> b!158836 m!249511))

(declare-fun m!249513 () Bool)

(assert (=> b!158836 m!249513))

(declare-fun m!249515 () Bool)

(assert (=> b!158836 m!249515))

(assert (=> b!158837 m!249507))

(assert (=> b!158837 m!249507))

(declare-fun m!249517 () Bool)

(assert (=> b!158837 m!249517))

(declare-fun m!249519 () Bool)

(assert (=> b!158838 m!249519))

(push 1)

(assert (not b!158838))

(assert (not b!158837))

(assert (not b!158836))

(assert (not start!32080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

