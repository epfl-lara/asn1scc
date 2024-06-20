; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35382 () Bool)

(assert start!35382)

(declare-fun res!137900 () Bool)

(declare-fun e!114587 () Bool)

(assert (=> start!35382 (=> (not res!137900) (not e!114587))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35382 (= res!137900 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35382 e!114587))

(assert (=> start!35382 true))

(declare-datatypes ((array!8432 0))(
  ( (array!8433 (arr!4685 (Array (_ BitVec 32) (_ BitVec 8))) (size!3764 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6684 0))(
  ( (BitStream!6685 (buf!4216 array!8432) (currentByte!7898 (_ BitVec 32)) (currentBit!7893 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6684)

(declare-fun e!114588 () Bool)

(declare-fun inv!12 (BitStream!6684) Bool)

(assert (=> start!35382 (and (inv!12 thiss!1577) e!114588)))

(declare-fun b!165557 () Bool)

(declare-fun res!137902 () Bool)

(declare-fun e!114584 () Bool)

(assert (=> b!165557 (=> (not res!137902) (not e!114584))))

(declare-datatypes ((Unit!11518 0))(
  ( (Unit!11519) )
))
(declare-datatypes ((tuple2!14582 0))(
  ( (tuple2!14583 (_1!7882 Unit!11518) (_2!7882 BitStream!6684)) )
))
(declare-fun lt!258861 () tuple2!14582)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!165557 (= res!137902 (= (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258861))) (currentByte!7898 (_2!7882 lt!258861)) (currentBit!7893 (_2!7882 lt!258861))) (bvadd (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)) ((_ sign_extend 32) nBits!511))))))

(declare-fun b!165558 () Bool)

(declare-fun e!114583 () Bool)

(assert (=> b!165558 (= e!114583 e!114584)))

(declare-fun res!137899 () Bool)

(assert (=> b!165558 (=> (not res!137899) (not e!114584))))

(assert (=> b!165558 (= res!137899 (= (size!3764 (buf!4216 thiss!1577)) (size!3764 (buf!4216 (_2!7882 lt!258861)))))))

(declare-fun lt!258864 () array!8432)

(declare-fun moveBitIndex!0 (BitStream!6684 (_ BitVec 64)) tuple2!14582)

(assert (=> b!165558 (= lt!258861 (moveBitIndex!0 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165559 () Bool)

(declare-fun e!114586 () Bool)

(assert (=> b!165559 (= e!114586 (not e!114583))))

(declare-fun res!137901 () Bool)

(assert (=> b!165559 (=> res!137901 e!114583)))

(declare-fun lt!258867 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165559 (= res!137901 (not (byteRangesEq!0 (select (arr!4685 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577)) lt!258867 #b00000000000000000000000000000000 (currentBit!7893 thiss!1577))))))

(declare-fun arrayRangesEq!644 (array!8432 array!8432 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165559 (arrayRangesEq!644 (buf!4216 thiss!1577) lt!258864 #b00000000000000000000000000000000 (currentByte!7898 thiss!1577))))

(declare-fun lt!258862 () Unit!11518)

(declare-fun arrayUpdatedAtPrefixLemma!252 (array!8432 (_ BitVec 32) (_ BitVec 8)) Unit!11518)

(assert (=> b!165559 (= lt!258862 (arrayUpdatedAtPrefixLemma!252 (buf!4216 thiss!1577) (currentByte!7898 thiss!1577) lt!258867))))

(assert (=> b!165559 (= lt!258864 (array!8433 (store (arr!4685 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) lt!258867) (size!3764 (buf!4216 thiss!1577))))))

(declare-fun lt!258866 () (_ BitVec 8))

(declare-fun lt!258860 () (_ BitVec 32))

(assert (=> b!165559 (= lt!258867 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4685 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7893 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258860)))))) (bvshl ((_ sign_extend 24) lt!258866) lt!258860))))))

(assert (=> b!165559 (= lt!258860 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7893 thiss!1577) nBits!511)))))

(declare-fun b!165560 () Bool)

(declare-fun res!137897 () Bool)

(assert (=> b!165560 (=> (not res!137897) (not e!114587))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165560 (= res!137897 (validate_offset_bits!1 ((_ sign_extend 32) (size!3764 (buf!4216 thiss!1577))) ((_ sign_extend 32) (currentByte!7898 thiss!1577)) ((_ sign_extend 32) (currentBit!7893 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165561 () Bool)

(declare-fun array_inv!3505 (array!8432) Bool)

(assert (=> b!165561 (= e!114588 (array_inv!3505 (buf!4216 thiss!1577)))))

(declare-fun b!165562 () Bool)

(declare-fun res!137903 () Bool)

(assert (=> b!165562 (=> (not res!137903) (not e!114584))))

(declare-fun isPrefixOf!0 (BitStream!6684 BitStream!6684) Bool)

(assert (=> b!165562 (= res!137903 (isPrefixOf!0 thiss!1577 (_2!7882 lt!258861)))))

(declare-fun b!165563 () Bool)

(declare-datatypes ((tuple2!14584 0))(
  ( (tuple2!14585 (_1!7883 BitStream!6684) (_2!7883 (_ BitVec 8))) )
))
(declare-fun lt!258865 () tuple2!14584)

(declare-datatypes ((tuple2!14586 0))(
  ( (tuple2!14587 (_1!7884 BitStream!6684) (_2!7884 BitStream!6684)) )
))
(declare-fun lt!258863 () tuple2!14586)

(assert (=> b!165563 (= e!114584 (and (= ((_ sign_extend 24) (_2!7883 lt!258865)) ((_ sign_extend 24) lt!258866)) (= (_1!7883 lt!258865) (_2!7884 lt!258863))))))

(declare-fun readPartialBytePure!0 (BitStream!6684 (_ BitVec 32)) tuple2!14584)

(assert (=> b!165563 (= lt!258865 (readPartialBytePure!0 (_1!7884 lt!258863) nBits!511))))

(declare-fun reader!0 (BitStream!6684 BitStream!6684) tuple2!14586)

(assert (=> b!165563 (= lt!258863 (reader!0 thiss!1577 (_2!7882 lt!258861)))))

(declare-fun b!165564 () Bool)

(assert (=> b!165564 (= e!114587 e!114586)))

(declare-fun res!137898 () Bool)

(assert (=> b!165564 (=> (not res!137898) (not e!114586))))

(assert (=> b!165564 (= res!137898 (bvsle (bvadd (currentBit!7893 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165564 (= lt!258866 ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))))))

(assert (= (and start!35382 res!137900) b!165560))

(assert (= (and b!165560 res!137897) b!165564))

(assert (= (and b!165564 res!137898) b!165559))

(assert (= (and b!165559 (not res!137901)) b!165558))

(assert (= (and b!165558 res!137899) b!165557))

(assert (= (and b!165557 res!137902) b!165562))

(assert (= (and b!165562 res!137903) b!165563))

(assert (= start!35382 b!165561))

(declare-fun m!263069 () Bool)

(assert (=> b!165558 m!263069))

(declare-fun m!263071 () Bool)

(assert (=> b!165563 m!263071))

(declare-fun m!263073 () Bool)

(assert (=> b!165563 m!263073))

(declare-fun m!263075 () Bool)

(assert (=> b!165560 m!263075))

(declare-fun m!263077 () Bool)

(assert (=> b!165562 m!263077))

(declare-fun m!263079 () Bool)

(assert (=> b!165564 m!263079))

(declare-fun m!263081 () Bool)

(assert (=> start!35382 m!263081))

(declare-fun m!263083 () Bool)

(assert (=> b!165561 m!263083))

(declare-fun m!263085 () Bool)

(assert (=> b!165557 m!263085))

(declare-fun m!263087 () Bool)

(assert (=> b!165557 m!263087))

(declare-fun m!263089 () Bool)

(assert (=> b!165559 m!263089))

(declare-fun m!263091 () Bool)

(assert (=> b!165559 m!263091))

(declare-fun m!263093 () Bool)

(assert (=> b!165559 m!263093))

(declare-fun m!263095 () Bool)

(assert (=> b!165559 m!263095))

(assert (=> b!165559 m!263091))

(declare-fun m!263097 () Bool)

(assert (=> b!165559 m!263097))

(declare-fun m!263099 () Bool)

(assert (=> b!165559 m!263099))

(declare-fun m!263101 () Bool)

(assert (=> b!165559 m!263101))

(check-sat (not b!165563) (not start!35382) (not b!165559) (not b!165557) (not b!165562) (not b!165561) (not b!165558) (not b!165560))
(check-sat)
(get-model)

(declare-fun d!57337 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57337 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3764 (buf!4216 thiss!1577))) ((_ sign_extend 32) (currentByte!7898 thiss!1577)) ((_ sign_extend 32) (currentBit!7893 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 thiss!1577))) ((_ sign_extend 32) (currentByte!7898 thiss!1577)) ((_ sign_extend 32) (currentBit!7893 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14248 () Bool)

(assert (= bs!14248 d!57337))

(declare-fun m!263137 () Bool)

(assert (=> bs!14248 m!263137))

(assert (=> b!165560 d!57337))

(declare-fun d!57339 () Bool)

(assert (=> d!57339 (= (byteRangesEq!0 (select (arr!4685 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577)) lt!258867 #b00000000000000000000000000000000 (currentBit!7893 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7893 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4685 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7893 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!258867) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7893 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14249 () Bool)

(assert (= bs!14249 d!57339))

(declare-fun m!263139 () Bool)

(assert (=> bs!14249 m!263139))

(declare-fun m!263141 () Bool)

(assert (=> bs!14249 m!263141))

(assert (=> b!165559 d!57339))

(declare-fun d!57341 () Bool)

(declare-fun res!137929 () Bool)

(declare-fun e!114611 () Bool)

(assert (=> d!57341 (=> res!137929 e!114611)))

(assert (=> d!57341 (= res!137929 (= #b00000000000000000000000000000000 (currentByte!7898 thiss!1577)))))

(assert (=> d!57341 (= (arrayRangesEq!644 (buf!4216 thiss!1577) lt!258864 #b00000000000000000000000000000000 (currentByte!7898 thiss!1577)) e!114611)))

(declare-fun b!165593 () Bool)

(declare-fun e!114612 () Bool)

(assert (=> b!165593 (= e!114611 e!114612)))

(declare-fun res!137930 () Bool)

(assert (=> b!165593 (=> (not res!137930) (not e!114612))))

(assert (=> b!165593 (= res!137930 (= (select (arr!4685 (buf!4216 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4685 lt!258864) #b00000000000000000000000000000000)))))

(declare-fun b!165594 () Bool)

(assert (=> b!165594 (= e!114612 (arrayRangesEq!644 (buf!4216 thiss!1577) lt!258864 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7898 thiss!1577)))))

(assert (= (and d!57341 (not res!137929)) b!165593))

(assert (= (and b!165593 res!137930) b!165594))

(declare-fun m!263143 () Bool)

(assert (=> b!165593 m!263143))

(declare-fun m!263145 () Bool)

(assert (=> b!165593 m!263145))

(declare-fun m!263147 () Bool)

(assert (=> b!165594 m!263147))

(assert (=> b!165559 d!57341))

(declare-fun d!57343 () Bool)

(declare-fun e!114615 () Bool)

(assert (=> d!57343 e!114615))

(declare-fun res!137933 () Bool)

(assert (=> d!57343 (=> (not res!137933) (not e!114615))))

(assert (=> d!57343 (= res!137933 (and (bvsge (currentByte!7898 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7898 thiss!1577) (size!3764 (buf!4216 thiss!1577)))))))

(declare-fun lt!258894 () Unit!11518)

(declare-fun choose!223 (array!8432 (_ BitVec 32) (_ BitVec 8)) Unit!11518)

(assert (=> d!57343 (= lt!258894 (choose!223 (buf!4216 thiss!1577) (currentByte!7898 thiss!1577) lt!258867))))

(assert (=> d!57343 (and (bvsle #b00000000000000000000000000000000 (currentByte!7898 thiss!1577)) (bvslt (currentByte!7898 thiss!1577) (size!3764 (buf!4216 thiss!1577))))))

(assert (=> d!57343 (= (arrayUpdatedAtPrefixLemma!252 (buf!4216 thiss!1577) (currentByte!7898 thiss!1577) lt!258867) lt!258894)))

(declare-fun b!165597 () Bool)

(assert (=> b!165597 (= e!114615 (arrayRangesEq!644 (buf!4216 thiss!1577) (array!8433 (store (arr!4685 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) lt!258867) (size!3764 (buf!4216 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7898 thiss!1577)))))

(assert (= (and d!57343 res!137933) b!165597))

(declare-fun m!263149 () Bool)

(assert (=> d!57343 m!263149))

(assert (=> b!165597 m!263095))

(declare-fun m!263151 () Bool)

(assert (=> b!165597 m!263151))

(assert (=> b!165559 d!57343))

(declare-fun d!57345 () Bool)

(declare-fun lt!258915 () (_ BitVec 32))

(assert (=> d!57345 (= lt!258915 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!258911 () (_ BitVec 32))

(assert (=> d!57345 (= lt!258911 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!114626 () Bool)

(assert (=> d!57345 e!114626))

(declare-fun res!137947 () Bool)

(assert (=> d!57345 (=> (not res!137947) (not e!114626))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6684 (_ BitVec 64)) Bool)

(assert (=> d!57345 (= res!137947 (moveBitIndexPrecond!0 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11522 () Unit!11518)

(declare-fun Unit!11523 () Unit!11518)

(declare-fun Unit!11524 () Unit!11518)

(assert (=> d!57345 (= (moveBitIndex!0 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) lt!258915) #b00000000000000000000000000000000) (tuple2!14583 Unit!11522 (BitStream!6685 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (bvsub (bvadd (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) lt!258911) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!258915 (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) lt!258915) #b00000000000000000000000000001000) (tuple2!14583 Unit!11523 (BitStream!6685 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (bvadd (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) lt!258911 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) lt!258915) #b00000000000000000000000000001000))) (tuple2!14583 Unit!11524 (BitStream!6685 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (bvadd (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) lt!258911) (bvadd (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) lt!258915))))))))

(declare-fun b!165611 () Bool)

(declare-fun e!114627 () Bool)

(assert (=> b!165611 (= e!114626 e!114627)))

(declare-fun res!137948 () Bool)

(assert (=> b!165611 (=> (not res!137948) (not e!114627))))

(declare-fun lt!258912 () (_ BitVec 64))

(declare-fun lt!258914 () tuple2!14582)

(assert (=> b!165611 (= res!137948 (= (bvadd lt!258912 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258914))) (currentByte!7898 (_2!7882 lt!258914)) (currentBit!7893 (_2!7882 lt!258914)))))))

(assert (=> b!165611 (or (not (= (bvand lt!258912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!258912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!258912 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!165611 (= lt!258912 (bitIndex!0 (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))) (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))))))

(declare-fun lt!258910 () (_ BitVec 32))

(declare-fun lt!258913 () (_ BitVec 32))

(declare-fun Unit!11525 () Unit!11518)

(declare-fun Unit!11526 () Unit!11518)

(declare-fun Unit!11527 () Unit!11518)

(assert (=> b!165611 (= lt!258914 (ite (bvslt (bvadd (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) lt!258910) #b00000000000000000000000000000000) (tuple2!14583 Unit!11525 (BitStream!6685 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (bvsub (bvadd (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) lt!258913) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!258910 (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) lt!258910) #b00000000000000000000000000001000) (tuple2!14583 Unit!11526 (BitStream!6685 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (bvadd (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) lt!258913 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) lt!258910) #b00000000000000000000000000001000))) (tuple2!14583 Unit!11527 (BitStream!6685 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (bvadd (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) lt!258913) (bvadd (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) lt!258910))))))))

(assert (=> b!165611 (= lt!258910 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165611 (= lt!258913 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!165612 () Bool)

(assert (=> b!165612 (= e!114627 (and (= (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))) (size!3764 (buf!4216 (_2!7882 lt!258914)))) (= (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (buf!4216 (_2!7882 lt!258914)))))))

(assert (= (and d!57345 res!137947) b!165611))

(assert (= (and b!165611 res!137948) b!165612))

(declare-fun m!263157 () Bool)

(assert (=> d!57345 m!263157))

(declare-fun m!263159 () Bool)

(assert (=> b!165611 m!263159))

(declare-fun m!263161 () Bool)

(assert (=> b!165611 m!263161))

(assert (=> b!165558 d!57345))

(declare-fun d!57355 () Bool)

(declare-datatypes ((tuple2!14594 0))(
  ( (tuple2!14595 (_1!7888 (_ BitVec 8)) (_2!7888 BitStream!6684)) )
))
(declare-fun lt!258918 () tuple2!14594)

(declare-fun readPartialByte!0 (BitStream!6684 (_ BitVec 32)) tuple2!14594)

(assert (=> d!57355 (= lt!258918 (readPartialByte!0 (_1!7884 lt!258863) nBits!511))))

(assert (=> d!57355 (= (readPartialBytePure!0 (_1!7884 lt!258863) nBits!511) (tuple2!14585 (_2!7888 lt!258918) (_1!7888 lt!258918)))))

(declare-fun bs!14251 () Bool)

(assert (= bs!14251 d!57355))

(declare-fun m!263163 () Bool)

(assert (=> bs!14251 m!263163))

(assert (=> b!165563 d!57355))

(declare-fun b!165646 () Bool)

(declare-fun e!114642 () Unit!11518)

(declare-fun lt!259058 () Unit!11518)

(assert (=> b!165646 (= e!114642 lt!259058)))

(declare-fun lt!259043 () (_ BitVec 64))

(assert (=> b!165646 (= lt!259043 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!259049 () (_ BitVec 64))

(assert (=> b!165646 (= lt!259049 (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8432 array!8432 (_ BitVec 64) (_ BitVec 64)) Unit!11518)

(assert (=> b!165646 (= lt!259058 (arrayBitRangesEqSymmetric!0 (buf!4216 thiss!1577) (buf!4216 (_2!7882 lt!258861)) lt!259043 lt!259049))))

(declare-fun arrayBitRangesEq!0 (array!8432 array!8432 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165646 (arrayBitRangesEq!0 (buf!4216 (_2!7882 lt!258861)) (buf!4216 thiss!1577) lt!259043 lt!259049)))

(declare-fun b!165647 () Bool)

(declare-fun Unit!11528 () Unit!11518)

(assert (=> b!165647 (= e!114642 Unit!11528)))

(declare-fun b!165648 () Bool)

(declare-fun res!137972 () Bool)

(declare-fun e!114643 () Bool)

(assert (=> b!165648 (=> (not res!137972) (not e!114643))))

(declare-fun lt!259050 () tuple2!14586)

(assert (=> b!165648 (= res!137972 (isPrefixOf!0 (_2!7884 lt!259050) (_2!7882 lt!258861)))))

(declare-fun b!165650 () Bool)

(declare-fun res!137973 () Bool)

(assert (=> b!165650 (=> (not res!137973) (not e!114643))))

(assert (=> b!165650 (= res!137973 (isPrefixOf!0 (_1!7884 lt!259050) thiss!1577))))

(declare-fun lt!259060 () (_ BitVec 64))

(declare-fun b!165649 () Bool)

(declare-fun lt!259056 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!6684 (_ BitVec 64)) BitStream!6684)

(assert (=> b!165649 (= e!114643 (= (_1!7884 lt!259050) (withMovedBitIndex!0 (_2!7884 lt!259050) (bvsub lt!259056 lt!259060))))))

(assert (=> b!165649 (or (= (bvand lt!259056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259060 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259056 lt!259060) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!165649 (= lt!259060 (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258861))) (currentByte!7898 (_2!7882 lt!258861)) (currentBit!7893 (_2!7882 lt!258861))))))

(assert (=> b!165649 (= lt!259056 (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))))

(declare-fun d!57357 () Bool)

(assert (=> d!57357 e!114643))

(declare-fun res!137974 () Bool)

(assert (=> d!57357 (=> (not res!137974) (not e!114643))))

(assert (=> d!57357 (= res!137974 (isPrefixOf!0 (_1!7884 lt!259050) (_2!7884 lt!259050)))))

(declare-fun lt!259052 () BitStream!6684)

(assert (=> d!57357 (= lt!259050 (tuple2!14587 lt!259052 (_2!7882 lt!258861)))))

(declare-fun lt!259048 () Unit!11518)

(declare-fun lt!259044 () Unit!11518)

(assert (=> d!57357 (= lt!259048 lt!259044)))

(assert (=> d!57357 (isPrefixOf!0 lt!259052 (_2!7882 lt!258861))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6684 BitStream!6684 BitStream!6684) Unit!11518)

(assert (=> d!57357 (= lt!259044 (lemmaIsPrefixTransitive!0 lt!259052 (_2!7882 lt!258861) (_2!7882 lt!258861)))))

(declare-fun lt!259046 () Unit!11518)

(declare-fun lt!259062 () Unit!11518)

(assert (=> d!57357 (= lt!259046 lt!259062)))

(assert (=> d!57357 (isPrefixOf!0 lt!259052 (_2!7882 lt!258861))))

(assert (=> d!57357 (= lt!259062 (lemmaIsPrefixTransitive!0 lt!259052 thiss!1577 (_2!7882 lt!258861)))))

(declare-fun lt!259053 () Unit!11518)

(assert (=> d!57357 (= lt!259053 e!114642)))

(declare-fun c!8591 () Bool)

(assert (=> d!57357 (= c!8591 (not (= (size!3764 (buf!4216 thiss!1577)) #b00000000000000000000000000000000)))))

(declare-fun lt!259055 () Unit!11518)

(declare-fun lt!259057 () Unit!11518)

(assert (=> d!57357 (= lt!259055 lt!259057)))

(assert (=> d!57357 (isPrefixOf!0 (_2!7882 lt!258861) (_2!7882 lt!258861))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6684) Unit!11518)

(assert (=> d!57357 (= lt!259057 (lemmaIsPrefixRefl!0 (_2!7882 lt!258861)))))

(declare-fun lt!259047 () Unit!11518)

(declare-fun lt!259061 () Unit!11518)

(assert (=> d!57357 (= lt!259047 lt!259061)))

(assert (=> d!57357 (= lt!259061 (lemmaIsPrefixRefl!0 (_2!7882 lt!258861)))))

(declare-fun lt!259059 () Unit!11518)

(declare-fun lt!259051 () Unit!11518)

(assert (=> d!57357 (= lt!259059 lt!259051)))

(assert (=> d!57357 (isPrefixOf!0 lt!259052 lt!259052)))

(assert (=> d!57357 (= lt!259051 (lemmaIsPrefixRefl!0 lt!259052))))

(declare-fun lt!259045 () Unit!11518)

(declare-fun lt!259054 () Unit!11518)

(assert (=> d!57357 (= lt!259045 lt!259054)))

(assert (=> d!57357 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!57357 (= lt!259054 (lemmaIsPrefixRefl!0 thiss!1577))))

(assert (=> d!57357 (= lt!259052 (BitStream!6685 (buf!4216 (_2!7882 lt!258861)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))))

(assert (=> d!57357 (isPrefixOf!0 thiss!1577 (_2!7882 lt!258861))))

(assert (=> d!57357 (= (reader!0 thiss!1577 (_2!7882 lt!258861)) lt!259050)))

(assert (= (and d!57357 c!8591) b!165646))

(assert (= (and d!57357 (not c!8591)) b!165647))

(assert (= (and d!57357 res!137974) b!165650))

(assert (= (and b!165650 res!137973) b!165648))

(assert (= (and b!165648 res!137972) b!165649))

(declare-fun m!263205 () Bool)

(assert (=> b!165649 m!263205))

(assert (=> b!165649 m!263085))

(assert (=> b!165649 m!263087))

(assert (=> b!165646 m!263087))

(declare-fun m!263207 () Bool)

(assert (=> b!165646 m!263207))

(declare-fun m!263209 () Bool)

(assert (=> b!165646 m!263209))

(declare-fun m!263211 () Bool)

(assert (=> b!165648 m!263211))

(assert (=> d!57357 m!263077))

(declare-fun m!263213 () Bool)

(assert (=> d!57357 m!263213))

(declare-fun m!263215 () Bool)

(assert (=> d!57357 m!263215))

(declare-fun m!263217 () Bool)

(assert (=> d!57357 m!263217))

(declare-fun m!263219 () Bool)

(assert (=> d!57357 m!263219))

(declare-fun m!263221 () Bool)

(assert (=> d!57357 m!263221))

(declare-fun m!263223 () Bool)

(assert (=> d!57357 m!263223))

(declare-fun m!263225 () Bool)

(assert (=> d!57357 m!263225))

(declare-fun m!263227 () Bool)

(assert (=> d!57357 m!263227))

(declare-fun m!263229 () Bool)

(assert (=> d!57357 m!263229))

(declare-fun m!263231 () Bool)

(assert (=> d!57357 m!263231))

(declare-fun m!263233 () Bool)

(assert (=> b!165650 m!263233))

(assert (=> b!165563 d!57357))

(declare-fun d!57373 () Bool)

(declare-fun e!114660 () Bool)

(assert (=> d!57373 e!114660))

(declare-fun res!137998 () Bool)

(assert (=> d!57373 (=> (not res!137998) (not e!114660))))

(declare-fun lt!259101 () (_ BitVec 64))

(declare-fun lt!259102 () (_ BitVec 64))

(declare-fun lt!259100 () (_ BitVec 64))

(assert (=> d!57373 (= res!137998 (= lt!259102 (bvsub lt!259100 lt!259101)))))

(assert (=> d!57373 (or (= (bvand lt!259100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259101 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259100 lt!259101) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57373 (= lt!259101 (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7882 lt!258861)))) ((_ sign_extend 32) (currentByte!7898 (_2!7882 lt!258861))) ((_ sign_extend 32) (currentBit!7893 (_2!7882 lt!258861)))))))

(declare-fun lt!259099 () (_ BitVec 64))

(declare-fun lt!259103 () (_ BitVec 64))

(assert (=> d!57373 (= lt!259100 (bvmul lt!259099 lt!259103))))

(assert (=> d!57373 (or (= lt!259099 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259103 (bvsdiv (bvmul lt!259099 lt!259103) lt!259099)))))

(assert (=> d!57373 (= lt!259103 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57373 (= lt!259099 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7882 lt!258861)))))))

(assert (=> d!57373 (= lt!259102 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7898 (_2!7882 lt!258861))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7893 (_2!7882 lt!258861)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57373 (invariant!0 (currentBit!7893 (_2!7882 lt!258861)) (currentByte!7898 (_2!7882 lt!258861)) (size!3764 (buf!4216 (_2!7882 lt!258861))))))

(assert (=> d!57373 (= (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258861))) (currentByte!7898 (_2!7882 lt!258861)) (currentBit!7893 (_2!7882 lt!258861))) lt!259102)))

(declare-fun b!165673 () Bool)

(declare-fun res!137997 () Bool)

(assert (=> b!165673 (=> (not res!137997) (not e!114660))))

(assert (=> b!165673 (= res!137997 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259102))))

(declare-fun b!165674 () Bool)

(declare-fun lt!259104 () (_ BitVec 64))

(assert (=> b!165674 (= e!114660 (bvsle lt!259102 (bvmul lt!259104 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165674 (or (= lt!259104 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259104 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259104)))))

(assert (=> b!165674 (= lt!259104 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7882 lt!258861)))))))

(assert (= (and d!57373 res!137998) b!165673))

(assert (= (and b!165673 res!137997) b!165674))

(declare-fun m!263255 () Bool)

(assert (=> d!57373 m!263255))

(declare-fun m!263257 () Bool)

(assert (=> d!57373 m!263257))

(assert (=> b!165557 d!57373))

(declare-fun d!57387 () Bool)

(declare-fun e!114665 () Bool)

(assert (=> d!57387 e!114665))

(declare-fun res!138004 () Bool)

(assert (=> d!57387 (=> (not res!138004) (not e!114665))))

(declare-fun lt!259109 () (_ BitVec 64))

(declare-fun lt!259108 () (_ BitVec 64))

(declare-fun lt!259110 () (_ BitVec 64))

(assert (=> d!57387 (= res!138004 (= lt!259110 (bvsub lt!259108 lt!259109)))))

(assert (=> d!57387 (or (= (bvand lt!259108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259109 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259108 lt!259109) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57387 (= lt!259109 (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 thiss!1577))) ((_ sign_extend 32) (currentByte!7898 thiss!1577)) ((_ sign_extend 32) (currentBit!7893 thiss!1577))))))

(declare-fun lt!259107 () (_ BitVec 64))

(declare-fun lt!259111 () (_ BitVec 64))

(assert (=> d!57387 (= lt!259108 (bvmul lt!259107 lt!259111))))

(assert (=> d!57387 (or (= lt!259107 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259111 (bvsdiv (bvmul lt!259107 lt!259111) lt!259107)))))

(assert (=> d!57387 (= lt!259111 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57387 (= lt!259107 ((_ sign_extend 32) (size!3764 (buf!4216 thiss!1577))))))

(assert (=> d!57387 (= lt!259110 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7898 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7893 thiss!1577))))))

(assert (=> d!57387 (invariant!0 (currentBit!7893 thiss!1577) (currentByte!7898 thiss!1577) (size!3764 (buf!4216 thiss!1577)))))

(assert (=> d!57387 (= (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)) lt!259110)))

(declare-fun b!165679 () Bool)

(declare-fun res!138003 () Bool)

(assert (=> b!165679 (=> (not res!138003) (not e!114665))))

(assert (=> b!165679 (= res!138003 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259110))))

(declare-fun b!165680 () Bool)

(declare-fun lt!259112 () (_ BitVec 64))

(assert (=> b!165680 (= e!114665 (bvsle lt!259110 (bvmul lt!259112 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165680 (or (= lt!259112 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259112 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259112)))))

(assert (=> b!165680 (= lt!259112 ((_ sign_extend 32) (size!3764 (buf!4216 thiss!1577))))))

(assert (= (and d!57387 res!138004) b!165679))

(assert (= (and b!165679 res!138003) b!165680))

(assert (=> d!57387 m!263137))

(declare-fun m!263265 () Bool)

(assert (=> d!57387 m!263265))

(assert (=> b!165557 d!57387))

(declare-fun d!57391 () Bool)

(assert (=> d!57391 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7893 thiss!1577) (currentByte!7898 thiss!1577) (size!3764 (buf!4216 thiss!1577))))))

(declare-fun bs!14256 () Bool)

(assert (= bs!14256 d!57391))

(assert (=> bs!14256 m!263265))

(assert (=> start!35382 d!57391))

(declare-fun d!57395 () Bool)

(declare-fun res!138015 () Bool)

(declare-fun e!114674 () Bool)

(assert (=> d!57395 (=> (not res!138015) (not e!114674))))

(assert (=> d!57395 (= res!138015 (= (size!3764 (buf!4216 thiss!1577)) (size!3764 (buf!4216 (_2!7882 lt!258861)))))))

(assert (=> d!57395 (= (isPrefixOf!0 thiss!1577 (_2!7882 lt!258861)) e!114674)))

(declare-fun b!165691 () Bool)

(declare-fun res!138017 () Bool)

(assert (=> b!165691 (=> (not res!138017) (not e!114674))))

(assert (=> b!165691 (= res!138017 (bvsle (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)) (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258861))) (currentByte!7898 (_2!7882 lt!258861)) (currentBit!7893 (_2!7882 lt!258861)))))))

(declare-fun b!165692 () Bool)

(declare-fun e!114675 () Bool)

(assert (=> b!165692 (= e!114674 e!114675)))

(declare-fun res!138016 () Bool)

(assert (=> b!165692 (=> res!138016 e!114675)))

(assert (=> b!165692 (= res!138016 (= (size!3764 (buf!4216 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!165693 () Bool)

(assert (=> b!165693 (= e!114675 (arrayBitRangesEq!0 (buf!4216 thiss!1577) (buf!4216 (_2!7882 lt!258861)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))))

(assert (= (and d!57395 res!138015) b!165691))

(assert (= (and b!165691 res!138017) b!165692))

(assert (= (and b!165692 (not res!138016)) b!165693))

(assert (=> b!165691 m!263087))

(assert (=> b!165691 m!263085))

(assert (=> b!165693 m!263087))

(assert (=> b!165693 m!263087))

(declare-fun m!263275 () Bool)

(assert (=> b!165693 m!263275))

(assert (=> b!165562 d!57395))

(declare-fun d!57401 () Bool)

(assert (=> d!57401 (= (array_inv!3505 (buf!4216 thiss!1577)) (bvsge (size!3764 (buf!4216 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165561 d!57401))

(check-sat (not d!57357) (not b!165611) (not d!57343) (not b!165649) (not d!57345) (not b!165594) (not d!57373) (not b!165648) (not b!165597) (not b!165693) (not d!57355) (not b!165691) (not b!165650) (not d!57337) (not d!57391) (not d!57387) (not b!165646))
(check-sat)
(get-model)

(declare-fun d!57415 () Bool)

(assert (=> d!57415 (= (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 thiss!1577))) ((_ sign_extend 32) (currentByte!7898 thiss!1577)) ((_ sign_extend 32) (currentBit!7893 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3764 (buf!4216 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7898 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7893 thiss!1577)))))))

(assert (=> d!57387 d!57415))

(declare-fun d!57417 () Bool)

(assert (=> d!57417 (= (invariant!0 (currentBit!7893 thiss!1577) (currentByte!7898 thiss!1577) (size!3764 (buf!4216 thiss!1577))) (and (bvsge (currentBit!7893 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7893 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7898 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7898 thiss!1577) (size!3764 (buf!4216 thiss!1577))) (and (= (currentBit!7893 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7898 thiss!1577) (size!3764 (buf!4216 thiss!1577)))))))))

(assert (=> d!57387 d!57417))

(declare-fun b!165744 () Bool)

(declare-fun e!114712 () Bool)

(declare-fun call!2777 () Bool)

(assert (=> b!165744 (= e!114712 call!2777)))

(declare-fun d!57419 () Bool)

(declare-fun res!138060 () Bool)

(declare-fun e!114715 () Bool)

(assert (=> d!57419 (=> res!138060 e!114715)))

(assert (=> d!57419 (= res!138060 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))))

(assert (=> d!57419 (= (arrayBitRangesEq!0 (buf!4216 thiss!1577) (buf!4216 (_2!7882 lt!258861)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) e!114715)))

(declare-fun b!165745 () Bool)

(declare-fun res!138062 () Bool)

(declare-fun lt!259222 () (_ BitVec 32))

(assert (=> b!165745 (= res!138062 (= lt!259222 #b00000000000000000000000000000000))))

(declare-fun e!114716 () Bool)

(assert (=> b!165745 (=> res!138062 e!114716)))

(declare-fun e!114717 () Bool)

(assert (=> b!165745 (= e!114717 e!114716)))

(declare-fun b!165746 () Bool)

(declare-fun e!114714 () Bool)

(assert (=> b!165746 (= e!114715 e!114714)))

(declare-fun res!138059 () Bool)

(assert (=> b!165746 (=> (not res!138059) (not e!114714))))

(declare-fun e!114713 () Bool)

(assert (=> b!165746 (= res!138059 e!114713)))

(declare-fun res!138058 () Bool)

(assert (=> b!165746 (=> res!138058 e!114713)))

(declare-datatypes ((tuple4!240 0))(
  ( (tuple4!241 (_1!7891 (_ BitVec 32)) (_2!7891 (_ BitVec 32)) (_3!591 (_ BitVec 32)) (_4!120 (_ BitVec 32))) )
))
(declare-fun lt!259223 () tuple4!240)

(assert (=> b!165746 (= res!138058 (bvsge (_1!7891 lt!259223) (_2!7891 lt!259223)))))

(assert (=> b!165746 (= lt!259222 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259224 () (_ BitVec 32))

(assert (=> b!165746 (= lt!259224 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!240)

(assert (=> b!165746 (= lt!259223 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))))

(declare-fun c!8597 () Bool)

(declare-fun bm!2774 () Bool)

(assert (=> bm!2774 (= call!2777 (byteRangesEq!0 (select (arr!4685 (buf!4216 thiss!1577)) (_3!591 lt!259223)) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_3!591 lt!259223)) lt!259224 (ite c!8597 lt!259222 #b00000000000000000000000000001000)))))

(declare-fun b!165747 () Bool)

(assert (=> b!165747 (= e!114712 e!114717)))

(declare-fun res!138061 () Bool)

(assert (=> b!165747 (= res!138061 call!2777)))

(assert (=> b!165747 (=> (not res!138061) (not e!114717))))

(declare-fun b!165748 () Bool)

(assert (=> b!165748 (= e!114713 (arrayRangesEq!644 (buf!4216 thiss!1577) (buf!4216 (_2!7882 lt!258861)) (_1!7891 lt!259223) (_2!7891 lt!259223)))))

(declare-fun b!165749 () Bool)

(assert (=> b!165749 (= e!114714 e!114712)))

(assert (=> b!165749 (= c!8597 (= (_3!591 lt!259223) (_4!120 lt!259223)))))

(declare-fun b!165750 () Bool)

(assert (=> b!165750 (= e!114716 (byteRangesEq!0 (select (arr!4685 (buf!4216 thiss!1577)) (_4!120 lt!259223)) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_4!120 lt!259223)) #b00000000000000000000000000000000 lt!259222))))

(assert (= (and d!57419 (not res!138060)) b!165746))

(assert (= (and b!165746 (not res!138058)) b!165748))

(assert (= (and b!165746 res!138059) b!165749))

(assert (= (and b!165749 c!8597) b!165744))

(assert (= (and b!165749 (not c!8597)) b!165747))

(assert (= (and b!165747 res!138061) b!165745))

(assert (= (and b!165745 (not res!138062)) b!165750))

(assert (= (or b!165744 b!165747) bm!2774))

(assert (=> b!165746 m!263087))

(declare-fun m!263323 () Bool)

(assert (=> b!165746 m!263323))

(declare-fun m!263325 () Bool)

(assert (=> bm!2774 m!263325))

(declare-fun m!263327 () Bool)

(assert (=> bm!2774 m!263327))

(assert (=> bm!2774 m!263325))

(assert (=> bm!2774 m!263327))

(declare-fun m!263329 () Bool)

(assert (=> bm!2774 m!263329))

(declare-fun m!263331 () Bool)

(assert (=> b!165748 m!263331))

(declare-fun m!263333 () Bool)

(assert (=> b!165750 m!263333))

(declare-fun m!263335 () Bool)

(assert (=> b!165750 m!263335))

(assert (=> b!165750 m!263333))

(assert (=> b!165750 m!263335))

(declare-fun m!263337 () Bool)

(assert (=> b!165750 m!263337))

(assert (=> b!165693 d!57419))

(assert (=> b!165693 d!57387))

(assert (=> d!57337 d!57415))

(assert (=> b!165646 d!57387))

(declare-fun d!57421 () Bool)

(assert (=> d!57421 (arrayBitRangesEq!0 (buf!4216 (_2!7882 lt!258861)) (buf!4216 thiss!1577) lt!259043 lt!259049)))

(declare-fun lt!259227 () Unit!11518)

(declare-fun choose!8 (array!8432 array!8432 (_ BitVec 64) (_ BitVec 64)) Unit!11518)

(assert (=> d!57421 (= lt!259227 (choose!8 (buf!4216 thiss!1577) (buf!4216 (_2!7882 lt!258861)) lt!259043 lt!259049))))

(assert (=> d!57421 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259043) (bvsle lt!259043 lt!259049))))

(assert (=> d!57421 (= (arrayBitRangesEqSymmetric!0 (buf!4216 thiss!1577) (buf!4216 (_2!7882 lt!258861)) lt!259043 lt!259049) lt!259227)))

(declare-fun bs!14260 () Bool)

(assert (= bs!14260 d!57421))

(assert (=> bs!14260 m!263209))

(declare-fun m!263339 () Bool)

(assert (=> bs!14260 m!263339))

(assert (=> b!165646 d!57421))

(declare-fun b!165751 () Bool)

(declare-fun e!114718 () Bool)

(declare-fun call!2778 () Bool)

(assert (=> b!165751 (= e!114718 call!2778)))

(declare-fun d!57423 () Bool)

(declare-fun res!138065 () Bool)

(declare-fun e!114721 () Bool)

(assert (=> d!57423 (=> res!138065 e!114721)))

(assert (=> d!57423 (= res!138065 (bvsge lt!259043 lt!259049))))

(assert (=> d!57423 (= (arrayBitRangesEq!0 (buf!4216 (_2!7882 lt!258861)) (buf!4216 thiss!1577) lt!259043 lt!259049) e!114721)))

(declare-fun b!165752 () Bool)

(declare-fun res!138067 () Bool)

(declare-fun lt!259228 () (_ BitVec 32))

(assert (=> b!165752 (= res!138067 (= lt!259228 #b00000000000000000000000000000000))))

(declare-fun e!114722 () Bool)

(assert (=> b!165752 (=> res!138067 e!114722)))

(declare-fun e!114723 () Bool)

(assert (=> b!165752 (= e!114723 e!114722)))

(declare-fun b!165753 () Bool)

(declare-fun e!114720 () Bool)

(assert (=> b!165753 (= e!114721 e!114720)))

(declare-fun res!138064 () Bool)

(assert (=> b!165753 (=> (not res!138064) (not e!114720))))

(declare-fun e!114719 () Bool)

(assert (=> b!165753 (= res!138064 e!114719)))

(declare-fun res!138063 () Bool)

(assert (=> b!165753 (=> res!138063 e!114719)))

(declare-fun lt!259229 () tuple4!240)

(assert (=> b!165753 (= res!138063 (bvsge (_1!7891 lt!259229) (_2!7891 lt!259229)))))

(assert (=> b!165753 (= lt!259228 ((_ extract 31 0) (bvsrem lt!259049 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259230 () (_ BitVec 32))

(assert (=> b!165753 (= lt!259230 ((_ extract 31 0) (bvsrem lt!259043 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165753 (= lt!259229 (arrayBitIndices!0 lt!259043 lt!259049))))

(declare-fun c!8598 () Bool)

(declare-fun bm!2775 () Bool)

(assert (=> bm!2775 (= call!2778 (byteRangesEq!0 (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_3!591 lt!259229)) (select (arr!4685 (buf!4216 thiss!1577)) (_3!591 lt!259229)) lt!259230 (ite c!8598 lt!259228 #b00000000000000000000000000001000)))))

(declare-fun b!165754 () Bool)

(assert (=> b!165754 (= e!114718 e!114723)))

(declare-fun res!138066 () Bool)

(assert (=> b!165754 (= res!138066 call!2778)))

(assert (=> b!165754 (=> (not res!138066) (not e!114723))))

(declare-fun b!165755 () Bool)

(assert (=> b!165755 (= e!114719 (arrayRangesEq!644 (buf!4216 (_2!7882 lt!258861)) (buf!4216 thiss!1577) (_1!7891 lt!259229) (_2!7891 lt!259229)))))

(declare-fun b!165756 () Bool)

(assert (=> b!165756 (= e!114720 e!114718)))

(assert (=> b!165756 (= c!8598 (= (_3!591 lt!259229) (_4!120 lt!259229)))))

(declare-fun b!165757 () Bool)

(assert (=> b!165757 (= e!114722 (byteRangesEq!0 (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_4!120 lt!259229)) (select (arr!4685 (buf!4216 thiss!1577)) (_4!120 lt!259229)) #b00000000000000000000000000000000 lt!259228))))

(assert (= (and d!57423 (not res!138065)) b!165753))

(assert (= (and b!165753 (not res!138063)) b!165755))

(assert (= (and b!165753 res!138064) b!165756))

(assert (= (and b!165756 c!8598) b!165751))

(assert (= (and b!165756 (not c!8598)) b!165754))

(assert (= (and b!165754 res!138066) b!165752))

(assert (= (and b!165752 (not res!138067)) b!165757))

(assert (= (or b!165751 b!165754) bm!2775))

(declare-fun m!263341 () Bool)

(assert (=> b!165753 m!263341))

(declare-fun m!263343 () Bool)

(assert (=> bm!2775 m!263343))

(declare-fun m!263345 () Bool)

(assert (=> bm!2775 m!263345))

(assert (=> bm!2775 m!263343))

(assert (=> bm!2775 m!263345))

(declare-fun m!263347 () Bool)

(assert (=> bm!2775 m!263347))

(declare-fun m!263349 () Bool)

(assert (=> b!165755 m!263349))

(declare-fun m!263351 () Bool)

(assert (=> b!165757 m!263351))

(declare-fun m!263353 () Bool)

(assert (=> b!165757 m!263353))

(assert (=> b!165757 m!263351))

(assert (=> b!165757 m!263353))

(declare-fun m!263355 () Bool)

(assert (=> b!165757 m!263355))

(assert (=> b!165646 d!57423))

(declare-fun d!57425 () Bool)

(declare-fun res!138068 () Bool)

(declare-fun e!114724 () Bool)

(assert (=> d!57425 (=> res!138068 e!114724)))

(assert (=> d!57425 (= res!138068 (= #b00000000000000000000000000000000 (currentByte!7898 thiss!1577)))))

(assert (=> d!57425 (= (arrayRangesEq!644 (buf!4216 thiss!1577) (array!8433 (store (arr!4685 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) lt!258867) (size!3764 (buf!4216 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7898 thiss!1577)) e!114724)))

(declare-fun b!165758 () Bool)

(declare-fun e!114725 () Bool)

(assert (=> b!165758 (= e!114724 e!114725)))

(declare-fun res!138069 () Bool)

(assert (=> b!165758 (=> (not res!138069) (not e!114725))))

(assert (=> b!165758 (= res!138069 (= (select (arr!4685 (buf!4216 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4685 (array!8433 (store (arr!4685 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) lt!258867) (size!3764 (buf!4216 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!165759 () Bool)

(assert (=> b!165759 (= e!114725 (arrayRangesEq!644 (buf!4216 thiss!1577) (array!8433 (store (arr!4685 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) lt!258867) (size!3764 (buf!4216 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7898 thiss!1577)))))

(assert (= (and d!57425 (not res!138068)) b!165758))

(assert (= (and b!165758 res!138069) b!165759))

(assert (=> b!165758 m!263143))

(declare-fun m!263357 () Bool)

(assert (=> b!165758 m!263357))

(declare-fun m!263359 () Bool)

(assert (=> b!165759 m!263359))

(assert (=> b!165597 d!57425))

(declare-fun d!57427 () Bool)

(assert (=> d!57427 (= (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7882 lt!258861)))) ((_ sign_extend 32) (currentByte!7898 (_2!7882 lt!258861))) ((_ sign_extend 32) (currentBit!7893 (_2!7882 lt!258861)))) (bvsub (bvmul ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7882 lt!258861)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7898 (_2!7882 lt!258861))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7893 (_2!7882 lt!258861))))))))

(assert (=> d!57373 d!57427))

(declare-fun d!57429 () Bool)

(assert (=> d!57429 (= (invariant!0 (currentBit!7893 (_2!7882 lt!258861)) (currentByte!7898 (_2!7882 lt!258861)) (size!3764 (buf!4216 (_2!7882 lt!258861)))) (and (bvsge (currentBit!7893 (_2!7882 lt!258861)) #b00000000000000000000000000000000) (bvslt (currentBit!7893 (_2!7882 lt!258861)) #b00000000000000000000000000001000) (bvsge (currentByte!7898 (_2!7882 lt!258861)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7898 (_2!7882 lt!258861)) (size!3764 (buf!4216 (_2!7882 lt!258861)))) (and (= (currentBit!7893 (_2!7882 lt!258861)) #b00000000000000000000000000000000) (= (currentByte!7898 (_2!7882 lt!258861)) (size!3764 (buf!4216 (_2!7882 lt!258861))))))))))

(assert (=> d!57373 d!57429))

(declare-fun d!57431 () Bool)

(declare-fun res!138070 () Bool)

(declare-fun e!114726 () Bool)

(assert (=> d!57431 (=> (not res!138070) (not e!114726))))

(assert (=> d!57431 (= res!138070 (= (size!3764 (buf!4216 (_2!7884 lt!259050))) (size!3764 (buf!4216 (_2!7882 lt!258861)))))))

(assert (=> d!57431 (= (isPrefixOf!0 (_2!7884 lt!259050) (_2!7882 lt!258861)) e!114726)))

(declare-fun b!165760 () Bool)

(declare-fun res!138072 () Bool)

(assert (=> b!165760 (=> (not res!138072) (not e!114726))))

(assert (=> b!165760 (= res!138072 (bvsle (bitIndex!0 (size!3764 (buf!4216 (_2!7884 lt!259050))) (currentByte!7898 (_2!7884 lt!259050)) (currentBit!7893 (_2!7884 lt!259050))) (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258861))) (currentByte!7898 (_2!7882 lt!258861)) (currentBit!7893 (_2!7882 lt!258861)))))))

(declare-fun b!165761 () Bool)

(declare-fun e!114727 () Bool)

(assert (=> b!165761 (= e!114726 e!114727)))

(declare-fun res!138071 () Bool)

(assert (=> b!165761 (=> res!138071 e!114727)))

(assert (=> b!165761 (= res!138071 (= (size!3764 (buf!4216 (_2!7884 lt!259050))) #b00000000000000000000000000000000))))

(declare-fun b!165762 () Bool)

(assert (=> b!165762 (= e!114727 (arrayBitRangesEq!0 (buf!4216 (_2!7884 lt!259050)) (buf!4216 (_2!7882 lt!258861)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_2!7884 lt!259050))) (currentByte!7898 (_2!7884 lt!259050)) (currentBit!7893 (_2!7884 lt!259050)))))))

(assert (= (and d!57431 res!138070) b!165760))

(assert (= (and b!165760 res!138072) b!165761))

(assert (= (and b!165761 (not res!138071)) b!165762))

(declare-fun m!263361 () Bool)

(assert (=> b!165760 m!263361))

(assert (=> b!165760 m!263085))

(assert (=> b!165762 m!263361))

(assert (=> b!165762 m!263361))

(declare-fun m!263363 () Bool)

(assert (=> b!165762 m!263363))

(assert (=> b!165648 d!57431))

(declare-fun d!57433 () Bool)

(declare-fun e!114728 () Bool)

(assert (=> d!57433 e!114728))

(declare-fun res!138074 () Bool)

(assert (=> d!57433 (=> (not res!138074) (not e!114728))))

(declare-fun lt!259233 () (_ BitVec 64))

(declare-fun lt!259234 () (_ BitVec 64))

(declare-fun lt!259232 () (_ BitVec 64))

(assert (=> d!57433 (= res!138074 (= lt!259234 (bvsub lt!259232 lt!259233)))))

(assert (=> d!57433 (or (= (bvand lt!259232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259233 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259232 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259232 lt!259233) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57433 (= lt!259233 (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7882 lt!258914)))) ((_ sign_extend 32) (currentByte!7898 (_2!7882 lt!258914))) ((_ sign_extend 32) (currentBit!7893 (_2!7882 lt!258914)))))))

(declare-fun lt!259231 () (_ BitVec 64))

(declare-fun lt!259235 () (_ BitVec 64))

(assert (=> d!57433 (= lt!259232 (bvmul lt!259231 lt!259235))))

(assert (=> d!57433 (or (= lt!259231 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259235 (bvsdiv (bvmul lt!259231 lt!259235) lt!259231)))))

(assert (=> d!57433 (= lt!259235 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57433 (= lt!259231 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7882 lt!258914)))))))

(assert (=> d!57433 (= lt!259234 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7898 (_2!7882 lt!258914))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7893 (_2!7882 lt!258914)))))))

(assert (=> d!57433 (invariant!0 (currentBit!7893 (_2!7882 lt!258914)) (currentByte!7898 (_2!7882 lt!258914)) (size!3764 (buf!4216 (_2!7882 lt!258914))))))

(assert (=> d!57433 (= (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258914))) (currentByte!7898 (_2!7882 lt!258914)) (currentBit!7893 (_2!7882 lt!258914))) lt!259234)))

(declare-fun b!165763 () Bool)

(declare-fun res!138073 () Bool)

(assert (=> b!165763 (=> (not res!138073) (not e!114728))))

(assert (=> b!165763 (= res!138073 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259234))))

(declare-fun b!165764 () Bool)

(declare-fun lt!259236 () (_ BitVec 64))

(assert (=> b!165764 (= e!114728 (bvsle lt!259234 (bvmul lt!259236 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165764 (or (= lt!259236 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259236 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259236)))))

(assert (=> b!165764 (= lt!259236 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7882 lt!258914)))))))

(assert (= (and d!57433 res!138074) b!165763))

(assert (= (and b!165763 res!138073) b!165764))

(declare-fun m!263365 () Bool)

(assert (=> d!57433 m!263365))

(declare-fun m!263367 () Bool)

(assert (=> d!57433 m!263367))

(assert (=> b!165611 d!57433))

(declare-fun d!57435 () Bool)

(declare-fun e!114729 () Bool)

(assert (=> d!57435 e!114729))

(declare-fun res!138076 () Bool)

(assert (=> d!57435 (=> (not res!138076) (not e!114729))))

(declare-fun lt!259240 () (_ BitVec 64))

(declare-fun lt!259239 () (_ BitVec 64))

(declare-fun lt!259238 () (_ BitVec 64))

(assert (=> d!57435 (= res!138076 (= lt!259240 (bvsub lt!259238 lt!259239)))))

(assert (=> d!57435 (or (= (bvand lt!259238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259239 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259238 lt!259239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57435 (= lt!259239 (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))) ((_ sign_extend 32) (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))) ((_ sign_extend 32) (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))))))

(declare-fun lt!259237 () (_ BitVec 64))

(declare-fun lt!259241 () (_ BitVec 64))

(assert (=> d!57435 (= lt!259238 (bvmul lt!259237 lt!259241))))

(assert (=> d!57435 (or (= lt!259237 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259241 (bvsdiv (bvmul lt!259237 lt!259241) lt!259237)))))

(assert (=> d!57435 (= lt!259241 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57435 (= lt!259237 ((_ sign_extend 32) (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))))))

(assert (=> d!57435 (= lt!259240 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))))))

(assert (=> d!57435 (invariant!0 (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))))))

(assert (=> d!57435 (= (bitIndex!0 (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))) (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))) lt!259240)))

(declare-fun b!165765 () Bool)

(declare-fun res!138075 () Bool)

(assert (=> b!165765 (=> (not res!138075) (not e!114729))))

(assert (=> b!165765 (= res!138075 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259240))))

(declare-fun b!165766 () Bool)

(declare-fun lt!259242 () (_ BitVec 64))

(assert (=> b!165766 (= e!114729 (bvsle lt!259240 (bvmul lt!259242 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165766 (or (= lt!259242 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259242 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259242)))))

(assert (=> b!165766 (= lt!259242 ((_ sign_extend 32) (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))))))

(assert (= (and d!57435 res!138076) b!165765))

(assert (= (and b!165765 res!138075) b!165766))

(declare-fun m!263369 () Bool)

(assert (=> d!57435 m!263369))

(declare-fun m!263371 () Bool)

(assert (=> d!57435 m!263371))

(assert (=> b!165611 d!57435))

(declare-fun d!57437 () Bool)

(assert (=> d!57437 (isPrefixOf!0 lt!259052 (_2!7882 lt!258861))))

(declare-fun lt!259245 () Unit!11518)

(declare-fun choose!30 (BitStream!6684 BitStream!6684 BitStream!6684) Unit!11518)

(assert (=> d!57437 (= lt!259245 (choose!30 lt!259052 (_2!7882 lt!258861) (_2!7882 lt!258861)))))

(assert (=> d!57437 (isPrefixOf!0 lt!259052 (_2!7882 lt!258861))))

(assert (=> d!57437 (= (lemmaIsPrefixTransitive!0 lt!259052 (_2!7882 lt!258861) (_2!7882 lt!258861)) lt!259245)))

(declare-fun bs!14261 () Bool)

(assert (= bs!14261 d!57437))

(assert (=> bs!14261 m!263221))

(declare-fun m!263373 () Bool)

(assert (=> bs!14261 m!263373))

(assert (=> bs!14261 m!263221))

(assert (=> d!57357 d!57437))

(declare-fun d!57439 () Bool)

(assert (=> d!57439 (isPrefixOf!0 (_2!7882 lt!258861) (_2!7882 lt!258861))))

(declare-fun lt!259248 () Unit!11518)

(declare-fun choose!11 (BitStream!6684) Unit!11518)

(assert (=> d!57439 (= lt!259248 (choose!11 (_2!7882 lt!258861)))))

(assert (=> d!57439 (= (lemmaIsPrefixRefl!0 (_2!7882 lt!258861)) lt!259248)))

(declare-fun bs!14263 () Bool)

(assert (= bs!14263 d!57439))

(assert (=> bs!14263 m!263225))

(declare-fun m!263375 () Bool)

(assert (=> bs!14263 m!263375))

(assert (=> d!57357 d!57439))

(declare-fun d!57441 () Bool)

(assert (=> d!57441 (isPrefixOf!0 thiss!1577 thiss!1577)))

(declare-fun lt!259249 () Unit!11518)

(assert (=> d!57441 (= lt!259249 (choose!11 thiss!1577))))

(assert (=> d!57441 (= (lemmaIsPrefixRefl!0 thiss!1577) lt!259249)))

(declare-fun bs!14264 () Bool)

(assert (= bs!14264 d!57441))

(assert (=> bs!14264 m!263231))

(declare-fun m!263377 () Bool)

(assert (=> bs!14264 m!263377))

(assert (=> d!57357 d!57441))

(declare-fun d!57443 () Bool)

(declare-fun res!138077 () Bool)

(declare-fun e!114730 () Bool)

(assert (=> d!57443 (=> (not res!138077) (not e!114730))))

(assert (=> d!57443 (= res!138077 (= (size!3764 (buf!4216 lt!259052)) (size!3764 (buf!4216 lt!259052))))))

(assert (=> d!57443 (= (isPrefixOf!0 lt!259052 lt!259052) e!114730)))

(declare-fun b!165767 () Bool)

(declare-fun res!138079 () Bool)

(assert (=> b!165767 (=> (not res!138079) (not e!114730))))

(assert (=> b!165767 (= res!138079 (bvsle (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052)) (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052))))))

(declare-fun b!165768 () Bool)

(declare-fun e!114731 () Bool)

(assert (=> b!165768 (= e!114730 e!114731)))

(declare-fun res!138078 () Bool)

(assert (=> b!165768 (=> res!138078 e!114731)))

(assert (=> b!165768 (= res!138078 (= (size!3764 (buf!4216 lt!259052)) #b00000000000000000000000000000000))))

(declare-fun b!165769 () Bool)

(assert (=> b!165769 (= e!114731 (arrayBitRangesEq!0 (buf!4216 lt!259052) (buf!4216 lt!259052) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052))))))

(assert (= (and d!57443 res!138077) b!165767))

(assert (= (and b!165767 res!138079) b!165768))

(assert (= (and b!165768 (not res!138078)) b!165769))

(declare-fun m!263379 () Bool)

(assert (=> b!165767 m!263379))

(assert (=> b!165767 m!263379))

(assert (=> b!165769 m!263379))

(assert (=> b!165769 m!263379))

(declare-fun m!263381 () Bool)

(assert (=> b!165769 m!263381))

(assert (=> d!57357 d!57443))

(assert (=> d!57357 d!57395))

(declare-fun d!57445 () Bool)

(declare-fun res!138080 () Bool)

(declare-fun e!114732 () Bool)

(assert (=> d!57445 (=> (not res!138080) (not e!114732))))

(assert (=> d!57445 (= res!138080 (= (size!3764 (buf!4216 thiss!1577)) (size!3764 (buf!4216 thiss!1577))))))

(assert (=> d!57445 (= (isPrefixOf!0 thiss!1577 thiss!1577) e!114732)))

(declare-fun b!165770 () Bool)

(declare-fun res!138082 () Bool)

(assert (=> b!165770 (=> (not res!138082) (not e!114732))))

(assert (=> b!165770 (= res!138082 (bvsle (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)) (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))))

(declare-fun b!165771 () Bool)

(declare-fun e!114733 () Bool)

(assert (=> b!165771 (= e!114732 e!114733)))

(declare-fun res!138081 () Bool)

(assert (=> b!165771 (=> res!138081 e!114733)))

(assert (=> b!165771 (= res!138081 (= (size!3764 (buf!4216 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!165772 () Bool)

(assert (=> b!165772 (= e!114733 (arrayBitRangesEq!0 (buf!4216 thiss!1577) (buf!4216 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))))

(assert (= (and d!57445 res!138080) b!165770))

(assert (= (and b!165770 res!138082) b!165771))

(assert (= (and b!165771 (not res!138081)) b!165772))

(assert (=> b!165770 m!263087))

(assert (=> b!165770 m!263087))

(assert (=> b!165772 m!263087))

(assert (=> b!165772 m!263087))

(declare-fun m!263383 () Bool)

(assert (=> b!165772 m!263383))

(assert (=> d!57357 d!57445))

(declare-fun d!57447 () Bool)

(declare-fun res!138083 () Bool)

(declare-fun e!114734 () Bool)

(assert (=> d!57447 (=> (not res!138083) (not e!114734))))

(assert (=> d!57447 (= res!138083 (= (size!3764 (buf!4216 lt!259052)) (size!3764 (buf!4216 (_2!7882 lt!258861)))))))

(assert (=> d!57447 (= (isPrefixOf!0 lt!259052 (_2!7882 lt!258861)) e!114734)))

(declare-fun b!165773 () Bool)

(declare-fun res!138085 () Bool)

(assert (=> b!165773 (=> (not res!138085) (not e!114734))))

(assert (=> b!165773 (= res!138085 (bvsle (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052)) (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258861))) (currentByte!7898 (_2!7882 lt!258861)) (currentBit!7893 (_2!7882 lt!258861)))))))

(declare-fun b!165774 () Bool)

(declare-fun e!114735 () Bool)

(assert (=> b!165774 (= e!114734 e!114735)))

(declare-fun res!138084 () Bool)

(assert (=> b!165774 (=> res!138084 e!114735)))

(assert (=> b!165774 (= res!138084 (= (size!3764 (buf!4216 lt!259052)) #b00000000000000000000000000000000))))

(declare-fun b!165775 () Bool)

(assert (=> b!165775 (= e!114735 (arrayBitRangesEq!0 (buf!4216 lt!259052) (buf!4216 (_2!7882 lt!258861)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052))))))

(assert (= (and d!57447 res!138083) b!165773))

(assert (= (and b!165773 res!138085) b!165774))

(assert (= (and b!165774 (not res!138084)) b!165775))

(assert (=> b!165773 m!263379))

(assert (=> b!165773 m!263085))

(assert (=> b!165775 m!263379))

(assert (=> b!165775 m!263379))

(declare-fun m!263385 () Bool)

(assert (=> b!165775 m!263385))

(assert (=> d!57357 d!57447))

(declare-fun d!57449 () Bool)

(assert (=> d!57449 (isPrefixOf!0 lt!259052 (_2!7882 lt!258861))))

(declare-fun lt!259250 () Unit!11518)

(assert (=> d!57449 (= lt!259250 (choose!30 lt!259052 thiss!1577 (_2!7882 lt!258861)))))

(assert (=> d!57449 (isPrefixOf!0 lt!259052 thiss!1577)))

(assert (=> d!57449 (= (lemmaIsPrefixTransitive!0 lt!259052 thiss!1577 (_2!7882 lt!258861)) lt!259250)))

(declare-fun bs!14265 () Bool)

(assert (= bs!14265 d!57449))

(assert (=> bs!14265 m!263221))

(declare-fun m!263387 () Bool)

(assert (=> bs!14265 m!263387))

(declare-fun m!263389 () Bool)

(assert (=> bs!14265 m!263389))

(assert (=> d!57357 d!57449))

(declare-fun d!57451 () Bool)

(declare-fun res!138086 () Bool)

(declare-fun e!114736 () Bool)

(assert (=> d!57451 (=> (not res!138086) (not e!114736))))

(assert (=> d!57451 (= res!138086 (= (size!3764 (buf!4216 (_2!7882 lt!258861))) (size!3764 (buf!4216 (_2!7882 lt!258861)))))))

(assert (=> d!57451 (= (isPrefixOf!0 (_2!7882 lt!258861) (_2!7882 lt!258861)) e!114736)))

(declare-fun b!165776 () Bool)

(declare-fun res!138088 () Bool)

(assert (=> b!165776 (=> (not res!138088) (not e!114736))))

(assert (=> b!165776 (= res!138088 (bvsle (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258861))) (currentByte!7898 (_2!7882 lt!258861)) (currentBit!7893 (_2!7882 lt!258861))) (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258861))) (currentByte!7898 (_2!7882 lt!258861)) (currentBit!7893 (_2!7882 lt!258861)))))))

(declare-fun b!165777 () Bool)

(declare-fun e!114737 () Bool)

(assert (=> b!165777 (= e!114736 e!114737)))

(declare-fun res!138087 () Bool)

(assert (=> b!165777 (=> res!138087 e!114737)))

(assert (=> b!165777 (= res!138087 (= (size!3764 (buf!4216 (_2!7882 lt!258861))) #b00000000000000000000000000000000))))

(declare-fun b!165778 () Bool)

(assert (=> b!165778 (= e!114737 (arrayBitRangesEq!0 (buf!4216 (_2!7882 lt!258861)) (buf!4216 (_2!7882 lt!258861)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258861))) (currentByte!7898 (_2!7882 lt!258861)) (currentBit!7893 (_2!7882 lt!258861)))))))

(assert (= (and d!57451 res!138086) b!165776))

(assert (= (and b!165776 res!138088) b!165777))

(assert (= (and b!165777 (not res!138087)) b!165778))

(assert (=> b!165776 m!263085))

(assert (=> b!165776 m!263085))

(assert (=> b!165778 m!263085))

(assert (=> b!165778 m!263085))

(declare-fun m!263391 () Bool)

(assert (=> b!165778 m!263391))

(assert (=> d!57357 d!57451))

(declare-fun d!57453 () Bool)

(assert (=> d!57453 (isPrefixOf!0 lt!259052 lt!259052)))

(declare-fun lt!259251 () Unit!11518)

(assert (=> d!57453 (= lt!259251 (choose!11 lt!259052))))

(assert (=> d!57453 (= (lemmaIsPrefixRefl!0 lt!259052) lt!259251)))

(declare-fun bs!14266 () Bool)

(assert (= bs!14266 d!57453))

(assert (=> bs!14266 m!263217))

(declare-fun m!263393 () Bool)

(assert (=> bs!14266 m!263393))

(assert (=> d!57357 d!57453))

(declare-fun d!57455 () Bool)

(declare-fun res!138089 () Bool)

(declare-fun e!114738 () Bool)

(assert (=> d!57455 (=> (not res!138089) (not e!114738))))

(assert (=> d!57455 (= res!138089 (= (size!3764 (buf!4216 (_1!7884 lt!259050))) (size!3764 (buf!4216 (_2!7884 lt!259050)))))))

(assert (=> d!57455 (= (isPrefixOf!0 (_1!7884 lt!259050) (_2!7884 lt!259050)) e!114738)))

(declare-fun b!165779 () Bool)

(declare-fun res!138091 () Bool)

(assert (=> b!165779 (=> (not res!138091) (not e!114738))))

(assert (=> b!165779 (= res!138091 (bvsle (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!259050))) (currentByte!7898 (_1!7884 lt!259050)) (currentBit!7893 (_1!7884 lt!259050))) (bitIndex!0 (size!3764 (buf!4216 (_2!7884 lt!259050))) (currentByte!7898 (_2!7884 lt!259050)) (currentBit!7893 (_2!7884 lt!259050)))))))

(declare-fun b!165780 () Bool)

(declare-fun e!114739 () Bool)

(assert (=> b!165780 (= e!114738 e!114739)))

(declare-fun res!138090 () Bool)

(assert (=> b!165780 (=> res!138090 e!114739)))

(assert (=> b!165780 (= res!138090 (= (size!3764 (buf!4216 (_1!7884 lt!259050))) #b00000000000000000000000000000000))))

(declare-fun b!165781 () Bool)

(assert (=> b!165781 (= e!114739 (arrayBitRangesEq!0 (buf!4216 (_1!7884 lt!259050)) (buf!4216 (_2!7884 lt!259050)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!259050))) (currentByte!7898 (_1!7884 lt!259050)) (currentBit!7893 (_1!7884 lt!259050)))))))

(assert (= (and d!57455 res!138089) b!165779))

(assert (= (and b!165779 res!138091) b!165780))

(assert (= (and b!165780 (not res!138090)) b!165781))

(declare-fun m!263395 () Bool)

(assert (=> b!165779 m!263395))

(assert (=> b!165779 m!263361))

(assert (=> b!165781 m!263395))

(assert (=> b!165781 m!263395))

(declare-fun m!263397 () Bool)

(assert (=> b!165781 m!263397))

(assert (=> d!57357 d!57455))

(declare-fun d!57457 () Bool)

(assert (=> d!57457 (arrayRangesEq!644 (buf!4216 thiss!1577) (array!8433 (store (arr!4685 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) lt!258867) (size!3764 (buf!4216 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7898 thiss!1577))))

(assert (=> d!57457 true))

(declare-fun _$8!177 () Unit!11518)

(assert (=> d!57457 (= (choose!223 (buf!4216 thiss!1577) (currentByte!7898 thiss!1577) lt!258867) _$8!177)))

(declare-fun bs!14267 () Bool)

(assert (= bs!14267 d!57457))

(assert (=> bs!14267 m!263095))

(assert (=> bs!14267 m!263151))

(assert (=> d!57343 d!57457))

(declare-fun d!57459 () Bool)

(declare-fun e!114745 () Bool)

(assert (=> d!57459 e!114745))

(declare-fun res!138094 () Bool)

(assert (=> d!57459 (=> (not res!138094) (not e!114745))))

(declare-fun lt!259269 () tuple2!14594)

(assert (=> d!57459 (= res!138094 (= (buf!4216 (_2!7888 lt!259269)) (buf!4216 (_1!7884 lt!258863))))))

(declare-datatypes ((tuple3!942 0))(
  ( (tuple3!943 (_1!7892 Unit!11518) (_2!7892 (_ BitVec 8)) (_3!592 BitStream!6684)) )
))
(declare-fun lt!259267 () tuple3!942)

(assert (=> d!57459 (= lt!259269 (tuple2!14595 (_2!7892 lt!259267) (_3!592 lt!259267)))))

(declare-fun e!114744 () tuple3!942)

(assert (=> d!57459 (= lt!259267 e!114744)))

(declare-fun c!8601 () Bool)

(declare-fun lt!259270 () (_ BitVec 32))

(assert (=> d!57459 (= c!8601 (bvsle lt!259270 #b00000000000000000000000000001000))))

(assert (=> d!57459 (= lt!259270 (bvadd (currentBit!7893 (_1!7884 lt!258863)) nBits!511))))

(assert (=> d!57459 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000))))

(assert (=> d!57459 (= (readPartialByte!0 (_1!7884 lt!258863) nBits!511) lt!259269)))

(declare-fun lt!259266 () tuple2!14582)

(declare-fun b!165788 () Bool)

(assert (=> b!165788 (= e!114744 (tuple3!943 (_1!7882 lt!259266) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4685 (buf!4216 (_1!7884 lt!258863))) (currentByte!7898 (_1!7884 lt!258863)))) (bvsub #b00000000000000000000000000001000 lt!259270)) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))) (_2!7882 lt!259266)))))

(assert (=> b!165788 (= lt!259266 (moveBitIndex!0 (_1!7884 lt!258863) ((_ sign_extend 32) nBits!511)))))

(declare-fun lt!259271 () (_ BitVec 32))

(declare-fun b!165789 () Bool)

(declare-fun Unit!11543 () Unit!11518)

(assert (=> b!165789 (= e!114744 (tuple3!943 Unit!11543 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4685 (buf!4216 (_1!7884 lt!258863))) (currentByte!7898 (_1!7884 lt!258863)))) lt!259271))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4685 (buf!4216 (_1!7884 lt!258863))) (bvadd (currentByte!7898 (_1!7884 lt!258863)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!259271))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))) (BitStream!6685 (buf!4216 (_1!7884 lt!258863)) (bvadd (currentByte!7898 (_1!7884 lt!258863)) #b00000000000000000000000000000001) lt!259271)))))

(assert (=> b!165789 (= lt!259271 (bvsub lt!259270 #b00000000000000000000000000001000))))

(declare-fun lt!259268 () (_ BitVec 64))

(declare-fun lt!259272 () (_ BitVec 64))

(declare-fun b!165790 () Bool)

(assert (=> b!165790 (= e!114745 (= (bitIndex!0 (size!3764 (buf!4216 (_2!7888 lt!259269))) (currentByte!7898 (_2!7888 lt!259269)) (currentBit!7893 (_2!7888 lt!259269))) (bvadd lt!259272 lt!259268)))))

(assert (=> b!165790 (or (not (= (bvand lt!259272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259268 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!259272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!259272 lt!259268) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!165790 (= lt!259268 ((_ sign_extend 32) nBits!511))))

(assert (=> b!165790 (= lt!259272 (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!258863))) (currentByte!7898 (_1!7884 lt!258863)) (currentBit!7893 (_1!7884 lt!258863))))))

(assert (= (and d!57459 c!8601) b!165788))

(assert (= (and d!57459 (not c!8601)) b!165789))

(assert (= (and d!57459 res!138094) b!165790))

(declare-fun m!263399 () Bool)

(assert (=> b!165788 m!263399))

(assert (=> b!165788 m!263079))

(declare-fun m!263401 () Bool)

(assert (=> b!165788 m!263401))

(assert (=> b!165789 m!263399))

(declare-fun m!263403 () Bool)

(assert (=> b!165789 m!263403))

(assert (=> b!165789 m!263079))

(declare-fun m!263405 () Bool)

(assert (=> b!165790 m!263405))

(declare-fun m!263407 () Bool)

(assert (=> b!165790 m!263407))

(assert (=> d!57355 d!57459))

(assert (=> b!165691 d!57387))

(assert (=> b!165691 d!57373))

(declare-fun d!57461 () Bool)

(declare-fun res!138095 () Bool)

(declare-fun e!114746 () Bool)

(assert (=> d!57461 (=> (not res!138095) (not e!114746))))

(assert (=> d!57461 (= res!138095 (= (size!3764 (buf!4216 (_1!7884 lt!259050))) (size!3764 (buf!4216 thiss!1577))))))

(assert (=> d!57461 (= (isPrefixOf!0 (_1!7884 lt!259050) thiss!1577) e!114746)))

(declare-fun b!165791 () Bool)

(declare-fun res!138097 () Bool)

(assert (=> b!165791 (=> (not res!138097) (not e!114746))))

(assert (=> b!165791 (= res!138097 (bvsle (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!259050))) (currentByte!7898 (_1!7884 lt!259050)) (currentBit!7893 (_1!7884 lt!259050))) (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))))

(declare-fun b!165792 () Bool)

(declare-fun e!114747 () Bool)

(assert (=> b!165792 (= e!114746 e!114747)))

(declare-fun res!138096 () Bool)

(assert (=> b!165792 (=> res!138096 e!114747)))

(assert (=> b!165792 (= res!138096 (= (size!3764 (buf!4216 (_1!7884 lt!259050))) #b00000000000000000000000000000000))))

(declare-fun b!165793 () Bool)

(assert (=> b!165793 (= e!114747 (arrayBitRangesEq!0 (buf!4216 (_1!7884 lt!259050)) (buf!4216 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!259050))) (currentByte!7898 (_1!7884 lt!259050)) (currentBit!7893 (_1!7884 lt!259050)))))))

(assert (= (and d!57461 res!138095) b!165791))

(assert (= (and b!165791 res!138097) b!165792))

(assert (= (and b!165792 (not res!138096)) b!165793))

(assert (=> b!165791 m!263395))

(assert (=> b!165791 m!263087))

(assert (=> b!165793 m!263395))

(assert (=> b!165793 m!263395))

(declare-fun m!263409 () Bool)

(assert (=> b!165793 m!263409))

(assert (=> b!165650 d!57461))

(declare-fun d!57463 () Bool)

(declare-fun res!138100 () Bool)

(declare-fun e!114750 () Bool)

(assert (=> d!57463 (=> (not res!138100) (not e!114750))))

(assert (=> d!57463 (= res!138100 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))))) ((_ sign_extend 32) nBits!511)) (bvsle ((_ sign_extend 32) nBits!511) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))))))))))

(assert (=> d!57463 (= (moveBitIndexPrecond!0 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)) ((_ sign_extend 32) nBits!511)) e!114750)))

(declare-fun lt!259275 () (_ BitVec 64))

(declare-fun b!165797 () Bool)

(assert (=> b!165797 (= e!114750 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259275) (bvsle lt!259275 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))))))))))

(assert (=> b!165797 (= lt!259275 (bvadd (bitIndex!0 (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))) (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))) ((_ sign_extend 32) nBits!511)))))

(assert (= (and d!57463 res!138100) b!165797))

(assert (=> b!165797 m!263161))

(assert (=> d!57345 d!57463))

(declare-fun d!57465 () Bool)

(declare-fun res!138101 () Bool)

(declare-fun e!114751 () Bool)

(assert (=> d!57465 (=> res!138101 e!114751)))

(assert (=> d!57465 (= res!138101 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7898 thiss!1577)))))

(assert (=> d!57465 (= (arrayRangesEq!644 (buf!4216 thiss!1577) lt!258864 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7898 thiss!1577)) e!114751)))

(declare-fun b!165798 () Bool)

(declare-fun e!114752 () Bool)

(assert (=> b!165798 (= e!114751 e!114752)))

(declare-fun res!138102 () Bool)

(assert (=> b!165798 (=> (not res!138102) (not e!114752))))

(assert (=> b!165798 (= res!138102 (= (select (arr!4685 (buf!4216 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4685 lt!258864) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!165799 () Bool)

(assert (=> b!165799 (= e!114752 (arrayRangesEq!644 (buf!4216 thiss!1577) lt!258864 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7898 thiss!1577)))))

(assert (= (and d!57465 (not res!138101)) b!165798))

(assert (= (and b!165798 res!138102) b!165799))

(declare-fun m!263411 () Bool)

(assert (=> b!165798 m!263411))

(declare-fun m!263413 () Bool)

(assert (=> b!165798 m!263413))

(declare-fun m!263415 () Bool)

(assert (=> b!165799 m!263415))

(assert (=> b!165594 d!57465))

(assert (=> d!57391 d!57417))

(declare-fun d!57467 () Bool)

(declare-fun e!114755 () Bool)

(assert (=> d!57467 e!114755))

(declare-fun res!138105 () Bool)

(assert (=> d!57467 (=> (not res!138105) (not e!114755))))

(declare-fun lt!259281 () (_ BitVec 64))

(declare-fun lt!259280 () BitStream!6684)

(assert (=> d!57467 (= res!138105 (= (bvadd lt!259281 (bvsub lt!259056 lt!259060)) (bitIndex!0 (size!3764 (buf!4216 lt!259280)) (currentByte!7898 lt!259280) (currentBit!7893 lt!259280))))))

(assert (=> d!57467 (or (not (= (bvand lt!259281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259056 lt!259060) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!259281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!259281 (bvsub lt!259056 lt!259060)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57467 (= lt!259281 (bitIndex!0 (size!3764 (buf!4216 (_2!7884 lt!259050))) (currentByte!7898 (_2!7884 lt!259050)) (currentBit!7893 (_2!7884 lt!259050))))))

(assert (=> d!57467 (= lt!259280 (_2!7882 (moveBitIndex!0 (_2!7884 lt!259050) (bvsub lt!259056 lt!259060))))))

(assert (=> d!57467 (moveBitIndexPrecond!0 (_2!7884 lt!259050) (bvsub lt!259056 lt!259060))))

(assert (=> d!57467 (= (withMovedBitIndex!0 (_2!7884 lt!259050) (bvsub lt!259056 lt!259060)) lt!259280)))

(declare-fun b!165802 () Bool)

(assert (=> b!165802 (= e!114755 (= (size!3764 (buf!4216 (_2!7884 lt!259050))) (size!3764 (buf!4216 lt!259280))))))

(assert (= (and d!57467 res!138105) b!165802))

(declare-fun m!263417 () Bool)

(assert (=> d!57467 m!263417))

(assert (=> d!57467 m!263361))

(declare-fun m!263419 () Bool)

(assert (=> d!57467 m!263419))

(declare-fun m!263421 () Bool)

(assert (=> d!57467 m!263421))

(assert (=> b!165649 d!57467))

(assert (=> b!165649 d!57373))

(assert (=> b!165649 d!57387))

(check-sat (not d!57439) (not b!165779) (not b!165775) (not bm!2775) (not b!165762) (not b!165788) (not b!165769) (not b!165753) (not b!165799) (not b!165760) (not b!165793) (not bm!2774) (not b!165778) (not b!165748) (not d!57437) (not b!165773) (not b!165791) (not d!57433) (not d!57467) (not d!57449) (not b!165746) (not b!165767) (not b!165781) (not d!57453) (not b!165776) (not b!165797) (not b!165755) (not b!165770) (not d!57441) (not b!165772) (not b!165759) (not d!57435) (not b!165750) (not b!165757) (not d!57457) (not b!165790) (not d!57421))
(check-sat)
(get-model)

(assert (=> d!57439 d!57451))

(declare-fun d!57651 () Bool)

(assert (=> d!57651 (isPrefixOf!0 (_2!7882 lt!258861) (_2!7882 lt!258861))))

(assert (=> d!57651 true))

(declare-fun _$14!297 () Unit!11518)

(assert (=> d!57651 (= (choose!11 (_2!7882 lt!258861)) _$14!297)))

(declare-fun bs!14296 () Bool)

(assert (= bs!14296 d!57651))

(assert (=> bs!14296 m!263225))

(assert (=> d!57439 d!57651))

(declare-fun d!57653 () Bool)

(assert (=> d!57653 (= (byteRangesEq!0 (select (arr!4685 (buf!4216 thiss!1577)) (_4!120 lt!259223)) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_4!120 lt!259223)) #b00000000000000000000000000000000 lt!259222) (or (= #b00000000000000000000000000000000 lt!259222) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4685 (buf!4216 thiss!1577)) (_4!120 lt!259223))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!259222))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_4!120 lt!259223))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!259222))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14297 () Bool)

(assert (= bs!14297 d!57653))

(declare-fun m!263783 () Bool)

(assert (=> bs!14297 m!263783))

(assert (=> bs!14297 m!263141))

(assert (=> b!165750 d!57653))

(declare-fun d!57655 () Bool)

(declare-fun lt!259489 () (_ BitVec 32))

(assert (=> d!57655 (= lt!259489 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259485 () (_ BitVec 32))

(assert (=> d!57655 (= lt!259485 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!114931 () Bool)

(assert (=> d!57655 e!114931))

(declare-fun res!138285 () Bool)

(assert (=> d!57655 (=> (not res!138285) (not e!114931))))

(assert (=> d!57655 (= res!138285 (moveBitIndexPrecond!0 (_1!7884 lt!258863) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11558 () Unit!11518)

(declare-fun Unit!11559 () Unit!11518)

(declare-fun Unit!11560 () Unit!11518)

(assert (=> d!57655 (= (moveBitIndex!0 (_1!7884 lt!258863) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7893 (_1!7884 lt!258863)) lt!259489) #b00000000000000000000000000000000) (tuple2!14583 Unit!11558 (BitStream!6685 (buf!4216 (_1!7884 lt!258863)) (bvsub (bvadd (currentByte!7898 (_1!7884 lt!258863)) lt!259485) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259489 (currentBit!7893 (_1!7884 lt!258863))))) (ite (bvsge (bvadd (currentBit!7893 (_1!7884 lt!258863)) lt!259489) #b00000000000000000000000000001000) (tuple2!14583 Unit!11559 (BitStream!6685 (buf!4216 (_1!7884 lt!258863)) (bvadd (currentByte!7898 (_1!7884 lt!258863)) lt!259485 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7893 (_1!7884 lt!258863)) lt!259489) #b00000000000000000000000000001000))) (tuple2!14583 Unit!11560 (BitStream!6685 (buf!4216 (_1!7884 lt!258863)) (bvadd (currentByte!7898 (_1!7884 lt!258863)) lt!259485) (bvadd (currentBit!7893 (_1!7884 lt!258863)) lt!259489))))))))

(declare-fun b!166026 () Bool)

(declare-fun e!114932 () Bool)

(assert (=> b!166026 (= e!114931 e!114932)))

(declare-fun res!138286 () Bool)

(assert (=> b!166026 (=> (not res!138286) (not e!114932))))

(declare-fun lt!259488 () tuple2!14582)

(declare-fun lt!259486 () (_ BitVec 64))

(assert (=> b!166026 (= res!138286 (= (bvadd lt!259486 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!259488))) (currentByte!7898 (_2!7882 lt!259488)) (currentBit!7893 (_2!7882 lt!259488)))))))

(assert (=> b!166026 (or (not (= (bvand lt!259486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!259486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!259486 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!166026 (= lt!259486 (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!258863))) (currentByte!7898 (_1!7884 lt!258863)) (currentBit!7893 (_1!7884 lt!258863))))))

(declare-fun lt!259487 () (_ BitVec 32))

(declare-fun lt!259484 () (_ BitVec 32))

(declare-fun Unit!11561 () Unit!11518)

(declare-fun Unit!11562 () Unit!11518)

(declare-fun Unit!11563 () Unit!11518)

(assert (=> b!166026 (= lt!259488 (ite (bvslt (bvadd (currentBit!7893 (_1!7884 lt!258863)) lt!259484) #b00000000000000000000000000000000) (tuple2!14583 Unit!11561 (BitStream!6685 (buf!4216 (_1!7884 lt!258863)) (bvsub (bvadd (currentByte!7898 (_1!7884 lt!258863)) lt!259487) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259484 (currentBit!7893 (_1!7884 lt!258863))))) (ite (bvsge (bvadd (currentBit!7893 (_1!7884 lt!258863)) lt!259484) #b00000000000000000000000000001000) (tuple2!14583 Unit!11562 (BitStream!6685 (buf!4216 (_1!7884 lt!258863)) (bvadd (currentByte!7898 (_1!7884 lt!258863)) lt!259487 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7893 (_1!7884 lt!258863)) lt!259484) #b00000000000000000000000000001000))) (tuple2!14583 Unit!11563 (BitStream!6685 (buf!4216 (_1!7884 lt!258863)) (bvadd (currentByte!7898 (_1!7884 lt!258863)) lt!259487) (bvadd (currentBit!7893 (_1!7884 lt!258863)) lt!259484))))))))

(assert (=> b!166026 (= lt!259484 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166026 (= lt!259487 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!166027 () Bool)

(assert (=> b!166027 (= e!114932 (and (= (size!3764 (buf!4216 (_1!7884 lt!258863))) (size!3764 (buf!4216 (_2!7882 lt!259488)))) (= (buf!4216 (_1!7884 lt!258863)) (buf!4216 (_2!7882 lt!259488)))))))

(assert (= (and d!57655 res!138285) b!166026))

(assert (= (and b!166026 res!138286) b!166027))

(declare-fun m!263785 () Bool)

(assert (=> d!57655 m!263785))

(declare-fun m!263787 () Bool)

(assert (=> b!166026 m!263787))

(assert (=> b!166026 m!263407))

(assert (=> b!165788 d!57655))

(declare-fun b!166028 () Bool)

(declare-fun e!114933 () Bool)

(declare-fun call!2794 () Bool)

(assert (=> b!166028 (= e!114933 call!2794)))

(declare-fun d!57657 () Bool)

(declare-fun res!138289 () Bool)

(declare-fun e!114936 () Bool)

(assert (=> d!57657 (=> res!138289 e!114936)))

(assert (=> d!57657 (= res!138289 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!259050))) (currentByte!7898 (_1!7884 lt!259050)) (currentBit!7893 (_1!7884 lt!259050)))))))

(assert (=> d!57657 (= (arrayBitRangesEq!0 (buf!4216 (_1!7884 lt!259050)) (buf!4216 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!259050))) (currentByte!7898 (_1!7884 lt!259050)) (currentBit!7893 (_1!7884 lt!259050)))) e!114936)))

(declare-fun b!166029 () Bool)

(declare-fun res!138291 () Bool)

(declare-fun lt!259490 () (_ BitVec 32))

(assert (=> b!166029 (= res!138291 (= lt!259490 #b00000000000000000000000000000000))))

(declare-fun e!114937 () Bool)

(assert (=> b!166029 (=> res!138291 e!114937)))

(declare-fun e!114938 () Bool)

(assert (=> b!166029 (= e!114938 e!114937)))

(declare-fun b!166030 () Bool)

(declare-fun e!114935 () Bool)

(assert (=> b!166030 (= e!114936 e!114935)))

(declare-fun res!138288 () Bool)

(assert (=> b!166030 (=> (not res!138288) (not e!114935))))

(declare-fun e!114934 () Bool)

(assert (=> b!166030 (= res!138288 e!114934)))

(declare-fun res!138287 () Bool)

(assert (=> b!166030 (=> res!138287 e!114934)))

(declare-fun lt!259491 () tuple4!240)

(assert (=> b!166030 (= res!138287 (bvsge (_1!7891 lt!259491) (_2!7891 lt!259491)))))

(assert (=> b!166030 (= lt!259490 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!259050))) (currentByte!7898 (_1!7884 lt!259050)) (currentBit!7893 (_1!7884 lt!259050))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259492 () (_ BitVec 32))

(assert (=> b!166030 (= lt!259492 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166030 (= lt!259491 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!259050))) (currentByte!7898 (_1!7884 lt!259050)) (currentBit!7893 (_1!7884 lt!259050)))))))

(declare-fun c!8623 () Bool)

(declare-fun bm!2791 () Bool)

(assert (=> bm!2791 (= call!2794 (byteRangesEq!0 (select (arr!4685 (buf!4216 (_1!7884 lt!259050))) (_3!591 lt!259491)) (select (arr!4685 (buf!4216 thiss!1577)) (_3!591 lt!259491)) lt!259492 (ite c!8623 lt!259490 #b00000000000000000000000000001000)))))

(declare-fun b!166031 () Bool)

(assert (=> b!166031 (= e!114933 e!114938)))

(declare-fun res!138290 () Bool)

(assert (=> b!166031 (= res!138290 call!2794)))

(assert (=> b!166031 (=> (not res!138290) (not e!114938))))

(declare-fun b!166032 () Bool)

(assert (=> b!166032 (= e!114934 (arrayRangesEq!644 (buf!4216 (_1!7884 lt!259050)) (buf!4216 thiss!1577) (_1!7891 lt!259491) (_2!7891 lt!259491)))))

(declare-fun b!166033 () Bool)

(assert (=> b!166033 (= e!114935 e!114933)))

(assert (=> b!166033 (= c!8623 (= (_3!591 lt!259491) (_4!120 lt!259491)))))

(declare-fun b!166034 () Bool)

(assert (=> b!166034 (= e!114937 (byteRangesEq!0 (select (arr!4685 (buf!4216 (_1!7884 lt!259050))) (_4!120 lt!259491)) (select (arr!4685 (buf!4216 thiss!1577)) (_4!120 lt!259491)) #b00000000000000000000000000000000 lt!259490))))

(assert (= (and d!57657 (not res!138289)) b!166030))

(assert (= (and b!166030 (not res!138287)) b!166032))

(assert (= (and b!166030 res!138288) b!166033))

(assert (= (and b!166033 c!8623) b!166028))

(assert (= (and b!166033 (not c!8623)) b!166031))

(assert (= (and b!166031 res!138290) b!166029))

(assert (= (and b!166029 (not res!138291)) b!166034))

(assert (= (or b!166028 b!166031) bm!2791))

(assert (=> b!166030 m!263395))

(declare-fun m!263789 () Bool)

(assert (=> b!166030 m!263789))

(declare-fun m!263791 () Bool)

(assert (=> bm!2791 m!263791))

(declare-fun m!263793 () Bool)

(assert (=> bm!2791 m!263793))

(assert (=> bm!2791 m!263791))

(assert (=> bm!2791 m!263793))

(declare-fun m!263795 () Bool)

(assert (=> bm!2791 m!263795))

(declare-fun m!263797 () Bool)

(assert (=> b!166032 m!263797))

(declare-fun m!263799 () Bool)

(assert (=> b!166034 m!263799))

(declare-fun m!263801 () Bool)

(assert (=> b!166034 m!263801))

(assert (=> b!166034 m!263799))

(assert (=> b!166034 m!263801))

(declare-fun m!263803 () Bool)

(assert (=> b!166034 m!263803))

(assert (=> b!165793 d!57657))

(declare-fun d!57659 () Bool)

(declare-fun e!114939 () Bool)

(assert (=> d!57659 e!114939))

(declare-fun res!138293 () Bool)

(assert (=> d!57659 (=> (not res!138293) (not e!114939))))

(declare-fun lt!259495 () (_ BitVec 64))

(declare-fun lt!259494 () (_ BitVec 64))

(declare-fun lt!259496 () (_ BitVec 64))

(assert (=> d!57659 (= res!138293 (= lt!259496 (bvsub lt!259494 lt!259495)))))

(assert (=> d!57659 (or (= (bvand lt!259494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259495 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259494 lt!259495) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57659 (= lt!259495 (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 (_1!7884 lt!259050)))) ((_ sign_extend 32) (currentByte!7898 (_1!7884 lt!259050))) ((_ sign_extend 32) (currentBit!7893 (_1!7884 lt!259050)))))))

(declare-fun lt!259493 () (_ BitVec 64))

(declare-fun lt!259497 () (_ BitVec 64))

(assert (=> d!57659 (= lt!259494 (bvmul lt!259493 lt!259497))))

(assert (=> d!57659 (or (= lt!259493 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259497 (bvsdiv (bvmul lt!259493 lt!259497) lt!259493)))))

(assert (=> d!57659 (= lt!259497 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57659 (= lt!259493 ((_ sign_extend 32) (size!3764 (buf!4216 (_1!7884 lt!259050)))))))

(assert (=> d!57659 (= lt!259496 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7898 (_1!7884 lt!259050))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7893 (_1!7884 lt!259050)))))))

(assert (=> d!57659 (invariant!0 (currentBit!7893 (_1!7884 lt!259050)) (currentByte!7898 (_1!7884 lt!259050)) (size!3764 (buf!4216 (_1!7884 lt!259050))))))

(assert (=> d!57659 (= (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!259050))) (currentByte!7898 (_1!7884 lt!259050)) (currentBit!7893 (_1!7884 lt!259050))) lt!259496)))

(declare-fun b!166035 () Bool)

(declare-fun res!138292 () Bool)

(assert (=> b!166035 (=> (not res!138292) (not e!114939))))

(assert (=> b!166035 (= res!138292 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259496))))

(declare-fun b!166036 () Bool)

(declare-fun lt!259498 () (_ BitVec 64))

(assert (=> b!166036 (= e!114939 (bvsle lt!259496 (bvmul lt!259498 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166036 (or (= lt!259498 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259498 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259498)))))

(assert (=> b!166036 (= lt!259498 ((_ sign_extend 32) (size!3764 (buf!4216 (_1!7884 lt!259050)))))))

(assert (= (and d!57659 res!138293) b!166035))

(assert (= (and b!166035 res!138292) b!166036))

(declare-fun m!263805 () Bool)

(assert (=> d!57659 m!263805))

(declare-fun m!263807 () Bool)

(assert (=> d!57659 m!263807))

(assert (=> b!165793 d!57659))

(assert (=> b!165791 d!57659))

(assert (=> b!165791 d!57387))

(assert (=> b!165797 d!57435))

(assert (=> b!165779 d!57659))

(declare-fun d!57661 () Bool)

(declare-fun e!114940 () Bool)

(assert (=> d!57661 e!114940))

(declare-fun res!138295 () Bool)

(assert (=> d!57661 (=> (not res!138295) (not e!114940))))

(declare-fun lt!259501 () (_ BitVec 64))

(declare-fun lt!259502 () (_ BitVec 64))

(declare-fun lt!259500 () (_ BitVec 64))

(assert (=> d!57661 (= res!138295 (= lt!259502 (bvsub lt!259500 lt!259501)))))

(assert (=> d!57661 (or (= (bvand lt!259500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259501 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259500 lt!259501) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57661 (= lt!259501 (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7884 lt!259050)))) ((_ sign_extend 32) (currentByte!7898 (_2!7884 lt!259050))) ((_ sign_extend 32) (currentBit!7893 (_2!7884 lt!259050)))))))

(declare-fun lt!259499 () (_ BitVec 64))

(declare-fun lt!259503 () (_ BitVec 64))

(assert (=> d!57661 (= lt!259500 (bvmul lt!259499 lt!259503))))

(assert (=> d!57661 (or (= lt!259499 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259503 (bvsdiv (bvmul lt!259499 lt!259503) lt!259499)))))

(assert (=> d!57661 (= lt!259503 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57661 (= lt!259499 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7884 lt!259050)))))))

(assert (=> d!57661 (= lt!259502 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7898 (_2!7884 lt!259050))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7893 (_2!7884 lt!259050)))))))

(assert (=> d!57661 (invariant!0 (currentBit!7893 (_2!7884 lt!259050)) (currentByte!7898 (_2!7884 lt!259050)) (size!3764 (buf!4216 (_2!7884 lt!259050))))))

(assert (=> d!57661 (= (bitIndex!0 (size!3764 (buf!4216 (_2!7884 lt!259050))) (currentByte!7898 (_2!7884 lt!259050)) (currentBit!7893 (_2!7884 lt!259050))) lt!259502)))

(declare-fun b!166037 () Bool)

(declare-fun res!138294 () Bool)

(assert (=> b!166037 (=> (not res!138294) (not e!114940))))

(assert (=> b!166037 (= res!138294 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259502))))

(declare-fun b!166038 () Bool)

(declare-fun lt!259504 () (_ BitVec 64))

(assert (=> b!166038 (= e!114940 (bvsle lt!259502 (bvmul lt!259504 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166038 (or (= lt!259504 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259504 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259504)))))

(assert (=> b!166038 (= lt!259504 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7884 lt!259050)))))))

(assert (= (and d!57661 res!138295) b!166037))

(assert (= (and b!166037 res!138294) b!166038))

(declare-fun m!263809 () Bool)

(assert (=> d!57661 m!263809))

(declare-fun m!263811 () Bool)

(assert (=> d!57661 m!263811))

(assert (=> b!165779 d!57661))

(declare-fun d!57663 () Bool)

(declare-fun e!114941 () Bool)

(assert (=> d!57663 e!114941))

(declare-fun res!138297 () Bool)

(assert (=> d!57663 (=> (not res!138297) (not e!114941))))

(declare-fun lt!259507 () (_ BitVec 64))

(declare-fun lt!259508 () (_ BitVec 64))

(declare-fun lt!259506 () (_ BitVec 64))

(assert (=> d!57663 (= res!138297 (= lt!259508 (bvsub lt!259506 lt!259507)))))

(assert (=> d!57663 (or (= (bvand lt!259506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259507 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259506 lt!259507) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57663 (= lt!259507 (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 lt!259052))) ((_ sign_extend 32) (currentByte!7898 lt!259052)) ((_ sign_extend 32) (currentBit!7893 lt!259052))))))

(declare-fun lt!259505 () (_ BitVec 64))

(declare-fun lt!259509 () (_ BitVec 64))

(assert (=> d!57663 (= lt!259506 (bvmul lt!259505 lt!259509))))

(assert (=> d!57663 (or (= lt!259505 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259509 (bvsdiv (bvmul lt!259505 lt!259509) lt!259505)))))

(assert (=> d!57663 (= lt!259509 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57663 (= lt!259505 ((_ sign_extend 32) (size!3764 (buf!4216 lt!259052))))))

(assert (=> d!57663 (= lt!259508 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7898 lt!259052)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7893 lt!259052))))))

(assert (=> d!57663 (invariant!0 (currentBit!7893 lt!259052) (currentByte!7898 lt!259052) (size!3764 (buf!4216 lt!259052)))))

(assert (=> d!57663 (= (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052)) lt!259508)))

(declare-fun b!166039 () Bool)

(declare-fun res!138296 () Bool)

(assert (=> b!166039 (=> (not res!138296) (not e!114941))))

(assert (=> b!166039 (= res!138296 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259508))))

(declare-fun b!166040 () Bool)

(declare-fun lt!259510 () (_ BitVec 64))

(assert (=> b!166040 (= e!114941 (bvsle lt!259508 (bvmul lt!259510 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166040 (or (= lt!259510 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259510 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259510)))))

(assert (=> b!166040 (= lt!259510 ((_ sign_extend 32) (size!3764 (buf!4216 lt!259052))))))

(assert (= (and d!57663 res!138297) b!166039))

(assert (= (and b!166039 res!138296) b!166040))

(declare-fun m!263813 () Bool)

(assert (=> d!57663 m!263813))

(declare-fun m!263815 () Bool)

(assert (=> d!57663 m!263815))

(assert (=> b!165767 d!57663))

(assert (=> b!165776 d!57373))

(declare-fun b!166041 () Bool)

(declare-fun e!114942 () Bool)

(declare-fun call!2795 () Bool)

(assert (=> b!166041 (= e!114942 call!2795)))

(declare-fun d!57665 () Bool)

(declare-fun res!138300 () Bool)

(declare-fun e!114945 () Bool)

(assert (=> d!57665 (=> res!138300 e!114945)))

(assert (=> d!57665 (= res!138300 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!259050))) (currentByte!7898 (_1!7884 lt!259050)) (currentBit!7893 (_1!7884 lt!259050)))))))

(assert (=> d!57665 (= (arrayBitRangesEq!0 (buf!4216 (_1!7884 lt!259050)) (buf!4216 (_2!7884 lt!259050)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!259050))) (currentByte!7898 (_1!7884 lt!259050)) (currentBit!7893 (_1!7884 lt!259050)))) e!114945)))

(declare-fun b!166042 () Bool)

(declare-fun res!138302 () Bool)

(declare-fun lt!259511 () (_ BitVec 32))

(assert (=> b!166042 (= res!138302 (= lt!259511 #b00000000000000000000000000000000))))

(declare-fun e!114946 () Bool)

(assert (=> b!166042 (=> res!138302 e!114946)))

(declare-fun e!114947 () Bool)

(assert (=> b!166042 (= e!114947 e!114946)))

(declare-fun b!166043 () Bool)

(declare-fun e!114944 () Bool)

(assert (=> b!166043 (= e!114945 e!114944)))

(declare-fun res!138299 () Bool)

(assert (=> b!166043 (=> (not res!138299) (not e!114944))))

(declare-fun e!114943 () Bool)

(assert (=> b!166043 (= res!138299 e!114943)))

(declare-fun res!138298 () Bool)

(assert (=> b!166043 (=> res!138298 e!114943)))

(declare-fun lt!259512 () tuple4!240)

(assert (=> b!166043 (= res!138298 (bvsge (_1!7891 lt!259512) (_2!7891 lt!259512)))))

(assert (=> b!166043 (= lt!259511 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!259050))) (currentByte!7898 (_1!7884 lt!259050)) (currentBit!7893 (_1!7884 lt!259050))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259513 () (_ BitVec 32))

(assert (=> b!166043 (= lt!259513 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166043 (= lt!259512 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!259050))) (currentByte!7898 (_1!7884 lt!259050)) (currentBit!7893 (_1!7884 lt!259050)))))))

(declare-fun c!8624 () Bool)

(declare-fun bm!2792 () Bool)

(assert (=> bm!2792 (= call!2795 (byteRangesEq!0 (select (arr!4685 (buf!4216 (_1!7884 lt!259050))) (_3!591 lt!259512)) (select (arr!4685 (buf!4216 (_2!7884 lt!259050))) (_3!591 lt!259512)) lt!259513 (ite c!8624 lt!259511 #b00000000000000000000000000001000)))))

(declare-fun b!166044 () Bool)

(assert (=> b!166044 (= e!114942 e!114947)))

(declare-fun res!138301 () Bool)

(assert (=> b!166044 (= res!138301 call!2795)))

(assert (=> b!166044 (=> (not res!138301) (not e!114947))))

(declare-fun b!166045 () Bool)

(assert (=> b!166045 (= e!114943 (arrayRangesEq!644 (buf!4216 (_1!7884 lt!259050)) (buf!4216 (_2!7884 lt!259050)) (_1!7891 lt!259512) (_2!7891 lt!259512)))))

(declare-fun b!166046 () Bool)

(assert (=> b!166046 (= e!114944 e!114942)))

(assert (=> b!166046 (= c!8624 (= (_3!591 lt!259512) (_4!120 lt!259512)))))

(declare-fun b!166047 () Bool)

(assert (=> b!166047 (= e!114946 (byteRangesEq!0 (select (arr!4685 (buf!4216 (_1!7884 lt!259050))) (_4!120 lt!259512)) (select (arr!4685 (buf!4216 (_2!7884 lt!259050))) (_4!120 lt!259512)) #b00000000000000000000000000000000 lt!259511))))

(assert (= (and d!57665 (not res!138300)) b!166043))

(assert (= (and b!166043 (not res!138298)) b!166045))

(assert (= (and b!166043 res!138299) b!166046))

(assert (= (and b!166046 c!8624) b!166041))

(assert (= (and b!166046 (not c!8624)) b!166044))

(assert (= (and b!166044 res!138301) b!166042))

(assert (= (and b!166042 (not res!138302)) b!166047))

(assert (= (or b!166041 b!166044) bm!2792))

(assert (=> b!166043 m!263395))

(assert (=> b!166043 m!263789))

(declare-fun m!263817 () Bool)

(assert (=> bm!2792 m!263817))

(declare-fun m!263819 () Bool)

(assert (=> bm!2792 m!263819))

(assert (=> bm!2792 m!263817))

(assert (=> bm!2792 m!263819))

(declare-fun m!263821 () Bool)

(assert (=> bm!2792 m!263821))

(declare-fun m!263823 () Bool)

(assert (=> b!166045 m!263823))

(declare-fun m!263825 () Bool)

(assert (=> b!166047 m!263825))

(declare-fun m!263827 () Bool)

(assert (=> b!166047 m!263827))

(assert (=> b!166047 m!263825))

(assert (=> b!166047 m!263827))

(declare-fun m!263829 () Bool)

(assert (=> b!166047 m!263829))

(assert (=> b!165781 d!57665))

(assert (=> b!165781 d!57659))

(declare-fun b!166048 () Bool)

(declare-fun e!114948 () Bool)

(declare-fun call!2796 () Bool)

(assert (=> b!166048 (= e!114948 call!2796)))

(declare-fun d!57667 () Bool)

(declare-fun res!138305 () Bool)

(declare-fun e!114951 () Bool)

(assert (=> d!57667 (=> res!138305 e!114951)))

(assert (=> d!57667 (= res!138305 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052))))))

(assert (=> d!57667 (= (arrayBitRangesEq!0 (buf!4216 lt!259052) (buf!4216 lt!259052) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052))) e!114951)))

(declare-fun b!166049 () Bool)

(declare-fun res!138307 () Bool)

(declare-fun lt!259514 () (_ BitVec 32))

(assert (=> b!166049 (= res!138307 (= lt!259514 #b00000000000000000000000000000000))))

(declare-fun e!114952 () Bool)

(assert (=> b!166049 (=> res!138307 e!114952)))

(declare-fun e!114953 () Bool)

(assert (=> b!166049 (= e!114953 e!114952)))

(declare-fun b!166050 () Bool)

(declare-fun e!114950 () Bool)

(assert (=> b!166050 (= e!114951 e!114950)))

(declare-fun res!138304 () Bool)

(assert (=> b!166050 (=> (not res!138304) (not e!114950))))

(declare-fun e!114949 () Bool)

(assert (=> b!166050 (= res!138304 e!114949)))

(declare-fun res!138303 () Bool)

(assert (=> b!166050 (=> res!138303 e!114949)))

(declare-fun lt!259515 () tuple4!240)

(assert (=> b!166050 (= res!138303 (bvsge (_1!7891 lt!259515) (_2!7891 lt!259515)))))

(assert (=> b!166050 (= lt!259514 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259516 () (_ BitVec 32))

(assert (=> b!166050 (= lt!259516 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166050 (= lt!259515 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052))))))

(declare-fun bm!2793 () Bool)

(declare-fun c!8625 () Bool)

(assert (=> bm!2793 (= call!2796 (byteRangesEq!0 (select (arr!4685 (buf!4216 lt!259052)) (_3!591 lt!259515)) (select (arr!4685 (buf!4216 lt!259052)) (_3!591 lt!259515)) lt!259516 (ite c!8625 lt!259514 #b00000000000000000000000000001000)))))

(declare-fun b!166051 () Bool)

(assert (=> b!166051 (= e!114948 e!114953)))

(declare-fun res!138306 () Bool)

(assert (=> b!166051 (= res!138306 call!2796)))

(assert (=> b!166051 (=> (not res!138306) (not e!114953))))

(declare-fun b!166052 () Bool)

(assert (=> b!166052 (= e!114949 (arrayRangesEq!644 (buf!4216 lt!259052) (buf!4216 lt!259052) (_1!7891 lt!259515) (_2!7891 lt!259515)))))

(declare-fun b!166053 () Bool)

(assert (=> b!166053 (= e!114950 e!114948)))

(assert (=> b!166053 (= c!8625 (= (_3!591 lt!259515) (_4!120 lt!259515)))))

(declare-fun b!166054 () Bool)

(assert (=> b!166054 (= e!114952 (byteRangesEq!0 (select (arr!4685 (buf!4216 lt!259052)) (_4!120 lt!259515)) (select (arr!4685 (buf!4216 lt!259052)) (_4!120 lt!259515)) #b00000000000000000000000000000000 lt!259514))))

(assert (= (and d!57667 (not res!138305)) b!166050))

(assert (= (and b!166050 (not res!138303)) b!166052))

(assert (= (and b!166050 res!138304) b!166053))

(assert (= (and b!166053 c!8625) b!166048))

(assert (= (and b!166053 (not c!8625)) b!166051))

(assert (= (and b!166051 res!138306) b!166049))

(assert (= (and b!166049 (not res!138307)) b!166054))

(assert (= (or b!166048 b!166051) bm!2793))

(assert (=> b!166050 m!263379))

(declare-fun m!263831 () Bool)

(assert (=> b!166050 m!263831))

(declare-fun m!263833 () Bool)

(assert (=> bm!2793 m!263833))

(assert (=> bm!2793 m!263833))

(assert (=> bm!2793 m!263833))

(assert (=> bm!2793 m!263833))

(declare-fun m!263835 () Bool)

(assert (=> bm!2793 m!263835))

(declare-fun m!263837 () Bool)

(assert (=> b!166052 m!263837))

(declare-fun m!263839 () Bool)

(assert (=> b!166054 m!263839))

(assert (=> b!166054 m!263839))

(assert (=> b!166054 m!263839))

(assert (=> b!166054 m!263839))

(declare-fun m!263841 () Bool)

(assert (=> b!166054 m!263841))

(assert (=> b!165769 d!57667))

(assert (=> b!165769 d!57663))

(declare-fun d!57669 () Bool)

(declare-fun e!114954 () Bool)

(assert (=> d!57669 e!114954))

(declare-fun res!138309 () Bool)

(assert (=> d!57669 (=> (not res!138309) (not e!114954))))

(declare-fun lt!259520 () (_ BitVec 64))

(declare-fun lt!259518 () (_ BitVec 64))

(declare-fun lt!259519 () (_ BitVec 64))

(assert (=> d!57669 (= res!138309 (= lt!259520 (bvsub lt!259518 lt!259519)))))

(assert (=> d!57669 (or (= (bvand lt!259518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259519 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259518 lt!259519) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57669 (= lt!259519 (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7888 lt!259269)))) ((_ sign_extend 32) (currentByte!7898 (_2!7888 lt!259269))) ((_ sign_extend 32) (currentBit!7893 (_2!7888 lt!259269)))))))

(declare-fun lt!259517 () (_ BitVec 64))

(declare-fun lt!259521 () (_ BitVec 64))

(assert (=> d!57669 (= lt!259518 (bvmul lt!259517 lt!259521))))

(assert (=> d!57669 (or (= lt!259517 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259521 (bvsdiv (bvmul lt!259517 lt!259521) lt!259517)))))

(assert (=> d!57669 (= lt!259521 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57669 (= lt!259517 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7888 lt!259269)))))))

(assert (=> d!57669 (= lt!259520 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7898 (_2!7888 lt!259269))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7893 (_2!7888 lt!259269)))))))

(assert (=> d!57669 (invariant!0 (currentBit!7893 (_2!7888 lt!259269)) (currentByte!7898 (_2!7888 lt!259269)) (size!3764 (buf!4216 (_2!7888 lt!259269))))))

(assert (=> d!57669 (= (bitIndex!0 (size!3764 (buf!4216 (_2!7888 lt!259269))) (currentByte!7898 (_2!7888 lt!259269)) (currentBit!7893 (_2!7888 lt!259269))) lt!259520)))

(declare-fun b!166055 () Bool)

(declare-fun res!138308 () Bool)

(assert (=> b!166055 (=> (not res!138308) (not e!114954))))

(assert (=> b!166055 (= res!138308 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259520))))

(declare-fun b!166056 () Bool)

(declare-fun lt!259522 () (_ BitVec 64))

(assert (=> b!166056 (= e!114954 (bvsle lt!259520 (bvmul lt!259522 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166056 (or (= lt!259522 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259522 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259522)))))

(assert (=> b!166056 (= lt!259522 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7888 lt!259269)))))))

(assert (= (and d!57669 res!138309) b!166055))

(assert (= (and b!166055 res!138308) b!166056))

(declare-fun m!263843 () Bool)

(assert (=> d!57669 m!263843))

(declare-fun m!263845 () Bool)

(assert (=> d!57669 m!263845))

(assert (=> b!165790 d!57669))

(declare-fun d!57671 () Bool)

(declare-fun e!114955 () Bool)

(assert (=> d!57671 e!114955))

(declare-fun res!138311 () Bool)

(assert (=> d!57671 (=> (not res!138311) (not e!114955))))

(declare-fun lt!259524 () (_ BitVec 64))

(declare-fun lt!259525 () (_ BitVec 64))

(declare-fun lt!259526 () (_ BitVec 64))

(assert (=> d!57671 (= res!138311 (= lt!259526 (bvsub lt!259524 lt!259525)))))

(assert (=> d!57671 (or (= (bvand lt!259524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259525 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259524 lt!259525) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57671 (= lt!259525 (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 (_1!7884 lt!258863)))) ((_ sign_extend 32) (currentByte!7898 (_1!7884 lt!258863))) ((_ sign_extend 32) (currentBit!7893 (_1!7884 lt!258863)))))))

(declare-fun lt!259523 () (_ BitVec 64))

(declare-fun lt!259527 () (_ BitVec 64))

(assert (=> d!57671 (= lt!259524 (bvmul lt!259523 lt!259527))))

(assert (=> d!57671 (or (= lt!259523 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259527 (bvsdiv (bvmul lt!259523 lt!259527) lt!259523)))))

(assert (=> d!57671 (= lt!259527 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57671 (= lt!259523 ((_ sign_extend 32) (size!3764 (buf!4216 (_1!7884 lt!258863)))))))

(assert (=> d!57671 (= lt!259526 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7898 (_1!7884 lt!258863))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7893 (_1!7884 lt!258863)))))))

(assert (=> d!57671 (invariant!0 (currentBit!7893 (_1!7884 lt!258863)) (currentByte!7898 (_1!7884 lt!258863)) (size!3764 (buf!4216 (_1!7884 lt!258863))))))

(assert (=> d!57671 (= (bitIndex!0 (size!3764 (buf!4216 (_1!7884 lt!258863))) (currentByte!7898 (_1!7884 lt!258863)) (currentBit!7893 (_1!7884 lt!258863))) lt!259526)))

(declare-fun b!166057 () Bool)

(declare-fun res!138310 () Bool)

(assert (=> b!166057 (=> (not res!138310) (not e!114955))))

(assert (=> b!166057 (= res!138310 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259526))))

(declare-fun b!166058 () Bool)

(declare-fun lt!259528 () (_ BitVec 64))

(assert (=> b!166058 (= e!114955 (bvsle lt!259526 (bvmul lt!259528 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166058 (or (= lt!259528 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259528 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259528)))))

(assert (=> b!166058 (= lt!259528 ((_ sign_extend 32) (size!3764 (buf!4216 (_1!7884 lt!258863)))))))

(assert (= (and d!57671 res!138311) b!166057))

(assert (= (and b!166057 res!138310) b!166058))

(declare-fun m!263847 () Bool)

(assert (=> d!57671 m!263847))

(declare-fun m!263849 () Bool)

(assert (=> d!57671 m!263849))

(assert (=> b!165790 d!57671))

(declare-fun d!57673 () Bool)

(assert (=> d!57673 (= (byteRangesEq!0 (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_3!591 lt!259229)) (select (arr!4685 (buf!4216 thiss!1577)) (_3!591 lt!259229)) lt!259230 (ite c!8598 lt!259228 #b00000000000000000000000000001000)) (or (= lt!259230 (ite c!8598 lt!259228 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_3!591 lt!259229))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8598 lt!259228 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!259230)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4685 (buf!4216 thiss!1577)) (_3!591 lt!259229))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8598 lt!259228 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!259230)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14298 () Bool)

(assert (= bs!14298 d!57673))

(declare-fun m!263851 () Bool)

(assert (=> bs!14298 m!263851))

(declare-fun m!263853 () Bool)

(assert (=> bs!14298 m!263853))

(assert (=> bm!2775 d!57673))

(assert (=> d!57437 d!57447))

(declare-fun d!57675 () Bool)

(assert (=> d!57675 (isPrefixOf!0 lt!259052 (_2!7882 lt!258861))))

(assert (=> d!57675 true))

(declare-fun _$15!268 () Unit!11518)

(assert (=> d!57675 (= (choose!30 lt!259052 (_2!7882 lt!258861) (_2!7882 lt!258861)) _$15!268)))

(declare-fun bs!14299 () Bool)

(assert (= bs!14299 d!57675))

(assert (=> bs!14299 m!263221))

(assert (=> d!57437 d!57675))

(declare-fun b!166059 () Bool)

(declare-fun e!114956 () Bool)

(declare-fun call!2797 () Bool)

(assert (=> b!166059 (= e!114956 call!2797)))

(declare-fun d!57677 () Bool)

(declare-fun res!138314 () Bool)

(declare-fun e!114959 () Bool)

(assert (=> d!57677 (=> res!138314 e!114959)))

(assert (=> d!57677 (= res!138314 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052))))))

(assert (=> d!57677 (= (arrayBitRangesEq!0 (buf!4216 lt!259052) (buf!4216 (_2!7882 lt!258861)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052))) e!114959)))

(declare-fun b!166060 () Bool)

(declare-fun res!138316 () Bool)

(declare-fun lt!259529 () (_ BitVec 32))

(assert (=> b!166060 (= res!138316 (= lt!259529 #b00000000000000000000000000000000))))

(declare-fun e!114960 () Bool)

(assert (=> b!166060 (=> res!138316 e!114960)))

(declare-fun e!114961 () Bool)

(assert (=> b!166060 (= e!114961 e!114960)))

(declare-fun b!166061 () Bool)

(declare-fun e!114958 () Bool)

(assert (=> b!166061 (= e!114959 e!114958)))

(declare-fun res!138313 () Bool)

(assert (=> b!166061 (=> (not res!138313) (not e!114958))))

(declare-fun e!114957 () Bool)

(assert (=> b!166061 (= res!138313 e!114957)))

(declare-fun res!138312 () Bool)

(assert (=> b!166061 (=> res!138312 e!114957)))

(declare-fun lt!259530 () tuple4!240)

(assert (=> b!166061 (= res!138312 (bvsge (_1!7891 lt!259530) (_2!7891 lt!259530)))))

(assert (=> b!166061 (= lt!259529 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259531 () (_ BitVec 32))

(assert (=> b!166061 (= lt!259531 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166061 (= lt!259530 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052))))))

(declare-fun bm!2794 () Bool)

(declare-fun c!8626 () Bool)

(assert (=> bm!2794 (= call!2797 (byteRangesEq!0 (select (arr!4685 (buf!4216 lt!259052)) (_3!591 lt!259530)) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_3!591 lt!259530)) lt!259531 (ite c!8626 lt!259529 #b00000000000000000000000000001000)))))

(declare-fun b!166062 () Bool)

(assert (=> b!166062 (= e!114956 e!114961)))

(declare-fun res!138315 () Bool)

(assert (=> b!166062 (= res!138315 call!2797)))

(assert (=> b!166062 (=> (not res!138315) (not e!114961))))

(declare-fun b!166063 () Bool)

(assert (=> b!166063 (= e!114957 (arrayRangesEq!644 (buf!4216 lt!259052) (buf!4216 (_2!7882 lt!258861)) (_1!7891 lt!259530) (_2!7891 lt!259530)))))

(declare-fun b!166064 () Bool)

(assert (=> b!166064 (= e!114958 e!114956)))

(assert (=> b!166064 (= c!8626 (= (_3!591 lt!259530) (_4!120 lt!259530)))))

(declare-fun b!166065 () Bool)

(assert (=> b!166065 (= e!114960 (byteRangesEq!0 (select (arr!4685 (buf!4216 lt!259052)) (_4!120 lt!259530)) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_4!120 lt!259530)) #b00000000000000000000000000000000 lt!259529))))

(assert (= (and d!57677 (not res!138314)) b!166061))

(assert (= (and b!166061 (not res!138312)) b!166063))

(assert (= (and b!166061 res!138313) b!166064))

(assert (= (and b!166064 c!8626) b!166059))

(assert (= (and b!166064 (not c!8626)) b!166062))

(assert (= (and b!166062 res!138315) b!166060))

(assert (= (and b!166060 (not res!138316)) b!166065))

(assert (= (or b!166059 b!166062) bm!2794))

(assert (=> b!166061 m!263379))

(assert (=> b!166061 m!263831))

(declare-fun m!263855 () Bool)

(assert (=> bm!2794 m!263855))

(declare-fun m!263857 () Bool)

(assert (=> bm!2794 m!263857))

(assert (=> bm!2794 m!263855))

(assert (=> bm!2794 m!263857))

(declare-fun m!263859 () Bool)

(assert (=> bm!2794 m!263859))

(declare-fun m!263861 () Bool)

(assert (=> b!166063 m!263861))

(declare-fun m!263863 () Bool)

(assert (=> b!166065 m!263863))

(declare-fun m!263865 () Bool)

(assert (=> b!166065 m!263865))

(assert (=> b!166065 m!263863))

(assert (=> b!166065 m!263865))

(declare-fun m!263867 () Bool)

(assert (=> b!166065 m!263867))

(assert (=> b!165775 d!57677))

(assert (=> b!165775 d!57663))

(declare-fun d!57679 () Bool)

(assert (=> d!57679 (= (arrayBitIndices!0 lt!259043 lt!259049) (tuple4!241 ((_ extract 31 0) (bvadd (bvsdiv lt!259043 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem lt!259043 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!259049 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!259043 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!259049 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!165753 d!57679))

(assert (=> b!165773 d!57663))

(assert (=> b!165773 d!57373))

(declare-fun b!166066 () Bool)

(declare-fun e!114962 () Bool)

(declare-fun call!2798 () Bool)

(assert (=> b!166066 (= e!114962 call!2798)))

(declare-fun d!57681 () Bool)

(declare-fun res!138319 () Bool)

(declare-fun e!114965 () Bool)

(assert (=> d!57681 (=> res!138319 e!114965)))

(assert (=> d!57681 (= res!138319 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258861))) (currentByte!7898 (_2!7882 lt!258861)) (currentBit!7893 (_2!7882 lt!258861)))))))

(assert (=> d!57681 (= (arrayBitRangesEq!0 (buf!4216 (_2!7882 lt!258861)) (buf!4216 (_2!7882 lt!258861)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258861))) (currentByte!7898 (_2!7882 lt!258861)) (currentBit!7893 (_2!7882 lt!258861)))) e!114965)))

(declare-fun b!166067 () Bool)

(declare-fun res!138321 () Bool)

(declare-fun lt!259532 () (_ BitVec 32))

(assert (=> b!166067 (= res!138321 (= lt!259532 #b00000000000000000000000000000000))))

(declare-fun e!114966 () Bool)

(assert (=> b!166067 (=> res!138321 e!114966)))

(declare-fun e!114967 () Bool)

(assert (=> b!166067 (= e!114967 e!114966)))

(declare-fun b!166068 () Bool)

(declare-fun e!114964 () Bool)

(assert (=> b!166068 (= e!114965 e!114964)))

(declare-fun res!138318 () Bool)

(assert (=> b!166068 (=> (not res!138318) (not e!114964))))

(declare-fun e!114963 () Bool)

(assert (=> b!166068 (= res!138318 e!114963)))

(declare-fun res!138317 () Bool)

(assert (=> b!166068 (=> res!138317 e!114963)))

(declare-fun lt!259533 () tuple4!240)

(assert (=> b!166068 (= res!138317 (bvsge (_1!7891 lt!259533) (_2!7891 lt!259533)))))

(assert (=> b!166068 (= lt!259532 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258861))) (currentByte!7898 (_2!7882 lt!258861)) (currentBit!7893 (_2!7882 lt!258861))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259534 () (_ BitVec 32))

(assert (=> b!166068 (= lt!259534 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166068 (= lt!259533 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!258861))) (currentByte!7898 (_2!7882 lt!258861)) (currentBit!7893 (_2!7882 lt!258861)))))))

(declare-fun c!8627 () Bool)

(declare-fun bm!2795 () Bool)

(assert (=> bm!2795 (= call!2798 (byteRangesEq!0 (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_3!591 lt!259533)) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_3!591 lt!259533)) lt!259534 (ite c!8627 lt!259532 #b00000000000000000000000000001000)))))

(declare-fun b!166069 () Bool)

(assert (=> b!166069 (= e!114962 e!114967)))

(declare-fun res!138320 () Bool)

(assert (=> b!166069 (= res!138320 call!2798)))

(assert (=> b!166069 (=> (not res!138320) (not e!114967))))

(declare-fun b!166070 () Bool)

(assert (=> b!166070 (= e!114963 (arrayRangesEq!644 (buf!4216 (_2!7882 lt!258861)) (buf!4216 (_2!7882 lt!258861)) (_1!7891 lt!259533) (_2!7891 lt!259533)))))

(declare-fun b!166071 () Bool)

(assert (=> b!166071 (= e!114964 e!114962)))

(assert (=> b!166071 (= c!8627 (= (_3!591 lt!259533) (_4!120 lt!259533)))))

(declare-fun b!166072 () Bool)

(assert (=> b!166072 (= e!114966 (byteRangesEq!0 (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_4!120 lt!259533)) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_4!120 lt!259533)) #b00000000000000000000000000000000 lt!259532))))

(assert (= (and d!57681 (not res!138319)) b!166068))

(assert (= (and b!166068 (not res!138317)) b!166070))

(assert (= (and b!166068 res!138318) b!166071))

(assert (= (and b!166071 c!8627) b!166066))

(assert (= (and b!166071 (not c!8627)) b!166069))

(assert (= (and b!166069 res!138320) b!166067))

(assert (= (and b!166067 (not res!138321)) b!166072))

(assert (= (or b!166066 b!166069) bm!2795))

(assert (=> b!166068 m!263085))

(declare-fun m!263869 () Bool)

(assert (=> b!166068 m!263869))

(declare-fun m!263871 () Bool)

(assert (=> bm!2795 m!263871))

(assert (=> bm!2795 m!263871))

(assert (=> bm!2795 m!263871))

(assert (=> bm!2795 m!263871))

(declare-fun m!263873 () Bool)

(assert (=> bm!2795 m!263873))

(declare-fun m!263875 () Bool)

(assert (=> b!166070 m!263875))

(declare-fun m!263877 () Bool)

(assert (=> b!166072 m!263877))

(assert (=> b!166072 m!263877))

(assert (=> b!166072 m!263877))

(assert (=> b!166072 m!263877))

(declare-fun m!263879 () Bool)

(assert (=> b!166072 m!263879))

(assert (=> b!165778 d!57681))

(assert (=> b!165778 d!57373))

(assert (=> d!57453 d!57443))

(declare-fun d!57683 () Bool)

(assert (=> d!57683 (isPrefixOf!0 lt!259052 lt!259052)))

(assert (=> d!57683 true))

(declare-fun _$14!298 () Unit!11518)

(assert (=> d!57683 (= (choose!11 lt!259052) _$14!298)))

(declare-fun bs!14300 () Bool)

(assert (= bs!14300 d!57683))

(assert (=> bs!14300 m!263217))

(assert (=> d!57453 d!57683))

(declare-fun b!166073 () Bool)

(declare-fun e!114968 () Bool)

(declare-fun call!2799 () Bool)

(assert (=> b!166073 (= e!114968 call!2799)))

(declare-fun d!57685 () Bool)

(declare-fun res!138324 () Bool)

(declare-fun e!114971 () Bool)

(assert (=> d!57685 (=> res!138324 e!114971)))

(assert (=> d!57685 (= res!138324 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_2!7884 lt!259050))) (currentByte!7898 (_2!7884 lt!259050)) (currentBit!7893 (_2!7884 lt!259050)))))))

(assert (=> d!57685 (= (arrayBitRangesEq!0 (buf!4216 (_2!7884 lt!259050)) (buf!4216 (_2!7882 lt!258861)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_2!7884 lt!259050))) (currentByte!7898 (_2!7884 lt!259050)) (currentBit!7893 (_2!7884 lt!259050)))) e!114971)))

(declare-fun b!166074 () Bool)

(declare-fun res!138326 () Bool)

(declare-fun lt!259535 () (_ BitVec 32))

(assert (=> b!166074 (= res!138326 (= lt!259535 #b00000000000000000000000000000000))))

(declare-fun e!114972 () Bool)

(assert (=> b!166074 (=> res!138326 e!114972)))

(declare-fun e!114973 () Bool)

(assert (=> b!166074 (= e!114973 e!114972)))

(declare-fun b!166075 () Bool)

(declare-fun e!114970 () Bool)

(assert (=> b!166075 (= e!114971 e!114970)))

(declare-fun res!138323 () Bool)

(assert (=> b!166075 (=> (not res!138323) (not e!114970))))

(declare-fun e!114969 () Bool)

(assert (=> b!166075 (= res!138323 e!114969)))

(declare-fun res!138322 () Bool)

(assert (=> b!166075 (=> res!138322 e!114969)))

(declare-fun lt!259536 () tuple4!240)

(assert (=> b!166075 (= res!138322 (bvsge (_1!7891 lt!259536) (_2!7891 lt!259536)))))

(assert (=> b!166075 (= lt!259535 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3764 (buf!4216 (_2!7884 lt!259050))) (currentByte!7898 (_2!7884 lt!259050)) (currentBit!7893 (_2!7884 lt!259050))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259537 () (_ BitVec 32))

(assert (=> b!166075 (= lt!259537 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166075 (= lt!259536 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 (_2!7884 lt!259050))) (currentByte!7898 (_2!7884 lt!259050)) (currentBit!7893 (_2!7884 lt!259050)))))))

(declare-fun c!8628 () Bool)

(declare-fun bm!2796 () Bool)

(assert (=> bm!2796 (= call!2799 (byteRangesEq!0 (select (arr!4685 (buf!4216 (_2!7884 lt!259050))) (_3!591 lt!259536)) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_3!591 lt!259536)) lt!259537 (ite c!8628 lt!259535 #b00000000000000000000000000001000)))))

(declare-fun b!166076 () Bool)

(assert (=> b!166076 (= e!114968 e!114973)))

(declare-fun res!138325 () Bool)

(assert (=> b!166076 (= res!138325 call!2799)))

(assert (=> b!166076 (=> (not res!138325) (not e!114973))))

(declare-fun b!166077 () Bool)

(assert (=> b!166077 (= e!114969 (arrayRangesEq!644 (buf!4216 (_2!7884 lt!259050)) (buf!4216 (_2!7882 lt!258861)) (_1!7891 lt!259536) (_2!7891 lt!259536)))))

(declare-fun b!166078 () Bool)

(assert (=> b!166078 (= e!114970 e!114968)))

(assert (=> b!166078 (= c!8628 (= (_3!591 lt!259536) (_4!120 lt!259536)))))

(declare-fun b!166079 () Bool)

(assert (=> b!166079 (= e!114972 (byteRangesEq!0 (select (arr!4685 (buf!4216 (_2!7884 lt!259050))) (_4!120 lt!259536)) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_4!120 lt!259536)) #b00000000000000000000000000000000 lt!259535))))

(assert (= (and d!57685 (not res!138324)) b!166075))

(assert (= (and b!166075 (not res!138322)) b!166077))

(assert (= (and b!166075 res!138323) b!166078))

(assert (= (and b!166078 c!8628) b!166073))

(assert (= (and b!166078 (not c!8628)) b!166076))

(assert (= (and b!166076 res!138325) b!166074))

(assert (= (and b!166074 (not res!138326)) b!166079))

(assert (= (or b!166073 b!166076) bm!2796))

(assert (=> b!166075 m!263361))

(declare-fun m!263881 () Bool)

(assert (=> b!166075 m!263881))

(declare-fun m!263883 () Bool)

(assert (=> bm!2796 m!263883))

(declare-fun m!263885 () Bool)

(assert (=> bm!2796 m!263885))

(assert (=> bm!2796 m!263883))

(assert (=> bm!2796 m!263885))

(declare-fun m!263887 () Bool)

(assert (=> bm!2796 m!263887))

(declare-fun m!263889 () Bool)

(assert (=> b!166077 m!263889))

(declare-fun m!263891 () Bool)

(assert (=> b!166079 m!263891))

(declare-fun m!263893 () Bool)

(assert (=> b!166079 m!263893))

(assert (=> b!166079 m!263891))

(assert (=> b!166079 m!263893))

(declare-fun m!263895 () Bool)

(assert (=> b!166079 m!263895))

(assert (=> b!165762 d!57685))

(assert (=> b!165762 d!57661))

(assert (=> d!57441 d!57445))

(declare-fun d!57687 () Bool)

(assert (=> d!57687 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!57687 true))

(declare-fun _$14!299 () Unit!11518)

(assert (=> d!57687 (= (choose!11 thiss!1577) _$14!299)))

(declare-fun bs!14301 () Bool)

(assert (= bs!14301 d!57687))

(assert (=> bs!14301 m!263231))

(assert (=> d!57441 d!57687))

(assert (=> b!165760 d!57661))

(assert (=> b!165760 d!57373))

(declare-fun d!57689 () Bool)

(declare-fun res!138327 () Bool)

(declare-fun e!114974 () Bool)

(assert (=> d!57689 (=> res!138327 e!114974)))

(assert (=> d!57689 (= res!138327 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7898 thiss!1577)))))

(assert (=> d!57689 (= (arrayRangesEq!644 (buf!4216 thiss!1577) lt!258864 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7898 thiss!1577)) e!114974)))

(declare-fun b!166080 () Bool)

(declare-fun e!114975 () Bool)

(assert (=> b!166080 (= e!114974 e!114975)))

(declare-fun res!138328 () Bool)

(assert (=> b!166080 (=> (not res!138328) (not e!114975))))

(assert (=> b!166080 (= res!138328 (= (select (arr!4685 (buf!4216 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4685 lt!258864) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!166081 () Bool)

(assert (=> b!166081 (= e!114975 (arrayRangesEq!644 (buf!4216 thiss!1577) lt!258864 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7898 thiss!1577)))))

(assert (= (and d!57689 (not res!138327)) b!166080))

(assert (= (and b!166080 res!138328) b!166081))

(declare-fun m!263897 () Bool)

(assert (=> b!166080 m!263897))

(declare-fun m!263899 () Bool)

(assert (=> b!166080 m!263899))

(declare-fun m!263901 () Bool)

(assert (=> b!166081 m!263901))

(assert (=> b!165799 d!57689))

(assert (=> d!57457 d!57425))

(declare-fun d!57691 () Bool)

(declare-fun res!138329 () Bool)

(declare-fun e!114976 () Bool)

(assert (=> d!57691 (=> res!138329 e!114976)))

(assert (=> d!57691 (= res!138329 (= (_1!7891 lt!259229) (_2!7891 lt!259229)))))

(assert (=> d!57691 (= (arrayRangesEq!644 (buf!4216 (_2!7882 lt!258861)) (buf!4216 thiss!1577) (_1!7891 lt!259229) (_2!7891 lt!259229)) e!114976)))

(declare-fun b!166082 () Bool)

(declare-fun e!114977 () Bool)

(assert (=> b!166082 (= e!114976 e!114977)))

(declare-fun res!138330 () Bool)

(assert (=> b!166082 (=> (not res!138330) (not e!114977))))

(assert (=> b!166082 (= res!138330 (= (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_1!7891 lt!259229)) (select (arr!4685 (buf!4216 thiss!1577)) (_1!7891 lt!259229))))))

(declare-fun b!166083 () Bool)

(assert (=> b!166083 (= e!114977 (arrayRangesEq!644 (buf!4216 (_2!7882 lt!258861)) (buf!4216 thiss!1577) (bvadd (_1!7891 lt!259229) #b00000000000000000000000000000001) (_2!7891 lt!259229)))))

(assert (= (and d!57691 (not res!138329)) b!166082))

(assert (= (and b!166082 res!138330) b!166083))

(declare-fun m!263903 () Bool)

(assert (=> b!166082 m!263903))

(declare-fun m!263905 () Bool)

(assert (=> b!166082 m!263905))

(declare-fun m!263907 () Bool)

(assert (=> b!166083 m!263907))

(assert (=> b!165755 d!57691))

(declare-fun d!57693 () Bool)

(assert (=> d!57693 (= (byteRangesEq!0 (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_4!120 lt!259229)) (select (arr!4685 (buf!4216 thiss!1577)) (_4!120 lt!259229)) #b00000000000000000000000000000000 lt!259228) (or (= #b00000000000000000000000000000000 lt!259228) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_4!120 lt!259229))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!259228))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4685 (buf!4216 thiss!1577)) (_4!120 lt!259229))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!259228))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14302 () Bool)

(assert (= bs!14302 d!57693))

(declare-fun m!263909 () Bool)

(assert (=> bs!14302 m!263909))

(assert (=> bs!14302 m!263141))

(assert (=> b!165757 d!57693))

(declare-fun d!57695 () Bool)

(assert (=> d!57695 (= (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))) ((_ sign_extend 32) (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))) ((_ sign_extend 32) (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))) (bvsub (bvmul ((_ sign_extend 32) (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))))))))

(assert (=> d!57435 d!57695))

(declare-fun d!57697 () Bool)

(assert (=> d!57697 (= (invariant!0 (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))) (and (bvsge (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) #b00000000000000000000000000000000) (bvslt (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) #b00000000000000000000000000001000) (bvsge (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) #b00000000000000000000000000000000) (or (bvslt (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))) (and (= (currentBit!7893 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) #b00000000000000000000000000000000) (= (currentByte!7898 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (size!3764 (buf!4216 (BitStream!6685 lt!258864 (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)))))))))))

(assert (=> d!57435 d!57697))

(assert (=> d!57449 d!57447))

(declare-fun d!57699 () Bool)

(assert (=> d!57699 (isPrefixOf!0 lt!259052 (_2!7882 lt!258861))))

(assert (=> d!57699 true))

(declare-fun _$15!269 () Unit!11518)

(assert (=> d!57699 (= (choose!30 lt!259052 thiss!1577 (_2!7882 lt!258861)) _$15!269)))

(declare-fun bs!14303 () Bool)

(assert (= bs!14303 d!57699))

(assert (=> bs!14303 m!263221))

(assert (=> d!57449 d!57699))

(declare-fun d!57701 () Bool)

(declare-fun res!138331 () Bool)

(declare-fun e!114978 () Bool)

(assert (=> d!57701 (=> (not res!138331) (not e!114978))))

(assert (=> d!57701 (= res!138331 (= (size!3764 (buf!4216 lt!259052)) (size!3764 (buf!4216 thiss!1577))))))

(assert (=> d!57701 (= (isPrefixOf!0 lt!259052 thiss!1577) e!114978)))

(declare-fun b!166084 () Bool)

(declare-fun res!138333 () Bool)

(assert (=> b!166084 (=> (not res!138333) (not e!114978))))

(assert (=> b!166084 (= res!138333 (bvsle (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052)) (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))))

(declare-fun b!166085 () Bool)

(declare-fun e!114979 () Bool)

(assert (=> b!166085 (= e!114978 e!114979)))

(declare-fun res!138332 () Bool)

(assert (=> b!166085 (=> res!138332 e!114979)))

(assert (=> b!166085 (= res!138332 (= (size!3764 (buf!4216 lt!259052)) #b00000000000000000000000000000000))))

(declare-fun b!166086 () Bool)

(assert (=> b!166086 (= e!114979 (arrayBitRangesEq!0 (buf!4216 lt!259052) (buf!4216 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 lt!259052)) (currentByte!7898 lt!259052) (currentBit!7893 lt!259052))))))

(assert (= (and d!57701 res!138331) b!166084))

(assert (= (and b!166084 res!138333) b!166085))

(assert (= (and b!166085 (not res!138332)) b!166086))

(assert (=> b!166084 m!263379))

(assert (=> b!166084 m!263087))

(assert (=> b!166086 m!263379))

(assert (=> b!166086 m!263379))

(declare-fun m!263911 () Bool)

(assert (=> b!166086 m!263911))

(assert (=> d!57449 d!57701))

(assert (=> b!165770 d!57387))

(declare-fun d!57703 () Bool)

(assert (=> d!57703 (= (byteRangesEq!0 (select (arr!4685 (buf!4216 thiss!1577)) (_3!591 lt!259223)) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_3!591 lt!259223)) lt!259224 (ite c!8597 lt!259222 #b00000000000000000000000000001000)) (or (= lt!259224 (ite c!8597 lt!259222 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4685 (buf!4216 thiss!1577)) (_3!591 lt!259223))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8597 lt!259222 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!259224)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_3!591 lt!259223))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8597 lt!259222 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!259224)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14304 () Bool)

(assert (= bs!14304 d!57703))

(declare-fun m!263913 () Bool)

(assert (=> bs!14304 m!263913))

(declare-fun m!263915 () Bool)

(assert (=> bs!14304 m!263915))

(assert (=> bm!2774 d!57703))

(assert (=> d!57421 d!57423))

(declare-fun d!57705 () Bool)

(assert (=> d!57705 (arrayBitRangesEq!0 (buf!4216 (_2!7882 lt!258861)) (buf!4216 thiss!1577) lt!259043 lt!259049)))

(assert (=> d!57705 true))

(declare-fun _$19!138 () Unit!11518)

(assert (=> d!57705 (= (choose!8 (buf!4216 thiss!1577) (buf!4216 (_2!7882 lt!258861)) lt!259043 lt!259049) _$19!138)))

(declare-fun bs!14305 () Bool)

(assert (= bs!14305 d!57705))

(assert (=> bs!14305 m!263209))

(assert (=> d!57421 d!57705))

(declare-fun d!57707 () Bool)

(assert (=> d!57707 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) (tuple4!241 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!165746 d!57707))

(declare-fun d!57709 () Bool)

(declare-fun res!138334 () Bool)

(declare-fun e!114980 () Bool)

(assert (=> d!57709 (=> res!138334 e!114980)))

(assert (=> d!57709 (= res!138334 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7898 thiss!1577)))))

(assert (=> d!57709 (= (arrayRangesEq!644 (buf!4216 thiss!1577) (array!8433 (store (arr!4685 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) lt!258867) (size!3764 (buf!4216 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7898 thiss!1577)) e!114980)))

(declare-fun b!166087 () Bool)

(declare-fun e!114981 () Bool)

(assert (=> b!166087 (= e!114980 e!114981)))

(declare-fun res!138335 () Bool)

(assert (=> b!166087 (=> (not res!138335) (not e!114981))))

(assert (=> b!166087 (= res!138335 (= (select (arr!4685 (buf!4216 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4685 (array!8433 (store (arr!4685 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) lt!258867) (size!3764 (buf!4216 thiss!1577)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!166088 () Bool)

(assert (=> b!166088 (= e!114981 (arrayRangesEq!644 (buf!4216 thiss!1577) (array!8433 (store (arr!4685 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) lt!258867) (size!3764 (buf!4216 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7898 thiss!1577)))))

(assert (= (and d!57709 (not res!138334)) b!166087))

(assert (= (and b!166087 res!138335) b!166088))

(assert (=> b!166087 m!263411))

(declare-fun m!263917 () Bool)

(assert (=> b!166087 m!263917))

(declare-fun m!263919 () Bool)

(assert (=> b!166088 m!263919))

(assert (=> b!165759 d!57709))

(declare-fun d!57711 () Bool)

(assert (=> d!57711 (= (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7882 lt!258914)))) ((_ sign_extend 32) (currentByte!7898 (_2!7882 lt!258914))) ((_ sign_extend 32) (currentBit!7893 (_2!7882 lt!258914)))) (bvsub (bvmul ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7882 lt!258914)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7898 (_2!7882 lt!258914))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7893 (_2!7882 lt!258914))))))))

(assert (=> d!57433 d!57711))

(declare-fun d!57713 () Bool)

(assert (=> d!57713 (= (invariant!0 (currentBit!7893 (_2!7882 lt!258914)) (currentByte!7898 (_2!7882 lt!258914)) (size!3764 (buf!4216 (_2!7882 lt!258914)))) (and (bvsge (currentBit!7893 (_2!7882 lt!258914)) #b00000000000000000000000000000000) (bvslt (currentBit!7893 (_2!7882 lt!258914)) #b00000000000000000000000000001000) (bvsge (currentByte!7898 (_2!7882 lt!258914)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7898 (_2!7882 lt!258914)) (size!3764 (buf!4216 (_2!7882 lt!258914)))) (and (= (currentBit!7893 (_2!7882 lt!258914)) #b00000000000000000000000000000000) (= (currentByte!7898 (_2!7882 lt!258914)) (size!3764 (buf!4216 (_2!7882 lt!258914))))))))))

(assert (=> d!57433 d!57713))

(declare-fun d!57715 () Bool)

(declare-fun e!114982 () Bool)

(assert (=> d!57715 e!114982))

(declare-fun res!138337 () Bool)

(assert (=> d!57715 (=> (not res!138337) (not e!114982))))

(declare-fun lt!259541 () (_ BitVec 64))

(declare-fun lt!259539 () (_ BitVec 64))

(declare-fun lt!259540 () (_ BitVec 64))

(assert (=> d!57715 (= res!138337 (= lt!259541 (bvsub lt!259539 lt!259540)))))

(assert (=> d!57715 (or (= (bvand lt!259539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259540 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259539 lt!259540) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57715 (= lt!259540 (remainingBits!0 ((_ sign_extend 32) (size!3764 (buf!4216 lt!259280))) ((_ sign_extend 32) (currentByte!7898 lt!259280)) ((_ sign_extend 32) (currentBit!7893 lt!259280))))))

(declare-fun lt!259538 () (_ BitVec 64))

(declare-fun lt!259542 () (_ BitVec 64))

(assert (=> d!57715 (= lt!259539 (bvmul lt!259538 lt!259542))))

(assert (=> d!57715 (or (= lt!259538 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259542 (bvsdiv (bvmul lt!259538 lt!259542) lt!259538)))))

(assert (=> d!57715 (= lt!259542 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57715 (= lt!259538 ((_ sign_extend 32) (size!3764 (buf!4216 lt!259280))))))

(assert (=> d!57715 (= lt!259541 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7898 lt!259280)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7893 lt!259280))))))

(assert (=> d!57715 (invariant!0 (currentBit!7893 lt!259280) (currentByte!7898 lt!259280) (size!3764 (buf!4216 lt!259280)))))

(assert (=> d!57715 (= (bitIndex!0 (size!3764 (buf!4216 lt!259280)) (currentByte!7898 lt!259280) (currentBit!7893 lt!259280)) lt!259541)))

(declare-fun b!166089 () Bool)

(declare-fun res!138336 () Bool)

(assert (=> b!166089 (=> (not res!138336) (not e!114982))))

(assert (=> b!166089 (= res!138336 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259541))))

(declare-fun b!166090 () Bool)

(declare-fun lt!259543 () (_ BitVec 64))

(assert (=> b!166090 (= e!114982 (bvsle lt!259541 (bvmul lt!259543 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166090 (or (= lt!259543 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259543 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259543)))))

(assert (=> b!166090 (= lt!259543 ((_ sign_extend 32) (size!3764 (buf!4216 lt!259280))))))

(assert (= (and d!57715 res!138337) b!166089))

(assert (= (and b!166089 res!138336) b!166090))

(declare-fun m!263921 () Bool)

(assert (=> d!57715 m!263921))

(declare-fun m!263923 () Bool)

(assert (=> d!57715 m!263923))

(assert (=> d!57467 d!57715))

(assert (=> d!57467 d!57661))

(declare-fun d!57717 () Bool)

(declare-fun lt!259549 () (_ BitVec 32))

(assert (=> d!57717 (= lt!259549 ((_ extract 31 0) (bvsrem (bvsub lt!259056 lt!259060) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259545 () (_ BitVec 32))

(assert (=> d!57717 (= lt!259545 ((_ extract 31 0) (bvsdiv (bvsub lt!259056 lt!259060) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!114983 () Bool)

(assert (=> d!57717 e!114983))

(declare-fun res!138338 () Bool)

(assert (=> d!57717 (=> (not res!138338) (not e!114983))))

(assert (=> d!57717 (= res!138338 (moveBitIndexPrecond!0 (_2!7884 lt!259050) (bvsub lt!259056 lt!259060)))))

(declare-fun Unit!11564 () Unit!11518)

(declare-fun Unit!11565 () Unit!11518)

(declare-fun Unit!11566 () Unit!11518)

(assert (=> d!57717 (= (moveBitIndex!0 (_2!7884 lt!259050) (bvsub lt!259056 lt!259060)) (ite (bvslt (bvadd (currentBit!7893 (_2!7884 lt!259050)) lt!259549) #b00000000000000000000000000000000) (tuple2!14583 Unit!11564 (BitStream!6685 (buf!4216 (_2!7884 lt!259050)) (bvsub (bvadd (currentByte!7898 (_2!7884 lt!259050)) lt!259545) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259549 (currentBit!7893 (_2!7884 lt!259050))))) (ite (bvsge (bvadd (currentBit!7893 (_2!7884 lt!259050)) lt!259549) #b00000000000000000000000000001000) (tuple2!14583 Unit!11565 (BitStream!6685 (buf!4216 (_2!7884 lt!259050)) (bvadd (currentByte!7898 (_2!7884 lt!259050)) lt!259545 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7893 (_2!7884 lt!259050)) lt!259549) #b00000000000000000000000000001000))) (tuple2!14583 Unit!11566 (BitStream!6685 (buf!4216 (_2!7884 lt!259050)) (bvadd (currentByte!7898 (_2!7884 lt!259050)) lt!259545) (bvadd (currentBit!7893 (_2!7884 lt!259050)) lt!259549))))))))

(declare-fun b!166091 () Bool)

(declare-fun e!114984 () Bool)

(assert (=> b!166091 (= e!114983 e!114984)))

(declare-fun res!138339 () Bool)

(assert (=> b!166091 (=> (not res!138339) (not e!114984))))

(declare-fun lt!259546 () (_ BitVec 64))

(declare-fun lt!259548 () tuple2!14582)

(assert (=> b!166091 (= res!138339 (= (bvadd lt!259546 (bvsub lt!259056 lt!259060)) (bitIndex!0 (size!3764 (buf!4216 (_2!7882 lt!259548))) (currentByte!7898 (_2!7882 lt!259548)) (currentBit!7893 (_2!7882 lt!259548)))))))

(assert (=> b!166091 (or (not (= (bvand lt!259546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259056 lt!259060) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!259546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!259546 (bvsub lt!259056 lt!259060)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!166091 (= lt!259546 (bitIndex!0 (size!3764 (buf!4216 (_2!7884 lt!259050))) (currentByte!7898 (_2!7884 lt!259050)) (currentBit!7893 (_2!7884 lt!259050))))))

(declare-fun lt!259544 () (_ BitVec 32))

(declare-fun lt!259547 () (_ BitVec 32))

(declare-fun Unit!11567 () Unit!11518)

(declare-fun Unit!11568 () Unit!11518)

(declare-fun Unit!11569 () Unit!11518)

(assert (=> b!166091 (= lt!259548 (ite (bvslt (bvadd (currentBit!7893 (_2!7884 lt!259050)) lt!259544) #b00000000000000000000000000000000) (tuple2!14583 Unit!11567 (BitStream!6685 (buf!4216 (_2!7884 lt!259050)) (bvsub (bvadd (currentByte!7898 (_2!7884 lt!259050)) lt!259547) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259544 (currentBit!7893 (_2!7884 lt!259050))))) (ite (bvsge (bvadd (currentBit!7893 (_2!7884 lt!259050)) lt!259544) #b00000000000000000000000000001000) (tuple2!14583 Unit!11568 (BitStream!6685 (buf!4216 (_2!7884 lt!259050)) (bvadd (currentByte!7898 (_2!7884 lt!259050)) lt!259547 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7893 (_2!7884 lt!259050)) lt!259544) #b00000000000000000000000000001000))) (tuple2!14583 Unit!11569 (BitStream!6685 (buf!4216 (_2!7884 lt!259050)) (bvadd (currentByte!7898 (_2!7884 lt!259050)) lt!259547) (bvadd (currentBit!7893 (_2!7884 lt!259050)) lt!259544))))))))

(assert (=> b!166091 (= lt!259544 ((_ extract 31 0) (bvsrem (bvsub lt!259056 lt!259060) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166091 (= lt!259547 ((_ extract 31 0) (bvsdiv (bvsub lt!259056 lt!259060) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!166092 () Bool)

(assert (=> b!166092 (= e!114984 (and (= (size!3764 (buf!4216 (_2!7884 lt!259050))) (size!3764 (buf!4216 (_2!7882 lt!259548)))) (= (buf!4216 (_2!7884 lt!259050)) (buf!4216 (_2!7882 lt!259548)))))))

(assert (= (and d!57717 res!138338) b!166091))

(assert (= (and b!166091 res!138339) b!166092))

(assert (=> d!57717 m!263421))

(declare-fun m!263925 () Bool)

(assert (=> b!166091 m!263925))

(assert (=> b!166091 m!263361))

(assert (=> d!57467 d!57717))

(declare-fun d!57719 () Bool)

(declare-fun res!138340 () Bool)

(declare-fun e!114985 () Bool)

(assert (=> d!57719 (=> (not res!138340) (not e!114985))))

(assert (=> d!57719 (= res!138340 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7884 lt!259050))))) (bvsub lt!259056 lt!259060)) (bvsle (bvsub lt!259056 lt!259060) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7884 lt!259050))))))))))

(assert (=> d!57719 (= (moveBitIndexPrecond!0 (_2!7884 lt!259050) (bvsub lt!259056 lt!259060)) e!114985)))

(declare-fun b!166093 () Bool)

(declare-fun lt!259550 () (_ BitVec 64))

(assert (=> b!166093 (= e!114985 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259550) (bvsle lt!259550 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3764 (buf!4216 (_2!7884 lt!259050))))))))))

(assert (=> b!166093 (= lt!259550 (bvadd (bitIndex!0 (size!3764 (buf!4216 (_2!7884 lt!259050))) (currentByte!7898 (_2!7884 lt!259050)) (currentBit!7893 (_2!7884 lt!259050))) (bvsub lt!259056 lt!259060)))))

(assert (= (and d!57719 res!138340) b!166093))

(assert (=> b!166093 m!263361))

(assert (=> d!57467 d!57719))

(declare-fun b!166094 () Bool)

(declare-fun e!114986 () Bool)

(declare-fun call!2800 () Bool)

(assert (=> b!166094 (= e!114986 call!2800)))

(declare-fun d!57721 () Bool)

(declare-fun res!138343 () Bool)

(declare-fun e!114989 () Bool)

(assert (=> d!57721 (=> res!138343 e!114989)))

(assert (=> d!57721 (= res!138343 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))))

(assert (=> d!57721 (= (arrayBitRangesEq!0 (buf!4216 thiss!1577) (buf!4216 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))) e!114989)))

(declare-fun b!166095 () Bool)

(declare-fun res!138345 () Bool)

(declare-fun lt!259551 () (_ BitVec 32))

(assert (=> b!166095 (= res!138345 (= lt!259551 #b00000000000000000000000000000000))))

(declare-fun e!114990 () Bool)

(assert (=> b!166095 (=> res!138345 e!114990)))

(declare-fun e!114991 () Bool)

(assert (=> b!166095 (= e!114991 e!114990)))

(declare-fun b!166096 () Bool)

(declare-fun e!114988 () Bool)

(assert (=> b!166096 (= e!114989 e!114988)))

(declare-fun res!138342 () Bool)

(assert (=> b!166096 (=> (not res!138342) (not e!114988))))

(declare-fun e!114987 () Bool)

(assert (=> b!166096 (= res!138342 e!114987)))

(declare-fun res!138341 () Bool)

(assert (=> b!166096 (=> res!138341 e!114987)))

(declare-fun lt!259552 () tuple4!240)

(assert (=> b!166096 (= res!138341 (bvsge (_1!7891 lt!259552) (_2!7891 lt!259552)))))

(assert (=> b!166096 (= lt!259551 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259553 () (_ BitVec 32))

(assert (=> b!166096 (= lt!259553 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166096 (= lt!259552 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3764 (buf!4216 thiss!1577)) (currentByte!7898 thiss!1577) (currentBit!7893 thiss!1577))))))

(declare-fun c!8629 () Bool)

(declare-fun bm!2797 () Bool)

(assert (=> bm!2797 (= call!2800 (byteRangesEq!0 (select (arr!4685 (buf!4216 thiss!1577)) (_3!591 lt!259552)) (select (arr!4685 (buf!4216 thiss!1577)) (_3!591 lt!259552)) lt!259553 (ite c!8629 lt!259551 #b00000000000000000000000000001000)))))

(declare-fun b!166097 () Bool)

(assert (=> b!166097 (= e!114986 e!114991)))

(declare-fun res!138344 () Bool)

(assert (=> b!166097 (= res!138344 call!2800)))

(assert (=> b!166097 (=> (not res!138344) (not e!114991))))

(declare-fun b!166098 () Bool)

(assert (=> b!166098 (= e!114987 (arrayRangesEq!644 (buf!4216 thiss!1577) (buf!4216 thiss!1577) (_1!7891 lt!259552) (_2!7891 lt!259552)))))

(declare-fun b!166099 () Bool)

(assert (=> b!166099 (= e!114988 e!114986)))

(assert (=> b!166099 (= c!8629 (= (_3!591 lt!259552) (_4!120 lt!259552)))))

(declare-fun b!166100 () Bool)

(assert (=> b!166100 (= e!114990 (byteRangesEq!0 (select (arr!4685 (buf!4216 thiss!1577)) (_4!120 lt!259552)) (select (arr!4685 (buf!4216 thiss!1577)) (_4!120 lt!259552)) #b00000000000000000000000000000000 lt!259551))))

(assert (= (and d!57721 (not res!138343)) b!166096))

(assert (= (and b!166096 (not res!138341)) b!166098))

(assert (= (and b!166096 res!138342) b!166099))

(assert (= (and b!166099 c!8629) b!166094))

(assert (= (and b!166099 (not c!8629)) b!166097))

(assert (= (and b!166097 res!138344) b!166095))

(assert (= (and b!166095 (not res!138345)) b!166100))

(assert (= (or b!166094 b!166097) bm!2797))

(assert (=> b!166096 m!263087))

(assert (=> b!166096 m!263323))

(declare-fun m!263927 () Bool)

(assert (=> bm!2797 m!263927))

(assert (=> bm!2797 m!263927))

(assert (=> bm!2797 m!263927))

(assert (=> bm!2797 m!263927))

(declare-fun m!263929 () Bool)

(assert (=> bm!2797 m!263929))

(declare-fun m!263931 () Bool)

(assert (=> b!166098 m!263931))

(declare-fun m!263933 () Bool)

(assert (=> b!166100 m!263933))

(assert (=> b!166100 m!263933))

(assert (=> b!166100 m!263933))

(assert (=> b!166100 m!263933))

(declare-fun m!263935 () Bool)

(assert (=> b!166100 m!263935))

(assert (=> b!165772 d!57721))

(assert (=> b!165772 d!57387))

(declare-fun d!57723 () Bool)

(declare-fun res!138346 () Bool)

(declare-fun e!114992 () Bool)

(assert (=> d!57723 (=> res!138346 e!114992)))

(assert (=> d!57723 (= res!138346 (= (_1!7891 lt!259223) (_2!7891 lt!259223)))))

(assert (=> d!57723 (= (arrayRangesEq!644 (buf!4216 thiss!1577) (buf!4216 (_2!7882 lt!258861)) (_1!7891 lt!259223) (_2!7891 lt!259223)) e!114992)))

(declare-fun b!166101 () Bool)

(declare-fun e!114993 () Bool)

(assert (=> b!166101 (= e!114992 e!114993)))

(declare-fun res!138347 () Bool)

(assert (=> b!166101 (=> (not res!138347) (not e!114993))))

(assert (=> b!166101 (= res!138347 (= (select (arr!4685 (buf!4216 thiss!1577)) (_1!7891 lt!259223)) (select (arr!4685 (buf!4216 (_2!7882 lt!258861))) (_1!7891 lt!259223))))))

(declare-fun b!166102 () Bool)

(assert (=> b!166102 (= e!114993 (arrayRangesEq!644 (buf!4216 thiss!1577) (buf!4216 (_2!7882 lt!258861)) (bvadd (_1!7891 lt!259223) #b00000000000000000000000000000001) (_2!7891 lt!259223)))))

(assert (= (and d!57723 (not res!138346)) b!166101))

(assert (= (and b!166101 res!138347) b!166102))

(declare-fun m!263937 () Bool)

(assert (=> b!166101 m!263937))

(declare-fun m!263939 () Bool)

(assert (=> b!166101 m!263939))

(declare-fun m!263941 () Bool)

(assert (=> b!166102 m!263941))

(assert (=> b!165748 d!57723))

(check-sat (not b!166070) (not d!57651) (not d!57699) (not d!57687) (not b!166063) (not b!166100) (not b!166086) (not bm!2794) (not b!166061) (not b!166098) (not bm!2792) (not d!57715) (not d!57655) (not b!166079) (not d!57659) (not b!166026) (not b!166043) (not b!166032) (not b!166081) (not b!166052) (not d!57675) (not d!57717) (not b!166050) (not bm!2796) (not d!57671) (not b!166072) (not b!166093) (not b!166091) (not b!166102) (not d!57661) (not b!166077) (not b!166075) (not bm!2797) (not d!57683) (not b!166054) (not b!166065) (not b!166034) (not d!57705) (not bm!2791) (not b!166068) (not b!166030) (not b!166045) (not d!57669) (not b!166088) (not bm!2795) (not b!166096) (not b!166047) (not b!166084) (not d!57663) (not bm!2793) (not b!166083))
(check-sat)
