; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34262 () Bool)

(assert start!34262)

(declare-fun b!163110 () Bool)

(declare-fun e!112618 () Bool)

(declare-datatypes ((array!8109 0))(
  ( (array!8110 (arr!4555 (Array (_ BitVec 32) (_ BitVec 8))) (size!3634 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6424 0))(
  ( (BitStream!6425 (buf!4086 array!8109) (currentByte!7610 (_ BitVec 32)) (currentBit!7605 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6424)

(declare-fun array_inv!3375 (array!8109) Bool)

(assert (=> b!163110 (= e!112618 (array_inv!3375 (buf!4086 thiss!1577)))))

(declare-fun res!135884 () Bool)

(declare-fun e!112619 () Bool)

(assert (=> start!34262 (=> (not res!135884) (not e!112619))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34262 (= res!135884 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34262 e!112619))

(assert (=> start!34262 true))

(declare-fun inv!12 (BitStream!6424) Bool)

(assert (=> start!34262 (and (inv!12 thiss!1577) e!112618)))

(declare-fun b!163111 () Bool)

(declare-fun e!112621 () Bool)

(declare-fun lt!256216 () array!8109)

(declare-fun moveBitIndexPrecond!0 (BitStream!6424 (_ BitVec 64)) Bool)

(assert (=> b!163111 (= e!112621 (moveBitIndexPrecond!0 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163112 () Bool)

(assert (=> b!163112 (= e!112619 (not e!112621))))

(declare-fun res!135883 () Bool)

(assert (=> b!163112 (=> res!135883 e!112621)))

(declare-fun lt!256215 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163112 (= res!135883 (not (byteRangesEq!0 (select (arr!4555 (buf!4086 thiss!1577)) (currentByte!7610 thiss!1577)) lt!256215 #b00000000000000000000000000000000 (currentBit!7605 thiss!1577))))))

(declare-fun arrayRangesEq!568 (array!8109 array!8109 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163112 (arrayRangesEq!568 (buf!4086 thiss!1577) lt!256216 #b00000000000000000000000000000000 (currentByte!7610 thiss!1577))))

(declare-datatypes ((Unit!11300 0))(
  ( (Unit!11301) )
))
(declare-fun lt!256217 () Unit!11300)

(declare-fun arrayUpdatedAtPrefixLemma!176 (array!8109 (_ BitVec 32) (_ BitVec 8)) Unit!11300)

(assert (=> b!163112 (= lt!256217 (arrayUpdatedAtPrefixLemma!176 (buf!4086 thiss!1577) (currentByte!7610 thiss!1577) lt!256215))))

(assert (=> b!163112 (= lt!256216 (array!8110 (store (arr!4555 (buf!4086 thiss!1577)) (currentByte!7610 thiss!1577) lt!256215) (size!3634 (buf!4086 thiss!1577))))))

(declare-fun lt!256218 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163112 (= lt!256215 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4555 (buf!4086 thiss!1577)) (currentByte!7610 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7605 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256218)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256218))))))

(assert (=> b!163112 (= lt!256218 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7605 thiss!1577) nBits!511)))))

(declare-fun b!163113 () Bool)

(declare-fun res!135885 () Bool)

(assert (=> b!163113 (=> (not res!135885) (not e!112619))))

(assert (=> b!163113 (= res!135885 (bvsle (bvadd (currentBit!7605 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163114 () Bool)

(declare-fun res!135882 () Bool)

(assert (=> b!163114 (=> (not res!135882) (not e!112619))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163114 (= res!135882 (validate_offset_bits!1 ((_ sign_extend 32) (size!3634 (buf!4086 thiss!1577))) ((_ sign_extend 32) (currentByte!7610 thiss!1577)) ((_ sign_extend 32) (currentBit!7605 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34262 res!135884) b!163114))

(assert (= (and b!163114 res!135882) b!163113))

(assert (= (and b!163113 res!135885) b!163112))

(assert (= (and b!163112 (not res!135883)) b!163111))

(assert (= start!34262 b!163110))

(declare-fun m!258985 () Bool)

(assert (=> b!163112 m!258985))

(declare-fun m!258987 () Bool)

(assert (=> b!163112 m!258987))

(assert (=> b!163112 m!258985))

(declare-fun m!258989 () Bool)

(assert (=> b!163112 m!258989))

(declare-fun m!258991 () Bool)

(assert (=> b!163112 m!258991))

(declare-fun m!258993 () Bool)

(assert (=> b!163112 m!258993))

(declare-fun m!258995 () Bool)

(assert (=> b!163112 m!258995))

(declare-fun m!258997 () Bool)

(assert (=> b!163112 m!258997))

(declare-fun m!258999 () Bool)

(assert (=> b!163112 m!258999))

(declare-fun m!259001 () Bool)

(assert (=> b!163114 m!259001))

(declare-fun m!259003 () Bool)

(assert (=> b!163111 m!259003))

(declare-fun m!259005 () Bool)

(assert (=> b!163110 m!259005))

(declare-fun m!259007 () Bool)

(assert (=> start!34262 m!259007))

(push 1)

(assert (not b!163110))

(assert (not start!34262))

(assert (not b!163111))

(assert (not b!163112))

(assert (not b!163114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56227 () Bool)

(declare-fun res!135924 () Bool)

(declare-fun e!112660 () Bool)

(assert (=> d!56227 (=> (not res!135924) (not e!112660))))

(assert (=> d!56227 (= res!135924 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3634 (buf!4086 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577)))))) ((_ sign_extend 32) nBits!511)) (bvsle ((_ sign_extend 32) nBits!511) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3634 (buf!4086 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577)))))))))))

(assert (=> d!56227 (= (moveBitIndexPrecond!0 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577)) ((_ sign_extend 32) nBits!511)) e!112660)))

(declare-fun lt!256251 () (_ BitVec 64))

(declare-fun b!163161 () Bool)

(assert (=> b!163161 (= e!112660 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256251) (bvsle lt!256251 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3634 (buf!4086 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577)))))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163161 (= lt!256251 (bvadd (bitIndex!0 (size!3634 (buf!4086 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577)))) (currentByte!7610 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577))) (currentBit!7605 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577)))) ((_ sign_extend 32) nBits!511)))))

(assert (= (and d!56227 res!135924) b!163161))

(declare-fun m!259077 () Bool)

(assert (=> b!163161 m!259077))

(assert (=> b!163111 d!56227))

(declare-fun d!56229 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56229 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7605 thiss!1577) (currentByte!7610 thiss!1577) (size!3634 (buf!4086 thiss!1577))))))

(declare-fun bs!13937 () Bool)

(assert (= bs!13937 d!56229))

(declare-fun m!259079 () Bool)

(assert (=> bs!13937 m!259079))

(assert (=> start!34262 d!56229))

(declare-fun d!56231 () Bool)

(assert (=> d!56231 (= (array_inv!3375 (buf!4086 thiss!1577)) (bvsge (size!3634 (buf!4086 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!163110 d!56231))

(declare-fun d!56233 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56233 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3634 (buf!4086 thiss!1577))) ((_ sign_extend 32) (currentByte!7610 thiss!1577)) ((_ sign_extend 32) (currentBit!7605 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3634 (buf!4086 thiss!1577))) ((_ sign_extend 32) (currentByte!7610 thiss!1577)) ((_ sign_extend 32) (currentBit!7605 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13938 () Bool)

(assert (= bs!13938 d!56233))

(declare-fun m!259081 () Bool)

(assert (=> bs!13938 m!259081))

(assert (=> b!163114 d!56233))

(declare-fun d!56235 () Bool)

(assert (=> d!56235 (= (byteRangesEq!0 (select (arr!4555 (buf!4086 thiss!1577)) (currentByte!7610 thiss!1577)) lt!256215 #b00000000000000000000000000000000 (currentBit!7605 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7605 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4555 (buf!4086 thiss!1577)) (currentByte!7610 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7605 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!256215) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7605 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13939 () Bool)

(assert (= bs!13939 d!56235))

(declare-fun m!259083 () Bool)

(assert (=> bs!13939 m!259083))

(declare-fun m!259085 () Bool)

(assert (=> bs!13939 m!259085))

(assert (=> b!163112 d!56235))

(declare-fun d!56237 () Bool)

(declare-fun res!135929 () Bool)

(declare-fun e!112665 () Bool)

(assert (=> d!56237 (=> res!135929 e!112665)))

(assert (=> d!56237 (= res!135929 (= #b00000000000000000000000000000000 (currentByte!7610 thiss!1577)))))

(assert (=> d!56237 (= (arrayRangesEq!568 (buf!4086 thiss!1577) lt!256216 #b00000000000000000000000000000000 (currentByte!7610 thiss!1577)) e!112665)))

(declare-fun b!163166 () Bool)

(declare-fun e!112666 () Bool)

(assert (=> b!163166 (= e!112665 e!112666)))

(declare-fun res!135930 () Bool)

(assert (=> b!163166 (=> (not res!135930) (not e!112666))))

(assert (=> b!163166 (= res!135930 (= (select (arr!4555 (buf!4086 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4555 lt!256216) #b00000000000000000000000000000000)))))

(declare-fun b!163167 () Bool)

(assert (=> b!163167 (= e!112666 (arrayRangesEq!568 (buf!4086 thiss!1577) lt!256216 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7610 thiss!1577)))))

(assert (= (and d!56237 (not res!135929)) b!163166))

(assert (= (and b!163166 res!135930) b!163167))

(declare-fun m!259087 () Bool)

(assert (=> b!163166 m!259087))

(declare-fun m!259089 () Bool)

(assert (=> b!163166 m!259089))

(declare-fun m!259091 () Bool)

(assert (=> b!163167 m!259091))

(assert (=> b!163112 d!56237))

(declare-fun d!56239 () Bool)

(declare-fun e!112669 () Bool)

(assert (=> d!56239 e!112669))

(declare-fun res!135933 () Bool)

(assert (=> d!56239 (=> (not res!135933) (not e!112669))))

(assert (=> d!56239 (= res!135933 (and (bvsge (currentByte!7610 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7610 thiss!1577) (size!3634 (buf!4086 thiss!1577)))))))

(declare-fun lt!256254 () Unit!11300)

(declare-fun choose!186 (array!8109 (_ BitVec 32) (_ BitVec 8)) Unit!11300)

(assert (=> d!56239 (= lt!256254 (choose!186 (buf!4086 thiss!1577) (currentByte!7610 thiss!1577) lt!256215))))

(assert (=> d!56239 (and (bvsle #b00000000000000000000000000000000 (currentByte!7610 thiss!1577)) (bvslt (currentByte!7610 thiss!1577) (size!3634 (buf!4086 thiss!1577))))))

(assert (=> d!56239 (= (arrayUpdatedAtPrefixLemma!176 (buf!4086 thiss!1577) (currentByte!7610 thiss!1577) lt!256215) lt!256254)))

(declare-fun b!163170 () Bool)

(assert (=> b!163170 (= e!112669 (arrayRangesEq!568 (buf!4086 thiss!1577) (array!8110 (store (arr!4555 (buf!4086 thiss!1577)) (currentByte!7610 thiss!1577) lt!256215) (size!3634 (buf!4086 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7610 thiss!1577)))))

(assert (= (and d!56239 res!135933) b!163170))

(declare-fun m!259093 () Bool)

(assert (=> d!56239 m!259093))

(assert (=> b!163170 m!258999))

(declare-fun m!259095 () Bool)

(assert (=> b!163170 m!259095))

(assert (=> b!163112 d!56239))

(push 1)

(assert (not b!163161))

(assert (not d!56239))

(assert (not b!163167))

(assert (not d!56233))

(assert (not d!56229))

(assert (not b!163170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56267 () Bool)

(assert (=> d!56267 (= (invariant!0 (currentBit!7605 thiss!1577) (currentByte!7610 thiss!1577) (size!3634 (buf!4086 thiss!1577))) (and (bvsge (currentBit!7605 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7605 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7610 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7610 thiss!1577) (size!3634 (buf!4086 thiss!1577))) (and (= (currentBit!7605 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7610 thiss!1577) (size!3634 (buf!4086 thiss!1577)))))))))

(assert (=> d!56229 d!56267))

(declare-fun d!56269 () Bool)

(assert (=> d!56269 (arrayRangesEq!568 (buf!4086 thiss!1577) (array!8110 (store (arr!4555 (buf!4086 thiss!1577)) (currentByte!7610 thiss!1577) lt!256215) (size!3634 (buf!4086 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7610 thiss!1577))))

(assert (=> d!56269 true))

(declare-fun _$8!154 () Unit!11300)

(assert (=> d!56269 (= (choose!186 (buf!4086 thiss!1577) (currentByte!7610 thiss!1577) lt!256215) _$8!154)))

(declare-fun bs!13944 () Bool)

(assert (= bs!13944 d!56269))

(assert (=> bs!13944 m!258999))

(assert (=> bs!13944 m!259095))

(assert (=> d!56239 d!56269))

(declare-fun d!56271 () Bool)

(assert (=> d!56271 (= (remainingBits!0 ((_ sign_extend 32) (size!3634 (buf!4086 thiss!1577))) ((_ sign_extend 32) (currentByte!7610 thiss!1577)) ((_ sign_extend 32) (currentBit!7605 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3634 (buf!4086 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7610 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7605 thiss!1577)))))))

(assert (=> d!56233 d!56271))

(declare-fun d!56273 () Bool)

(declare-fun res!135956 () Bool)

(declare-fun e!112689 () Bool)

(assert (=> d!56273 (=> res!135956 e!112689)))

(assert (=> d!56273 (= res!135956 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7610 thiss!1577)))))

(assert (=> d!56273 (= (arrayRangesEq!568 (buf!4086 thiss!1577) lt!256216 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7610 thiss!1577)) e!112689)))

(declare-fun b!163194 () Bool)

(declare-fun e!112690 () Bool)

(assert (=> b!163194 (= e!112689 e!112690)))

(declare-fun res!135957 () Bool)

(assert (=> b!163194 (=> (not res!135957) (not e!112690))))

(assert (=> b!163194 (= res!135957 (= (select (arr!4555 (buf!4086 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4555 lt!256216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!163195 () Bool)

(assert (=> b!163195 (= e!112690 (arrayRangesEq!568 (buf!4086 thiss!1577) lt!256216 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7610 thiss!1577)))))

(assert (= (and d!56273 (not res!135956)) b!163194))

(assert (= (and b!163194 res!135957) b!163195))

(declare-fun m!259131 () Bool)

(assert (=> b!163194 m!259131))

(declare-fun m!259133 () Bool)

(assert (=> b!163194 m!259133))

(declare-fun m!259135 () Bool)

(assert (=> b!163195 m!259135))

(assert (=> b!163167 d!56273))

(declare-fun d!56275 () Bool)

(declare-fun e!112693 () Bool)

(assert (=> d!56275 e!112693))

(declare-fun res!135962 () Bool)

(assert (=> d!56275 (=> (not res!135962) (not e!112693))))

(declare-fun lt!256296 () (_ BitVec 64))

(declare-fun lt!256292 () (_ BitVec 64))

(declare-fun lt!256293 () (_ BitVec 64))

(assert (=> d!56275 (= res!135962 (= lt!256296 (bvsub lt!256292 lt!256293)))))

(assert (=> d!56275 (or (= (bvand lt!256292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256293 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256292 lt!256293) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56275 (= lt!256293 (remainingBits!0 ((_ sign_extend 32) (size!3634 (buf!4086 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577))))) ((_ sign_extend 32) (currentByte!7610 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577)))) ((_ sign_extend 32) (currentBit!7605 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577))))))))

(declare-fun lt!256291 () (_ BitVec 64))

(declare-fun lt!256295 () (_ BitVec 64))

(assert (=> d!56275 (= lt!256292 (bvmul lt!256291 lt!256295))))

(assert (=> d!56275 (or (= lt!256291 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!256295 (bvsdiv (bvmul lt!256291 lt!256295) lt!256291)))))

(assert (=> d!56275 (= lt!256295 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56275 (= lt!256291 ((_ sign_extend 32) (size!3634 (buf!4086 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577))))))))

(assert (=> d!56275 (= lt!256296 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7610 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7605 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577))))))))

(assert (=> d!56275 (invariant!0 (currentBit!7605 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577))) (currentByte!7610 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577))) (size!3634 (buf!4086 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577)))))))

(assert (=> d!56275 (= (bitIndex!0 (size!3634 (buf!4086 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577)))) (currentByte!7610 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577))) (currentBit!7605 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577)))) lt!256296)))

(declare-fun b!163200 () Bool)

(declare-fun res!135963 () Bool)

(assert (=> b!163200 (=> (not res!135963) (not e!112693))))

(assert (=> b!163200 (= res!135963 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256296))))

(declare-fun b!163201 () Bool)

(declare-fun lt!256294 () (_ BitVec 64))

(assert (=> b!163201 (= e!112693 (bvsle lt!256296 (bvmul lt!256294 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163201 (or (= lt!256294 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!256294 #b0000000000000000000000000000000000000000000000000000000000001000) lt!256294)))))

(assert (=> b!163201 (= lt!256294 ((_ sign_extend 32) (size!3634 (buf!4086 (BitStream!6425 lt!256216 (currentByte!7610 thiss!1577) (currentBit!7605 thiss!1577))))))))

(assert (= (and d!56275 res!135962) b!163200))

(assert (= (and b!163200 res!135963) b!163201))

(declare-fun m!259137 () Bool)

(assert (=> d!56275 m!259137))

(declare-fun m!259139 () Bool)

(assert (=> d!56275 m!259139))

(assert (=> b!163161 d!56275))

(declare-fun d!56277 () Bool)

(declare-fun res!135964 () Bool)

(declare-fun e!112694 () Bool)

(assert (=> d!56277 (=> res!135964 e!112694)))

(assert (=> d!56277 (= res!135964 (= #b00000000000000000000000000000000 (currentByte!7610 thiss!1577)))))

(assert (=> d!56277 (= (arrayRangesEq!568 (buf!4086 thiss!1577) (array!8110 (store (arr!4555 (buf!4086 thiss!1577)) (currentByte!7610 thiss!1577) lt!256215) (size!3634 (buf!4086 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7610 thiss!1577)) e!112694)))

(declare-fun b!163202 () Bool)

(declare-fun e!112695 () Bool)

(assert (=> b!163202 (= e!112694 e!112695)))

(declare-fun res!135965 () Bool)

(assert (=> b!163202 (=> (not res!135965) (not e!112695))))

(assert (=> b!163202 (= res!135965 (= (select (arr!4555 (buf!4086 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4555 (array!8110 (store (arr!4555 (buf!4086 thiss!1577)) (currentByte!7610 thiss!1577) lt!256215) (size!3634 (buf!4086 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!163203 () Bool)

(assert (=> b!163203 (= e!112695 (arrayRangesEq!568 (buf!4086 thiss!1577) (array!8110 (store (arr!4555 (buf!4086 thiss!1577)) (currentByte!7610 thiss!1577) lt!256215) (size!3634 (buf!4086 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7610 thiss!1577)))))

(assert (= (and d!56277 (not res!135964)) b!163202))

(assert (= (and b!163202 res!135965) b!163203))

(assert (=> b!163202 m!259087))

(declare-fun m!259141 () Bool)

(assert (=> b!163202 m!259141))

(declare-fun m!259143 () Bool)

(assert (=> b!163203 m!259143))

(assert (=> b!163170 d!56277))

(push 1)

(assert (not b!163203))

(assert (not d!56275))

(assert (not d!56269))

(assert (not b!163195))

(check-sat)

(pop 1)

(push 1)

(check-sat)

