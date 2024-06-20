; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32302 () Bool)

(assert start!32302)

(declare-datatypes ((array!7596 0))(
  ( (array!7597 (arr!4360 (Array (_ BitVec 32) (_ BitVec 8))) (size!3439 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6046 0))(
  ( (BitStream!6047 (buf!3897 array!7596) (currentByte!7131 (_ BitVec 32)) (currentBit!7126 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!10847 0))(
  ( (Unit!10848) )
))
(declare-datatypes ((tuple3!780 0))(
  ( (tuple3!781 (_1!7738 Unit!10847) (_2!7738 (_ BitVec 8)) (_3!507 BitStream!6046)) )
))
(declare-fun lt!251792 () tuple3!780)

(declare-fun thiss!1602 () BitStream!6046)

(declare-fun e!108968 () Bool)

(declare-fun b!159527 () Bool)

(declare-fun lt!251785 () Bool)

(assert (=> b!159527 (= e!108968 (or lt!251785 (bvsgt #b00000000000000000000000000000000 (currentByte!7131 thiss!1602)) (bvsle (size!3439 (buf!3897 thiss!1602)) (size!3439 (buf!3897 (_3!507 lt!251792))))))))

(declare-fun b!159526 () Bool)

(declare-fun e!108969 () Bool)

(declare-fun lt!251791 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159526 (= e!108969 (byteRangesEq!0 (select (arr!4360 (buf!3897 thiss!1602)) (currentByte!7131 thiss!1602)) lt!251791 #b00000000000000000000000000000000 (currentBit!7126 thiss!1602)))))

(declare-fun b!159525 () Bool)

(declare-fun e!108972 () Bool)

(assert (=> b!159525 (= e!108972 (not e!108968))))

(declare-fun res!133165 () Bool)

(assert (=> b!159525 (=> res!133165 e!108968)))

(declare-fun lt!251790 () array!7596)

(declare-fun arrayRangesEq!490 (array!7596 array!7596 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159525 (= res!133165 (not (arrayRangesEq!490 (buf!3897 thiss!1602) lt!251790 #b00000000000000000000000000000000 (bvsub (currentByte!7131 (_3!507 lt!251792)) #b00000000000000000000000000000001))))))

(declare-fun lt!251788 () (_ BitVec 8))

(assert (=> b!159525 (arrayRangesEq!490 (buf!3897 thiss!1602) (array!7597 (store (arr!4360 (buf!3897 thiss!1602)) (bvsub (currentByte!7131 (_3!507 lt!251792)) #b00000000000000000000000000000001) lt!251788) (size!3439 (buf!3897 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7131 (_3!507 lt!251792)) #b00000000000000000000000000000001))))

(declare-fun lt!251789 () Unit!10847)

(declare-fun arrayUpdatedAtPrefixLemma!98 (array!7596 (_ BitVec 32) (_ BitVec 8)) Unit!10847)

(assert (=> b!159525 (= lt!251789 (arrayUpdatedAtPrefixLemma!98 (buf!3897 thiss!1602) (bvsub (currentByte!7131 (_3!507 lt!251792)) #b00000000000000000000000000000001) lt!251788))))

(assert (=> b!159525 (= lt!251788 (select (arr!4360 (buf!3897 (_3!507 lt!251792))) (bvsub (currentByte!7131 (_3!507 lt!251792)) #b00000000000000000000000000000001)))))

(declare-fun lt!251786 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251784 () (_ BitVec 8))

(declare-fun lt!251783 () (_ BitVec 8))

(declare-fun lt!251787 () (_ BitVec 32))

(declare-fun Unit!10849 () Unit!10847)

(declare-fun Unit!10850 () Unit!10847)

(assert (=> b!159525 (= lt!251792 (ite lt!251785 (let ((bdg!9394 ((_ extract 7 0) (bvnot lt!251787)))) (let ((bdg!9395 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4360 (buf!3897 thiss!1602)) (currentByte!7131 thiss!1602) lt!251784) (currentByte!7131 thiss!1602) lt!251791) (bvadd #b00000000000000000000000000000001 (currentByte!7131 thiss!1602)))) ((_ sign_extend 24) bdg!9394))))) (tuple3!781 Unit!10849 bdg!9394 (BitStream!6047 (array!7597 (store (arr!4360 (array!7597 (store (arr!4360 lt!251790) (bvadd #b00000000000000000000000000000001 (currentByte!7131 thiss!1602)) bdg!9395) (size!3439 lt!251790))) (bvadd #b00000000000000000000000000000001 (currentByte!7131 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9395) (bvshl ((_ sign_extend 24) v!222) lt!251786)))) (size!3439 (array!7597 (store (arr!4360 lt!251790) (bvadd #b00000000000000000000000000000001 (currentByte!7131 thiss!1602)) bdg!9395) (size!3439 lt!251790)))) (bvadd #b00000000000000000000000000000001 (currentByte!7131 thiss!1602)) (currentBit!7126 thiss!1602))))) (tuple3!781 Unit!10850 lt!251783 (BitStream!6047 lt!251790 (bvadd #b00000000000000000000000000000001 (currentByte!7131 thiss!1602)) (currentBit!7126 thiss!1602)))))))

(declare-fun lt!251793 () (_ BitVec 32))

(assert (=> b!159525 (= lt!251785 (bvsgt lt!251793 #b00000000000000000000000000000000))))

(assert (=> b!159525 e!108969))

(declare-fun res!133164 () Bool)

(assert (=> b!159525 (=> res!133164 e!108969)))

(assert (=> b!159525 (= res!133164 (bvsge (currentByte!7131 thiss!1602) (size!3439 (buf!3897 thiss!1602))))))

(assert (=> b!159525 (= lt!251790 (array!7597 (store (store (arr!4360 (buf!3897 thiss!1602)) (currentByte!7131 thiss!1602) lt!251784) (currentByte!7131 thiss!1602) lt!251791) (size!3439 (buf!3897 thiss!1602))))))

(assert (=> b!159525 (= lt!251791 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251784) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251793))))))

(assert (=> b!159525 (= lt!251784 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4360 (buf!3897 thiss!1602)) (currentByte!7131 thiss!1602))) lt!251787)))))

(assert (=> b!159525 (= lt!251787 ((_ sign_extend 24) lt!251783))))

(assert (=> b!159525 (= lt!251783 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251786)))))))

(assert (=> b!159525 (= lt!251786 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251793))))))

(assert (=> b!159525 (= lt!251793 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7126 thiss!1602))))))

(declare-fun b!159528 () Bool)

(declare-fun e!108971 () Bool)

(declare-fun array_inv!3186 (array!7596) Bool)

(assert (=> b!159528 (= e!108971 (array_inv!3186 (buf!3897 thiss!1602)))))

(declare-fun res!133166 () Bool)

(assert (=> start!32302 (=> (not res!133166) (not e!108972))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32302 (= res!133166 (validate_offset_byte!0 ((_ sign_extend 32) (size!3439 (buf!3897 thiss!1602))) ((_ sign_extend 32) (currentByte!7131 thiss!1602)) ((_ sign_extend 32) (currentBit!7126 thiss!1602))))))

(assert (=> start!32302 e!108972))

(declare-fun inv!12 (BitStream!6046) Bool)

(assert (=> start!32302 (and (inv!12 thiss!1602) e!108971)))

(assert (=> start!32302 true))

(assert (= (and start!32302 res!133166) b!159525))

(assert (= (and b!159525 (not res!133164)) b!159526))

(assert (= (and b!159525 (not res!133165)) b!159527))

(assert (= start!32302 b!159528))

(declare-fun m!251455 () Bool)

(assert (=> b!159526 m!251455))

(assert (=> b!159526 m!251455))

(declare-fun m!251457 () Bool)

(assert (=> b!159526 m!251457))

(declare-fun m!251459 () Bool)

(assert (=> b!159525 m!251459))

(declare-fun m!251461 () Bool)

(assert (=> b!159525 m!251461))

(declare-fun m!251463 () Bool)

(assert (=> b!159525 m!251463))

(declare-fun m!251465 () Bool)

(assert (=> b!159525 m!251465))

(declare-fun m!251467 () Bool)

(assert (=> b!159525 m!251467))

(declare-fun m!251469 () Bool)

(assert (=> b!159525 m!251469))

(assert (=> b!159525 m!251455))

(declare-fun m!251471 () Bool)

(assert (=> b!159525 m!251471))

(declare-fun m!251473 () Bool)

(assert (=> b!159525 m!251473))

(declare-fun m!251475 () Bool)

(assert (=> b!159525 m!251475))

(declare-fun m!251477 () Bool)

(assert (=> b!159525 m!251477))

(declare-fun m!251479 () Bool)

(assert (=> b!159525 m!251479))

(declare-fun m!251481 () Bool)

(assert (=> b!159528 m!251481))

(declare-fun m!251483 () Bool)

(assert (=> start!32302 m!251483))

(declare-fun m!251485 () Bool)

(assert (=> start!32302 m!251485))

(push 1)

(assert (not b!159525))

(assert (not b!159528))

(assert (not start!32302))

(assert (not b!159526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

