; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32084 () Bool)

(assert start!32084)

(declare-fun res!132604 () Bool)

(declare-fun e!108269 () Bool)

(assert (=> start!32084 (=> (not res!132604) (not e!108269))))

(declare-datatypes ((array!7510 0))(
  ( (array!7511 (arr!4323 (Array (_ BitVec 32) (_ BitVec 8))) (size!3402 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5972 0))(
  ( (BitStream!5973 (buf!3860 array!7510) (currentByte!7084 (_ BitVec 32)) (currentBit!7079 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5972)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32084 (= res!132604 (validate_offset_byte!0 ((_ sign_extend 32) (size!3402 (buf!3860 thiss!1602))) ((_ sign_extend 32) (currentByte!7084 thiss!1602)) ((_ sign_extend 32) (currentBit!7079 thiss!1602))))))

(assert (=> start!32084 e!108269))

(declare-fun e!108270 () Bool)

(declare-fun inv!12 (BitStream!5972) Bool)

(assert (=> start!32084 (and (inv!12 thiss!1602) e!108270)))

(assert (=> start!32084 true))

(declare-fun b!158854 () Bool)

(assert (=> b!158854 (= e!108269 (not true))))

(declare-datatypes ((Unit!10699 0))(
  ( (Unit!10700) )
))
(declare-datatypes ((tuple3!706 0))(
  ( (tuple3!707 (_1!7701 Unit!10699) (_2!7701 (_ BitVec 8)) (_3!470 BitStream!5972)) )
))
(declare-fun lt!250419 () tuple3!706)

(declare-fun lt!250422 () (_ BitVec 8))

(declare-fun arrayRangesEq!453 (array!7510 array!7510 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158854 (arrayRangesEq!453 (buf!3860 thiss!1602) (array!7511 (store (arr!4323 (buf!3860 thiss!1602)) (bvsub (currentByte!7084 (_3!470 lt!250419)) #b00000000000000000000000000000001) lt!250422) (size!3402 (buf!3860 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7084 (_3!470 lt!250419)) #b00000000000000000000000000000001))))

(declare-fun lt!250426 () Unit!10699)

(declare-fun arrayUpdatedAtPrefixLemma!61 (array!7510 (_ BitVec 32) (_ BitVec 8)) Unit!10699)

(assert (=> b!158854 (= lt!250426 (arrayUpdatedAtPrefixLemma!61 (buf!3860 thiss!1602) (bvsub (currentByte!7084 (_3!470 lt!250419)) #b00000000000000000000000000000001) lt!250422))))

(assert (=> b!158854 (= lt!250422 (select (arr!4323 (buf!3860 (_3!470 lt!250419))) (bvsub (currentByte!7084 (_3!470 lt!250419)) #b00000000000000000000000000000001)))))

(declare-fun lt!250423 () array!7510)

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250424 () (_ BitVec 8))

(declare-fun lt!250420 () (_ BitVec 8))

(declare-fun lt!250421 () (_ BitVec 32))

(declare-fun lt!250425 () (_ BitVec 32))

(declare-fun lt!250427 () (_ BitVec 8))

(declare-fun lt!250428 () (_ BitVec 32))

(declare-fun Unit!10701 () Unit!10699)

(declare-fun Unit!10702 () Unit!10699)

(assert (=> b!158854 (= lt!250419 (ite (bvsgt lt!250428 #b00000000000000000000000000000000) (let ((bdg!9216 ((_ extract 7 0) (bvnot lt!250421)))) (let ((bdg!9217 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4323 (buf!3860 thiss!1602)) (currentByte!7084 thiss!1602) lt!250420) (currentByte!7084 thiss!1602) lt!250424) (bvadd #b00000000000000000000000000000001 (currentByte!7084 thiss!1602)))) ((_ sign_extend 24) bdg!9216))))) (tuple3!707 Unit!10701 bdg!9216 (BitStream!5973 (array!7511 (store (arr!4323 (array!7511 (store (arr!4323 lt!250423) (bvadd #b00000000000000000000000000000001 (currentByte!7084 thiss!1602)) bdg!9217) (size!3402 lt!250423))) (bvadd #b00000000000000000000000000000001 (currentByte!7084 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9217) (bvshl ((_ sign_extend 24) v!222) lt!250425)))) (size!3402 (array!7511 (store (arr!4323 lt!250423) (bvadd #b00000000000000000000000000000001 (currentByte!7084 thiss!1602)) bdg!9217) (size!3402 lt!250423)))) (bvadd #b00000000000000000000000000000001 (currentByte!7084 thiss!1602)) (currentBit!7079 thiss!1602))))) (tuple3!707 Unit!10702 lt!250427 (BitStream!5973 lt!250423 (bvadd #b00000000000000000000000000000001 (currentByte!7084 thiss!1602)) (currentBit!7079 thiss!1602)))))))

(declare-fun e!108268 () Bool)

(assert (=> b!158854 e!108268))

(declare-fun res!132605 () Bool)

(assert (=> b!158854 (=> res!132605 e!108268)))

(assert (=> b!158854 (= res!132605 (bvsge (currentByte!7084 thiss!1602) (size!3402 (buf!3860 thiss!1602))))))

(assert (=> b!158854 (= lt!250423 (array!7511 (store (store (arr!4323 (buf!3860 thiss!1602)) (currentByte!7084 thiss!1602) lt!250420) (currentByte!7084 thiss!1602) lt!250424) (size!3402 (buf!3860 thiss!1602))))))

(assert (=> b!158854 (= lt!250424 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250420) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250428))))))

(assert (=> b!158854 (= lt!250420 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4323 (buf!3860 thiss!1602)) (currentByte!7084 thiss!1602))) lt!250421)))))

(assert (=> b!158854 (= lt!250421 ((_ sign_extend 24) lt!250427))))

(assert (=> b!158854 (= lt!250427 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250425)))))))

(assert (=> b!158854 (= lt!250425 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250428))))))

(assert (=> b!158854 (= lt!250428 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7079 thiss!1602))))))

(declare-fun b!158855 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158855 (= e!108268 (byteRangesEq!0 (select (arr!4323 (buf!3860 thiss!1602)) (currentByte!7084 thiss!1602)) lt!250424 #b00000000000000000000000000000000 (currentBit!7079 thiss!1602)))))

(declare-fun b!158856 () Bool)

(declare-fun array_inv!3149 (array!7510) Bool)

(assert (=> b!158856 (= e!108270 (array_inv!3149 (buf!3860 thiss!1602)))))

(assert (= (and start!32084 res!132604) b!158854))

(assert (= (and b!158854 (not res!132605)) b!158855))

(assert (= start!32084 b!158856))

(declare-fun m!249551 () Bool)

(assert (=> start!32084 m!249551))

(declare-fun m!249553 () Bool)

(assert (=> start!32084 m!249553))

(declare-fun m!249555 () Bool)

(assert (=> b!158854 m!249555))

(declare-fun m!249557 () Bool)

(assert (=> b!158854 m!249557))

(declare-fun m!249559 () Bool)

(assert (=> b!158854 m!249559))

(declare-fun m!249561 () Bool)

(assert (=> b!158854 m!249561))

(declare-fun m!249563 () Bool)

(assert (=> b!158854 m!249563))

(declare-fun m!249565 () Bool)

(assert (=> b!158854 m!249565))

(declare-fun m!249567 () Bool)

(assert (=> b!158854 m!249567))

(declare-fun m!249569 () Bool)

(assert (=> b!158854 m!249569))

(declare-fun m!249571 () Bool)

(assert (=> b!158854 m!249571))

(declare-fun m!249573 () Bool)

(assert (=> b!158854 m!249573))

(declare-fun m!249575 () Bool)

(assert (=> b!158854 m!249575))

(assert (=> b!158855 m!249567))

(assert (=> b!158855 m!249567))

(declare-fun m!249577 () Bool)

(assert (=> b!158855 m!249577))

(declare-fun m!249579 () Bool)

(assert (=> b!158856 m!249579))

(push 1)

(assert (not b!158856))

(assert (not b!158855))

(assert (not b!158854))

(assert (not start!32084))

(check-sat)

(pop 1)

(push 1)

(check-sat)

