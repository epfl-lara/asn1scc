; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32306 () Bool)

(assert start!32306)

(declare-fun b!159549 () Bool)

(declare-fun e!108998 () Bool)

(declare-fun e!108999 () Bool)

(assert (=> b!159549 (= e!108998 (not e!108999))))

(declare-fun res!133183 () Bool)

(assert (=> b!159549 (=> res!133183 e!108999)))

(declare-datatypes ((array!7600 0))(
  ( (array!7601 (arr!4362 (Array (_ BitVec 32) (_ BitVec 8))) (size!3441 (_ BitVec 32))) )
))
(declare-fun lt!251853 () array!7600)

(declare-datatypes ((BitStream!6050 0))(
  ( (BitStream!6051 (buf!3899 array!7600) (currentByte!7133 (_ BitVec 32)) (currentBit!7128 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6050)

(declare-datatypes ((Unit!10855 0))(
  ( (Unit!10856) )
))
(declare-datatypes ((tuple3!784 0))(
  ( (tuple3!785 (_1!7740 Unit!10855) (_2!7740 (_ BitVec 8)) (_3!509 BitStream!6050)) )
))
(declare-fun lt!251855 () tuple3!784)

(declare-fun arrayRangesEq!492 (array!7600 array!7600 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159549 (= res!133183 (not (arrayRangesEq!492 (buf!3899 thiss!1602) lt!251853 #b00000000000000000000000000000000 (bvsub (currentByte!7133 (_3!509 lt!251855)) #b00000000000000000000000000000001))))))

(declare-fun lt!251854 () (_ BitVec 8))

(assert (=> b!159549 (arrayRangesEq!492 (buf!3899 thiss!1602) (array!7601 (store (arr!4362 (buf!3899 thiss!1602)) (bvsub (currentByte!7133 (_3!509 lt!251855)) #b00000000000000000000000000000001) lt!251854) (size!3441 (buf!3899 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7133 (_3!509 lt!251855)) #b00000000000000000000000000000001))))

(declare-fun lt!251852 () Unit!10855)

(declare-fun arrayUpdatedAtPrefixLemma!100 (array!7600 (_ BitVec 32) (_ BitVec 8)) Unit!10855)

(assert (=> b!159549 (= lt!251852 (arrayUpdatedAtPrefixLemma!100 (buf!3899 thiss!1602) (bvsub (currentByte!7133 (_3!509 lt!251855)) #b00000000000000000000000000000001) lt!251854))))

(assert (=> b!159549 (= lt!251854 (select (arr!4362 (buf!3899 (_3!509 lt!251855))) (bvsub (currentByte!7133 (_3!509 lt!251855)) #b00000000000000000000000000000001)))))

(declare-fun lt!251851 () (_ BitVec 32))

(declare-fun lt!251857 () (_ BitVec 8))

(declare-fun lt!251856 () (_ BitVec 32))

(declare-fun lt!251849 () (_ BitVec 8))

(declare-fun lt!251850 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251859 () Bool)

(declare-fun Unit!10857 () Unit!10855)

(declare-fun Unit!10858 () Unit!10855)

(assert (=> b!159549 (= lt!251855 (ite lt!251859 (let ((bdg!9394 ((_ extract 7 0) (bvnot lt!251856)))) (let ((bdg!9395 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4362 (buf!3899 thiss!1602)) (currentByte!7133 thiss!1602) lt!251850) (currentByte!7133 thiss!1602) lt!251857) (bvadd #b00000000000000000000000000000001 (currentByte!7133 thiss!1602)))) ((_ sign_extend 24) bdg!9394))))) (tuple3!785 Unit!10857 bdg!9394 (BitStream!6051 (array!7601 (store (arr!4362 (array!7601 (store (arr!4362 lt!251853) (bvadd #b00000000000000000000000000000001 (currentByte!7133 thiss!1602)) bdg!9395) (size!3441 lt!251853))) (bvadd #b00000000000000000000000000000001 (currentByte!7133 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9395) (bvshl ((_ sign_extend 24) v!222) lt!251851)))) (size!3441 (array!7601 (store (arr!4362 lt!251853) (bvadd #b00000000000000000000000000000001 (currentByte!7133 thiss!1602)) bdg!9395) (size!3441 lt!251853)))) (bvadd #b00000000000000000000000000000001 (currentByte!7133 thiss!1602)) (currentBit!7128 thiss!1602))))) (tuple3!785 Unit!10858 lt!251849 (BitStream!6051 lt!251853 (bvadd #b00000000000000000000000000000001 (currentByte!7133 thiss!1602)) (currentBit!7128 thiss!1602)))))))

(declare-fun lt!251858 () (_ BitVec 32))

(assert (=> b!159549 (= lt!251859 (bvsgt lt!251858 #b00000000000000000000000000000000))))

(declare-fun e!109000 () Bool)

(assert (=> b!159549 e!109000))

(declare-fun res!133182 () Bool)

(assert (=> b!159549 (=> res!133182 e!109000)))

(assert (=> b!159549 (= res!133182 (bvsge (currentByte!7133 thiss!1602) (size!3441 (buf!3899 thiss!1602))))))

(assert (=> b!159549 (= lt!251853 (array!7601 (store (store (arr!4362 (buf!3899 thiss!1602)) (currentByte!7133 thiss!1602) lt!251850) (currentByte!7133 thiss!1602) lt!251857) (size!3441 (buf!3899 thiss!1602))))))

(assert (=> b!159549 (= lt!251857 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251850) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251858))))))

(assert (=> b!159549 (= lt!251850 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4362 (buf!3899 thiss!1602)) (currentByte!7133 thiss!1602))) lt!251856)))))

(assert (=> b!159549 (= lt!251856 ((_ sign_extend 24) lt!251849))))

(assert (=> b!159549 (= lt!251849 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251851)))))))

(assert (=> b!159549 (= lt!251851 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251858))))))

(assert (=> b!159549 (= lt!251858 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7128 thiss!1602))))))

(declare-fun res!133184 () Bool)

(assert (=> start!32306 (=> (not res!133184) (not e!108998))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32306 (= res!133184 (validate_offset_byte!0 ((_ sign_extend 32) (size!3441 (buf!3899 thiss!1602))) ((_ sign_extend 32) (currentByte!7133 thiss!1602)) ((_ sign_extend 32) (currentBit!7128 thiss!1602))))))

(assert (=> start!32306 e!108998))

(declare-fun e!109002 () Bool)

(declare-fun inv!12 (BitStream!6050) Bool)

(assert (=> start!32306 (and (inv!12 thiss!1602) e!109002)))

(assert (=> start!32306 true))

(declare-fun b!159551 () Bool)

(assert (=> b!159551 (= e!108999 (or lt!251859 (bvsgt #b00000000000000000000000000000000 (currentByte!7133 thiss!1602)) (bvsle (size!3441 (buf!3899 thiss!1602)) (size!3441 (buf!3899 (_3!509 lt!251855))))))))

(declare-fun b!159550 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159550 (= e!109000 (byteRangesEq!0 (select (arr!4362 (buf!3899 thiss!1602)) (currentByte!7133 thiss!1602)) lt!251857 #b00000000000000000000000000000000 (currentBit!7128 thiss!1602)))))

(declare-fun b!159552 () Bool)

(declare-fun array_inv!3188 (array!7600) Bool)

(assert (=> b!159552 (= e!109002 (array_inv!3188 (buf!3899 thiss!1602)))))

(assert (= (and start!32306 res!133184) b!159549))

(assert (= (and b!159549 (not res!133182)) b!159550))

(assert (= (and b!159549 (not res!133183)) b!159551))

(assert (= start!32306 b!159552))

(declare-fun m!251519 () Bool)

(assert (=> b!159549 m!251519))

(declare-fun m!251521 () Bool)

(assert (=> b!159549 m!251521))

(declare-fun m!251523 () Bool)

(assert (=> b!159549 m!251523))

(declare-fun m!251525 () Bool)

(assert (=> b!159549 m!251525))

(declare-fun m!251527 () Bool)

(assert (=> b!159549 m!251527))

(declare-fun m!251529 () Bool)

(assert (=> b!159549 m!251529))

(declare-fun m!251531 () Bool)

(assert (=> b!159549 m!251531))

(declare-fun m!251533 () Bool)

(assert (=> b!159549 m!251533))

(declare-fun m!251535 () Bool)

(assert (=> b!159549 m!251535))

(declare-fun m!251537 () Bool)

(assert (=> b!159549 m!251537))

(declare-fun m!251539 () Bool)

(assert (=> b!159549 m!251539))

(declare-fun m!251541 () Bool)

(assert (=> b!159549 m!251541))

(declare-fun m!251543 () Bool)

(assert (=> start!32306 m!251543))

(declare-fun m!251545 () Bool)

(assert (=> start!32306 m!251545))

(assert (=> b!159550 m!251531))

(assert (=> b!159550 m!251531))

(declare-fun m!251547 () Bool)

(assert (=> b!159550 m!251547))

(declare-fun m!251549 () Bool)

(assert (=> b!159552 m!251549))

(push 1)

(assert (not b!159552))

(assert (not start!32306))

(assert (not b!159550))

(assert (not b!159549))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

