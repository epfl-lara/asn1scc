; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32152 () Bool)

(assert start!32152)

(declare-fun res!132850 () Bool)

(declare-fun e!108600 () Bool)

(assert (=> start!32152 (=> (not res!132850) (not e!108600))))

(declare-datatypes ((array!7557 0))(
  ( (array!7558 (arr!4345 (Array (_ BitVec 32) (_ BitVec 8))) (size!3424 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6016 0))(
  ( (BitStream!6017 (buf!3882 array!7557) (currentByte!7107 (_ BitVec 32)) (currentBit!7102 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6016)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32152 (= res!132850 (validate_offset_byte!0 ((_ sign_extend 32) (size!3424 (buf!3882 thiss!1602))) ((_ sign_extend 32) (currentByte!7107 thiss!1602)) ((_ sign_extend 32) (currentBit!7102 thiss!1602))))))

(assert (=> start!32152 e!108600))

(declare-fun e!108597 () Bool)

(declare-fun inv!12 (BitStream!6016) Bool)

(assert (=> start!32152 (and (inv!12 thiss!1602) e!108597)))

(assert (=> start!32152 true))

(declare-fun b!159164 () Bool)

(declare-fun e!108596 () Bool)

(assert (=> b!159164 (= e!108596 true)))

(declare-fun lt!251175 () (_ BitVec 8))

(declare-fun lt!251173 () array!7557)

(declare-datatypes ((Unit!10787 0))(
  ( (Unit!10788) )
))
(declare-datatypes ((tuple3!750 0))(
  ( (tuple3!751 (_1!7723 Unit!10787) (_2!7723 (_ BitVec 8)) (_3!492 BitStream!6016)) )
))
(declare-fun lt!251170 () tuple3!750)

(declare-fun lt!251179 () (_ BitVec 8))

(declare-fun arrayRangesEq!475 (array!7557 array!7557 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159164 (arrayRangesEq!475 lt!251173 (array!7558 (store (store (store (arr!4345 (buf!3882 thiss!1602)) (currentByte!7107 thiss!1602) lt!251179) (currentByte!7107 thiss!1602) lt!251175) (currentByte!7107 (_3!492 lt!251170)) (select (arr!4345 (buf!3882 (_3!492 lt!251170))) (currentByte!7107 (_3!492 lt!251170)))) (size!3424 (buf!3882 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7107 (_3!492 lt!251170)))))

(declare-fun lt!251172 () Unit!10787)

(declare-fun arrayUpdatedAtPrefixLemma!83 (array!7557 (_ BitVec 32) (_ BitVec 8)) Unit!10787)

(assert (=> b!159164 (= lt!251172 (arrayUpdatedAtPrefixLemma!83 lt!251173 (currentByte!7107 (_3!492 lt!251170)) (select (arr!4345 (buf!3882 (_3!492 lt!251170))) (currentByte!7107 (_3!492 lt!251170)))))))

(assert (=> b!159164 (arrayRangesEq!475 (buf!3882 thiss!1602) (array!7558 (store (arr!4345 (buf!3882 thiss!1602)) (currentByte!7107 (_3!492 lt!251170)) (select (arr!4345 (buf!3882 (_3!492 lt!251170))) (currentByte!7107 (_3!492 lt!251170)))) (size!3424 (buf!3882 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7107 (_3!492 lt!251170)))))

(declare-fun lt!251180 () Unit!10787)

(assert (=> b!159164 (= lt!251180 (arrayUpdatedAtPrefixLemma!83 (buf!3882 thiss!1602) (currentByte!7107 (_3!492 lt!251170)) (select (arr!4345 (buf!3882 (_3!492 lt!251170))) (currentByte!7107 (_3!492 lt!251170)))))))

(declare-fun b!159165 () Bool)

(assert (=> b!159165 (= e!108600 (not e!108596))))

(declare-fun res!132851 () Bool)

(assert (=> b!159165 (=> res!132851 e!108596)))

(assert (=> b!159165 (= res!132851 (not (arrayRangesEq!475 (buf!3882 thiss!1602) lt!251173 #b00000000000000000000000000000000 (bvsub (currentByte!7107 (_3!492 lt!251170)) #b00000000000000000000000000000001))))))

(declare-fun lt!251181 () (_ BitVec 8))

(assert (=> b!159165 (arrayRangesEq!475 (buf!3882 thiss!1602) (array!7558 (store (arr!4345 (buf!3882 thiss!1602)) (bvsub (currentByte!7107 (_3!492 lt!251170)) #b00000000000000000000000000000001) lt!251181) (size!3424 (buf!3882 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7107 (_3!492 lt!251170)) #b00000000000000000000000000000001))))

(declare-fun lt!251174 () Unit!10787)

(assert (=> b!159165 (= lt!251174 (arrayUpdatedAtPrefixLemma!83 (buf!3882 thiss!1602) (bvsub (currentByte!7107 (_3!492 lt!251170)) #b00000000000000000000000000000001) lt!251181))))

(assert (=> b!159165 (= lt!251181 (select (arr!4345 (buf!3882 (_3!492 lt!251170))) (bvsub (currentByte!7107 (_3!492 lt!251170)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251177 () (_ BitVec 32))

(declare-fun lt!251171 () (_ BitVec 8))

(declare-fun lt!251176 () (_ BitVec 32))

(declare-fun lt!251178 () (_ BitVec 32))

(declare-fun Unit!10789 () Unit!10787)

(declare-fun Unit!10790 () Unit!10787)

(assert (=> b!159165 (= lt!251170 (ite (bvsgt lt!251177 #b00000000000000000000000000000000) (let ((bdg!9321 ((_ extract 7 0) (bvnot lt!251178)))) (let ((bdg!9322 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4345 (buf!3882 thiss!1602)) (currentByte!7107 thiss!1602) lt!251179) (currentByte!7107 thiss!1602) lt!251175) (bvadd #b00000000000000000000000000000001 (currentByte!7107 thiss!1602)))) ((_ sign_extend 24) bdg!9321))))) (tuple3!751 Unit!10789 bdg!9321 (BitStream!6017 (array!7558 (store (arr!4345 (array!7558 (store (arr!4345 lt!251173) (bvadd #b00000000000000000000000000000001 (currentByte!7107 thiss!1602)) bdg!9322) (size!3424 lt!251173))) (bvadd #b00000000000000000000000000000001 (currentByte!7107 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9322) (bvshl ((_ sign_extend 24) v!222) lt!251176)))) (size!3424 (array!7558 (store (arr!4345 lt!251173) (bvadd #b00000000000000000000000000000001 (currentByte!7107 thiss!1602)) bdg!9322) (size!3424 lt!251173)))) (bvadd #b00000000000000000000000000000001 (currentByte!7107 thiss!1602)) (currentBit!7102 thiss!1602))))) (tuple3!751 Unit!10790 lt!251171 (BitStream!6017 lt!251173 (bvadd #b00000000000000000000000000000001 (currentByte!7107 thiss!1602)) (currentBit!7102 thiss!1602)))))))

(declare-fun e!108598 () Bool)

(assert (=> b!159165 e!108598))

(declare-fun res!132848 () Bool)

(assert (=> b!159165 (=> res!132848 e!108598)))

(assert (=> b!159165 (= res!132848 (bvsge (currentByte!7107 thiss!1602) (size!3424 (buf!3882 thiss!1602))))))

(assert (=> b!159165 (= lt!251173 (array!7558 (store (store (arr!4345 (buf!3882 thiss!1602)) (currentByte!7107 thiss!1602) lt!251179) (currentByte!7107 thiss!1602) lt!251175) (size!3424 (buf!3882 thiss!1602))))))

(assert (=> b!159165 (= lt!251175 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251179) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251177))))))

(assert (=> b!159165 (= lt!251179 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4345 (buf!3882 thiss!1602)) (currentByte!7107 thiss!1602))) lt!251178)))))

(assert (=> b!159165 (= lt!251178 ((_ sign_extend 24) lt!251171))))

(assert (=> b!159165 (= lt!251171 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251176)))))))

(assert (=> b!159165 (= lt!251176 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251177))))))

(assert (=> b!159165 (= lt!251177 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7102 thiss!1602))))))

(declare-fun b!159166 () Bool)

(declare-fun array_inv!3171 (array!7557) Bool)

(assert (=> b!159166 (= e!108597 (array_inv!3171 (buf!3882 thiss!1602)))))

(declare-fun b!159167 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159167 (= e!108598 (byteRangesEq!0 (select (arr!4345 (buf!3882 thiss!1602)) (currentByte!7107 thiss!1602)) lt!251175 #b00000000000000000000000000000000 (currentBit!7102 thiss!1602)))))

(declare-fun b!159168 () Bool)

(declare-fun res!132849 () Bool)

(assert (=> b!159168 (=> res!132849 e!108596)))

(assert (=> b!159168 (= res!132849 (bvsle lt!251177 #b00000000000000000000000000000000))))

(assert (= (and start!32152 res!132850) b!159165))

(assert (= (and b!159165 (not res!132848)) b!159167))

(assert (= (and b!159165 (not res!132851)) b!159168))

(assert (= (and b!159168 (not res!132849)) b!159164))

(assert (= start!32152 b!159166))

(declare-fun m!250459 () Bool)

(assert (=> b!159164 m!250459))

(declare-fun m!250461 () Bool)

(assert (=> b!159164 m!250461))

(declare-fun m!250463 () Bool)

(assert (=> b!159164 m!250463))

(declare-fun m!250465 () Bool)

(assert (=> b!159164 m!250465))

(declare-fun m!250467 () Bool)

(assert (=> b!159164 m!250467))

(declare-fun m!250469 () Bool)

(assert (=> b!159164 m!250469))

(declare-fun m!250471 () Bool)

(assert (=> b!159164 m!250471))

(assert (=> b!159164 m!250461))

(declare-fun m!250473 () Bool)

(assert (=> b!159164 m!250473))

(declare-fun m!250475 () Bool)

(assert (=> b!159164 m!250475))

(assert (=> b!159164 m!250461))

(declare-fun m!250477 () Bool)

(assert (=> start!32152 m!250477))

(declare-fun m!250479 () Bool)

(assert (=> start!32152 m!250479))

(declare-fun m!250481 () Bool)

(assert (=> b!159167 m!250481))

(assert (=> b!159167 m!250481))

(declare-fun m!250483 () Bool)

(assert (=> b!159167 m!250483))

(declare-fun m!250485 () Bool)

(assert (=> b!159166 m!250485))

(declare-fun m!250487 () Bool)

(assert (=> b!159165 m!250487))

(declare-fun m!250489 () Bool)

(assert (=> b!159165 m!250489))

(declare-fun m!250491 () Bool)

(assert (=> b!159165 m!250491))

(declare-fun m!250493 () Bool)

(assert (=> b!159165 m!250493))

(declare-fun m!250495 () Bool)

(assert (=> b!159165 m!250495))

(assert (=> b!159165 m!250465))

(declare-fun m!250497 () Bool)

(assert (=> b!159165 m!250497))

(declare-fun m!250499 () Bool)

(assert (=> b!159165 m!250499))

(assert (=> b!159165 m!250481))

(assert (=> b!159165 m!250471))

(declare-fun m!250501 () Bool)

(assert (=> b!159165 m!250501))

(declare-fun m!250503 () Bool)

(assert (=> b!159165 m!250503))

(push 1)

(assert (not b!159164))

(assert (not b!159166))

(assert (not start!32152))

(assert (not b!159165))

(assert (not b!159167))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

