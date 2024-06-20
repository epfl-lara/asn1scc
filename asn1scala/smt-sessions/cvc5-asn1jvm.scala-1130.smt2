; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32086 () Bool)

(assert start!32086)

(declare-fun res!132610 () Bool)

(declare-fun e!108280 () Bool)

(assert (=> start!32086 (=> (not res!132610) (not e!108280))))

(declare-datatypes ((array!7512 0))(
  ( (array!7513 (arr!4324 (Array (_ BitVec 32) (_ BitVec 8))) (size!3403 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5974 0))(
  ( (BitStream!5975 (buf!3861 array!7512) (currentByte!7085 (_ BitVec 32)) (currentBit!7080 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5974)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32086 (= res!132610 (validate_offset_byte!0 ((_ sign_extend 32) (size!3403 (buf!3861 thiss!1602))) ((_ sign_extend 32) (currentByte!7085 thiss!1602)) ((_ sign_extend 32) (currentBit!7080 thiss!1602))))))

(assert (=> start!32086 e!108280))

(declare-fun e!108281 () Bool)

(declare-fun inv!12 (BitStream!5974) Bool)

(assert (=> start!32086 (and (inv!12 thiss!1602) e!108281)))

(assert (=> start!32086 true))

(declare-fun b!158863 () Bool)

(declare-datatypes ((Unit!10703 0))(
  ( (Unit!10704) )
))
(declare-datatypes ((tuple3!708 0))(
  ( (tuple3!709 (_1!7702 Unit!10703) (_2!7702 (_ BitVec 8)) (_3!471 BitStream!5974)) )
))
(declare-fun lt!250451 () tuple3!708)

(assert (=> b!158863 (= e!108280 (not (or (bvsgt #b00000000000000000000000000000000 (bvsub (currentByte!7085 (_3!471 lt!250451)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7085 (_3!471 lt!250451)) #b00000000000000000000000000000001) (size!3403 (buf!3861 thiss!1602))))))))

(declare-fun lt!250449 () (_ BitVec 8))

(declare-fun arrayRangesEq!454 (array!7512 array!7512 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158863 (arrayRangesEq!454 (buf!3861 thiss!1602) (array!7513 (store (arr!4324 (buf!3861 thiss!1602)) (bvsub (currentByte!7085 (_3!471 lt!250451)) #b00000000000000000000000000000001) lt!250449) (size!3403 (buf!3861 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7085 (_3!471 lt!250451)) #b00000000000000000000000000000001))))

(declare-fun lt!250456 () Unit!10703)

(declare-fun arrayUpdatedAtPrefixLemma!62 (array!7512 (_ BitVec 32) (_ BitVec 8)) Unit!10703)

(assert (=> b!158863 (= lt!250456 (arrayUpdatedAtPrefixLemma!62 (buf!3861 thiss!1602) (bvsub (currentByte!7085 (_3!471 lt!250451)) #b00000000000000000000000000000001) lt!250449))))

(assert (=> b!158863 (= lt!250449 (select (arr!4324 (buf!3861 (_3!471 lt!250451))) (bvsub (currentByte!7085 (_3!471 lt!250451)) #b00000000000000000000000000000001)))))

(declare-fun lt!250450 () (_ BitVec 32))

(declare-fun lt!250453 () (_ BitVec 8))

(declare-fun lt!250452 () (_ BitVec 8))

(declare-fun lt!250458 () (_ BitVec 8))

(declare-fun lt!250457 () (_ BitVec 32))

(declare-fun lt!250455 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250454 () array!7512)

(declare-fun Unit!10705 () Unit!10703)

(declare-fun Unit!10706 () Unit!10703)

(assert (=> b!158863 (= lt!250451 (ite (bvsgt lt!250455 #b00000000000000000000000000000000) (let ((bdg!9228 ((_ extract 7 0) (bvnot lt!250450)))) (let ((bdg!9229 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4324 (buf!3861 thiss!1602)) (currentByte!7085 thiss!1602) lt!250452) (currentByte!7085 thiss!1602) lt!250453) (bvadd #b00000000000000000000000000000001 (currentByte!7085 thiss!1602)))) ((_ sign_extend 24) bdg!9228))))) (tuple3!709 Unit!10705 bdg!9228 (BitStream!5975 (array!7513 (store (arr!4324 (array!7513 (store (arr!4324 lt!250454) (bvadd #b00000000000000000000000000000001 (currentByte!7085 thiss!1602)) bdg!9229) (size!3403 lt!250454))) (bvadd #b00000000000000000000000000000001 (currentByte!7085 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9229) (bvshl ((_ sign_extend 24) v!222) lt!250457)))) (size!3403 (array!7513 (store (arr!4324 lt!250454) (bvadd #b00000000000000000000000000000001 (currentByte!7085 thiss!1602)) bdg!9229) (size!3403 lt!250454)))) (bvadd #b00000000000000000000000000000001 (currentByte!7085 thiss!1602)) (currentBit!7080 thiss!1602))))) (tuple3!709 Unit!10706 lt!250458 (BitStream!5975 lt!250454 (bvadd #b00000000000000000000000000000001 (currentByte!7085 thiss!1602)) (currentBit!7080 thiss!1602)))))))

(declare-fun e!108279 () Bool)

(assert (=> b!158863 e!108279))

(declare-fun res!132611 () Bool)

(assert (=> b!158863 (=> res!132611 e!108279)))

(assert (=> b!158863 (= res!132611 (bvsge (currentByte!7085 thiss!1602) (size!3403 (buf!3861 thiss!1602))))))

(assert (=> b!158863 (= lt!250454 (array!7513 (store (store (arr!4324 (buf!3861 thiss!1602)) (currentByte!7085 thiss!1602) lt!250452) (currentByte!7085 thiss!1602) lt!250453) (size!3403 (buf!3861 thiss!1602))))))

(assert (=> b!158863 (= lt!250453 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250452) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250455))))))

(assert (=> b!158863 (= lt!250452 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4324 (buf!3861 thiss!1602)) (currentByte!7085 thiss!1602))) lt!250450)))))

(assert (=> b!158863 (= lt!250450 ((_ sign_extend 24) lt!250458))))

(assert (=> b!158863 (= lt!250458 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250457)))))))

(assert (=> b!158863 (= lt!250457 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250455))))))

(assert (=> b!158863 (= lt!250455 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7080 thiss!1602))))))

(declare-fun b!158864 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158864 (= e!108279 (byteRangesEq!0 (select (arr!4324 (buf!3861 thiss!1602)) (currentByte!7085 thiss!1602)) lt!250453 #b00000000000000000000000000000000 (currentBit!7080 thiss!1602)))))

(declare-fun b!158865 () Bool)

(declare-fun array_inv!3150 (array!7512) Bool)

(assert (=> b!158865 (= e!108281 (array_inv!3150 (buf!3861 thiss!1602)))))

(assert (= (and start!32086 res!132610) b!158863))

(assert (= (and b!158863 (not res!132611)) b!158864))

(assert (= start!32086 b!158865))

(declare-fun m!249581 () Bool)

(assert (=> start!32086 m!249581))

(declare-fun m!249583 () Bool)

(assert (=> start!32086 m!249583))

(declare-fun m!249585 () Bool)

(assert (=> b!158863 m!249585))

(declare-fun m!249587 () Bool)

(assert (=> b!158863 m!249587))

(declare-fun m!249589 () Bool)

(assert (=> b!158863 m!249589))

(declare-fun m!249591 () Bool)

(assert (=> b!158863 m!249591))

(declare-fun m!249593 () Bool)

(assert (=> b!158863 m!249593))

(declare-fun m!249595 () Bool)

(assert (=> b!158863 m!249595))

(declare-fun m!249597 () Bool)

(assert (=> b!158863 m!249597))

(declare-fun m!249599 () Bool)

(assert (=> b!158863 m!249599))

(declare-fun m!249601 () Bool)

(assert (=> b!158863 m!249601))

(declare-fun m!249603 () Bool)

(assert (=> b!158863 m!249603))

(declare-fun m!249605 () Bool)

(assert (=> b!158863 m!249605))

(assert (=> b!158864 m!249599))

(assert (=> b!158864 m!249599))

(declare-fun m!249607 () Bool)

(assert (=> b!158864 m!249607))

(declare-fun m!249609 () Bool)

(assert (=> b!158865 m!249609))

(push 1)

(assert (not b!158865))

(assert (not b!158864))

(assert (not b!158863))

(assert (not start!32086))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

