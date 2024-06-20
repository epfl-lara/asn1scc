; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32158 () Bool)

(assert start!32158)

(declare-fun res!132885 () Bool)

(declare-fun e!108644 () Bool)

(assert (=> start!32158 (=> (not res!132885) (not e!108644))))

(declare-datatypes ((array!7563 0))(
  ( (array!7564 (arr!4348 (Array (_ BitVec 32) (_ BitVec 8))) (size!3427 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6022 0))(
  ( (BitStream!6023 (buf!3885 array!7563) (currentByte!7110 (_ BitVec 32)) (currentBit!7105 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6022)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32158 (= res!132885 (validate_offset_byte!0 ((_ sign_extend 32) (size!3427 (buf!3885 thiss!1602))) ((_ sign_extend 32) (currentByte!7110 thiss!1602)) ((_ sign_extend 32) (currentBit!7105 thiss!1602))))))

(assert (=> start!32158 e!108644))

(declare-fun e!108642 () Bool)

(declare-fun inv!12 (BitStream!6022) Bool)

(assert (=> start!32158 (and (inv!12 thiss!1602) e!108642)))

(assert (=> start!32158 true))

(declare-fun b!159209 () Bool)

(declare-fun e!108645 () Bool)

(declare-fun lt!251282 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159209 (= e!108645 (byteRangesEq!0 (select (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 thiss!1602)) lt!251282 #b00000000000000000000000000000000 (currentBit!7105 thiss!1602)))))

(declare-fun b!159210 () Bool)

(declare-fun e!108643 () Bool)

(assert (=> b!159210 (= e!108643 (bvsle #b00000000000000000000000000000000 (currentByte!7110 thiss!1602)))))

(declare-datatypes ((Unit!10799 0))(
  ( (Unit!10800) )
))
(declare-datatypes ((tuple3!756 0))(
  ( (tuple3!757 (_1!7726 Unit!10799) (_2!7726 (_ BitVec 8)) (_3!495 BitStream!6022)) )
))
(declare-fun lt!251291 () tuple3!756)

(declare-fun arrayRangesEq!478 (array!7563 array!7563 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159210 (arrayRangesEq!478 (buf!3885 thiss!1602) (buf!3885 (_3!495 lt!251291)) #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001))))

(declare-fun lt!251283 () array!7563)

(declare-fun lt!251290 () Unit!10799)

(declare-fun arrayRangesEqTransitive!121 (array!7563 array!7563 array!7563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10799)

(assert (=> b!159210 (= lt!251290 (arrayRangesEqTransitive!121 (buf!3885 thiss!1602) lt!251283 (buf!3885 (_3!495 lt!251291)) #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) (currentByte!7110 (_3!495 lt!251291))))))

(declare-fun lt!251288 () (_ BitVec 8))

(assert (=> b!159210 (arrayRangesEq!478 lt!251283 (array!7564 (store (store (store (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 thiss!1602) lt!251288) (currentByte!7110 thiss!1602) lt!251282) (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))) (size!3427 (buf!3885 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7110 (_3!495 lt!251291)))))

(declare-fun lt!251289 () Unit!10799)

(declare-fun arrayUpdatedAtPrefixLemma!86 (array!7563 (_ BitVec 32) (_ BitVec 8)) Unit!10799)

(assert (=> b!159210 (= lt!251289 (arrayUpdatedAtPrefixLemma!86 lt!251283 (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))))))

(assert (=> b!159210 (arrayRangesEq!478 (buf!3885 thiss!1602) (array!7564 (store (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))) (size!3427 (buf!3885 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7110 (_3!495 lt!251291)))))

(declare-fun lt!251285 () Unit!10799)

(assert (=> b!159210 (= lt!251285 (arrayUpdatedAtPrefixLemma!86 (buf!3885 thiss!1602) (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))))))

(declare-fun b!159211 () Bool)

(assert (=> b!159211 (= e!108644 (not e!108643))))

(declare-fun res!132884 () Bool)

(assert (=> b!159211 (=> res!132884 e!108643)))

(assert (=> b!159211 (= res!132884 (not (arrayRangesEq!478 (buf!3885 thiss!1602) lt!251283 #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001))))))

(declare-fun lt!251281 () (_ BitVec 8))

(assert (=> b!159211 (arrayRangesEq!478 (buf!3885 thiss!1602) (array!7564 (store (arr!4348 (buf!3885 thiss!1602)) (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) lt!251281) (size!3427 (buf!3885 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001))))

(declare-fun lt!251280 () Unit!10799)

(assert (=> b!159211 (= lt!251280 (arrayUpdatedAtPrefixLemma!86 (buf!3885 thiss!1602) (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) lt!251281))))

(assert (=> b!159211 (= lt!251281 (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001)))))

(declare-fun lt!251287 () (_ BitVec 8))

(declare-fun lt!251284 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251292 () (_ BitVec 32))

(declare-fun lt!251286 () (_ BitVec 32))

(declare-fun Unit!10801 () Unit!10799)

(declare-fun Unit!10802 () Unit!10799)

(assert (=> b!159211 (= lt!251291 (ite (bvsgt lt!251292 #b00000000000000000000000000000000) (let ((bdg!9335 ((_ extract 7 0) (bvnot lt!251286)))) (let ((bdg!9336 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 thiss!1602) lt!251288) (currentByte!7110 thiss!1602) lt!251282) (bvadd #b00000000000000000000000000000001 (currentByte!7110 thiss!1602)))) ((_ sign_extend 24) bdg!9335))))) (tuple3!757 Unit!10801 bdg!9335 (BitStream!6023 (array!7564 (store (arr!4348 (array!7564 (store (arr!4348 lt!251283) (bvadd #b00000000000000000000000000000001 (currentByte!7110 thiss!1602)) bdg!9336) (size!3427 lt!251283))) (bvadd #b00000000000000000000000000000001 (currentByte!7110 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9336) (bvshl ((_ sign_extend 24) v!222) lt!251284)))) (size!3427 (array!7564 (store (arr!4348 lt!251283) (bvadd #b00000000000000000000000000000001 (currentByte!7110 thiss!1602)) bdg!9336) (size!3427 lt!251283)))) (bvadd #b00000000000000000000000000000001 (currentByte!7110 thiss!1602)) (currentBit!7105 thiss!1602))))) (tuple3!757 Unit!10802 lt!251287 (BitStream!6023 lt!251283 (bvadd #b00000000000000000000000000000001 (currentByte!7110 thiss!1602)) (currentBit!7105 thiss!1602)))))))

(assert (=> b!159211 e!108645))

(declare-fun res!132886 () Bool)

(assert (=> b!159211 (=> res!132886 e!108645)))

(assert (=> b!159211 (= res!132886 (bvsge (currentByte!7110 thiss!1602) (size!3427 (buf!3885 thiss!1602))))))

(assert (=> b!159211 (= lt!251283 (array!7564 (store (store (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 thiss!1602) lt!251288) (currentByte!7110 thiss!1602) lt!251282) (size!3427 (buf!3885 thiss!1602))))))

(assert (=> b!159211 (= lt!251282 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251288) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251292))))))

(assert (=> b!159211 (= lt!251288 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 thiss!1602))) lt!251286)))))

(assert (=> b!159211 (= lt!251286 ((_ sign_extend 24) lt!251287))))

(assert (=> b!159211 (= lt!251287 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251284)))))))

(assert (=> b!159211 (= lt!251284 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251292))))))

(assert (=> b!159211 (= lt!251292 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7105 thiss!1602))))))

(declare-fun b!159212 () Bool)

(declare-fun array_inv!3174 (array!7563) Bool)

(assert (=> b!159212 (= e!108642 (array_inv!3174 (buf!3885 thiss!1602)))))

(declare-fun b!159213 () Bool)

(declare-fun res!132887 () Bool)

(assert (=> b!159213 (=> res!132887 e!108643)))

(assert (=> b!159213 (= res!132887 (bvsle lt!251292 #b00000000000000000000000000000000))))

(assert (= (and start!32158 res!132885) b!159211))

(assert (= (and b!159211 (not res!132886)) b!159209))

(assert (= (and b!159211 (not res!132884)) b!159213))

(assert (= (and b!159213 (not res!132887)) b!159210))

(assert (= start!32158 b!159212))

(declare-fun m!250597 () Bool)

(assert (=> b!159210 m!250597))

(declare-fun m!250599 () Bool)

(assert (=> b!159210 m!250599))

(declare-fun m!250601 () Bool)

(assert (=> b!159210 m!250601))

(declare-fun m!250603 () Bool)

(assert (=> b!159210 m!250603))

(assert (=> b!159210 m!250597))

(declare-fun m!250605 () Bool)

(assert (=> b!159210 m!250605))

(declare-fun m!250607 () Bool)

(assert (=> b!159210 m!250607))

(declare-fun m!250609 () Bool)

(assert (=> b!159210 m!250609))

(declare-fun m!250611 () Bool)

(assert (=> b!159210 m!250611))

(assert (=> b!159210 m!250597))

(declare-fun m!250613 () Bool)

(assert (=> b!159210 m!250613))

(declare-fun m!250615 () Bool)

(assert (=> b!159210 m!250615))

(declare-fun m!250617 () Bool)

(assert (=> b!159210 m!250617))

(declare-fun m!250619 () Bool)

(assert (=> start!32158 m!250619))

(declare-fun m!250621 () Bool)

(assert (=> start!32158 m!250621))

(declare-fun m!250623 () Bool)

(assert (=> b!159212 m!250623))

(declare-fun m!250625 () Bool)

(assert (=> b!159209 m!250625))

(assert (=> b!159209 m!250625))

(declare-fun m!250627 () Bool)

(assert (=> b!159209 m!250627))

(declare-fun m!250629 () Bool)

(assert (=> b!159211 m!250629))

(declare-fun m!250631 () Bool)

(assert (=> b!159211 m!250631))

(declare-fun m!250633 () Bool)

(assert (=> b!159211 m!250633))

(assert (=> b!159211 m!250601))

(declare-fun m!250635 () Bool)

(assert (=> b!159211 m!250635))

(declare-fun m!250637 () Bool)

(assert (=> b!159211 m!250637))

(declare-fun m!250639 () Bool)

(assert (=> b!159211 m!250639))

(assert (=> b!159211 m!250617))

(declare-fun m!250641 () Bool)

(assert (=> b!159211 m!250641))

(declare-fun m!250643 () Bool)

(assert (=> b!159211 m!250643))

(declare-fun m!250645 () Bool)

(assert (=> b!159211 m!250645))

(assert (=> b!159211 m!250625))

(push 1)

(assert (not b!159210))

(assert (not b!159212))

(assert (not b!159211))

(assert (not b!159209))

(assert (not start!32158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53461 () Bool)

(assert (=> d!53461 (= (byteRangesEq!0 (select (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 thiss!1602)) lt!251282 #b00000000000000000000000000000000 (currentBit!7105 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7105 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7105 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!251282) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7105 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13258 () Bool)

(assert (= bs!13258 d!53461))

(declare-fun m!250747 () Bool)

(assert (=> bs!13258 m!250747))

(declare-fun m!250749 () Bool)

(assert (=> bs!13258 m!250749))

(assert (=> b!159209 d!53461))

(declare-fun d!53463 () Bool)

(assert (=> d!53463 (arrayRangesEq!478 (buf!3885 thiss!1602) (buf!3885 (_3!495 lt!251291)) #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001))))

(declare-fun lt!251373 () Unit!10799)

(declare-fun choose!121 (array!7563 array!7563 array!7563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10799)

(assert (=> d!53463 (= lt!251373 (choose!121 (buf!3885 thiss!1602) lt!251283 (buf!3885 (_3!495 lt!251291)) #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) (currentByte!7110 (_3!495 lt!251291))))))

(assert (=> d!53463 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) (currentByte!7110 (_3!495 lt!251291))))))

(assert (=> d!53463 (= (arrayRangesEqTransitive!121 (buf!3885 thiss!1602) lt!251283 (buf!3885 (_3!495 lt!251291)) #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) (currentByte!7110 (_3!495 lt!251291))) lt!251373)))

(declare-fun bs!13259 () Bool)

(assert (= bs!13259 d!53463))

(assert (=> bs!13259 m!250611))

(declare-fun m!250751 () Bool)

(assert (=> bs!13259 m!250751))

(assert (=> b!159210 d!53463))

(declare-fun d!53465 () Bool)

(declare-fun res!132916 () Bool)

(declare-fun e!108680 () Bool)

(assert (=> d!53465 (=> res!132916 e!108680)))

(assert (=> d!53465 (= res!132916 (= #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001)))))

(assert (=> d!53465 (= (arrayRangesEq!478 (buf!3885 thiss!1602) (buf!3885 (_3!495 lt!251291)) #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001)) e!108680)))

(declare-fun b!159248 () Bool)

(declare-fun e!108681 () Bool)

(assert (=> b!159248 (= e!108680 e!108681)))

(declare-fun res!132917 () Bool)

(assert (=> b!159248 (=> (not res!132917) (not e!108681))))

(assert (=> b!159248 (= res!132917 (= (select (arr!4348 (buf!3885 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) #b00000000000000000000000000000000)))))

(declare-fun b!159249 () Bool)

(assert (=> b!159249 (= e!108681 (arrayRangesEq!478 (buf!3885 thiss!1602) (buf!3885 (_3!495 lt!251291)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001)))))

(assert (= (and d!53465 (not res!132916)) b!159248))

(assert (= (and b!159248 res!132917) b!159249))

(declare-fun m!250753 () Bool)

(assert (=> b!159248 m!250753))

(declare-fun m!250755 () Bool)

(assert (=> b!159248 m!250755))

(declare-fun m!250757 () Bool)

(assert (=> b!159249 m!250757))

(assert (=> b!159210 d!53465))

(declare-fun d!53467 () Bool)

(declare-fun e!108684 () Bool)

(assert (=> d!53467 e!108684))

(declare-fun res!132920 () Bool)

(assert (=> d!53467 (=> (not res!132920) (not e!108684))))

(assert (=> d!53467 (= res!132920 (and (bvsge (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000000) (bvslt (currentByte!7110 (_3!495 lt!251291)) (size!3427 lt!251283))))))

(declare-fun lt!251376 () Unit!10799)

(declare-fun choose!122 (array!7563 (_ BitVec 32) (_ BitVec 8)) Unit!10799)

(assert (=> d!53467 (= lt!251376 (choose!122 lt!251283 (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))))))

(assert (=> d!53467 (and (bvsle #b00000000000000000000000000000000 (currentByte!7110 (_3!495 lt!251291))) (bvslt (currentByte!7110 (_3!495 lt!251291)) (size!3427 lt!251283)))))

(assert (=> d!53467 (= (arrayUpdatedAtPrefixLemma!86 lt!251283 (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))) lt!251376)))

(declare-fun b!159252 () Bool)

(assert (=> b!159252 (= e!108684 (arrayRangesEq!478 lt!251283 (array!7564 (store (arr!4348 lt!251283) (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))) (size!3427 lt!251283)) #b00000000000000000000000000000000 (currentByte!7110 (_3!495 lt!251291))))))

(assert (= (and d!53467 res!132920) b!159252))

(assert (=> d!53467 m!250597))

(declare-fun m!250759 () Bool)

(assert (=> d!53467 m!250759))

(declare-fun m!250761 () Bool)

(assert (=> b!159252 m!250761))

(declare-fun m!250763 () Bool)

(assert (=> b!159252 m!250763))

(assert (=> b!159210 d!53467))

(declare-fun d!53469 () Bool)

(declare-fun res!132921 () Bool)

(declare-fun e!108685 () Bool)

(assert (=> d!53469 (=> res!132921 e!108685)))

(assert (=> d!53469 (= res!132921 (= #b00000000000000000000000000000000 (currentByte!7110 (_3!495 lt!251291))))))

(assert (=> d!53469 (= (arrayRangesEq!478 lt!251283 (array!7564 (store (store (store (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 thiss!1602) lt!251288) (currentByte!7110 thiss!1602) lt!251282) (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))) (size!3427 (buf!3885 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7110 (_3!495 lt!251291))) e!108685)))

(declare-fun b!159253 () Bool)

(declare-fun e!108686 () Bool)

(assert (=> b!159253 (= e!108685 e!108686)))

(declare-fun res!132922 () Bool)

(assert (=> b!159253 (=> (not res!132922) (not e!108686))))

(assert (=> b!159253 (= res!132922 (= (select (arr!4348 lt!251283) #b00000000000000000000000000000000) (select (arr!4348 (array!7564 (store (store (store (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 thiss!1602) lt!251288) (currentByte!7110 thiss!1602) lt!251282) (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))) (size!3427 (buf!3885 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159254 () Bool)

(assert (=> b!159254 (= e!108686 (arrayRangesEq!478 lt!251283 (array!7564 (store (store (store (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 thiss!1602) lt!251288) (currentByte!7110 thiss!1602) lt!251282) (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))) (size!3427 (buf!3885 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7110 (_3!495 lt!251291))))))

(assert (= (and d!53469 (not res!132921)) b!159253))

(assert (= (and b!159253 res!132922) b!159254))

(declare-fun m!250765 () Bool)

(assert (=> b!159253 m!250765))

(declare-fun m!250767 () Bool)

(assert (=> b!159253 m!250767))

(declare-fun m!250769 () Bool)

(assert (=> b!159254 m!250769))

(assert (=> b!159210 d!53469))

(declare-fun d!53471 () Bool)

(declare-fun e!108687 () Bool)

(assert (=> d!53471 e!108687))

(declare-fun res!132923 () Bool)

(assert (=> d!53471 (=> (not res!132923) (not e!108687))))

(assert (=> d!53471 (= res!132923 (and (bvsge (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000000) (bvslt (currentByte!7110 (_3!495 lt!251291)) (size!3427 (buf!3885 thiss!1602)))))))

(declare-fun lt!251377 () Unit!10799)

(assert (=> d!53471 (= lt!251377 (choose!122 (buf!3885 thiss!1602) (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))))))

(assert (=> d!53471 (and (bvsle #b00000000000000000000000000000000 (currentByte!7110 (_3!495 lt!251291))) (bvslt (currentByte!7110 (_3!495 lt!251291)) (size!3427 (buf!3885 thiss!1602))))))

(assert (=> d!53471 (= (arrayUpdatedAtPrefixLemma!86 (buf!3885 thiss!1602) (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))) lt!251377)))

(declare-fun b!159255 () Bool)

(assert (=> b!159255 (= e!108687 (arrayRangesEq!478 (buf!3885 thiss!1602) (array!7564 (store (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))) (size!3427 (buf!3885 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7110 (_3!495 lt!251291))))))

(assert (= (and d!53471 res!132923) b!159255))

(assert (=> d!53471 m!250597))

(declare-fun m!250771 () Bool)

(assert (=> d!53471 m!250771))

(assert (=> b!159255 m!250609))

(assert (=> b!159255 m!250607))

(assert (=> b!159210 d!53471))

(declare-fun d!53473 () Bool)

(declare-fun res!132924 () Bool)

(declare-fun e!108688 () Bool)

(assert (=> d!53473 (=> res!132924 e!108688)))

(assert (=> d!53473 (= res!132924 (= #b00000000000000000000000000000000 (currentByte!7110 (_3!495 lt!251291))))))

(assert (=> d!53473 (= (arrayRangesEq!478 (buf!3885 thiss!1602) (array!7564 (store (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))) (size!3427 (buf!3885 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7110 (_3!495 lt!251291))) e!108688)))

(declare-fun b!159256 () Bool)

(declare-fun e!108689 () Bool)

(assert (=> b!159256 (= e!108688 e!108689)))

(declare-fun res!132925 () Bool)

(assert (=> b!159256 (=> (not res!132925) (not e!108689))))

(assert (=> b!159256 (= res!132925 (= (select (arr!4348 (buf!3885 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4348 (array!7564 (store (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))) (size!3427 (buf!3885 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159257 () Bool)

(assert (=> b!159257 (= e!108689 (arrayRangesEq!478 (buf!3885 thiss!1602) (array!7564 (store (arr!4348 (buf!3885 thiss!1602)) (currentByte!7110 (_3!495 lt!251291)) (select (arr!4348 (buf!3885 (_3!495 lt!251291))) (currentByte!7110 (_3!495 lt!251291)))) (size!3427 (buf!3885 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7110 (_3!495 lt!251291))))))

(assert (= (and d!53473 (not res!132924)) b!159256))

(assert (= (and b!159256 res!132925) b!159257))

(assert (=> b!159256 m!250753))

(declare-fun m!250773 () Bool)

(assert (=> b!159256 m!250773))

(declare-fun m!250775 () Bool)

(assert (=> b!159257 m!250775))

(assert (=> b!159210 d!53473))

(declare-fun d!53477 () Bool)

(declare-fun res!132926 () Bool)

(declare-fun e!108690 () Bool)

(assert (=> d!53477 (=> res!132926 e!108690)))

(assert (=> d!53477 (= res!132926 (= #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001)))))

(assert (=> d!53477 (= (arrayRangesEq!478 (buf!3885 thiss!1602) lt!251283 #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001)) e!108690)))

(declare-fun b!159258 () Bool)

(declare-fun e!108691 () Bool)

(assert (=> b!159258 (= e!108690 e!108691)))

(declare-fun res!132927 () Bool)

(assert (=> b!159258 (=> (not res!132927) (not e!108691))))

(assert (=> b!159258 (= res!132927 (= (select (arr!4348 (buf!3885 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4348 lt!251283) #b00000000000000000000000000000000)))))

(declare-fun b!159259 () Bool)

(assert (=> b!159259 (= e!108691 (arrayRangesEq!478 (buf!3885 thiss!1602) lt!251283 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001)))))

(assert (= (and d!53477 (not res!132926)) b!159258))

(assert (= (and b!159258 res!132927) b!159259))

(assert (=> b!159258 m!250753))

(assert (=> b!159258 m!250765))

(declare-fun m!250777 () Bool)

(assert (=> b!159259 m!250777))

(assert (=> b!159211 d!53477))

(declare-fun d!53479 () Bool)

(declare-fun res!132928 () Bool)

(declare-fun e!108692 () Bool)

(assert (=> d!53479 (=> res!132928 e!108692)))

(assert (=> d!53479 (= res!132928 (= #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001)))))

(assert (=> d!53479 (= (arrayRangesEq!478 (buf!3885 thiss!1602) (array!7564 (store (arr!4348 (buf!3885 thiss!1602)) (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) lt!251281) (size!3427 (buf!3885 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001)) e!108692)))

(declare-fun b!159260 () Bool)

(declare-fun e!108693 () Bool)

(assert (=> b!159260 (= e!108692 e!108693)))

(declare-fun res!132929 () Bool)

(assert (=> b!159260 (=> (not res!132929) (not e!108693))))

(assert (=> b!159260 (= res!132929 (= (select (arr!4348 (buf!3885 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4348 (array!7564 (store (arr!4348 (buf!3885 thiss!1602)) (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) lt!251281) (size!3427 (buf!3885 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159261 () Bool)

(assert (=> b!159261 (= e!108693 (arrayRangesEq!478 (buf!3885 thiss!1602) (array!7564 (store (arr!4348 (buf!3885 thiss!1602)) (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) lt!251281) (size!3427 (buf!3885 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001)))))

(assert (= (and d!53479 (not res!132928)) b!159260))

(assert (= (and b!159260 res!132929) b!159261))

(assert (=> b!159260 m!250753))

(declare-fun m!250779 () Bool)

(assert (=> b!159260 m!250779))

(declare-fun m!250781 () Bool)

(assert (=> b!159261 m!250781))

(assert (=> b!159211 d!53479))

(declare-fun d!53481 () Bool)

(declare-fun e!108694 () Bool)

(assert (=> d!53481 e!108694))

(declare-fun res!132930 () Bool)

(assert (=> d!53481 (=> (not res!132930) (not e!108694))))

(assert (=> d!53481 (= res!132930 (and (bvsge (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) (size!3427 (buf!3885 thiss!1602)))))))

(declare-fun lt!251378 () Unit!10799)

(assert (=> d!53481 (= lt!251378 (choose!122 (buf!3885 thiss!1602) (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) lt!251281))))

(assert (=> d!53481 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) (size!3427 (buf!3885 thiss!1602))))))

(assert (=> d!53481 (= (arrayUpdatedAtPrefixLemma!86 (buf!3885 thiss!1602) (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) lt!251281) lt!251378)))

(declare-fun b!159262 () Bool)

(assert (=> b!159262 (= e!108694 (arrayRangesEq!478 (buf!3885 thiss!1602) (array!7564 (store (arr!4348 (buf!3885 thiss!1602)) (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001) lt!251281) (size!3427 (buf!3885 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7110 (_3!495 lt!251291)) #b00000000000000000000000000000001)))))

(assert (= (and d!53481 res!132930) b!159262))

(declare-fun m!250783 () Bool)

(assert (=> d!53481 m!250783))

(assert (=> b!159262 m!250631))

(assert (=> b!159262 m!250645))

(assert (=> b!159211 d!53481))

(declare-fun d!53483 () Bool)

(assert (=> d!53483 (= (array_inv!3174 (buf!3885 thiss!1602)) (bvsge (size!3427 (buf!3885 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!159212 d!53483))

(declare-fun d!53485 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53485 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3427 (buf!3885 thiss!1602))) ((_ sign_extend 32) (currentByte!7110 thiss!1602)) ((_ sign_extend 32) (currentBit!7105 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3427 (buf!3885 thiss!1602))) ((_ sign_extend 32) (currentByte!7110 thiss!1602)) ((_ sign_extend 32) (currentBit!7105 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13260 () Bool)

(assert (= bs!13260 d!53485))

(declare-fun m!250785 () Bool)

(assert (=> bs!13260 m!250785))

(assert (=> start!32158 d!53485))

(declare-fun d!53487 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53487 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7105 thiss!1602) (currentByte!7110 thiss!1602) (size!3427 (buf!3885 thiss!1602))))))

(declare-fun bs!13261 () Bool)

(assert (= bs!13261 d!53487))

(declare-fun m!250787 () Bool)

(assert (=> bs!13261 m!250787))

(assert (=> start!32158 d!53487))

(push 1)

(assert (not d!53485))

(assert (not b!159255))

(assert (not b!159257))

(assert (not b!159259))

(assert (not b!159262))

(assert (not d!53467))

(assert (not b!159252))

(assert (not d!53487))

(assert (not d!53463))

(assert (not d!53471))

(assert (not b!159261))

(assert (not b!159249))

(assert (not b!159254))

(assert (not d!53481))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

