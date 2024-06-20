; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36302 () Bool)

(assert start!36302)

(declare-datatypes ((array!8664 0))(
  ( (array!8665 (arr!4770 (Array (_ BitVec 32) (_ BitVec 8))) (size!3849 (_ BitVec 32))) )
))
(declare-fun lt!260442 () array!8664)

(declare-fun b!167274 () Bool)

(declare-datatypes ((BitStream!6854 0))(
  ( (BitStream!6855 (buf!4301 array!8664) (currentByte!8135 (_ BitVec 32)) (currentBit!8130 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6854)

(declare-fun e!116029 () Bool)

(declare-fun lt!260444 () (_ BitVec 32))

(declare-fun inv!12 (BitStream!6854) Bool)

(assert (=> b!167274 (= e!116029 (inv!12 (BitStream!6855 lt!260442 (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)) lt!260444)))))

(declare-fun b!167275 () Bool)

(declare-fun res!139254 () Bool)

(declare-fun e!116027 () Bool)

(assert (=> b!167275 (=> (not res!139254) (not e!116027))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167275 (= res!139254 (validate_offset_bits!1 ((_ sign_extend 32) (size!3849 (buf!4301 thiss!1577))) ((_ sign_extend 32) (currentByte!8135 thiss!1577)) ((_ sign_extend 32) (currentBit!8130 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167276 () Bool)

(declare-fun res!139257 () Bool)

(assert (=> b!167276 (=> (not res!139257) (not e!116027))))

(assert (=> b!167276 (= res!139257 (bvsgt (bvadd (currentBit!8130 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!139255 () Bool)

(assert (=> start!36302 (=> (not res!139255) (not e!116027))))

(assert (=> start!36302 (= res!139255 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36302 e!116027))

(assert (=> start!36302 true))

(declare-fun e!116026 () Bool)

(assert (=> start!36302 (and (inv!12 thiss!1577) e!116026)))

(declare-fun b!167277 () Bool)

(assert (=> b!167277 (= e!116027 (not e!116029))))

(declare-fun res!139256 () Bool)

(assert (=> b!167277 (=> res!139256 e!116029)))

(declare-fun lt!260446 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167277 (= res!139256 (not (byteRangesEq!0 (select (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577)) lt!260446 #b00000000000000000000000000000000 lt!260444)))))

(declare-fun arrayRangesEq!678 (array!8664 array!8664 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167277 (arrayRangesEq!678 (buf!4301 thiss!1577) lt!260442 #b00000000000000000000000000000000 (currentByte!8135 thiss!1577))))

(declare-datatypes ((Unit!11646 0))(
  ( (Unit!11647) )
))
(declare-fun lt!260441 () Unit!11646)

(declare-fun lt!260438 () array!8664)

(declare-fun arrayRangesEqTransitive!180 (array!8664 array!8664 array!8664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11646)

(assert (=> b!167277 (= lt!260441 (arrayRangesEqTransitive!180 (buf!4301 thiss!1577) lt!260438 lt!260442 #b00000000000000000000000000000000 (currentByte!8135 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577))))))

(assert (=> b!167277 (arrayRangesEq!678 lt!260438 lt!260442 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)))))

(declare-fun lt!260443 () Unit!11646)

(declare-fun lt!260439 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!286 (array!8664 (_ BitVec 32) (_ BitVec 8)) Unit!11646)

(assert (=> b!167277 (= lt!260443 (arrayUpdatedAtPrefixLemma!286 lt!260438 (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)) lt!260439))))

(assert (=> b!167277 (arrayRangesEq!678 (buf!4301 thiss!1577) (array!8665 (store (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577) lt!260446) (size!3849 (buf!4301 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8135 thiss!1577))))

(declare-fun lt!260445 () Unit!11646)

(assert (=> b!167277 (= lt!260445 (arrayUpdatedAtPrefixLemma!286 (buf!4301 thiss!1577) (currentByte!8135 thiss!1577) lt!260446))))

(declare-fun lt!260437 () (_ BitVec 32))

(assert (=> b!167277 (= lt!260446 (select (store (store (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8130 thiss!1577)))))))) (bvlshr (bvand lt!260437 #b00000000000000000000000011111111) lt!260444)))) (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)) lt!260439) (currentByte!8135 thiss!1577)))))

(assert (=> b!167277 (= lt!260442 (array!8665 (store (store (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8130 thiss!1577)))))))) (bvlshr (bvand lt!260437 #b00000000000000000000000011111111) lt!260444)))) (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)) lt!260439) (size!3849 (buf!4301 thiss!1577))))))

(declare-fun lt!260440 () (_ BitVec 32))

(assert (=> b!167277 (= lt!260439 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8130 thiss!1577)))))))) (bvlshr (bvand lt!260437 #b00000000000000000000000011111111) lt!260444)))) (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260440))) (bvshl lt!260437 lt!260440))))))

(assert (=> b!167277 (= lt!260440 (bvsub #b00000000000000000000000000001000 lt!260444))))

(assert (=> b!167277 (= lt!260438 (array!8665 (store (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8130 thiss!1577)))))))) (bvlshr (bvand lt!260437 #b00000000000000000000000011111111) lt!260444)))) (size!3849 (buf!4301 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167277 (= lt!260437 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167277 (= lt!260444 (bvsub (bvadd (currentBit!8130 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167278 () Bool)

(declare-fun array_inv!3590 (array!8664) Bool)

(assert (=> b!167278 (= e!116026 (array_inv!3590 (buf!4301 thiss!1577)))))

(assert (= (and start!36302 res!139255) b!167275))

(assert (= (and b!167275 res!139254) b!167276))

(assert (= (and b!167276 res!139257) b!167277))

(assert (= (and b!167277 (not res!139256)) b!167274))

(assert (= start!36302 b!167278))

(declare-fun m!266111 () Bool)

(assert (=> b!167274 m!266111))

(declare-fun m!266113 () Bool)

(assert (=> b!167278 m!266113))

(declare-fun m!266115 () Bool)

(assert (=> b!167275 m!266115))

(declare-fun m!266117 () Bool)

(assert (=> b!167277 m!266117))

(declare-fun m!266119 () Bool)

(assert (=> b!167277 m!266119))

(declare-fun m!266121 () Bool)

(assert (=> b!167277 m!266121))

(declare-fun m!266123 () Bool)

(assert (=> b!167277 m!266123))

(declare-fun m!266125 () Bool)

(assert (=> b!167277 m!266125))

(declare-fun m!266127 () Bool)

(assert (=> b!167277 m!266127))

(declare-fun m!266129 () Bool)

(assert (=> b!167277 m!266129))

(assert (=> b!167277 m!266119))

(declare-fun m!266131 () Bool)

(assert (=> b!167277 m!266131))

(declare-fun m!266133 () Bool)

(assert (=> b!167277 m!266133))

(declare-fun m!266135 () Bool)

(assert (=> b!167277 m!266135))

(declare-fun m!266137 () Bool)

(assert (=> b!167277 m!266137))

(declare-fun m!266139 () Bool)

(assert (=> b!167277 m!266139))

(declare-fun m!266141 () Bool)

(assert (=> b!167277 m!266141))

(declare-fun m!266143 () Bool)

(assert (=> b!167277 m!266143))

(declare-fun m!266145 () Bool)

(assert (=> b!167277 m!266145))

(declare-fun m!266147 () Bool)

(assert (=> b!167277 m!266147))

(declare-fun m!266149 () Bool)

(assert (=> start!36302 m!266149))

(push 1)

(assert (not b!167277))

(assert (not start!36302))

(assert (not b!167278))

(assert (not b!167275))

(assert (not b!167274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58569 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58569 (= (inv!12 (BitStream!6855 lt!260442 (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)) lt!260444)) (invariant!0 (currentBit!8130 (BitStream!6855 lt!260442 (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)) lt!260444)) (currentByte!8135 (BitStream!6855 lt!260442 (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)) lt!260444)) (size!3849 (buf!4301 (BitStream!6855 lt!260442 (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)) lt!260444)))))))

(declare-fun bs!14541 () Bool)

(assert (= bs!14541 d!58569))

(declare-fun m!266199 () Bool)

(assert (=> bs!14541 m!266199))

(assert (=> b!167274 d!58569))

(declare-fun d!58573 () Bool)

(assert (=> d!58573 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8130 thiss!1577) (currentByte!8135 thiss!1577) (size!3849 (buf!4301 thiss!1577))))))

(declare-fun bs!14542 () Bool)

(assert (= bs!14542 d!58573))

(declare-fun m!266201 () Bool)

(assert (=> bs!14542 m!266201))

(assert (=> start!36302 d!58573))

(declare-fun d!58575 () Bool)

(assert (=> d!58575 (= (array_inv!3590 (buf!4301 thiss!1577)) (bvsge (size!3849 (buf!4301 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!167278 d!58575))

(declare-fun d!58577 () Bool)

(declare-fun e!116060 () Bool)

(assert (=> d!58577 e!116060))

(declare-fun res!139288 () Bool)

(assert (=> d!58577 (=> (not res!139288) (not e!116060))))

(assert (=> d!58577 (= res!139288 (and (bvsge (currentByte!8135 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8135 thiss!1577) (size!3849 (buf!4301 thiss!1577)))))))

(declare-fun lt!260463 () Unit!11646)

(declare-fun choose!247 (array!8664 (_ BitVec 32) (_ BitVec 8)) Unit!11646)

(assert (=> d!58577 (= lt!260463 (choose!247 (buf!4301 thiss!1577) (currentByte!8135 thiss!1577) lt!260446))))

(assert (=> d!58577 (and (bvsle #b00000000000000000000000000000000 (currentByte!8135 thiss!1577)) (bvslt (currentByte!8135 thiss!1577) (size!3849 (buf!4301 thiss!1577))))))

(assert (=> d!58577 (= (arrayUpdatedAtPrefixLemma!286 (buf!4301 thiss!1577) (currentByte!8135 thiss!1577) lt!260446) lt!260463)))

(declare-fun b!167309 () Bool)

(assert (=> b!167309 (= e!116060 (arrayRangesEq!678 (buf!4301 thiss!1577) (array!8665 (store (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577) lt!260446) (size!3849 (buf!4301 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8135 thiss!1577)))))

(assert (= (and d!58577 res!139288) b!167309))

(declare-fun m!266223 () Bool)

(assert (=> d!58577 m!266223))

(assert (=> b!167309 m!266135))

(assert (=> b!167309 m!266147))

(assert (=> b!167277 d!58577))

(declare-fun d!58593 () Bool)

(declare-fun e!116061 () Bool)

(assert (=> d!58593 e!116061))

(declare-fun res!139289 () Bool)

(assert (=> d!58593 (=> (not res!139289) (not e!116061))))

(assert (=> d!58593 (= res!139289 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)) (size!3849 lt!260438))))))

(declare-fun lt!260464 () Unit!11646)

(assert (=> d!58593 (= lt!260464 (choose!247 lt!260438 (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)) lt!260439))))

(assert (=> d!58593 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)) (size!3849 lt!260438)))))

(assert (=> d!58593 (= (arrayUpdatedAtPrefixLemma!286 lt!260438 (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)) lt!260439) lt!260464)))

(declare-fun b!167310 () Bool)

(assert (=> b!167310 (= e!116061 (arrayRangesEq!678 lt!260438 (array!8665 (store (arr!4770 lt!260438) (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577)) lt!260439) (size!3849 lt!260438)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577))))))

(assert (= (and d!58593 res!139289) b!167310))

(declare-fun m!266225 () Bool)

(assert (=> d!58593 m!266225))

(declare-fun m!266227 () Bool)

(assert (=> b!167310 m!266227))

(declare-fun m!266229 () Bool)

(assert (=> b!167310 m!266229))

(assert (=> b!167277 d!58593))

(declare-fun d!58595 () Bool)

(declare-fun res!139294 () Bool)

(declare-fun e!116066 () Bool)

(assert (=> d!58595 (=> res!139294 e!116066)))

(assert (=> d!58595 (= res!139294 (= #b00000000000000000000000000000000 (currentByte!8135 thiss!1577)))))

(assert (=> d!58595 (= (arrayRangesEq!678 (buf!4301 thiss!1577) (array!8665 (store (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577) lt!260446) (size!3849 (buf!4301 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8135 thiss!1577)) e!116066)))

(declare-fun b!167315 () Bool)

(declare-fun e!116067 () Bool)

(assert (=> b!167315 (= e!116066 e!116067)))

(declare-fun res!139295 () Bool)

(assert (=> b!167315 (=> (not res!139295) (not e!116067))))

(assert (=> b!167315 (= res!139295 (= (select (arr!4770 (buf!4301 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4770 (array!8665 (store (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577) lt!260446) (size!3849 (buf!4301 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167316 () Bool)

(assert (=> b!167316 (= e!116067 (arrayRangesEq!678 (buf!4301 thiss!1577) (array!8665 (store (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577) lt!260446) (size!3849 (buf!4301 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8135 thiss!1577)))))

(assert (= (and d!58595 (not res!139294)) b!167315))

(assert (= (and b!167315 res!139295) b!167316))

(declare-fun m!266231 () Bool)

(assert (=> b!167315 m!266231))

(declare-fun m!266233 () Bool)

(assert (=> b!167315 m!266233))

(declare-fun m!266235 () Bool)

(assert (=> b!167316 m!266235))

(assert (=> b!167277 d!58595))

(declare-fun d!58597 () Bool)

(assert (=> d!58597 (= (byteRangesEq!0 (select (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577)) lt!260446 #b00000000000000000000000000000000 lt!260444) (or (= #b00000000000000000000000000000000 lt!260444) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4770 (buf!4301 thiss!1577)) (currentByte!8135 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260444))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!260446) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260444))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14547 () Bool)

(assert (= bs!14547 d!58597))

(declare-fun m!266237 () Bool)

(assert (=> bs!14547 m!266237))

(declare-fun m!266239 () Bool)

(assert (=> bs!14547 m!266239))

(assert (=> b!167277 d!58597))

(declare-fun d!58603 () Bool)

(declare-fun res!139296 () Bool)

(declare-fun e!116068 () Bool)

(assert (=> d!58603 (=> res!139296 e!116068)))

(assert (=> d!58603 (= res!139296 (= #b00000000000000000000000000000000 (currentByte!8135 thiss!1577)))))

(assert (=> d!58603 (= (arrayRangesEq!678 (buf!4301 thiss!1577) lt!260442 #b00000000000000000000000000000000 (currentByte!8135 thiss!1577)) e!116068)))

(declare-fun b!167317 () Bool)

(declare-fun e!116069 () Bool)

(assert (=> b!167317 (= e!116068 e!116069)))

(declare-fun res!139297 () Bool)

(assert (=> b!167317 (=> (not res!139297) (not e!116069))))

(assert (=> b!167317 (= res!139297 (= (select (arr!4770 (buf!4301 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4770 lt!260442) #b00000000000000000000000000000000)))))

(declare-fun b!167318 () Bool)

(assert (=> b!167318 (= e!116069 (arrayRangesEq!678 (buf!4301 thiss!1577) lt!260442 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8135 thiss!1577)))))

(assert (= (and d!58603 (not res!139296)) b!167317))

(assert (= (and b!167317 res!139297) b!167318))

(assert (=> b!167317 m!266231))

(declare-fun m!266241 () Bool)

(assert (=> b!167317 m!266241))

(declare-fun m!266243 () Bool)

(assert (=> b!167318 m!266243))

(assert (=> b!167277 d!58603))

(declare-fun d!58607 () Bool)

(declare-fun res!139298 () Bool)

(declare-fun e!116070 () Bool)

(assert (=> d!58607 (=> res!139298 e!116070)))

(assert (=> d!58607 (= res!139298 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577))))))

(assert (=> d!58607 (= (arrayRangesEq!678 lt!260438 lt!260442 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577))) e!116070)))

(declare-fun b!167319 () Bool)

(declare-fun e!116071 () Bool)

(assert (=> b!167319 (= e!116070 e!116071)))

(declare-fun res!139299 () Bool)

(assert (=> b!167319 (=> (not res!139299) (not e!116071))))

(assert (=> b!167319 (= res!139299 (= (select (arr!4770 lt!260438) #b00000000000000000000000000000000) (select (arr!4770 lt!260442) #b00000000000000000000000000000000)))))

(declare-fun b!167320 () Bool)

(assert (=> b!167320 (= e!116071 (arrayRangesEq!678 lt!260438 lt!260442 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577))))))

(assert (= (and d!58607 (not res!139298)) b!167319))

(assert (= (and b!167319 res!139299) b!167320))

(declare-fun m!266245 () Bool)

(assert (=> b!167319 m!266245))

(assert (=> b!167319 m!266241))

(declare-fun m!266247 () Bool)

(assert (=> b!167320 m!266247))

(assert (=> b!167277 d!58607))

(declare-fun d!58609 () Bool)

(assert (=> d!58609 (arrayRangesEq!678 (buf!4301 thiss!1577) lt!260442 #b00000000000000000000000000000000 (currentByte!8135 thiss!1577))))

(declare-fun lt!260467 () Unit!11646)

(declare-fun choose!248 (array!8664 array!8664 array!8664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11646)

(assert (=> d!58609 (= lt!260467 (choose!248 (buf!4301 thiss!1577) lt!260438 lt!260442 #b00000000000000000000000000000000 (currentByte!8135 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577))))))

(assert (=> d!58609 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!8135 thiss!1577)) (bvsle (currentByte!8135 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577))))))

(assert (=> d!58609 (= (arrayRangesEqTransitive!180 (buf!4301 thiss!1577) lt!260438 lt!260442 #b00000000000000000000000000000000 (currentByte!8135 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8135 thiss!1577))) lt!260467)))

(declare-fun bs!14550 () Bool)

(assert (= bs!14550 d!58609))

(assert (=> bs!14550 m!266141))

(declare-fun m!266263 () Bool)

(assert (=> bs!14550 m!266263))

(assert (=> b!167277 d!58609))

(declare-fun d!58623 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58623 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3849 (buf!4301 thiss!1577))) ((_ sign_extend 32) (currentByte!8135 thiss!1577)) ((_ sign_extend 32) (currentBit!8130 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3849 (buf!4301 thiss!1577))) ((_ sign_extend 32) (currentByte!8135 thiss!1577)) ((_ sign_extend 32) (currentBit!8130 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14552 () Bool)

(assert (= bs!14552 d!58623))

(declare-fun m!266265 () Bool)

(assert (=> bs!14552 m!266265))

(assert (=> b!167275 d!58623))

(push 1)

(assert (not d!58569))

(assert (not d!58609))

(assert (not b!167318))

(assert (not d!58573))

(assert (not b!167309))

(assert (not d!58577))

(assert (not d!58593))

(assert (not b!167320))

(assert (not b!167316))

(assert (not d!58623))

(assert (not b!167310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

