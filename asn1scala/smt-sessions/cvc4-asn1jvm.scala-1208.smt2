; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34338 () Bool)

(assert start!34338)

(declare-fun res!136018 () Bool)

(declare-fun e!112743 () Bool)

(assert (=> start!34338 (=> (not res!136018) (not e!112743))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34338 (= res!136018 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34338 e!112743))

(assert (=> start!34338 true))

(declare-datatypes ((array!8122 0))(
  ( (array!8123 (arr!4560 (Array (_ BitVec 32) (_ BitVec 8))) (size!3639 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6434 0))(
  ( (BitStream!6435 (buf!4091 array!8122) (currentByte!7627 (_ BitVec 32)) (currentBit!7622 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6434)

(declare-fun e!112744 () Bool)

(declare-fun inv!12 (BitStream!6434) Bool)

(assert (=> start!34338 (and (inv!12 thiss!1577) e!112744)))

(declare-fun b!163262 () Bool)

(declare-fun array_inv!3380 (array!8122) Bool)

(assert (=> b!163262 (= e!112744 (array_inv!3380 (buf!4091 thiss!1577)))))

(declare-fun b!163263 () Bool)

(declare-fun e!112745 () Bool)

(assert (=> b!163263 (= e!112743 (not e!112745))))

(declare-fun res!136016 () Bool)

(assert (=> b!163263 (=> res!136016 e!112745)))

(declare-fun lt!256358 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163263 (= res!136016 (not (byteRangesEq!0 (select (arr!4560 (buf!4091 thiss!1577)) (currentByte!7627 thiss!1577)) lt!256358 #b00000000000000000000000000000000 (currentBit!7622 thiss!1577))))))

(declare-fun lt!256359 () array!8122)

(declare-fun arrayRangesEq!573 (array!8122 array!8122 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163263 (arrayRangesEq!573 (buf!4091 thiss!1577) lt!256359 #b00000000000000000000000000000000 (currentByte!7627 thiss!1577))))

(declare-datatypes ((Unit!11310 0))(
  ( (Unit!11311) )
))
(declare-fun lt!256356 () Unit!11310)

(declare-fun arrayUpdatedAtPrefixLemma!181 (array!8122 (_ BitVec 32) (_ BitVec 8)) Unit!11310)

(assert (=> b!163263 (= lt!256356 (arrayUpdatedAtPrefixLemma!181 (buf!4091 thiss!1577) (currentByte!7627 thiss!1577) lt!256358))))

(assert (=> b!163263 (= lt!256359 (array!8123 (store (arr!4560 (buf!4091 thiss!1577)) (currentByte!7627 thiss!1577) lt!256358) (size!3639 (buf!4091 thiss!1577))))))

(declare-fun lt!256355 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163263 (= lt!256358 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4560 (buf!4091 thiss!1577)) (currentByte!7627 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7622 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256355)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256355))))))

(assert (=> b!163263 (= lt!256355 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7622 thiss!1577) nBits!511)))))

(declare-fun b!163264 () Bool)

(declare-fun res!136020 () Bool)

(assert (=> b!163264 (=> (not res!136020) (not e!112743))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163264 (= res!136020 (validate_offset_bits!1 ((_ sign_extend 32) (size!3639 (buf!4091 thiss!1577))) ((_ sign_extend 32) (currentByte!7627 thiss!1577)) ((_ sign_extend 32) (currentBit!7622 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163265 () Bool)

(declare-fun e!112747 () Bool)

(declare-datatypes ((tuple2!14502 0))(
  ( (tuple2!14503 (_1!7842 Unit!11310) (_2!7842 BitStream!6434)) )
))
(declare-fun lt!256357 () tuple2!14502)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163265 (= e!112747 (invariant!0 (currentBit!7622 (_2!7842 lt!256357)) (currentByte!7627 (_2!7842 lt!256357)) (size!3639 (buf!4091 (_2!7842 lt!256357)))))))

(declare-fun b!163266 () Bool)

(assert (=> b!163266 (= e!112745 e!112747)))

(declare-fun res!136017 () Bool)

(assert (=> b!163266 (=> res!136017 e!112747)))

(assert (=> b!163266 (= res!136017 (not (= (size!3639 (buf!4091 thiss!1577)) (size!3639 (buf!4091 (_2!7842 lt!256357))))))))

(declare-fun moveBitIndex!0 (BitStream!6434 (_ BitVec 64)) tuple2!14502)

(assert (=> b!163266 (= lt!256357 (moveBitIndex!0 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163267 () Bool)

(declare-fun res!136019 () Bool)

(assert (=> b!163267 (=> (not res!136019) (not e!112743))))

(assert (=> b!163267 (= res!136019 (bvsle (bvadd (currentBit!7622 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34338 res!136018) b!163264))

(assert (= (and b!163264 res!136020) b!163267))

(assert (= (and b!163267 res!136019) b!163263))

(assert (= (and b!163263 (not res!136016)) b!163266))

(assert (= (and b!163266 (not res!136017)) b!163265))

(assert (= start!34338 b!163262))

(declare-fun m!259211 () Bool)

(assert (=> b!163265 m!259211))

(declare-fun m!259213 () Bool)

(assert (=> b!163266 m!259213))

(declare-fun m!259215 () Bool)

(assert (=> b!163264 m!259215))

(declare-fun m!259217 () Bool)

(assert (=> start!34338 m!259217))

(declare-fun m!259219 () Bool)

(assert (=> b!163263 m!259219))

(declare-fun m!259221 () Bool)

(assert (=> b!163263 m!259221))

(declare-fun m!259223 () Bool)

(assert (=> b!163263 m!259223))

(declare-fun m!259225 () Bool)

(assert (=> b!163263 m!259225))

(declare-fun m!259227 () Bool)

(assert (=> b!163263 m!259227))

(declare-fun m!259229 () Bool)

(assert (=> b!163263 m!259229))

(declare-fun m!259231 () Bool)

(assert (=> b!163263 m!259231))

(assert (=> b!163263 m!259223))

(declare-fun m!259233 () Bool)

(assert (=> b!163263 m!259233))

(declare-fun m!259235 () Bool)

(assert (=> b!163262 m!259235))

(push 1)

(assert (not b!163266))

(assert (not b!163264))

(assert (not b!163262))

(assert (not b!163265))

(assert (not start!34338))

(assert (not b!163263))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56327 () Bool)

(assert (=> d!56327 (= (byteRangesEq!0 (select (arr!4560 (buf!4091 thiss!1577)) (currentByte!7627 thiss!1577)) lt!256358 #b00000000000000000000000000000000 (currentBit!7622 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7622 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4560 (buf!4091 thiss!1577)) (currentByte!7627 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7622 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!256358) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7622 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13955 () Bool)

(assert (= bs!13955 d!56327))

(declare-fun m!259279 () Bool)

(assert (=> bs!13955 m!259279))

(declare-fun m!259281 () Bool)

(assert (=> bs!13955 m!259281))

(assert (=> b!163263 d!56327))

(declare-fun d!56331 () Bool)

(declare-fun res!136049 () Bool)

(declare-fun e!112776 () Bool)

(assert (=> d!56331 (=> res!136049 e!112776)))

(assert (=> d!56331 (= res!136049 (= #b00000000000000000000000000000000 (currentByte!7627 thiss!1577)))))

(assert (=> d!56331 (= (arrayRangesEq!573 (buf!4091 thiss!1577) lt!256359 #b00000000000000000000000000000000 (currentByte!7627 thiss!1577)) e!112776)))

(declare-fun b!163296 () Bool)

(declare-fun e!112777 () Bool)

(assert (=> b!163296 (= e!112776 e!112777)))

(declare-fun res!136050 () Bool)

(assert (=> b!163296 (=> (not res!136050) (not e!112777))))

(assert (=> b!163296 (= res!136050 (= (select (arr!4560 (buf!4091 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4560 lt!256359) #b00000000000000000000000000000000)))))

(declare-fun b!163297 () Bool)

(assert (=> b!163297 (= e!112777 (arrayRangesEq!573 (buf!4091 thiss!1577) lt!256359 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7627 thiss!1577)))))

(assert (= (and d!56331 (not res!136049)) b!163296))

(assert (= (and b!163296 res!136050) b!163297))

(declare-fun m!259283 () Bool)

(assert (=> b!163296 m!259283))

(declare-fun m!259285 () Bool)

(assert (=> b!163296 m!259285))

(declare-fun m!259287 () Bool)

(assert (=> b!163297 m!259287))

(assert (=> b!163263 d!56331))

(declare-fun d!56333 () Bool)

(declare-fun e!112780 () Bool)

(assert (=> d!56333 e!112780))

(declare-fun res!136053 () Bool)

(assert (=> d!56333 (=> (not res!136053) (not e!112780))))

(assert (=> d!56333 (= res!136053 (and (bvsge (currentByte!7627 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7627 thiss!1577) (size!3639 (buf!4091 thiss!1577)))))))

(declare-fun lt!256386 () Unit!11310)

(declare-fun choose!190 (array!8122 (_ BitVec 32) (_ BitVec 8)) Unit!11310)

(assert (=> d!56333 (= lt!256386 (choose!190 (buf!4091 thiss!1577) (currentByte!7627 thiss!1577) lt!256358))))

(assert (=> d!56333 (and (bvsle #b00000000000000000000000000000000 (currentByte!7627 thiss!1577)) (bvslt (currentByte!7627 thiss!1577) (size!3639 (buf!4091 thiss!1577))))))

(assert (=> d!56333 (= (arrayUpdatedAtPrefixLemma!181 (buf!4091 thiss!1577) (currentByte!7627 thiss!1577) lt!256358) lt!256386)))

(declare-fun b!163300 () Bool)

(assert (=> b!163300 (= e!112780 (arrayRangesEq!573 (buf!4091 thiss!1577) (array!8123 (store (arr!4560 (buf!4091 thiss!1577)) (currentByte!7627 thiss!1577) lt!256358) (size!3639 (buf!4091 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7627 thiss!1577)))))

(assert (= (and d!56333 res!136053) b!163300))

(declare-fun m!259289 () Bool)

(assert (=> d!56333 m!259289))

(assert (=> b!163300 m!259231))

(declare-fun m!259291 () Bool)

(assert (=> b!163300 m!259291))

(assert (=> b!163263 d!56333))

(declare-fun d!56335 () Bool)

(assert (=> d!56335 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7622 thiss!1577) (currentByte!7627 thiss!1577) (size!3639 (buf!4091 thiss!1577))))))

(declare-fun bs!13956 () Bool)

(assert (= bs!13956 d!56335))

(declare-fun m!259293 () Bool)

(assert (=> bs!13956 m!259293))

(assert (=> start!34338 d!56335))

(declare-fun d!56337 () Bool)

(assert (=> d!56337 (= (array_inv!3380 (buf!4091 thiss!1577)) (bvsge (size!3639 (buf!4091 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!163262 d!56337))

(declare-fun d!56339 () Bool)

(declare-fun lt!256422 () (_ BitVec 32))

(assert (=> d!56339 (= lt!256422 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!256417 () (_ BitVec 32))

(assert (=> d!56339 (= lt!256417 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!112792 () Bool)

(assert (=> d!56339 e!112792))

(declare-fun res!136065 () Bool)

(assert (=> d!56339 (=> (not res!136065) (not e!112792))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6434 (_ BitVec 64)) Bool)

(assert (=> d!56339 (= res!136065 (moveBitIndexPrecond!0 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11324 () Unit!11310)

(declare-fun Unit!11325 () Unit!11310)

(declare-fun Unit!11326 () Unit!11310)

(assert (=> d!56339 (= (moveBitIndex!0 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) lt!256422) #b00000000000000000000000000000000) (tuple2!14503 Unit!11324 (BitStream!6435 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) (bvsub (bvadd (currentByte!7627 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) lt!256417) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!256422 (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) lt!256422) #b00000000000000000000000000001000) (tuple2!14503 Unit!11325 (BitStream!6435 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) (bvadd (currentByte!7627 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) lt!256417 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) lt!256422) #b00000000000000000000000000001000))) (tuple2!14503 Unit!11326 (BitStream!6435 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) (bvadd (currentByte!7627 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) lt!256417) (bvadd (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) lt!256422))))))))

(declare-fun b!163311 () Bool)

(declare-fun e!112791 () Bool)

(assert (=> b!163311 (= e!112792 e!112791)))

(declare-fun res!136064 () Bool)

(assert (=> b!163311 (=> (not res!136064) (not e!112791))))

(declare-fun lt!256421 () tuple2!14502)

(declare-fun lt!256420 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163311 (= res!136064 (= (bvadd lt!256420 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3639 (buf!4091 (_2!7842 lt!256421))) (currentByte!7627 (_2!7842 lt!256421)) (currentBit!7622 (_2!7842 lt!256421)))))))

(assert (=> b!163311 (or (not (= (bvand lt!256420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!256420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!256420 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!163311 (= lt!256420 (bitIndex!0 (size!3639 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))) (currentByte!7627 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))))))

(declare-fun lt!256418 () (_ BitVec 32))

(declare-fun lt!256419 () (_ BitVec 32))

(declare-fun Unit!11327 () Unit!11310)

(declare-fun Unit!11328 () Unit!11310)

(declare-fun Unit!11329 () Unit!11310)

(assert (=> b!163311 (= lt!256421 (ite (bvslt (bvadd (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) lt!256419) #b00000000000000000000000000000000) (tuple2!14503 Unit!11327 (BitStream!6435 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) (bvsub (bvadd (currentByte!7627 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) lt!256418) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!256419 (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) lt!256419) #b00000000000000000000000000001000) (tuple2!14503 Unit!11328 (BitStream!6435 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) (bvadd (currentByte!7627 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) lt!256418 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) lt!256419) #b00000000000000000000000000001000))) (tuple2!14503 Unit!11329 (BitStream!6435 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) (bvadd (currentByte!7627 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) lt!256418) (bvadd (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) lt!256419))))))))

(assert (=> b!163311 (= lt!256419 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163311 (= lt!256418 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!163312 () Bool)

(assert (=> b!163312 (= e!112791 (and (= (size!3639 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))) (size!3639 (buf!4091 (_2!7842 lt!256421)))) (= (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) (buf!4091 (_2!7842 lt!256421)))))))

(assert (= (and d!56339 res!136065) b!163311))

(assert (= (and b!163311 res!136064) b!163312))

(declare-fun m!259301 () Bool)

(assert (=> d!56339 m!259301))

(declare-fun m!259303 () Bool)

(assert (=> b!163311 m!259303))

(declare-fun m!259305 () Bool)

(assert (=> b!163311 m!259305))

(assert (=> b!163266 d!56339))

(declare-fun d!56343 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56343 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3639 (buf!4091 thiss!1577))) ((_ sign_extend 32) (currentByte!7627 thiss!1577)) ((_ sign_extend 32) (currentBit!7622 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3639 (buf!4091 thiss!1577))) ((_ sign_extend 32) (currentByte!7627 thiss!1577)) ((_ sign_extend 32) (currentBit!7622 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13957 () Bool)

(assert (= bs!13957 d!56343))

(declare-fun m!259307 () Bool)

(assert (=> bs!13957 m!259307))

(assert (=> b!163264 d!56343))

(declare-fun d!56345 () Bool)

(assert (=> d!56345 (= (invariant!0 (currentBit!7622 (_2!7842 lt!256357)) (currentByte!7627 (_2!7842 lt!256357)) (size!3639 (buf!4091 (_2!7842 lt!256357)))) (and (bvsge (currentBit!7622 (_2!7842 lt!256357)) #b00000000000000000000000000000000) (bvslt (currentBit!7622 (_2!7842 lt!256357)) #b00000000000000000000000000001000) (bvsge (currentByte!7627 (_2!7842 lt!256357)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7627 (_2!7842 lt!256357)) (size!3639 (buf!4091 (_2!7842 lt!256357)))) (and (= (currentBit!7622 (_2!7842 lt!256357)) #b00000000000000000000000000000000) (= (currentByte!7627 (_2!7842 lt!256357)) (size!3639 (buf!4091 (_2!7842 lt!256357))))))))))

(assert (=> b!163265 d!56345))

(push 1)

(assert (not b!163300))

(assert (not d!56343))

(assert (not b!163311))

(assert (not d!56339))

(assert (not d!56335))

(assert (not b!163297))

(assert (not d!56333))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56363 () Bool)

(declare-fun res!136081 () Bool)

(declare-fun e!112804 () Bool)

(assert (=> d!56363 (=> res!136081 e!112804)))

(assert (=> d!56363 (= res!136081 (= #b00000000000000000000000000000000 (currentByte!7627 thiss!1577)))))

(assert (=> d!56363 (= (arrayRangesEq!573 (buf!4091 thiss!1577) (array!8123 (store (arr!4560 (buf!4091 thiss!1577)) (currentByte!7627 thiss!1577) lt!256358) (size!3639 (buf!4091 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7627 thiss!1577)) e!112804)))

(declare-fun b!163329 () Bool)

(declare-fun e!112805 () Bool)

(assert (=> b!163329 (= e!112804 e!112805)))

(declare-fun res!136082 () Bool)

(assert (=> b!163329 (=> (not res!136082) (not e!112805))))

(assert (=> b!163329 (= res!136082 (= (select (arr!4560 (buf!4091 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4560 (array!8123 (store (arr!4560 (buf!4091 thiss!1577)) (currentByte!7627 thiss!1577) lt!256358) (size!3639 (buf!4091 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!163330 () Bool)

(assert (=> b!163330 (= e!112805 (arrayRangesEq!573 (buf!4091 thiss!1577) (array!8123 (store (arr!4560 (buf!4091 thiss!1577)) (currentByte!7627 thiss!1577) lt!256358) (size!3639 (buf!4091 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7627 thiss!1577)))))

(assert (= (and d!56363 (not res!136081)) b!163329))

(assert (= (and b!163329 res!136082) b!163330))

(assert (=> b!163329 m!259283))

(declare-fun m!259327 () Bool)

(assert (=> b!163329 m!259327))

(declare-fun m!259329 () Bool)

(assert (=> b!163330 m!259329))

(assert (=> b!163300 d!56363))

(declare-fun d!56365 () Bool)

(assert (=> d!56365 (= (invariant!0 (currentBit!7622 thiss!1577) (currentByte!7627 thiss!1577) (size!3639 (buf!4091 thiss!1577))) (and (bvsge (currentBit!7622 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7622 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7627 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7627 thiss!1577) (size!3639 (buf!4091 thiss!1577))) (and (= (currentBit!7622 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7627 thiss!1577) (size!3639 (buf!4091 thiss!1577)))))))))

(assert (=> d!56335 d!56365))

(declare-fun d!56367 () Bool)

(assert (=> d!56367 (arrayRangesEq!573 (buf!4091 thiss!1577) (array!8123 (store (arr!4560 (buf!4091 thiss!1577)) (currentByte!7627 thiss!1577) lt!256358) (size!3639 (buf!4091 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7627 thiss!1577))))

(assert (=> d!56367 true))

(declare-fun _$8!163 () Unit!11310)

(assert (=> d!56367 (= (choose!190 (buf!4091 thiss!1577) (currentByte!7627 thiss!1577) lt!256358) _$8!163)))

(declare-fun bs!13959 () Bool)

(assert (= bs!13959 d!56367))

(assert (=> bs!13959 m!259231))

(assert (=> bs!13959 m!259291))

(assert (=> d!56333 d!56367))

(declare-fun d!56369 () Bool)

(declare-fun res!136083 () Bool)

(declare-fun e!112806 () Bool)

(assert (=> d!56369 (=> res!136083 e!112806)))

(assert (=> d!56369 (= res!136083 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7627 thiss!1577)))))

(assert (=> d!56369 (= (arrayRangesEq!573 (buf!4091 thiss!1577) lt!256359 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7627 thiss!1577)) e!112806)))

(declare-fun b!163331 () Bool)

(declare-fun e!112807 () Bool)

(assert (=> b!163331 (= e!112806 e!112807)))

(declare-fun res!136084 () Bool)

(assert (=> b!163331 (=> (not res!136084) (not e!112807))))

(assert (=> b!163331 (= res!136084 (= (select (arr!4560 (buf!4091 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4560 lt!256359) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!163332 () Bool)

(assert (=> b!163332 (= e!112807 (arrayRangesEq!573 (buf!4091 thiss!1577) lt!256359 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7627 thiss!1577)))))

(assert (= (and d!56369 (not res!136083)) b!163331))

(assert (= (and b!163331 res!136084) b!163332))

(declare-fun m!259331 () Bool)

(assert (=> b!163331 m!259331))

(declare-fun m!259333 () Bool)

(assert (=> b!163331 m!259333))

(declare-fun m!259335 () Bool)

(assert (=> b!163332 m!259335))

(assert (=> b!163297 d!56369))

(declare-fun d!56371 () Bool)

(declare-fun res!136087 () Bool)

(declare-fun e!112810 () Bool)

(assert (=> d!56371 (=> (not res!136087) (not e!112810))))

(assert (=> d!56371 (= res!136087 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3639 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))))) ((_ sign_extend 32) nBits!511)) (bvsle ((_ sign_extend 32) nBits!511) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3639 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))))))))))

(assert (=> d!56371 (= (moveBitIndexPrecond!0 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)) ((_ sign_extend 32) nBits!511)) e!112810)))

(declare-fun lt!256452 () (_ BitVec 64))

(declare-fun b!163336 () Bool)

(assert (=> b!163336 (= e!112810 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256452) (bvsle lt!256452 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3639 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))))))))))

(assert (=> b!163336 (= lt!256452 (bvadd (bitIndex!0 (size!3639 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))) (currentByte!7627 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))) ((_ sign_extend 32) nBits!511)))))

(assert (= (and d!56371 res!136087) b!163336))

(assert (=> b!163336 m!259305))

(assert (=> d!56339 d!56371))

(declare-fun d!56373 () Bool)

(assert (=> d!56373 (= (remainingBits!0 ((_ sign_extend 32) (size!3639 (buf!4091 thiss!1577))) ((_ sign_extend 32) (currentByte!7627 thiss!1577)) ((_ sign_extend 32) (currentBit!7622 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3639 (buf!4091 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7627 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7622 thiss!1577)))))))

(assert (=> d!56343 d!56373))

(declare-fun d!56375 () Bool)

(declare-fun e!112813 () Bool)

(assert (=> d!56375 e!112813))

(declare-fun res!136092 () Bool)

(assert (=> d!56375 (=> (not res!136092) (not e!112813))))

(declare-fun lt!256467 () (_ BitVec 64))

(declare-fun lt!256466 () (_ BitVec 64))

(declare-fun lt!256470 () (_ BitVec 64))

(assert (=> d!56375 (= res!136092 (= lt!256470 (bvsub lt!256466 lt!256467)))))

(assert (=> d!56375 (or (= (bvand lt!256466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256466 lt!256467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56375 (= lt!256467 (remainingBits!0 ((_ sign_extend 32) (size!3639 (buf!4091 (_2!7842 lt!256421)))) ((_ sign_extend 32) (currentByte!7627 (_2!7842 lt!256421))) ((_ sign_extend 32) (currentBit!7622 (_2!7842 lt!256421)))))))

(declare-fun lt!256465 () (_ BitVec 64))

(declare-fun lt!256468 () (_ BitVec 64))

(assert (=> d!56375 (= lt!256466 (bvmul lt!256465 lt!256468))))

(assert (=> d!56375 (or (= lt!256465 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!256468 (bvsdiv (bvmul lt!256465 lt!256468) lt!256465)))))

(assert (=> d!56375 (= lt!256468 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56375 (= lt!256465 ((_ sign_extend 32) (size!3639 (buf!4091 (_2!7842 lt!256421)))))))

(assert (=> d!56375 (= lt!256470 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7627 (_2!7842 lt!256421))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7622 (_2!7842 lt!256421)))))))

(assert (=> d!56375 (invariant!0 (currentBit!7622 (_2!7842 lt!256421)) (currentByte!7627 (_2!7842 lt!256421)) (size!3639 (buf!4091 (_2!7842 lt!256421))))))

(assert (=> d!56375 (= (bitIndex!0 (size!3639 (buf!4091 (_2!7842 lt!256421))) (currentByte!7627 (_2!7842 lt!256421)) (currentBit!7622 (_2!7842 lt!256421))) lt!256470)))

(declare-fun b!163341 () Bool)

(declare-fun res!136093 () Bool)

(assert (=> b!163341 (=> (not res!136093) (not e!112813))))

(assert (=> b!163341 (= res!136093 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256470))))

(declare-fun b!163342 () Bool)

(declare-fun lt!256469 () (_ BitVec 64))

(assert (=> b!163342 (= e!112813 (bvsle lt!256470 (bvmul lt!256469 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163342 (or (= lt!256469 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!256469 #b0000000000000000000000000000000000000000000000000000000000001000) lt!256469)))))

(assert (=> b!163342 (= lt!256469 ((_ sign_extend 32) (size!3639 (buf!4091 (_2!7842 lt!256421)))))))

(assert (= (and d!56375 res!136092) b!163341))

(assert (= (and b!163341 res!136093) b!163342))

(declare-fun m!259337 () Bool)

(assert (=> d!56375 m!259337))

(declare-fun m!259339 () Bool)

(assert (=> d!56375 m!259339))

(assert (=> b!163311 d!56375))

(declare-fun d!56377 () Bool)

(declare-fun e!112814 () Bool)

(assert (=> d!56377 e!112814))

(declare-fun res!136094 () Bool)

(assert (=> d!56377 (=> (not res!136094) (not e!112814))))

(declare-fun lt!256472 () (_ BitVec 64))

(declare-fun lt!256473 () (_ BitVec 64))

(declare-fun lt!256476 () (_ BitVec 64))

(assert (=> d!56377 (= res!136094 (= lt!256476 (bvsub lt!256472 lt!256473)))))

(assert (=> d!56377 (or (= (bvand lt!256472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256473 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256472 lt!256473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56377 (= lt!256473 (remainingBits!0 ((_ sign_extend 32) (size!3639 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))))) ((_ sign_extend 32) (currentByte!7627 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))) ((_ sign_extend 32) (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))))))))

(declare-fun lt!256471 () (_ BitVec 64))

(declare-fun lt!256474 () (_ BitVec 64))

(assert (=> d!56377 (= lt!256472 (bvmul lt!256471 lt!256474))))

(assert (=> d!56377 (or (= lt!256471 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!256474 (bvsdiv (bvmul lt!256471 lt!256474) lt!256471)))))

(assert (=> d!56377 (= lt!256474 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56377 (= lt!256471 ((_ sign_extend 32) (size!3639 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))))))))

(assert (=> d!56377 (= lt!256476 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7627 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))))))))

(assert (=> d!56377 (invariant!0 (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) (currentByte!7627 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) (size!3639 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))))))

(assert (=> d!56377 (= (bitIndex!0 (size!3639 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))) (currentByte!7627 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))) (currentBit!7622 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577)))) lt!256476)))

(declare-fun b!163343 () Bool)

(declare-fun res!136095 () Bool)

(assert (=> b!163343 (=> (not res!136095) (not e!112814))))

(assert (=> b!163343 (= res!136095 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256476))))

(declare-fun b!163344 () Bool)

(declare-fun lt!256475 () (_ BitVec 64))

(assert (=> b!163344 (= e!112814 (bvsle lt!256476 (bvmul lt!256475 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163344 (or (= lt!256475 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!256475 #b0000000000000000000000000000000000000000000000000000000000001000) lt!256475)))))

(assert (=> b!163344 (= lt!256475 ((_ sign_extend 32) (size!3639 (buf!4091 (BitStream!6435 lt!256359 (currentByte!7627 thiss!1577) (currentBit!7622 thiss!1577))))))))

(assert (= (and d!56377 res!136094) b!163343))

(assert (= (and b!163343 res!136095) b!163344))

(declare-fun m!259341 () Bool)

(assert (=> d!56377 m!259341))

(declare-fun m!259343 () Bool)

(assert (=> d!56377 m!259343))

(assert (=> b!163311 d!56377))

(push 1)

(assert (not b!163330))

(assert (not b!163332))

(assert (not d!56375))

(assert (not d!56367))

(assert (not d!56377))

(assert (not b!163336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

