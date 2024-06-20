; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34336 () Bool)

(assert start!34336)

(declare-fun res!136005 () Bool)

(declare-fun e!112728 () Bool)

(assert (=> start!34336 (=> (not res!136005) (not e!112728))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34336 (= res!136005 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34336 e!112728))

(assert (=> start!34336 true))

(declare-datatypes ((array!8120 0))(
  ( (array!8121 (arr!4559 (Array (_ BitVec 32) (_ BitVec 8))) (size!3638 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6432 0))(
  ( (BitStream!6433 (buf!4090 array!8120) (currentByte!7626 (_ BitVec 32)) (currentBit!7621 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6432)

(declare-fun e!112731 () Bool)

(declare-fun inv!12 (BitStream!6432) Bool)

(assert (=> start!34336 (and (inv!12 thiss!1577) e!112731)))

(declare-fun b!163244 () Bool)

(declare-fun array_inv!3379 (array!8120) Bool)

(assert (=> b!163244 (= e!112731 (array_inv!3379 (buf!4090 thiss!1577)))))

(declare-fun b!163245 () Bool)

(declare-fun res!136002 () Bool)

(assert (=> b!163245 (=> (not res!136002) (not e!112728))))

(assert (=> b!163245 (= res!136002 (bvsle (bvadd (currentBit!7621 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163246 () Bool)

(declare-fun e!112732 () Bool)

(assert (=> b!163246 (= e!112728 (not e!112732))))

(declare-fun res!136003 () Bool)

(assert (=> b!163246 (=> res!136003 e!112732)))

(declare-fun lt!256340 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163246 (= res!136003 (not (byteRangesEq!0 (select (arr!4559 (buf!4090 thiss!1577)) (currentByte!7626 thiss!1577)) lt!256340 #b00000000000000000000000000000000 (currentBit!7621 thiss!1577))))))

(declare-fun lt!256342 () array!8120)

(declare-fun arrayRangesEq!572 (array!8120 array!8120 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163246 (arrayRangesEq!572 (buf!4090 thiss!1577) lt!256342 #b00000000000000000000000000000000 (currentByte!7626 thiss!1577))))

(declare-datatypes ((Unit!11308 0))(
  ( (Unit!11309) )
))
(declare-fun lt!256343 () Unit!11308)

(declare-fun arrayUpdatedAtPrefixLemma!180 (array!8120 (_ BitVec 32) (_ BitVec 8)) Unit!11308)

(assert (=> b!163246 (= lt!256343 (arrayUpdatedAtPrefixLemma!180 (buf!4090 thiss!1577) (currentByte!7626 thiss!1577) lt!256340))))

(assert (=> b!163246 (= lt!256342 (array!8121 (store (arr!4559 (buf!4090 thiss!1577)) (currentByte!7626 thiss!1577) lt!256340) (size!3638 (buf!4090 thiss!1577))))))

(declare-fun lt!256341 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163246 (= lt!256340 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4559 (buf!4090 thiss!1577)) (currentByte!7626 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7621 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256341)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256341))))))

(assert (=> b!163246 (= lt!256341 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7621 thiss!1577) nBits!511)))))

(declare-fun b!163247 () Bool)

(declare-fun res!136004 () Bool)

(assert (=> b!163247 (=> (not res!136004) (not e!112728))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163247 (= res!136004 (validate_offset_bits!1 ((_ sign_extend 32) (size!3638 (buf!4090 thiss!1577))) ((_ sign_extend 32) (currentByte!7626 thiss!1577)) ((_ sign_extend 32) (currentBit!7621 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163248 () Bool)

(declare-fun e!112730 () Bool)

(declare-datatypes ((tuple2!14500 0))(
  ( (tuple2!14501 (_1!7841 Unit!11308) (_2!7841 BitStream!6432)) )
))
(declare-fun lt!256344 () tuple2!14500)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163248 (= e!112730 (invariant!0 (currentBit!7621 (_2!7841 lt!256344)) (currentByte!7626 (_2!7841 lt!256344)) (size!3638 (buf!4090 (_2!7841 lt!256344)))))))

(declare-fun b!163249 () Bool)

(assert (=> b!163249 (= e!112732 e!112730)))

(declare-fun res!136001 () Bool)

(assert (=> b!163249 (=> res!136001 e!112730)))

(assert (=> b!163249 (= res!136001 (not (= (size!3638 (buf!4090 thiss!1577)) (size!3638 (buf!4090 (_2!7841 lt!256344))))))))

(declare-fun moveBitIndex!0 (BitStream!6432 (_ BitVec 64)) tuple2!14500)

(assert (=> b!163249 (= lt!256344 (moveBitIndex!0 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34336 res!136005) b!163247))

(assert (= (and b!163247 res!136004) b!163245))

(assert (= (and b!163245 res!136002) b!163246))

(assert (= (and b!163246 (not res!136003)) b!163249))

(assert (= (and b!163249 (not res!136001)) b!163248))

(assert (= start!34336 b!163244))

(declare-fun m!259185 () Bool)

(assert (=> b!163248 m!259185))

(declare-fun m!259187 () Bool)

(assert (=> start!34336 m!259187))

(declare-fun m!259189 () Bool)

(assert (=> b!163249 m!259189))

(declare-fun m!259191 () Bool)

(assert (=> b!163244 m!259191))

(declare-fun m!259193 () Bool)

(assert (=> b!163247 m!259193))

(declare-fun m!259195 () Bool)

(assert (=> b!163246 m!259195))

(declare-fun m!259197 () Bool)

(assert (=> b!163246 m!259197))

(declare-fun m!259199 () Bool)

(assert (=> b!163246 m!259199))

(declare-fun m!259201 () Bool)

(assert (=> b!163246 m!259201))

(assert (=> b!163246 m!259197))

(declare-fun m!259203 () Bool)

(assert (=> b!163246 m!259203))

(declare-fun m!259205 () Bool)

(assert (=> b!163246 m!259205))

(declare-fun m!259207 () Bool)

(assert (=> b!163246 m!259207))

(declare-fun m!259209 () Bool)

(assert (=> b!163246 m!259209))

(check-sat (not start!34336) (not b!163247) (not b!163246) (not b!163249) (not b!163248) (not b!163244))
(check-sat)
(get-model)

(declare-fun d!56293 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56293 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3638 (buf!4090 thiss!1577))) ((_ sign_extend 32) (currentByte!7626 thiss!1577)) ((_ sign_extend 32) (currentBit!7621 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3638 (buf!4090 thiss!1577))) ((_ sign_extend 32) (currentByte!7626 thiss!1577)) ((_ sign_extend 32) (currentBit!7621 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13949 () Bool)

(assert (= bs!13949 d!56293))

(declare-fun m!259237 () Bool)

(assert (=> bs!13949 m!259237))

(assert (=> b!163247 d!56293))

(declare-fun d!56295 () Bool)

(assert (=> d!56295 (= (invariant!0 (currentBit!7621 (_2!7841 lt!256344)) (currentByte!7626 (_2!7841 lt!256344)) (size!3638 (buf!4090 (_2!7841 lt!256344)))) (and (bvsge (currentBit!7621 (_2!7841 lt!256344)) #b00000000000000000000000000000000) (bvslt (currentBit!7621 (_2!7841 lt!256344)) #b00000000000000000000000000001000) (bvsge (currentByte!7626 (_2!7841 lt!256344)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7626 (_2!7841 lt!256344)) (size!3638 (buf!4090 (_2!7841 lt!256344)))) (and (= (currentBit!7621 (_2!7841 lt!256344)) #b00000000000000000000000000000000) (= (currentByte!7626 (_2!7841 lt!256344)) (size!3638 (buf!4090 (_2!7841 lt!256344))))))))))

(assert (=> b!163248 d!56295))

(declare-fun d!56297 () Bool)

(assert (=> d!56297 (= (byteRangesEq!0 (select (arr!4559 (buf!4090 thiss!1577)) (currentByte!7626 thiss!1577)) lt!256340 #b00000000000000000000000000000000 (currentBit!7621 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7621 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4559 (buf!4090 thiss!1577)) (currentByte!7626 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7621 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!256340) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7621 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13950 () Bool)

(assert (= bs!13950 d!56297))

(declare-fun m!259239 () Bool)

(assert (=> bs!13950 m!259239))

(declare-fun m!259241 () Bool)

(assert (=> bs!13950 m!259241))

(assert (=> b!163246 d!56297))

(declare-fun d!56299 () Bool)

(declare-fun res!136025 () Bool)

(declare-fun e!112752 () Bool)

(assert (=> d!56299 (=> res!136025 e!112752)))

(assert (=> d!56299 (= res!136025 (= #b00000000000000000000000000000000 (currentByte!7626 thiss!1577)))))

(assert (=> d!56299 (= (arrayRangesEq!572 (buf!4090 thiss!1577) lt!256342 #b00000000000000000000000000000000 (currentByte!7626 thiss!1577)) e!112752)))

(declare-fun b!163272 () Bool)

(declare-fun e!112753 () Bool)

(assert (=> b!163272 (= e!112752 e!112753)))

(declare-fun res!136026 () Bool)

(assert (=> b!163272 (=> (not res!136026) (not e!112753))))

(assert (=> b!163272 (= res!136026 (= (select (arr!4559 (buf!4090 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4559 lt!256342) #b00000000000000000000000000000000)))))

(declare-fun b!163273 () Bool)

(assert (=> b!163273 (= e!112753 (arrayRangesEq!572 (buf!4090 thiss!1577) lt!256342 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7626 thiss!1577)))))

(assert (= (and d!56299 (not res!136025)) b!163272))

(assert (= (and b!163272 res!136026) b!163273))

(declare-fun m!259243 () Bool)

(assert (=> b!163272 m!259243))

(declare-fun m!259245 () Bool)

(assert (=> b!163272 m!259245))

(declare-fun m!259247 () Bool)

(assert (=> b!163273 m!259247))

(assert (=> b!163246 d!56299))

(declare-fun d!56301 () Bool)

(declare-fun e!112756 () Bool)

(assert (=> d!56301 e!112756))

(declare-fun res!136029 () Bool)

(assert (=> d!56301 (=> (not res!136029) (not e!112756))))

(assert (=> d!56301 (= res!136029 (and (bvsge (currentByte!7626 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7626 thiss!1577) (size!3638 (buf!4090 thiss!1577)))))))

(declare-fun lt!256362 () Unit!11308)

(declare-fun choose!188 (array!8120 (_ BitVec 32) (_ BitVec 8)) Unit!11308)

(assert (=> d!56301 (= lt!256362 (choose!188 (buf!4090 thiss!1577) (currentByte!7626 thiss!1577) lt!256340))))

(assert (=> d!56301 (and (bvsle #b00000000000000000000000000000000 (currentByte!7626 thiss!1577)) (bvslt (currentByte!7626 thiss!1577) (size!3638 (buf!4090 thiss!1577))))))

(assert (=> d!56301 (= (arrayUpdatedAtPrefixLemma!180 (buf!4090 thiss!1577) (currentByte!7626 thiss!1577) lt!256340) lt!256362)))

(declare-fun b!163276 () Bool)

(assert (=> b!163276 (= e!112756 (arrayRangesEq!572 (buf!4090 thiss!1577) (array!8121 (store (arr!4559 (buf!4090 thiss!1577)) (currentByte!7626 thiss!1577) lt!256340) (size!3638 (buf!4090 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7626 thiss!1577)))))

(assert (= (and d!56301 res!136029) b!163276))

(declare-fun m!259249 () Bool)

(assert (=> d!56301 m!259249))

(assert (=> b!163276 m!259199))

(declare-fun m!259251 () Bool)

(assert (=> b!163276 m!259251))

(assert (=> b!163246 d!56301))

(declare-fun d!56303 () Bool)

(assert (=> d!56303 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7621 thiss!1577) (currentByte!7626 thiss!1577) (size!3638 (buf!4090 thiss!1577))))))

(declare-fun bs!13951 () Bool)

(assert (= bs!13951 d!56303))

(declare-fun m!259253 () Bool)

(assert (=> bs!13951 m!259253))

(assert (=> start!34336 d!56303))

(declare-fun d!56305 () Bool)

(assert (=> d!56305 (= (array_inv!3379 (buf!4090 thiss!1577)) (bvsge (size!3638 (buf!4090 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!163244 d!56305))

(declare-fun d!56307 () Bool)

(declare-fun lt!256379 () (_ BitVec 32))

(assert (=> d!56307 (= lt!256379 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!256377 () (_ BitVec 32))

(assert (=> d!56307 (= lt!256377 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!112761 () Bool)

(assert (=> d!56307 e!112761))

(declare-fun res!136035 () Bool)

(assert (=> d!56307 (=> (not res!136035) (not e!112761))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6432 (_ BitVec 64)) Bool)

(assert (=> d!56307 (= res!136035 (moveBitIndexPrecond!0 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11312 () Unit!11308)

(declare-fun Unit!11313 () Unit!11308)

(declare-fun Unit!11314 () Unit!11308)

(assert (=> d!56307 (= (moveBitIndex!0 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) lt!256379) #b00000000000000000000000000000000) (tuple2!14501 Unit!11312 (BitStream!6433 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) (bvsub (bvadd (currentByte!7626 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) lt!256377) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!256379 (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) lt!256379) #b00000000000000000000000000001000) (tuple2!14501 Unit!11313 (BitStream!6433 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) (bvadd (currentByte!7626 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) lt!256377 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) lt!256379) #b00000000000000000000000000001000))) (tuple2!14501 Unit!11314 (BitStream!6433 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) (bvadd (currentByte!7626 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) lt!256377) (bvadd (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) lt!256379))))))))

(declare-fun b!163281 () Bool)

(declare-fun e!112762 () Bool)

(assert (=> b!163281 (= e!112761 e!112762)))

(declare-fun res!136034 () Bool)

(assert (=> b!163281 (=> (not res!136034) (not e!112762))))

(declare-fun lt!256380 () tuple2!14500)

(declare-fun lt!256375 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163281 (= res!136034 (= (bvadd lt!256375 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3638 (buf!4090 (_2!7841 lt!256380))) (currentByte!7626 (_2!7841 lt!256380)) (currentBit!7621 (_2!7841 lt!256380)))))))

(assert (=> b!163281 (or (not (= (bvand lt!256375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!256375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!256375 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!163281 (= lt!256375 (bitIndex!0 (size!3638 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))) (currentByte!7626 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))))))

(declare-fun lt!256378 () (_ BitVec 32))

(declare-fun lt!256376 () (_ BitVec 32))

(declare-fun Unit!11315 () Unit!11308)

(declare-fun Unit!11316 () Unit!11308)

(declare-fun Unit!11317 () Unit!11308)

(assert (=> b!163281 (= lt!256380 (ite (bvslt (bvadd (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) lt!256378) #b00000000000000000000000000000000) (tuple2!14501 Unit!11315 (BitStream!6433 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) (bvsub (bvadd (currentByte!7626 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) lt!256376) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!256378 (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) lt!256378) #b00000000000000000000000000001000) (tuple2!14501 Unit!11316 (BitStream!6433 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) (bvadd (currentByte!7626 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) lt!256376 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) lt!256378) #b00000000000000000000000000001000))) (tuple2!14501 Unit!11317 (BitStream!6433 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) (bvadd (currentByte!7626 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) lt!256376) (bvadd (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) lt!256378))))))))

(assert (=> b!163281 (= lt!256378 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163281 (= lt!256376 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!163282 () Bool)

(assert (=> b!163282 (= e!112762 (and (= (size!3638 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))) (size!3638 (buf!4090 (_2!7841 lt!256380)))) (= (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) (buf!4090 (_2!7841 lt!256380)))))))

(assert (= (and d!56307 res!136035) b!163281))

(assert (= (and b!163281 res!136034) b!163282))

(declare-fun m!259261 () Bool)

(assert (=> d!56307 m!259261))

(declare-fun m!259263 () Bool)

(assert (=> b!163281 m!259263))

(declare-fun m!259265 () Bool)

(assert (=> b!163281 m!259265))

(assert (=> b!163249 d!56307))

(check-sat (not b!163273) (not d!56301) (not d!56307) (not b!163276) (not d!56303) (not b!163281) (not d!56293))
(check-sat)
(get-model)

(declare-fun d!56347 () Bool)

(declare-fun e!112795 () Bool)

(assert (=> d!56347 e!112795))

(declare-fun res!136070 () Bool)

(assert (=> d!56347 (=> (not res!136070) (not e!112795))))

(declare-fun lt!256438 () (_ BitVec 64))

(declare-fun lt!256435 () (_ BitVec 64))

(declare-fun lt!256437 () (_ BitVec 64))

(assert (=> d!56347 (= res!136070 (= lt!256437 (bvsub lt!256435 lt!256438)))))

(assert (=> d!56347 (or (= (bvand lt!256435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256438 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256435 lt!256438) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56347 (= lt!256438 (remainingBits!0 ((_ sign_extend 32) (size!3638 (buf!4090 (_2!7841 lt!256380)))) ((_ sign_extend 32) (currentByte!7626 (_2!7841 lt!256380))) ((_ sign_extend 32) (currentBit!7621 (_2!7841 lt!256380)))))))

(declare-fun lt!256440 () (_ BitVec 64))

(declare-fun lt!256436 () (_ BitVec 64))

(assert (=> d!56347 (= lt!256435 (bvmul lt!256440 lt!256436))))

(assert (=> d!56347 (or (= lt!256440 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!256436 (bvsdiv (bvmul lt!256440 lt!256436) lt!256440)))))

(assert (=> d!56347 (= lt!256436 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56347 (= lt!256440 ((_ sign_extend 32) (size!3638 (buf!4090 (_2!7841 lt!256380)))))))

(assert (=> d!56347 (= lt!256437 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7626 (_2!7841 lt!256380))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7621 (_2!7841 lt!256380)))))))

(assert (=> d!56347 (invariant!0 (currentBit!7621 (_2!7841 lt!256380)) (currentByte!7626 (_2!7841 lt!256380)) (size!3638 (buf!4090 (_2!7841 lt!256380))))))

(assert (=> d!56347 (= (bitIndex!0 (size!3638 (buf!4090 (_2!7841 lt!256380))) (currentByte!7626 (_2!7841 lt!256380)) (currentBit!7621 (_2!7841 lt!256380))) lt!256437)))

(declare-fun b!163317 () Bool)

(declare-fun res!136071 () Bool)

(assert (=> b!163317 (=> (not res!136071) (not e!112795))))

(assert (=> b!163317 (= res!136071 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256437))))

(declare-fun b!163318 () Bool)

(declare-fun lt!256439 () (_ BitVec 64))

(assert (=> b!163318 (= e!112795 (bvsle lt!256437 (bvmul lt!256439 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163318 (or (= lt!256439 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!256439 #b0000000000000000000000000000000000000000000000000000000000001000) lt!256439)))))

(assert (=> b!163318 (= lt!256439 ((_ sign_extend 32) (size!3638 (buf!4090 (_2!7841 lt!256380)))))))

(assert (= (and d!56347 res!136070) b!163317))

(assert (= (and b!163317 res!136071) b!163318))

(declare-fun m!259309 () Bool)

(assert (=> d!56347 m!259309))

(declare-fun m!259311 () Bool)

(assert (=> d!56347 m!259311))

(assert (=> b!163281 d!56347))

(declare-fun d!56349 () Bool)

(declare-fun e!112796 () Bool)

(assert (=> d!56349 e!112796))

(declare-fun res!136072 () Bool)

(assert (=> d!56349 (=> (not res!136072) (not e!112796))))

(declare-fun lt!256441 () (_ BitVec 64))

(declare-fun lt!256444 () (_ BitVec 64))

(declare-fun lt!256443 () (_ BitVec 64))

(assert (=> d!56349 (= res!136072 (= lt!256443 (bvsub lt!256441 lt!256444)))))

(assert (=> d!56349 (or (= (bvand lt!256441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256444 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256441 lt!256444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56349 (= lt!256444 (remainingBits!0 ((_ sign_extend 32) (size!3638 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))))) ((_ sign_extend 32) (currentByte!7626 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))) ((_ sign_extend 32) (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))))))))

(declare-fun lt!256446 () (_ BitVec 64))

(declare-fun lt!256442 () (_ BitVec 64))

(assert (=> d!56349 (= lt!256441 (bvmul lt!256446 lt!256442))))

(assert (=> d!56349 (or (= lt!256446 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!256442 (bvsdiv (bvmul lt!256446 lt!256442) lt!256446)))))

(assert (=> d!56349 (= lt!256442 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56349 (= lt!256446 ((_ sign_extend 32) (size!3638 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))))))))

(assert (=> d!56349 (= lt!256443 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7626 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))))))))

(assert (=> d!56349 (invariant!0 (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) (currentByte!7626 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) (size!3638 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))))))

(assert (=> d!56349 (= (bitIndex!0 (size!3638 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))) (currentByte!7626 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))) lt!256443)))

(declare-fun b!163319 () Bool)

(declare-fun res!136073 () Bool)

(assert (=> b!163319 (=> (not res!136073) (not e!112796))))

(assert (=> b!163319 (= res!136073 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256443))))

(declare-fun b!163320 () Bool)

(declare-fun lt!256445 () (_ BitVec 64))

(assert (=> b!163320 (= e!112796 (bvsle lt!256443 (bvmul lt!256445 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163320 (or (= lt!256445 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!256445 #b0000000000000000000000000000000000000000000000000000000000001000) lt!256445)))))

(assert (=> b!163320 (= lt!256445 ((_ sign_extend 32) (size!3638 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))))))))

(assert (= (and d!56349 res!136072) b!163319))

(assert (= (and b!163319 res!136073) b!163320))

(declare-fun m!259313 () Bool)

(assert (=> d!56349 m!259313))

(declare-fun m!259315 () Bool)

(assert (=> d!56349 m!259315))

(assert (=> b!163281 d!56349))

(declare-fun d!56351 () Bool)

(assert (=> d!56351 (arrayRangesEq!572 (buf!4090 thiss!1577) (array!8121 (store (arr!4559 (buf!4090 thiss!1577)) (currentByte!7626 thiss!1577) lt!256340) (size!3638 (buf!4090 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7626 thiss!1577))))

(assert (=> d!56351 true))

(declare-fun _$8!160 () Unit!11308)

(assert (=> d!56351 (= (choose!188 (buf!4090 thiss!1577) (currentByte!7626 thiss!1577) lt!256340) _$8!160)))

(declare-fun bs!13958 () Bool)

(assert (= bs!13958 d!56351))

(assert (=> bs!13958 m!259199))

(assert (=> bs!13958 m!259251))

(assert (=> d!56301 d!56351))

(declare-fun d!56353 () Bool)

(declare-fun res!136076 () Bool)

(declare-fun e!112799 () Bool)

(assert (=> d!56353 (=> (not res!136076) (not e!112799))))

(assert (=> d!56353 (= res!136076 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3638 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))))) ((_ sign_extend 32) nBits!511)) (bvsle ((_ sign_extend 32) nBits!511) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3638 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))))))))))

(assert (=> d!56353 (= (moveBitIndexPrecond!0 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)) ((_ sign_extend 32) nBits!511)) e!112799)))

(declare-fun lt!256449 () (_ BitVec 64))

(declare-fun b!163324 () Bool)

(assert (=> b!163324 (= e!112799 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256449) (bvsle lt!256449 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3638 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))))))))))

(assert (=> b!163324 (= lt!256449 (bvadd (bitIndex!0 (size!3638 (buf!4090 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))) (currentByte!7626 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577))) (currentBit!7621 (BitStream!6433 lt!256342 (currentByte!7626 thiss!1577) (currentBit!7621 thiss!1577)))) ((_ sign_extend 32) nBits!511)))))

(assert (= (and d!56353 res!136076) b!163324))

(assert (=> b!163324 m!259265))

(assert (=> d!56307 d!56353))

(declare-fun d!56355 () Bool)

(assert (=> d!56355 (= (invariant!0 (currentBit!7621 thiss!1577) (currentByte!7626 thiss!1577) (size!3638 (buf!4090 thiss!1577))) (and (bvsge (currentBit!7621 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7621 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7626 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7626 thiss!1577) (size!3638 (buf!4090 thiss!1577))) (and (= (currentBit!7621 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7626 thiss!1577) (size!3638 (buf!4090 thiss!1577)))))))))

(assert (=> d!56303 d!56355))

(declare-fun d!56357 () Bool)

(declare-fun res!136077 () Bool)

(declare-fun e!112800 () Bool)

(assert (=> d!56357 (=> res!136077 e!112800)))

(assert (=> d!56357 (= res!136077 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7626 thiss!1577)))))

(assert (=> d!56357 (= (arrayRangesEq!572 (buf!4090 thiss!1577) lt!256342 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7626 thiss!1577)) e!112800)))

(declare-fun b!163325 () Bool)

(declare-fun e!112801 () Bool)

(assert (=> b!163325 (= e!112800 e!112801)))

(declare-fun res!136078 () Bool)

(assert (=> b!163325 (=> (not res!136078) (not e!112801))))

(assert (=> b!163325 (= res!136078 (= (select (arr!4559 (buf!4090 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4559 lt!256342) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!163326 () Bool)

(assert (=> b!163326 (= e!112801 (arrayRangesEq!572 (buf!4090 thiss!1577) lt!256342 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7626 thiss!1577)))))

(assert (= (and d!56357 (not res!136077)) b!163325))

(assert (= (and b!163325 res!136078) b!163326))

(declare-fun m!259317 () Bool)

(assert (=> b!163325 m!259317))

(declare-fun m!259319 () Bool)

(assert (=> b!163325 m!259319))

(declare-fun m!259321 () Bool)

(assert (=> b!163326 m!259321))

(assert (=> b!163273 d!56357))

(declare-fun d!56359 () Bool)

(assert (=> d!56359 (= (remainingBits!0 ((_ sign_extend 32) (size!3638 (buf!4090 thiss!1577))) ((_ sign_extend 32) (currentByte!7626 thiss!1577)) ((_ sign_extend 32) (currentBit!7621 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3638 (buf!4090 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7626 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7621 thiss!1577)))))))

(assert (=> d!56293 d!56359))

(declare-fun d!56361 () Bool)

(declare-fun res!136079 () Bool)

(declare-fun e!112802 () Bool)

(assert (=> d!56361 (=> res!136079 e!112802)))

(assert (=> d!56361 (= res!136079 (= #b00000000000000000000000000000000 (currentByte!7626 thiss!1577)))))

(assert (=> d!56361 (= (arrayRangesEq!572 (buf!4090 thiss!1577) (array!8121 (store (arr!4559 (buf!4090 thiss!1577)) (currentByte!7626 thiss!1577) lt!256340) (size!3638 (buf!4090 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7626 thiss!1577)) e!112802)))

(declare-fun b!163327 () Bool)

(declare-fun e!112803 () Bool)

(assert (=> b!163327 (= e!112802 e!112803)))

(declare-fun res!136080 () Bool)

(assert (=> b!163327 (=> (not res!136080) (not e!112803))))

(assert (=> b!163327 (= res!136080 (= (select (arr!4559 (buf!4090 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4559 (array!8121 (store (arr!4559 (buf!4090 thiss!1577)) (currentByte!7626 thiss!1577) lt!256340) (size!3638 (buf!4090 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!163328 () Bool)

(assert (=> b!163328 (= e!112803 (arrayRangesEq!572 (buf!4090 thiss!1577) (array!8121 (store (arr!4559 (buf!4090 thiss!1577)) (currentByte!7626 thiss!1577) lt!256340) (size!3638 (buf!4090 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7626 thiss!1577)))))

(assert (= (and d!56361 (not res!136079)) b!163327))

(assert (= (and b!163327 res!136080) b!163328))

(assert (=> b!163327 m!259243))

(declare-fun m!259323 () Bool)

(assert (=> b!163327 m!259323))

(declare-fun m!259325 () Bool)

(assert (=> b!163328 m!259325))

(assert (=> b!163276 d!56361))

(check-sat (not d!56347) (not d!56349) (not d!56351) (not b!163324) (not b!163328) (not b!163326))
(check-sat)
