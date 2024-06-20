; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34724 () Bool)

(assert start!34724)

(declare-fun b!164367 () Bool)

(declare-fun e!113582 () Bool)

(assert (=> b!164367 (= e!113582 true)))

(declare-datatypes ((array!8228 0))(
  ( (array!8229 (arr!4605 (Array (_ BitVec 32) (_ BitVec 8))) (size!3684 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6524 0))(
  ( (BitStream!6525 (buf!4136 array!8228) (currentByte!7709 (_ BitVec 32)) (currentBit!7704 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!14544 0))(
  ( (tuple2!14545 (_1!7863 BitStream!6524) (_2!7863 BitStream!6524)) )
))
(declare-fun lt!257952 () tuple2!14544)

(declare-fun thiss!1577 () BitStream!6524)

(declare-fun lt!257951 () BitStream!6524)

(declare-fun reader!0 (BitStream!6524 BitStream!6524) tuple2!14544)

(assert (=> b!164367 (= lt!257952 (reader!0 thiss!1577 lt!257951))))

(declare-fun res!136967 () Bool)

(declare-fun e!113583 () Bool)

(assert (=> start!34724 (=> (not res!136967) (not e!113583))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34724 (= res!136967 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34724 e!113583))

(assert (=> start!34724 true))

(declare-fun e!113579 () Bool)

(declare-fun inv!12 (BitStream!6524) Bool)

(assert (=> start!34724 (and (inv!12 thiss!1577) e!113579)))

(declare-fun b!164368 () Bool)

(declare-fun e!113580 () Bool)

(assert (=> b!164368 (= e!113583 (not e!113580))))

(declare-fun res!136966 () Bool)

(assert (=> b!164368 (=> res!136966 e!113580)))

(declare-fun lt!257949 () (_ BitVec 8))

(declare-fun lt!257946 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164368 (= res!136966 (not (byteRangesEq!0 (select (arr!4605 (buf!4136 thiss!1577)) (currentByte!7709 thiss!1577)) lt!257949 #b00000000000000000000000000000000 lt!257946)))))

(declare-fun lt!257944 () array!8228)

(declare-fun arrayRangesEq!618 (array!8228 array!8228 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164368 (arrayRangesEq!618 (buf!4136 thiss!1577) lt!257944 #b00000000000000000000000000000000 (currentByte!7709 thiss!1577))))

(declare-fun lt!257947 () array!8228)

(declare-datatypes ((Unit!11445 0))(
  ( (Unit!11446) )
))
(declare-fun lt!257953 () Unit!11445)

(declare-fun arrayRangesEqTransitive!165 (array!8228 array!8228 array!8228 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11445)

(assert (=> b!164368 (= lt!257953 (arrayRangesEqTransitive!165 (buf!4136 thiss!1577) lt!257947 lt!257944 #b00000000000000000000000000000000 (currentByte!7709 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7709 thiss!1577))))))

(assert (=> b!164368 (arrayRangesEq!618 lt!257947 lt!257944 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7709 thiss!1577)))))

(declare-fun lt!257954 () (_ BitVec 8))

(declare-fun lt!257955 () Unit!11445)

(declare-fun arrayUpdatedAtPrefixLemma!226 (array!8228 (_ BitVec 32) (_ BitVec 8)) Unit!11445)

(assert (=> b!164368 (= lt!257955 (arrayUpdatedAtPrefixLemma!226 lt!257947 (bvadd #b00000000000000000000000000000001 (currentByte!7709 thiss!1577)) lt!257954))))

(assert (=> b!164368 (arrayRangesEq!618 (buf!4136 thiss!1577) (array!8229 (store (arr!4605 (buf!4136 thiss!1577)) (currentByte!7709 thiss!1577) lt!257949) (size!3684 (buf!4136 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7709 thiss!1577))))

(declare-fun lt!257945 () Unit!11445)

(assert (=> b!164368 (= lt!257945 (arrayUpdatedAtPrefixLemma!226 (buf!4136 thiss!1577) (currentByte!7709 thiss!1577) lt!257949))))

(declare-fun lt!257948 () (_ BitVec 32))

(assert (=> b!164368 (= lt!257949 (select (store (store (arr!4605 (buf!4136 thiss!1577)) (currentByte!7709 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4605 (buf!4136 thiss!1577)) (currentByte!7709 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7704 thiss!1577)))))))) (bvlshr (bvand lt!257948 #b00000000000000000000000011111111) lt!257946)))) (bvadd #b00000000000000000000000000000001 (currentByte!7709 thiss!1577)) lt!257954) (currentByte!7709 thiss!1577)))))

(assert (=> b!164368 (= lt!257944 (array!8229 (store (store (arr!4605 (buf!4136 thiss!1577)) (currentByte!7709 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4605 (buf!4136 thiss!1577)) (currentByte!7709 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7704 thiss!1577)))))))) (bvlshr (bvand lt!257948 #b00000000000000000000000011111111) lt!257946)))) (bvadd #b00000000000000000000000000000001 (currentByte!7709 thiss!1577)) lt!257954) (size!3684 (buf!4136 thiss!1577))))))

(declare-fun lt!257950 () (_ BitVec 32))

(assert (=> b!164368 (= lt!257954 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4605 (buf!4136 thiss!1577)) (currentByte!7709 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4605 (buf!4136 thiss!1577)) (currentByte!7709 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7704 thiss!1577)))))))) (bvlshr (bvand lt!257948 #b00000000000000000000000011111111) lt!257946)))) (bvadd #b00000000000000000000000000000001 (currentByte!7709 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257950))) (bvshl lt!257948 lt!257950))))))

(assert (=> b!164368 (= lt!257950 (bvsub #b00000000000000000000000000001000 lt!257946))))

(assert (=> b!164368 (= lt!257947 (array!8229 (store (arr!4605 (buf!4136 thiss!1577)) (currentByte!7709 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4605 (buf!4136 thiss!1577)) (currentByte!7709 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7704 thiss!1577)))))))) (bvlshr (bvand lt!257948 #b00000000000000000000000011111111) lt!257946)))) (size!3684 (buf!4136 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164368 (= lt!257948 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164368 (= lt!257946 (bvsub (bvadd (currentBit!7704 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164369 () Bool)

(declare-fun res!136968 () Bool)

(assert (=> b!164369 (=> (not res!136968) (not e!113583))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164369 (= res!136968 (validate_offset_bits!1 ((_ sign_extend 32) (size!3684 (buf!4136 thiss!1577))) ((_ sign_extend 32) (currentByte!7709 thiss!1577)) ((_ sign_extend 32) (currentBit!7704 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164370 () Bool)

(declare-fun res!136969 () Bool)

(assert (=> b!164370 (=> res!136969 e!113582)))

(declare-fun isPrefixOf!0 (BitStream!6524 BitStream!6524) Bool)

(assert (=> b!164370 (= res!136969 (not (isPrefixOf!0 thiss!1577 lt!257951)))))

(declare-fun b!164371 () Bool)

(assert (=> b!164371 (= e!113580 e!113582)))

(declare-fun res!136970 () Bool)

(assert (=> b!164371 (=> res!136970 e!113582)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!164371 (= res!136970 (not (= (bitIndex!0 (size!3684 (buf!4136 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!7709 thiss!1577)) lt!257946) (bvadd (bitIndex!0 (size!3684 (buf!4136 thiss!1577)) (currentByte!7709 thiss!1577) (currentBit!7704 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(assert (=> b!164371 (= lt!257951 (BitStream!6525 lt!257944 (bvadd #b00000000000000000000000000000001 (currentByte!7709 thiss!1577)) lt!257946))))

(declare-fun b!164372 () Bool)

(declare-fun res!136965 () Bool)

(assert (=> b!164372 (=> (not res!136965) (not e!113583))))

(assert (=> b!164372 (= res!136965 (bvsgt (bvadd (currentBit!7704 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164373 () Bool)

(declare-fun array_inv!3425 (array!8228) Bool)

(assert (=> b!164373 (= e!113579 (array_inv!3425 (buf!4136 thiss!1577)))))

(assert (= (and start!34724 res!136967) b!164369))

(assert (= (and b!164369 res!136968) b!164372))

(assert (= (and b!164372 res!136965) b!164368))

(assert (= (and b!164368 (not res!136966)) b!164371))

(assert (= (and b!164371 (not res!136970)) b!164370))

(assert (= (and b!164370 (not res!136969)) b!164367))

(assert (= start!34724 b!164373))

(declare-fun m!261331 () Bool)

(assert (=> b!164370 m!261331))

(declare-fun m!261333 () Bool)

(assert (=> b!164369 m!261333))

(declare-fun m!261335 () Bool)

(assert (=> b!164373 m!261335))

(declare-fun m!261337 () Bool)

(assert (=> b!164367 m!261337))

(declare-fun m!261339 () Bool)

(assert (=> b!164368 m!261339))

(declare-fun m!261341 () Bool)

(assert (=> b!164368 m!261341))

(declare-fun m!261343 () Bool)

(assert (=> b!164368 m!261343))

(declare-fun m!261345 () Bool)

(assert (=> b!164368 m!261345))

(declare-fun m!261347 () Bool)

(assert (=> b!164368 m!261347))

(declare-fun m!261349 () Bool)

(assert (=> b!164368 m!261349))

(declare-fun m!261351 () Bool)

(assert (=> b!164368 m!261351))

(declare-fun m!261353 () Bool)

(assert (=> b!164368 m!261353))

(declare-fun m!261355 () Bool)

(assert (=> b!164368 m!261355))

(declare-fun m!261357 () Bool)

(assert (=> b!164368 m!261357))

(declare-fun m!261359 () Bool)

(assert (=> b!164368 m!261359))

(declare-fun m!261361 () Bool)

(assert (=> b!164368 m!261361))

(assert (=> b!164368 m!261357))

(declare-fun m!261363 () Bool)

(assert (=> b!164368 m!261363))

(declare-fun m!261365 () Bool)

(assert (=> b!164368 m!261365))

(declare-fun m!261367 () Bool)

(assert (=> b!164368 m!261367))

(declare-fun m!261369 () Bool)

(assert (=> b!164368 m!261369))

(declare-fun m!261371 () Bool)

(assert (=> start!34724 m!261371))

(declare-fun m!261373 () Bool)

(assert (=> b!164371 m!261373))

(declare-fun m!261375 () Bool)

(assert (=> b!164371 m!261375))

(push 1)

(assert (not b!164367))

(assert (not start!34724))

(assert (not b!164369))

(assert (not b!164368))

(assert (not b!164373))

(assert (not b!164371))

(assert (not b!164370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

