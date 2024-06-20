; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35098 () Bool)

(assert start!35098)

(declare-fun b!165090 () Bool)

(declare-fun e!114200 () Bool)

(declare-datatypes ((array!8351 0))(
  ( (array!8352 (arr!4655 (Array (_ BitVec 32) (_ BitVec 8))) (size!3734 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6624 0))(
  ( (BitStream!6625 (buf!4186 array!8351) (currentByte!7814 (_ BitVec 32)) (currentBit!7809 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6624)

(declare-fun array_inv!3475 (array!8351) Bool)

(assert (=> b!165090 (= e!114200 (array_inv!3475 (buf!4186 thiss!1577)))))

(declare-fun b!165088 () Bool)

(declare-fun res!137517 () Bool)

(declare-fun e!114199 () Bool)

(assert (=> b!165088 (=> (not res!137517) (not e!114199))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!165088 (= res!137517 (bvsle (bvadd (currentBit!7809 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!137519 () Bool)

(assert (=> start!35098 (=> (not res!137519) (not e!114199))))

(assert (=> start!35098 (= res!137519 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35098 e!114199))

(assert (=> start!35098 true))

(declare-fun inv!12 (BitStream!6624) Bool)

(assert (=> start!35098 (and (inv!12 thiss!1577) e!114200)))

(declare-fun b!165087 () Bool)

(declare-fun res!137518 () Bool)

(assert (=> b!165087 (=> (not res!137518) (not e!114199))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165087 (= res!137518 (validate_offset_bits!1 ((_ sign_extend 32) (size!3734 (buf!4186 thiss!1577))) ((_ sign_extend 32) (currentByte!7814 thiss!1577)) ((_ sign_extend 32) (currentBit!7809 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165089 () Bool)

(declare-fun lt!258531 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165089 (= e!114199 (not (inv!12 (BitStream!6625 (array!8352 (store (arr!4655 (buf!4186 thiss!1577)) (currentByte!7814 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4655 (buf!4186 thiss!1577)) (currentByte!7814 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7809 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258531)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258531)))) (size!3734 (buf!4186 thiss!1577))) (currentByte!7814 thiss!1577) (currentBit!7809 thiss!1577)))))))

(assert (=> b!165089 (= lt!258531 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7809 thiss!1577) nBits!511)))))

(assert (= (and start!35098 res!137519) b!165087))

(assert (= (and b!165087 res!137518) b!165088))

(assert (= (and b!165088 res!137517) b!165089))

(assert (= start!35098 b!165090))

(declare-fun m!262447 () Bool)

(assert (=> b!165090 m!262447))

(declare-fun m!262449 () Bool)

(assert (=> start!35098 m!262449))

(declare-fun m!262451 () Bool)

(assert (=> b!165087 m!262451))

(declare-fun m!262453 () Bool)

(assert (=> b!165089 m!262453))

(declare-fun m!262455 () Bool)

(assert (=> b!165089 m!262455))

(declare-fun m!262457 () Bool)

(assert (=> b!165089 m!262457))

(declare-fun m!262459 () Bool)

(assert (=> b!165089 m!262459))

(declare-fun m!262461 () Bool)

(assert (=> b!165089 m!262461))

(declare-fun m!262463 () Bool)

(assert (=> b!165089 m!262463))

(check-sat (not b!165087) (not b!165090) (not b!165089) (not start!35098))
(check-sat)
(get-model)

(declare-fun d!57085 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57085 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3734 (buf!4186 thiss!1577))) ((_ sign_extend 32) (currentByte!7814 thiss!1577)) ((_ sign_extend 32) (currentBit!7809 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3734 (buf!4186 thiss!1577))) ((_ sign_extend 32) (currentByte!7814 thiss!1577)) ((_ sign_extend 32) (currentBit!7809 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14172 () Bool)

(assert (= bs!14172 d!57085))

(declare-fun m!262483 () Bool)

(assert (=> bs!14172 m!262483))

(assert (=> b!165087 d!57085))

(declare-fun d!57087 () Bool)

(assert (=> d!57087 (= (array_inv!3475 (buf!4186 thiss!1577)) (bvsge (size!3734 (buf!4186 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165090 d!57087))

(declare-fun d!57089 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57089 (= (inv!12 (BitStream!6625 (array!8352 (store (arr!4655 (buf!4186 thiss!1577)) (currentByte!7814 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4655 (buf!4186 thiss!1577)) (currentByte!7814 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7809 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258531)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258531)))) (size!3734 (buf!4186 thiss!1577))) (currentByte!7814 thiss!1577) (currentBit!7809 thiss!1577))) (invariant!0 (currentBit!7809 (BitStream!6625 (array!8352 (store (arr!4655 (buf!4186 thiss!1577)) (currentByte!7814 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4655 (buf!4186 thiss!1577)) (currentByte!7814 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7809 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258531)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258531)))) (size!3734 (buf!4186 thiss!1577))) (currentByte!7814 thiss!1577) (currentBit!7809 thiss!1577))) (currentByte!7814 (BitStream!6625 (array!8352 (store (arr!4655 (buf!4186 thiss!1577)) (currentByte!7814 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4655 (buf!4186 thiss!1577)) (currentByte!7814 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7809 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258531)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258531)))) (size!3734 (buf!4186 thiss!1577))) (currentByte!7814 thiss!1577) (currentBit!7809 thiss!1577))) (size!3734 (buf!4186 (BitStream!6625 (array!8352 (store (arr!4655 (buf!4186 thiss!1577)) (currentByte!7814 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4655 (buf!4186 thiss!1577)) (currentByte!7814 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7809 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258531)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258531)))) (size!3734 (buf!4186 thiss!1577))) (currentByte!7814 thiss!1577) (currentBit!7809 thiss!1577))))))))

(declare-fun bs!14173 () Bool)

(assert (= bs!14173 d!57089))

(declare-fun m!262485 () Bool)

(assert (=> bs!14173 m!262485))

(assert (=> b!165089 d!57089))

(declare-fun d!57091 () Bool)

(assert (=> d!57091 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7809 thiss!1577) (currentByte!7814 thiss!1577) (size!3734 (buf!4186 thiss!1577))))))

(declare-fun bs!14174 () Bool)

(assert (= bs!14174 d!57091))

(declare-fun m!262487 () Bool)

(assert (=> bs!14174 m!262487))

(assert (=> start!35098 d!57091))

(check-sat (not d!57089) (not d!57085) (not d!57091))
(check-sat)
