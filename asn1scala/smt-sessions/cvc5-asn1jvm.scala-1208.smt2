; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34334 () Bool)

(assert start!34334)

(declare-fun b!163226 () Bool)

(declare-fun e!112716 () Bool)

(declare-datatypes ((array!8118 0))(
  ( (array!8119 (arr!4558 (Array (_ BitVec 32) (_ BitVec 8))) (size!3637 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6430 0))(
  ( (BitStream!6431 (buf!4089 array!8118) (currentByte!7625 (_ BitVec 32)) (currentBit!7620 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6430)

(declare-fun array_inv!3378 (array!8118) Bool)

(assert (=> b!163226 (= e!112716 (array_inv!3378 (buf!4089 thiss!1577)))))

(declare-fun res!135986 () Bool)

(declare-fun e!112713 () Bool)

(assert (=> start!34334 (=> (not res!135986) (not e!112713))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34334 (= res!135986 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34334 e!112713))

(assert (=> start!34334 true))

(declare-fun inv!12 (BitStream!6430) Bool)

(assert (=> start!34334 (and (inv!12 thiss!1577) e!112716)))

(declare-fun b!163227 () Bool)

(declare-fun res!135990 () Bool)

(assert (=> b!163227 (=> (not res!135990) (not e!112713))))

(assert (=> b!163227 (= res!135990 (bvsle (bvadd (currentBit!7620 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163228 () Bool)

(declare-fun e!112715 () Bool)

(declare-fun e!112714 () Bool)

(assert (=> b!163228 (= e!112715 e!112714)))

(declare-fun res!135987 () Bool)

(assert (=> b!163228 (=> res!135987 e!112714)))

(declare-datatypes ((Unit!11306 0))(
  ( (Unit!11307) )
))
(declare-datatypes ((tuple2!14498 0))(
  ( (tuple2!14499 (_1!7840 Unit!11306) (_2!7840 BitStream!6430)) )
))
(declare-fun lt!256326 () tuple2!14498)

(assert (=> b!163228 (= res!135987 (not (= (size!3637 (buf!4089 thiss!1577)) (size!3637 (buf!4089 (_2!7840 lt!256326))))))))

(declare-fun lt!256328 () array!8118)

(declare-fun moveBitIndex!0 (BitStream!6430 (_ BitVec 64)) tuple2!14498)

(assert (=> b!163228 (= lt!256326 (moveBitIndex!0 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163229 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163229 (= e!112714 (invariant!0 (currentBit!7620 (_2!7840 lt!256326)) (currentByte!7625 (_2!7840 lt!256326)) (size!3637 (buf!4089 (_2!7840 lt!256326)))))))

(declare-fun b!163230 () Bool)

(declare-fun res!135988 () Bool)

(assert (=> b!163230 (=> (not res!135988) (not e!112713))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163230 (= res!135988 (validate_offset_bits!1 ((_ sign_extend 32) (size!3637 (buf!4089 thiss!1577))) ((_ sign_extend 32) (currentByte!7625 thiss!1577)) ((_ sign_extend 32) (currentBit!7620 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163231 () Bool)

(assert (=> b!163231 (= e!112713 (not e!112715))))

(declare-fun res!135989 () Bool)

(assert (=> b!163231 (=> res!135989 e!112715)))

(declare-fun lt!256325 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163231 (= res!135989 (not (byteRangesEq!0 (select (arr!4558 (buf!4089 thiss!1577)) (currentByte!7625 thiss!1577)) lt!256325 #b00000000000000000000000000000000 (currentBit!7620 thiss!1577))))))

(declare-fun arrayRangesEq!571 (array!8118 array!8118 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163231 (arrayRangesEq!571 (buf!4089 thiss!1577) lt!256328 #b00000000000000000000000000000000 (currentByte!7625 thiss!1577))))

(declare-fun lt!256327 () Unit!11306)

(declare-fun arrayUpdatedAtPrefixLemma!179 (array!8118 (_ BitVec 32) (_ BitVec 8)) Unit!11306)

(assert (=> b!163231 (= lt!256327 (arrayUpdatedAtPrefixLemma!179 (buf!4089 thiss!1577) (currentByte!7625 thiss!1577) lt!256325))))

(assert (=> b!163231 (= lt!256328 (array!8119 (store (arr!4558 (buf!4089 thiss!1577)) (currentByte!7625 thiss!1577) lt!256325) (size!3637 (buf!4089 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(declare-fun lt!256329 () (_ BitVec 32))

(assert (=> b!163231 (= lt!256325 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4558 (buf!4089 thiss!1577)) (currentByte!7625 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7620 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256329)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256329))))))

(assert (=> b!163231 (= lt!256329 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7620 thiss!1577) nBits!511)))))

(assert (= (and start!34334 res!135986) b!163230))

(assert (= (and b!163230 res!135988) b!163227))

(assert (= (and b!163227 res!135990) b!163231))

(assert (= (and b!163231 (not res!135989)) b!163228))

(assert (= (and b!163228 (not res!135987)) b!163229))

(assert (= start!34334 b!163226))

(declare-fun m!259159 () Bool)

(assert (=> b!163230 m!259159))

(declare-fun m!259161 () Bool)

(assert (=> b!163226 m!259161))

(declare-fun m!259163 () Bool)

(assert (=> b!163228 m!259163))

(declare-fun m!259165 () Bool)

(assert (=> start!34334 m!259165))

(declare-fun m!259167 () Bool)

(assert (=> b!163229 m!259167))

(declare-fun m!259169 () Bool)

(assert (=> b!163231 m!259169))

(declare-fun m!259171 () Bool)

(assert (=> b!163231 m!259171))

(declare-fun m!259173 () Bool)

(assert (=> b!163231 m!259173))

(declare-fun m!259175 () Bool)

(assert (=> b!163231 m!259175))

(declare-fun m!259177 () Bool)

(assert (=> b!163231 m!259177))

(assert (=> b!163231 m!259173))

(declare-fun m!259179 () Bool)

(assert (=> b!163231 m!259179))

(declare-fun m!259181 () Bool)

(assert (=> b!163231 m!259181))

(declare-fun m!259183 () Bool)

(assert (=> b!163231 m!259183))

(push 1)

(assert (not b!163226))

(assert (not b!163230))

(assert (not start!34334))

(assert (not b!163231))

(assert (not b!163229))

(assert (not b!163228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56311 () Bool)

(assert (=> d!56311 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7620 thiss!1577) (currentByte!7625 thiss!1577) (size!3637 (buf!4089 thiss!1577))))))

(declare-fun bs!13952 () Bool)

(assert (= bs!13952 d!56311))

(declare-fun m!259255 () Bool)

(assert (=> bs!13952 m!259255))

(assert (=> start!34334 d!56311))

(declare-fun d!56313 () Bool)

(assert (=> d!56313 (= (array_inv!3378 (buf!4089 thiss!1577)) (bvsge (size!3637 (buf!4089 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!163226 d!56313))

(declare-fun d!56315 () Bool)

(assert (=> d!56315 (= (byteRangesEq!0 (select (arr!4558 (buf!4089 thiss!1577)) (currentByte!7625 thiss!1577)) lt!256325 #b00000000000000000000000000000000 (currentBit!7620 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7620 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4558 (buf!4089 thiss!1577)) (currentByte!7625 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7620 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!256325) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7620 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13953 () Bool)

(assert (= bs!13953 d!56315))

(declare-fun m!259257 () Bool)

(assert (=> bs!13953 m!259257))

(declare-fun m!259259 () Bool)

(assert (=> bs!13953 m!259259))

(assert (=> b!163231 d!56315))

(declare-fun d!56317 () Bool)

(declare-fun res!136040 () Bool)

(declare-fun e!112767 () Bool)

(assert (=> d!56317 (=> res!136040 e!112767)))

(assert (=> d!56317 (= res!136040 (= #b00000000000000000000000000000000 (currentByte!7625 thiss!1577)))))

(assert (=> d!56317 (= (arrayRangesEq!571 (buf!4089 thiss!1577) lt!256328 #b00000000000000000000000000000000 (currentByte!7625 thiss!1577)) e!112767)))

(declare-fun b!163287 () Bool)

(declare-fun e!112768 () Bool)

(assert (=> b!163287 (= e!112767 e!112768)))

(declare-fun res!136041 () Bool)

(assert (=> b!163287 (=> (not res!136041) (not e!112768))))

(assert (=> b!163287 (= res!136041 (= (select (arr!4558 (buf!4089 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4558 lt!256328) #b00000000000000000000000000000000)))))

(declare-fun b!163288 () Bool)

(assert (=> b!163288 (= e!112768 (arrayRangesEq!571 (buf!4089 thiss!1577) lt!256328 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7625 thiss!1577)))))

(assert (= (and d!56317 (not res!136040)) b!163287))

(assert (= (and b!163287 res!136041) b!163288))

(declare-fun m!259267 () Bool)

(assert (=> b!163287 m!259267))

(declare-fun m!259269 () Bool)

(assert (=> b!163287 m!259269))

(declare-fun m!259271 () Bool)

(assert (=> b!163288 m!259271))

(assert (=> b!163231 d!56317))

(declare-fun d!56319 () Bool)

(declare-fun e!112771 () Bool)

(assert (=> d!56319 e!112771))

(declare-fun res!136044 () Bool)

(assert (=> d!56319 (=> (not res!136044) (not e!112771))))

(assert (=> d!56319 (= res!136044 (and (bvsge (currentByte!7625 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7625 thiss!1577) (size!3637 (buf!4089 thiss!1577)))))))

(declare-fun lt!256383 () Unit!11306)

(declare-fun choose!189 (array!8118 (_ BitVec 32) (_ BitVec 8)) Unit!11306)

(assert (=> d!56319 (= lt!256383 (choose!189 (buf!4089 thiss!1577) (currentByte!7625 thiss!1577) lt!256325))))

(assert (=> d!56319 (and (bvsle #b00000000000000000000000000000000 (currentByte!7625 thiss!1577)) (bvslt (currentByte!7625 thiss!1577) (size!3637 (buf!4089 thiss!1577))))))

(assert (=> d!56319 (= (arrayUpdatedAtPrefixLemma!179 (buf!4089 thiss!1577) (currentByte!7625 thiss!1577) lt!256325) lt!256383)))

(declare-fun b!163291 () Bool)

(assert (=> b!163291 (= e!112771 (arrayRangesEq!571 (buf!4089 thiss!1577) (array!8119 (store (arr!4558 (buf!4089 thiss!1577)) (currentByte!7625 thiss!1577) lt!256325) (size!3637 (buf!4089 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7625 thiss!1577)))))

(assert (= (and d!56319 res!136044) b!163291))

(declare-fun m!259273 () Bool)

(assert (=> d!56319 m!259273))

(assert (=> b!163291 m!259169))

(declare-fun m!259275 () Bool)

(assert (=> b!163291 m!259275))

(assert (=> b!163231 d!56319))

(declare-fun d!56321 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56321 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3637 (buf!4089 thiss!1577))) ((_ sign_extend 32) (currentByte!7625 thiss!1577)) ((_ sign_extend 32) (currentBit!7620 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3637 (buf!4089 thiss!1577))) ((_ sign_extend 32) (currentByte!7625 thiss!1577)) ((_ sign_extend 32) (currentBit!7620 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13954 () Bool)

(assert (= bs!13954 d!56321))

(declare-fun m!259277 () Bool)

(assert (=> bs!13954 m!259277))

(assert (=> b!163230 d!56321))

(declare-fun d!56323 () Bool)

(assert (=> d!56323 (= (invariant!0 (currentBit!7620 (_2!7840 lt!256326)) (currentByte!7625 (_2!7840 lt!256326)) (size!3637 (buf!4089 (_2!7840 lt!256326)))) (and (bvsge (currentBit!7620 (_2!7840 lt!256326)) #b00000000000000000000000000000000) (bvslt (currentBit!7620 (_2!7840 lt!256326)) #b00000000000000000000000000001000) (bvsge (currentByte!7625 (_2!7840 lt!256326)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7625 (_2!7840 lt!256326)) (size!3637 (buf!4089 (_2!7840 lt!256326)))) (and (= (currentBit!7620 (_2!7840 lt!256326)) #b00000000000000000000000000000000) (= (currentByte!7625 (_2!7840 lt!256326)) (size!3637 (buf!4089 (_2!7840 lt!256326))))))))))

(assert (=> b!163229 d!56323))

(declare-fun d!56325 () Bool)

(declare-fun lt!256403 () (_ BitVec 32))

(assert (=> d!56325 (= lt!256403 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!256402 () (_ BitVec 32))

(assert (=> d!56325 (= lt!256402 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!112785 () Bool)

(assert (=> d!56325 e!112785))

(declare-fun res!136058 () Bool)

(assert (=> d!56325 (=> (not res!136058) (not e!112785))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6430 (_ BitVec 64)) Bool)

(assert (=> d!56325 (= res!136058 (moveBitIndexPrecond!0 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11318 () Unit!11306)

(declare-fun Unit!11319 () Unit!11306)

(declare-fun Unit!11320 () Unit!11306)

(assert (=> d!56325 (= (moveBitIndex!0 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) lt!256403) #b00000000000000000000000000000000) (tuple2!14499 Unit!11318 (BitStream!6431 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) (bvsub (bvadd (currentByte!7625 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) lt!256402) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!256403 (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) lt!256403) #b00000000000000000000000000001000) (tuple2!14499 Unit!11319 (BitStream!6431 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) (bvadd (currentByte!7625 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) lt!256402 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) lt!256403) #b00000000000000000000000000001000))) (tuple2!14499 Unit!11320 (BitStream!6431 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) (bvadd (currentByte!7625 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) lt!256402) (bvadd (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) lt!256403))))))))

(declare-fun b!163305 () Bool)

(declare-fun e!112786 () Bool)

(assert (=> b!163305 (= e!112785 e!112786)))

(declare-fun res!136059 () Bool)

(assert (=> b!163305 (=> (not res!136059) (not e!112786))))

(declare-fun lt!256400 () (_ BitVec 64))

(declare-fun lt!256401 () tuple2!14498)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163305 (= res!136059 (= (bvadd lt!256400 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3637 (buf!4089 (_2!7840 lt!256401))) (currentByte!7625 (_2!7840 lt!256401)) (currentBit!7620 (_2!7840 lt!256401)))))))

(assert (=> b!163305 (or (not (= (bvand lt!256400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!256400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!256400 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!163305 (= lt!256400 (bitIndex!0 (size!3637 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))) (currentByte!7625 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))))))

(declare-fun lt!256404 () (_ BitVec 32))

(declare-fun lt!256399 () (_ BitVec 32))

(declare-fun Unit!11321 () Unit!11306)

(declare-fun Unit!11322 () Unit!11306)

(declare-fun Unit!11323 () Unit!11306)

(assert (=> b!163305 (= lt!256401 (ite (bvslt (bvadd (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) lt!256399) #b00000000000000000000000000000000) (tuple2!14499 Unit!11321 (BitStream!6431 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) (bvsub (bvadd (currentByte!7625 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) lt!256404) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!256399 (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) lt!256399) #b00000000000000000000000000001000) (tuple2!14499 Unit!11322 (BitStream!6431 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) (bvadd (currentByte!7625 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) lt!256404 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) lt!256399) #b00000000000000000000000000001000))) (tuple2!14499 Unit!11323 (BitStream!6431 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) (bvadd (currentByte!7625 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) lt!256404) (bvadd (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) lt!256399))))))))

(assert (=> b!163305 (= lt!256399 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163305 (= lt!256404 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!163306 () Bool)

(assert (=> b!163306 (= e!112786 (and (= (size!3637 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))) (size!3637 (buf!4089 (_2!7840 lt!256401)))) (= (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) (buf!4089 (_2!7840 lt!256401)))))))

(assert (= (and d!56325 res!136058) b!163305))

(assert (= (and b!163305 res!136059) b!163306))

(declare-fun m!259295 () Bool)

(assert (=> d!56325 m!259295))

(declare-fun m!259297 () Bool)

(assert (=> b!163305 m!259297))

(declare-fun m!259299 () Bool)

(assert (=> b!163305 m!259299))

(assert (=> b!163228 d!56325))

(push 1)

(assert (not d!56319))

(assert (not d!56311))

(assert (not d!56321))

(assert (not b!163291))

(assert (not b!163305))

(assert (not d!56325))

(assert (not b!163288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56379 () Bool)

(assert (=> d!56379 (= (invariant!0 (currentBit!7620 thiss!1577) (currentByte!7625 thiss!1577) (size!3637 (buf!4089 thiss!1577))) (and (bvsge (currentBit!7620 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7620 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7625 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7625 thiss!1577) (size!3637 (buf!4089 thiss!1577))) (and (= (currentBit!7620 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7625 thiss!1577) (size!3637 (buf!4089 thiss!1577)))))))))

(assert (=> d!56311 d!56379))

(declare-fun d!56381 () Bool)

(declare-fun res!136098 () Bool)

(declare-fun e!112817 () Bool)

(assert (=> d!56381 (=> (not res!136098) (not e!112817))))

(assert (=> d!56381 (= res!136098 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3637 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))))) ((_ sign_extend 32) nBits!511)) (bvsle ((_ sign_extend 32) nBits!511) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3637 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))))))))))

(assert (=> d!56381 (= (moveBitIndexPrecond!0 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)) ((_ sign_extend 32) nBits!511)) e!112817)))

(declare-fun b!163348 () Bool)

(declare-fun lt!256479 () (_ BitVec 64))

(assert (=> b!163348 (= e!112817 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256479) (bvsle lt!256479 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3637 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))))))))))

(assert (=> b!163348 (= lt!256479 (bvadd (bitIndex!0 (size!3637 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))) (currentByte!7625 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))) ((_ sign_extend 32) nBits!511)))))

(assert (= (and d!56381 res!136098) b!163348))

(assert (=> b!163348 m!259299))

(assert (=> d!56325 d!56381))

(declare-fun d!56383 () Bool)

(assert (=> d!56383 (= (remainingBits!0 ((_ sign_extend 32) (size!3637 (buf!4089 thiss!1577))) ((_ sign_extend 32) (currentByte!7625 thiss!1577)) ((_ sign_extend 32) (currentBit!7620 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3637 (buf!4089 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7625 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7620 thiss!1577)))))))

(assert (=> d!56321 d!56383))

(declare-fun d!56385 () Bool)

(declare-fun res!136099 () Bool)

(declare-fun e!112818 () Bool)

(assert (=> d!56385 (=> res!136099 e!112818)))

(assert (=> d!56385 (= res!136099 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7625 thiss!1577)))))

(assert (=> d!56385 (= (arrayRangesEq!571 (buf!4089 thiss!1577) lt!256328 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7625 thiss!1577)) e!112818)))

(declare-fun b!163349 () Bool)

(declare-fun e!112819 () Bool)

(assert (=> b!163349 (= e!112818 e!112819)))

(declare-fun res!136100 () Bool)

(assert (=> b!163349 (=> (not res!136100) (not e!112819))))

(assert (=> b!163349 (= res!136100 (= (select (arr!4558 (buf!4089 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4558 lt!256328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!163350 () Bool)

(assert (=> b!163350 (= e!112819 (arrayRangesEq!571 (buf!4089 thiss!1577) lt!256328 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7625 thiss!1577)))))

(assert (= (and d!56385 (not res!136099)) b!163349))

(assert (= (and b!163349 res!136100) b!163350))

(declare-fun m!259345 () Bool)

(assert (=> b!163349 m!259345))

(declare-fun m!259347 () Bool)

(assert (=> b!163349 m!259347))

(declare-fun m!259349 () Bool)

(assert (=> b!163350 m!259349))

(assert (=> b!163288 d!56385))

(declare-fun d!56387 () Bool)

(declare-fun e!112822 () Bool)

(assert (=> d!56387 e!112822))

(declare-fun res!136106 () Bool)

(assert (=> d!56387 (=> (not res!136106) (not e!112822))))

(declare-fun lt!256492 () (_ BitVec 64))

(declare-fun lt!256496 () (_ BitVec 64))

(declare-fun lt!256495 () (_ BitVec 64))

(assert (=> d!56387 (= res!136106 (= lt!256492 (bvsub lt!256495 lt!256496)))))

(assert (=> d!56387 (or (= (bvand lt!256495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256496 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256495 lt!256496) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56387 (= lt!256496 (remainingBits!0 ((_ sign_extend 32) (size!3637 (buf!4089 (_2!7840 lt!256401)))) ((_ sign_extend 32) (currentByte!7625 (_2!7840 lt!256401))) ((_ sign_extend 32) (currentBit!7620 (_2!7840 lt!256401)))))))

(declare-fun lt!256497 () (_ BitVec 64))

(declare-fun lt!256493 () (_ BitVec 64))

(assert (=> d!56387 (= lt!256495 (bvmul lt!256497 lt!256493))))

(assert (=> d!56387 (or (= lt!256497 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!256493 (bvsdiv (bvmul lt!256497 lt!256493) lt!256497)))))

(assert (=> d!56387 (= lt!256493 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56387 (= lt!256497 ((_ sign_extend 32) (size!3637 (buf!4089 (_2!7840 lt!256401)))))))

(assert (=> d!56387 (= lt!256492 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7625 (_2!7840 lt!256401))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7620 (_2!7840 lt!256401)))))))

(assert (=> d!56387 (invariant!0 (currentBit!7620 (_2!7840 lt!256401)) (currentByte!7625 (_2!7840 lt!256401)) (size!3637 (buf!4089 (_2!7840 lt!256401))))))

(assert (=> d!56387 (= (bitIndex!0 (size!3637 (buf!4089 (_2!7840 lt!256401))) (currentByte!7625 (_2!7840 lt!256401)) (currentBit!7620 (_2!7840 lt!256401))) lt!256492)))

(declare-fun b!163355 () Bool)

(declare-fun res!136105 () Bool)

(assert (=> b!163355 (=> (not res!136105) (not e!112822))))

(assert (=> b!163355 (= res!136105 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256492))))

(declare-fun b!163356 () Bool)

(declare-fun lt!256494 () (_ BitVec 64))

(assert (=> b!163356 (= e!112822 (bvsle lt!256492 (bvmul lt!256494 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163356 (or (= lt!256494 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!256494 #b0000000000000000000000000000000000000000000000000000000000001000) lt!256494)))))

(assert (=> b!163356 (= lt!256494 ((_ sign_extend 32) (size!3637 (buf!4089 (_2!7840 lt!256401)))))))

(assert (= (and d!56387 res!136106) b!163355))

(assert (= (and b!163355 res!136105) b!163356))

(declare-fun m!259351 () Bool)

(assert (=> d!56387 m!259351))

(declare-fun m!259353 () Bool)

(assert (=> d!56387 m!259353))

(assert (=> b!163305 d!56387))

(declare-fun d!56389 () Bool)

(declare-fun e!112823 () Bool)

(assert (=> d!56389 e!112823))

(declare-fun res!136108 () Bool)

(assert (=> d!56389 (=> (not res!136108) (not e!112823))))

(declare-fun lt!256501 () (_ BitVec 64))

(declare-fun lt!256502 () (_ BitVec 64))

(declare-fun lt!256498 () (_ BitVec 64))

(assert (=> d!56389 (= res!136108 (= lt!256498 (bvsub lt!256501 lt!256502)))))

(assert (=> d!56389 (or (= (bvand lt!256501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256502 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256501 lt!256502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56389 (= lt!256502 (remainingBits!0 ((_ sign_extend 32) (size!3637 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))))) ((_ sign_extend 32) (currentByte!7625 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))) ((_ sign_extend 32) (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))))))))

(declare-fun lt!256503 () (_ BitVec 64))

(declare-fun lt!256499 () (_ BitVec 64))

(assert (=> d!56389 (= lt!256501 (bvmul lt!256503 lt!256499))))

(assert (=> d!56389 (or (= lt!256503 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!256499 (bvsdiv (bvmul lt!256503 lt!256499) lt!256503)))))

(assert (=> d!56389 (= lt!256499 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56389 (= lt!256503 ((_ sign_extend 32) (size!3637 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))))))))

(assert (=> d!56389 (= lt!256498 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7625 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))))))))

(assert (=> d!56389 (invariant!0 (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) (currentByte!7625 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) (size!3637 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))))))

(assert (=> d!56389 (= (bitIndex!0 (size!3637 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))) (currentByte!7625 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))) (currentBit!7620 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577)))) lt!256498)))

(declare-fun b!163357 () Bool)

(declare-fun res!136107 () Bool)

(assert (=> b!163357 (=> (not res!136107) (not e!112823))))

(assert (=> b!163357 (= res!136107 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256498))))

(declare-fun b!163358 () Bool)

(declare-fun lt!256500 () (_ BitVec 64))

(assert (=> b!163358 (= e!112823 (bvsle lt!256498 (bvmul lt!256500 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163358 (or (= lt!256500 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!256500 #b0000000000000000000000000000000000000000000000000000000000001000) lt!256500)))))

(assert (=> b!163358 (= lt!256500 ((_ sign_extend 32) (size!3637 (buf!4089 (BitStream!6431 lt!256328 (currentByte!7625 thiss!1577) (currentBit!7620 thiss!1577))))))))

(assert (= (and d!56389 res!136108) b!163357))

(assert (= (and b!163357 res!136107) b!163358))

(declare-fun m!259355 () Bool)

(assert (=> d!56389 m!259355))

(declare-fun m!259357 () Bool)

(assert (=> d!56389 m!259357))

(assert (=> b!163305 d!56389))

(declare-fun d!56391 () Bool)

(declare-fun res!136109 () Bool)

(declare-fun e!112824 () Bool)

(assert (=> d!56391 (=> res!136109 e!112824)))

(assert (=> d!56391 (= res!136109 (= #b00000000000000000000000000000000 (currentByte!7625 thiss!1577)))))

(assert (=> d!56391 (= (arrayRangesEq!571 (buf!4089 thiss!1577) (array!8119 (store (arr!4558 (buf!4089 thiss!1577)) (currentByte!7625 thiss!1577) lt!256325) (size!3637 (buf!4089 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7625 thiss!1577)) e!112824)))

(declare-fun b!163359 () Bool)

(declare-fun e!112825 () Bool)

(assert (=> b!163359 (= e!112824 e!112825)))

(declare-fun res!136110 () Bool)

(assert (=> b!163359 (=> (not res!136110) (not e!112825))))

(assert (=> b!163359 (= res!136110 (= (select (arr!4558 (buf!4089 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4558 (array!8119 (store (arr!4558 (buf!4089 thiss!1577)) (currentByte!7625 thiss!1577) lt!256325) (size!3637 (buf!4089 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!163360 () Bool)

(assert (=> b!163360 (= e!112825 (arrayRangesEq!571 (buf!4089 thiss!1577) (array!8119 (store (arr!4558 (buf!4089 thiss!1577)) (currentByte!7625 thiss!1577) lt!256325) (size!3637 (buf!4089 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7625 thiss!1577)))))

(assert (= (and d!56391 (not res!136109)) b!163359))

(assert (= (and b!163359 res!136110) b!163360))

(assert (=> b!163359 m!259267))

(declare-fun m!259359 () Bool)

(assert (=> b!163359 m!259359))

(declare-fun m!259361 () Bool)

(assert (=> b!163360 m!259361))

(assert (=> b!163291 d!56391))

(declare-fun d!56393 () Bool)

(assert (=> d!56393 (arrayRangesEq!571 (buf!4089 thiss!1577) (array!8119 (store (arr!4558 (buf!4089 thiss!1577)) (currentByte!7625 thiss!1577) lt!256325) (size!3637 (buf!4089 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7625 thiss!1577))))

(assert (=> d!56393 true))

(declare-fun _$8!166 () Unit!11306)

(assert (=> d!56393 (= (choose!189 (buf!4089 thiss!1577) (currentByte!7625 thiss!1577) lt!256325) _$8!166)))

(declare-fun bs!13960 () Bool)

(assert (= bs!13960 d!56393))

(assert (=> bs!13960 m!259169))

(assert (=> bs!13960 m!259275))

(assert (=> d!56319 d!56393))

(push 1)

(assert (not b!163348))

(assert (not b!163360))

(assert (not b!163350))

(assert (not d!56393))

(assert (not d!56389))

(assert (not d!56387))

(check-sat)

(pop 1)

(push 1)

(check-sat)

