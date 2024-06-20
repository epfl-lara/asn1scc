; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33864 () Bool)

(assert start!33864)

(declare-fun b!161714 () Bool)

(declare-fun e!111433 () Bool)

(assert (=> b!161714 (= e!111433 true)))

(declare-datatypes ((array!8002 0))(
  ( (array!8003 (arr!4509 (Array (_ BitVec 32) (_ BitVec 8))) (size!3588 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6344 0))(
  ( (BitStream!6345 (buf!4046 array!8002) (currentByte!7540 (_ BitVec 32)) (currentBit!7535 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11122 0))(
  ( (Unit!11123) )
))
(declare-datatypes ((tuple3!904 0))(
  ( (tuple3!905 (_1!7803 Unit!11122) (_2!7803 (_ BitVec 8)) (_3!569 BitStream!6344)) )
))
(declare-fun lt!254569 () tuple3!904)

(declare-fun thiss!1602 () BitStream!6344)

(declare-fun lt!254571 () (_ BitVec 8))

(declare-fun lt!254570 () array!8002)

(declare-fun lt!254560 () (_ BitVec 8))

(declare-fun arrayRangesEq!540 (array!8002 array!8002 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161714 (arrayRangesEq!540 lt!254570 (array!8003 (store (store (store (arr!4509 (buf!4046 thiss!1602)) (currentByte!7540 thiss!1602) lt!254571) (currentByte!7540 thiss!1602) lt!254560) (currentByte!7540 (_3!569 lt!254569)) (select (arr!4509 (buf!4046 (_3!569 lt!254569))) (currentByte!7540 (_3!569 lt!254569)))) (size!3588 (buf!4046 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7540 (_3!569 lt!254569)))))

(declare-fun lt!254562 () Unit!11122)

(declare-fun arrayUpdatedAtPrefixLemma!148 (array!8002 (_ BitVec 32) (_ BitVec 8)) Unit!11122)

(assert (=> b!161714 (= lt!254562 (arrayUpdatedAtPrefixLemma!148 lt!254570 (currentByte!7540 (_3!569 lt!254569)) (select (arr!4509 (buf!4046 (_3!569 lt!254569))) (currentByte!7540 (_3!569 lt!254569)))))))

(assert (=> b!161714 (arrayRangesEq!540 (buf!4046 thiss!1602) (array!8003 (store (arr!4509 (buf!4046 thiss!1602)) (currentByte!7540 (_3!569 lt!254569)) (select (arr!4509 (buf!4046 (_3!569 lt!254569))) (currentByte!7540 (_3!569 lt!254569)))) (size!3588 (buf!4046 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7540 (_3!569 lt!254569)))))

(declare-fun lt!254564 () Unit!11122)

(assert (=> b!161714 (= lt!254564 (arrayUpdatedAtPrefixLemma!148 (buf!4046 thiss!1602) (currentByte!7540 (_3!569 lt!254569)) (select (arr!4509 (buf!4046 (_3!569 lt!254569))) (currentByte!7540 (_3!569 lt!254569)))))))

(declare-fun b!161715 () Bool)

(declare-fun res!134817 () Bool)

(assert (=> b!161715 (=> res!134817 e!111433)))

(declare-fun lt!254565 () (_ BitVec 32))

(assert (=> b!161715 (= res!134817 (bvsle lt!254565 #b00000000000000000000000000000000))))

(declare-fun res!134819 () Bool)

(declare-fun e!111435 () Bool)

(assert (=> start!33864 (=> (not res!134819) (not e!111435))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33864 (= res!134819 (validate_offset_byte!0 ((_ sign_extend 32) (size!3588 (buf!4046 thiss!1602))) ((_ sign_extend 32) (currentByte!7540 thiss!1602)) ((_ sign_extend 32) (currentBit!7535 thiss!1602))))))

(assert (=> start!33864 e!111435))

(declare-fun e!111432 () Bool)

(declare-fun inv!12 (BitStream!6344) Bool)

(assert (=> start!33864 (and (inv!12 thiss!1602) e!111432)))

(assert (=> start!33864 true))

(declare-fun b!161716 () Bool)

(declare-fun e!111434 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161716 (= e!111434 (byteRangesEq!0 (select (arr!4509 (buf!4046 thiss!1602)) (currentByte!7540 thiss!1602)) lt!254560 #b00000000000000000000000000000000 (currentBit!7535 thiss!1602)))))

(declare-fun b!161717 () Bool)

(assert (=> b!161717 (= e!111435 (not e!111433))))

(declare-fun res!134818 () Bool)

(assert (=> b!161717 (=> res!134818 e!111433)))

(assert (=> b!161717 (= res!134818 (not (arrayRangesEq!540 (buf!4046 thiss!1602) lt!254570 #b00000000000000000000000000000000 (bvsub (currentByte!7540 (_3!569 lt!254569)) #b00000000000000000000000000000001))))))

(declare-fun lt!254561 () (_ BitVec 8))

(assert (=> b!161717 (arrayRangesEq!540 (buf!4046 thiss!1602) (array!8003 (store (arr!4509 (buf!4046 thiss!1602)) (bvsub (currentByte!7540 (_3!569 lt!254569)) #b00000000000000000000000000000001) lt!254561) (size!3588 (buf!4046 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7540 (_3!569 lt!254569)) #b00000000000000000000000000000001))))

(declare-fun lt!254568 () Unit!11122)

(assert (=> b!161717 (= lt!254568 (arrayUpdatedAtPrefixLemma!148 (buf!4046 thiss!1602) (bvsub (currentByte!7540 (_3!569 lt!254569)) #b00000000000000000000000000000001) lt!254561))))

(assert (=> b!161717 (= lt!254561 (select (arr!4509 (buf!4046 (_3!569 lt!254569))) (bvsub (currentByte!7540 (_3!569 lt!254569)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254567 () (_ BitVec 32))

(declare-fun lt!254563 () (_ BitVec 32))

(declare-fun lt!254566 () (_ BitVec 8))

(declare-fun Unit!11124 () Unit!11122)

(declare-fun Unit!11125 () Unit!11122)

(assert (=> b!161717 (= lt!254569 (ite (bvsgt lt!254565 #b00000000000000000000000000000000) (let ((bdg!9691 ((_ extract 7 0) (bvnot lt!254563)))) (let ((bdg!9692 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4509 (buf!4046 thiss!1602)) (currentByte!7540 thiss!1602) lt!254571) (currentByte!7540 thiss!1602) lt!254560) (bvadd #b00000000000000000000000000000001 (currentByte!7540 thiss!1602)))) ((_ sign_extend 24) bdg!9691))))) (tuple3!905 Unit!11124 bdg!9691 (BitStream!6345 (array!8003 (store (arr!4509 (array!8003 (store (arr!4509 lt!254570) (bvadd #b00000000000000000000000000000001 (currentByte!7540 thiss!1602)) bdg!9692) (size!3588 lt!254570))) (bvadd #b00000000000000000000000000000001 (currentByte!7540 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9692) (bvshl ((_ sign_extend 24) v!222) lt!254567)))) (size!3588 (array!8003 (store (arr!4509 lt!254570) (bvadd #b00000000000000000000000000000001 (currentByte!7540 thiss!1602)) bdg!9692) (size!3588 lt!254570)))) (bvadd #b00000000000000000000000000000001 (currentByte!7540 thiss!1602)) (currentBit!7535 thiss!1602))))) (tuple3!905 Unit!11125 lt!254566 (BitStream!6345 lt!254570 (bvadd #b00000000000000000000000000000001 (currentByte!7540 thiss!1602)) (currentBit!7535 thiss!1602)))))))

(assert (=> b!161717 e!111434))

(declare-fun res!134816 () Bool)

(assert (=> b!161717 (=> res!134816 e!111434)))

(assert (=> b!161717 (= res!134816 (bvsge (currentByte!7540 thiss!1602) (size!3588 (buf!4046 thiss!1602))))))

(assert (=> b!161717 (= lt!254570 (array!8003 (store (store (arr!4509 (buf!4046 thiss!1602)) (currentByte!7540 thiss!1602) lt!254571) (currentByte!7540 thiss!1602) lt!254560) (size!3588 (buf!4046 thiss!1602))))))

(assert (=> b!161717 (= lt!254560 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254571) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254565))))))

(assert (=> b!161717 (= lt!254571 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4509 (buf!4046 thiss!1602)) (currentByte!7540 thiss!1602))) lt!254563)))))

(assert (=> b!161717 (= lt!254563 ((_ sign_extend 24) lt!254566))))

(assert (=> b!161717 (= lt!254566 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254567)))))))

(assert (=> b!161717 (= lt!254567 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254565))))))

(assert (=> b!161717 (= lt!254565 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7535 thiss!1602))))))

(declare-fun b!161718 () Bool)

(declare-fun array_inv!3335 (array!8002) Bool)

(assert (=> b!161718 (= e!111432 (array_inv!3335 (buf!4046 thiss!1602)))))

(assert (= (and start!33864 res!134819) b!161717))

(assert (= (and b!161717 (not res!134816)) b!161716))

(assert (= (and b!161717 (not res!134818)) b!161715))

(assert (= (and b!161715 (not res!134817)) b!161714))

(assert (= start!33864 b!161718))

(declare-fun m!256397 () Bool)

(assert (=> b!161717 m!256397))

(declare-fun m!256399 () Bool)

(assert (=> b!161717 m!256399))

(declare-fun m!256401 () Bool)

(assert (=> b!161717 m!256401))

(declare-fun m!256403 () Bool)

(assert (=> b!161717 m!256403))

(declare-fun m!256405 () Bool)

(assert (=> b!161717 m!256405))

(declare-fun m!256407 () Bool)

(assert (=> b!161717 m!256407))

(declare-fun m!256409 () Bool)

(assert (=> b!161717 m!256409))

(declare-fun m!256411 () Bool)

(assert (=> b!161717 m!256411))

(declare-fun m!256413 () Bool)

(assert (=> b!161717 m!256413))

(declare-fun m!256415 () Bool)

(assert (=> b!161717 m!256415))

(declare-fun m!256417 () Bool)

(assert (=> b!161717 m!256417))

(declare-fun m!256419 () Bool)

(assert (=> b!161717 m!256419))

(declare-fun m!256421 () Bool)

(assert (=> b!161718 m!256421))

(assert (=> b!161716 m!256409))

(assert (=> b!161716 m!256409))

(declare-fun m!256423 () Bool)

(assert (=> b!161716 m!256423))

(declare-fun m!256425 () Bool)

(assert (=> b!161714 m!256425))

(declare-fun m!256427 () Bool)

(assert (=> b!161714 m!256427))

(declare-fun m!256429 () Bool)

(assert (=> b!161714 m!256429))

(declare-fun m!256431 () Bool)

(assert (=> b!161714 m!256431))

(assert (=> b!161714 m!256407))

(assert (=> b!161714 m!256411))

(assert (=> b!161714 m!256431))

(declare-fun m!256433 () Bool)

(assert (=> b!161714 m!256433))

(declare-fun m!256435 () Bool)

(assert (=> b!161714 m!256435))

(assert (=> b!161714 m!256431))

(declare-fun m!256437 () Bool)

(assert (=> b!161714 m!256437))

(declare-fun m!256439 () Bool)

(assert (=> start!33864 m!256439))

(declare-fun m!256441 () Bool)

(assert (=> start!33864 m!256441))

(push 1)

