; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34730 () Bool)

(assert start!34730)

(declare-fun b!164430 () Bool)

(declare-fun res!137020 () Bool)

(declare-fun e!113624 () Bool)

(assert (=> b!164430 (=> res!137020 e!113624)))

(declare-datatypes ((array!8234 0))(
  ( (array!8235 (arr!4608 (Array (_ BitVec 32) (_ BitVec 8))) (size!3687 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6530 0))(
  ( (BitStream!6531 (buf!4139 array!8234) (currentByte!7712 (_ BitVec 32)) (currentBit!7707 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6530)

(declare-fun lt!258063 () BitStream!6530)

(declare-fun isPrefixOf!0 (BitStream!6530 BitStream!6530) Bool)

(assert (=> b!164430 (= res!137020 (not (isPrefixOf!0 thiss!1577 lt!258063)))))

(declare-fun b!164431 () Bool)

(declare-fun res!137021 () Bool)

(declare-fun e!113625 () Bool)

(assert (=> b!164431 (=> (not res!137021) (not e!113625))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164431 (= res!137021 (validate_offset_bits!1 ((_ sign_extend 32) (size!3687 (buf!4139 thiss!1577))) ((_ sign_extend 32) (currentByte!7712 thiss!1577)) ((_ sign_extend 32) (currentBit!7707 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!137023 () Bool)

(assert (=> start!34730 (=> (not res!137023) (not e!113625))))

(assert (=> start!34730 (= res!137023 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34730 e!113625))

(assert (=> start!34730 true))

(declare-fun e!113628 () Bool)

(declare-fun inv!12 (BitStream!6530) Bool)

(assert (=> start!34730 (and (inv!12 thiss!1577) e!113628)))

(declare-fun b!164432 () Bool)

(declare-datatypes ((tuple2!14550 0))(
  ( (tuple2!14551 (_1!7866 BitStream!6530) (_2!7866 BitStream!6530)) )
))
(declare-fun lt!258060 () tuple2!14550)

(assert (=> b!164432 (= e!113624 (validate_offset_bits!1 ((_ sign_extend 32) (size!3687 (buf!4139 (_1!7866 lt!258060)))) ((_ sign_extend 32) (currentByte!7712 (_1!7866 lt!258060))) ((_ sign_extend 32) (currentBit!7707 (_1!7866 lt!258060))) ((_ sign_extend 32) nBits!511)))))

(declare-fun reader!0 (BitStream!6530 BitStream!6530) tuple2!14550)

(assert (=> b!164432 (= lt!258060 (reader!0 thiss!1577 lt!258063))))

(declare-fun b!164433 () Bool)

(declare-fun array_inv!3428 (array!8234) Bool)

(assert (=> b!164433 (= e!113628 (array_inv!3428 (buf!4139 thiss!1577)))))

(declare-fun b!164434 () Bool)

(declare-fun res!137019 () Bool)

(assert (=> b!164434 (=> (not res!137019) (not e!113625))))

(assert (=> b!164434 (= res!137019 (bvsgt (bvadd (currentBit!7707 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164435 () Bool)

(declare-fun e!113627 () Bool)

(assert (=> b!164435 (= e!113627 e!113624)))

(declare-fun res!137024 () Bool)

(assert (=> b!164435 (=> res!137024 e!113624)))

(declare-fun lt!258055 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!164435 (= res!137024 (not (= (bitIndex!0 (size!3687 (buf!4139 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)) lt!258055) (bvadd (bitIndex!0 (size!3687 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) (currentBit!7707 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun lt!258056 () array!8234)

(assert (=> b!164435 (= lt!258063 (BitStream!6531 lt!258056 (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)) lt!258055))))

(declare-fun b!164436 () Bool)

(assert (=> b!164436 (= e!113625 (not e!113627))))

(declare-fun res!137022 () Bool)

(assert (=> b!164436 (=> res!137022 e!113627)))

(declare-fun lt!258061 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164436 (= res!137022 (not (byteRangesEq!0 (select (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577)) lt!258061 #b00000000000000000000000000000000 lt!258055)))))

(declare-fun arrayRangesEq!621 (array!8234 array!8234 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164436 (arrayRangesEq!621 (buf!4139 thiss!1577) lt!258056 #b00000000000000000000000000000000 (currentByte!7712 thiss!1577))))

(declare-fun lt!258059 () array!8234)

(declare-datatypes ((Unit!11451 0))(
  ( (Unit!11452) )
))
(declare-fun lt!258053 () Unit!11451)

(declare-fun arrayRangesEqTransitive!168 (array!8234 array!8234 array!8234 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11451)

(assert (=> b!164436 (= lt!258053 (arrayRangesEqTransitive!168 (buf!4139 thiss!1577) lt!258059 lt!258056 #b00000000000000000000000000000000 (currentByte!7712 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577))))))

(assert (=> b!164436 (arrayRangesEq!621 lt!258059 lt!258056 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)))))

(declare-fun lt!258052 () Unit!11451)

(declare-fun lt!258057 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!229 (array!8234 (_ BitVec 32) (_ BitVec 8)) Unit!11451)

(assert (=> b!164436 (= lt!258052 (arrayUpdatedAtPrefixLemma!229 lt!258059 (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)) lt!258057))))

(assert (=> b!164436 (arrayRangesEq!621 (buf!4139 thiss!1577) (array!8235 (store (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) lt!258061) (size!3687 (buf!4139 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7712 thiss!1577))))

(declare-fun lt!258054 () Unit!11451)

(assert (=> b!164436 (= lt!258054 (arrayUpdatedAtPrefixLemma!229 (buf!4139 thiss!1577) (currentByte!7712 thiss!1577) lt!258061))))

(declare-fun lt!258062 () (_ BitVec 32))

(assert (=> b!164436 (= lt!258061 (select (store (store (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7707 thiss!1577)))))))) (bvlshr (bvand lt!258062 #b00000000000000000000000011111111) lt!258055)))) (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)) lt!258057) (currentByte!7712 thiss!1577)))))

(assert (=> b!164436 (= lt!258056 (array!8235 (store (store (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7707 thiss!1577)))))))) (bvlshr (bvand lt!258062 #b00000000000000000000000011111111) lt!258055)))) (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)) lt!258057) (size!3687 (buf!4139 thiss!1577))))))

(declare-fun lt!258058 () (_ BitVec 32))

(assert (=> b!164436 (= lt!258057 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7707 thiss!1577)))))))) (bvlshr (bvand lt!258062 #b00000000000000000000000011111111) lt!258055)))) (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258058))) (bvshl lt!258062 lt!258058))))))

(assert (=> b!164436 (= lt!258058 (bvsub #b00000000000000000000000000001000 lt!258055))))

(assert (=> b!164436 (= lt!258059 (array!8235 (store (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7707 thiss!1577)))))))) (bvlshr (bvand lt!258062 #b00000000000000000000000011111111) lt!258055)))) (size!3687 (buf!4139 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164436 (= lt!258062 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164436 (= lt!258055 (bvsub (bvadd (currentBit!7707 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34730 res!137023) b!164431))

(assert (= (and b!164431 res!137021) b!164434))

(assert (= (and b!164434 res!137019) b!164436))

(assert (= (and b!164436 (not res!137022)) b!164435))

(assert (= (and b!164435 (not res!137024)) b!164430))

(assert (= (and b!164430 (not res!137020)) b!164432))

(assert (= start!34730 b!164433))

(declare-fun m!261473 () Bool)

(assert (=> b!164432 m!261473))

(declare-fun m!261475 () Bool)

(assert (=> b!164432 m!261475))

(declare-fun m!261477 () Bool)

(assert (=> b!164436 m!261477))

(declare-fun m!261479 () Bool)

(assert (=> b!164436 m!261479))

(declare-fun m!261481 () Bool)

(assert (=> b!164436 m!261481))

(assert (=> b!164436 m!261477))

(declare-fun m!261483 () Bool)

(assert (=> b!164436 m!261483))

(declare-fun m!261485 () Bool)

(assert (=> b!164436 m!261485))

(declare-fun m!261487 () Bool)

(assert (=> b!164436 m!261487))

(declare-fun m!261489 () Bool)

(assert (=> b!164436 m!261489))

(declare-fun m!261491 () Bool)

(assert (=> b!164436 m!261491))

(declare-fun m!261493 () Bool)

(assert (=> b!164436 m!261493))

(declare-fun m!261495 () Bool)

(assert (=> b!164436 m!261495))

(declare-fun m!261497 () Bool)

(assert (=> b!164436 m!261497))

(declare-fun m!261499 () Bool)

(assert (=> b!164436 m!261499))

(declare-fun m!261501 () Bool)

(assert (=> b!164436 m!261501))

(declare-fun m!261503 () Bool)

(assert (=> b!164436 m!261503))

(declare-fun m!261505 () Bool)

(assert (=> b!164436 m!261505))

(declare-fun m!261507 () Bool)

(assert (=> b!164436 m!261507))

(declare-fun m!261509 () Bool)

(assert (=> b!164431 m!261509))

(declare-fun m!261511 () Bool)

(assert (=> b!164430 m!261511))

(declare-fun m!261513 () Bool)

(assert (=> b!164433 m!261513))

(declare-fun m!261515 () Bool)

(assert (=> b!164435 m!261515))

(declare-fun m!261517 () Bool)

(assert (=> b!164435 m!261517))

(declare-fun m!261519 () Bool)

(assert (=> start!34730 m!261519))

(push 1)

(assert (not b!164435))

(assert (not b!164433))

(assert (not b!164436))

(assert (not b!164431))

(assert (not start!34730))

(assert (not b!164432))

(assert (not b!164430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56751 () Bool)

(declare-fun res!137045 () Bool)

(declare-fun e!113648 () Bool)

(assert (=> d!56751 (=> (not res!137045) (not e!113648))))

(assert (=> d!56751 (= res!137045 (= (size!3687 (buf!4139 thiss!1577)) (size!3687 (buf!4139 lt!258063))))))

(assert (=> d!56751 (= (isPrefixOf!0 thiss!1577 lt!258063) e!113648)))

(declare-fun b!164457 () Bool)

(declare-fun res!137047 () Bool)

(assert (=> b!164457 (=> (not res!137047) (not e!113648))))

(assert (=> b!164457 (= res!137047 (bvsle (bitIndex!0 (size!3687 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) (currentBit!7707 thiss!1577)) (bitIndex!0 (size!3687 (buf!4139 lt!258063)) (currentByte!7712 lt!258063) (currentBit!7707 lt!258063))))))

(declare-fun b!164458 () Bool)

(declare-fun e!113647 () Bool)

(assert (=> b!164458 (= e!113648 e!113647)))

(declare-fun res!137046 () Bool)

(assert (=> b!164458 (=> res!137046 e!113647)))

(assert (=> b!164458 (= res!137046 (= (size!3687 (buf!4139 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!164459 () Bool)

(declare-fun arrayBitRangesEq!0 (array!8234 array!8234 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164459 (= e!113647 (arrayBitRangesEq!0 (buf!4139 thiss!1577) (buf!4139 lt!258063) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3687 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) (currentBit!7707 thiss!1577))))))

(assert (= (and d!56751 res!137045) b!164457))

(assert (= (and b!164457 res!137047) b!164458))

(assert (= (and b!164458 (not res!137046)) b!164459))

(assert (=> b!164457 m!261517))

(declare-fun m!261553 () Bool)

(assert (=> b!164457 m!261553))

(assert (=> b!164459 m!261517))

(assert (=> b!164459 m!261517))

(declare-fun m!261555 () Bool)

(assert (=> b!164459 m!261555))

(assert (=> b!164430 d!56751))

(declare-fun d!56757 () Bool)

(declare-fun e!113651 () Bool)

(assert (=> d!56757 e!113651))

(declare-fun res!137053 () Bool)

(assert (=> d!56757 (=> (not res!137053) (not e!113651))))

(declare-fun lt!258083 () (_ BitVec 64))

(declare-fun lt!258085 () (_ BitVec 64))

(declare-fun lt!258086 () (_ BitVec 64))

(assert (=> d!56757 (= res!137053 (= lt!258085 (bvsub lt!258083 lt!258086)))))

(assert (=> d!56757 (or (= (bvand lt!258083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!258086 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!258083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258083 lt!258086) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56757 (= lt!258086 (remainingBits!0 ((_ sign_extend 32) (size!3687 (buf!4139 thiss!1577))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577))) ((_ sign_extend 32) lt!258055)))))

(declare-fun lt!258087 () (_ BitVec 64))

(declare-fun lt!258084 () (_ BitVec 64))

(assert (=> d!56757 (= lt!258083 (bvmul lt!258087 lt!258084))))

(assert (=> d!56757 (or (= lt!258087 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!258084 (bvsdiv (bvmul lt!258087 lt!258084) lt!258087)))))

(assert (=> d!56757 (= lt!258084 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56757 (= lt!258087 ((_ sign_extend 32) (size!3687 (buf!4139 thiss!1577))))))

(assert (=> d!56757 (= lt!258085 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) lt!258055)))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56757 (invariant!0 lt!258055 (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)) (size!3687 (buf!4139 thiss!1577)))))

(assert (=> d!56757 (= (bitIndex!0 (size!3687 (buf!4139 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)) lt!258055) lt!258085)))

(declare-fun b!164464 () Bool)

(declare-fun res!137052 () Bool)

(assert (=> b!164464 (=> (not res!137052) (not e!113651))))

(assert (=> b!164464 (= res!137052 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!258085))))

(declare-fun b!164465 () Bool)

(declare-fun lt!258088 () (_ BitVec 64))

(assert (=> b!164465 (= e!113651 (bvsle lt!258085 (bvmul lt!258088 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!164465 (or (= lt!258088 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!258088 #b0000000000000000000000000000000000000000000000000000000000001000) lt!258088)))))

(assert (=> b!164465 (= lt!258088 ((_ sign_extend 32) (size!3687 (buf!4139 thiss!1577))))))

(assert (= (and d!56757 res!137053) b!164464))

(assert (= (and b!164464 res!137052) b!164465))

(declare-fun m!261557 () Bool)

(assert (=> d!56757 m!261557))

(declare-fun m!261559 () Bool)

(assert (=> d!56757 m!261559))

(assert (=> b!164435 d!56757))

(declare-fun d!56759 () Bool)

(declare-fun e!113652 () Bool)

(assert (=> d!56759 e!113652))

(declare-fun res!137055 () Bool)

(assert (=> d!56759 (=> (not res!137055) (not e!113652))))

(declare-fun lt!258092 () (_ BitVec 64))

(declare-fun lt!258089 () (_ BitVec 64))

(declare-fun lt!258091 () (_ BitVec 64))

(assert (=> d!56759 (= res!137055 (= lt!258091 (bvsub lt!258089 lt!258092)))))

(assert (=> d!56759 (or (= (bvand lt!258089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!258092 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!258089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258089 lt!258092) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56759 (= lt!258092 (remainingBits!0 ((_ sign_extend 32) (size!3687 (buf!4139 thiss!1577))) ((_ sign_extend 32) (currentByte!7712 thiss!1577)) ((_ sign_extend 32) (currentBit!7707 thiss!1577))))))

(declare-fun lt!258093 () (_ BitVec 64))

(declare-fun lt!258090 () (_ BitVec 64))

(assert (=> d!56759 (= lt!258089 (bvmul lt!258093 lt!258090))))

(assert (=> d!56759 (or (= lt!258093 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!258090 (bvsdiv (bvmul lt!258093 lt!258090) lt!258093)))))

(assert (=> d!56759 (= lt!258090 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56759 (= lt!258093 ((_ sign_extend 32) (size!3687 (buf!4139 thiss!1577))))))

(assert (=> d!56759 (= lt!258091 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7712 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7707 thiss!1577))))))

(assert (=> d!56759 (invariant!0 (currentBit!7707 thiss!1577) (currentByte!7712 thiss!1577) (size!3687 (buf!4139 thiss!1577)))))

(assert (=> d!56759 (= (bitIndex!0 (size!3687 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) (currentBit!7707 thiss!1577)) lt!258091)))

(declare-fun b!164466 () Bool)

(declare-fun res!137054 () Bool)

(assert (=> b!164466 (=> (not res!137054) (not e!113652))))

(assert (=> b!164466 (= res!137054 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!258091))))

(declare-fun b!164467 () Bool)

(declare-fun lt!258094 () (_ BitVec 64))

(assert (=> b!164467 (= e!113652 (bvsle lt!258091 (bvmul lt!258094 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!164467 (or (= lt!258094 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!258094 #b0000000000000000000000000000000000000000000000000000000000001000) lt!258094)))))

(assert (=> b!164467 (= lt!258094 ((_ sign_extend 32) (size!3687 (buf!4139 thiss!1577))))))

(assert (= (and d!56759 res!137055) b!164466))

(assert (= (and b!164466 res!137054) b!164467))

(declare-fun m!261561 () Bool)

(assert (=> d!56759 m!261561))

(declare-fun m!261563 () Bool)

(assert (=> d!56759 m!261563))

(assert (=> b!164435 d!56759))

(declare-fun d!56761 () Bool)

(assert (=> d!56761 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7707 thiss!1577) (currentByte!7712 thiss!1577) (size!3687 (buf!4139 thiss!1577))))))

(declare-fun bs!14065 () Bool)

(assert (= bs!14065 d!56761))

(assert (=> bs!14065 m!261563))

(assert (=> start!34730 d!56761))

(declare-fun d!56763 () Bool)

(declare-fun e!113659 () Bool)

(assert (=> d!56763 e!113659))

(declare-fun res!137064 () Bool)

(assert (=> d!56763 (=> (not res!137064) (not e!113659))))

(assert (=> d!56763 (= res!137064 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)) (size!3687 lt!258059))))))

(declare-fun lt!258137 () Unit!11451)

(declare-fun choose!207 (array!8234 (_ BitVec 32) (_ BitVec 8)) Unit!11451)

(assert (=> d!56763 (= lt!258137 (choose!207 lt!258059 (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)) lt!258057))))

(assert (=> d!56763 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)) (size!3687 lt!258059)))))

(assert (=> d!56763 (= (arrayUpdatedAtPrefixLemma!229 lt!258059 (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)) lt!258057) lt!258137)))

(declare-fun b!164480 () Bool)

(assert (=> b!164480 (= e!113659 (arrayRangesEq!621 lt!258059 (array!8235 (store (arr!4608 lt!258059) (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577)) lt!258057) (size!3687 lt!258059)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577))))))

(assert (= (and d!56763 res!137064) b!164480))

(declare-fun m!261565 () Bool)

(assert (=> d!56763 m!261565))

(declare-fun m!261567 () Bool)

(assert (=> b!164480 m!261567))

(declare-fun m!261569 () Bool)

(assert (=> b!164480 m!261569))

(assert (=> b!164436 d!56763))

(declare-fun d!56765 () Bool)

(assert (=> d!56765 (arrayRangesEq!621 (buf!4139 thiss!1577) lt!258056 #b00000000000000000000000000000000 (currentByte!7712 thiss!1577))))

(declare-fun lt!258140 () Unit!11451)

(declare-fun choose!208 (array!8234 array!8234 array!8234 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11451)

(assert (=> d!56765 (= lt!258140 (choose!208 (buf!4139 thiss!1577) lt!258059 lt!258056 #b00000000000000000000000000000000 (currentByte!7712 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577))))))

(assert (=> d!56765 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!7712 thiss!1577)) (bvsle (currentByte!7712 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577))))))

(assert (=> d!56765 (= (arrayRangesEqTransitive!168 (buf!4139 thiss!1577) lt!258059 lt!258056 #b00000000000000000000000000000000 (currentByte!7712 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577))) lt!258140)))

(declare-fun bs!14066 () Bool)

(assert (= bs!14066 d!56765))

(assert (=> bs!14066 m!261507))

(declare-fun m!261571 () Bool)

(assert (=> bs!14066 m!261571))

(assert (=> b!164436 d!56765))

(declare-fun d!56767 () Bool)

(declare-fun res!137072 () Bool)

(declare-fun e!113666 () Bool)

(assert (=> d!56767 (=> res!137072 e!113666)))

(assert (=> d!56767 (= res!137072 (= #b00000000000000000000000000000000 (currentByte!7712 thiss!1577)))))

(assert (=> d!56767 (= (arrayRangesEq!621 (buf!4139 thiss!1577) (array!8235 (store (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) lt!258061) (size!3687 (buf!4139 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7712 thiss!1577)) e!113666)))

(declare-fun b!164490 () Bool)

(declare-fun e!113667 () Bool)

(assert (=> b!164490 (= e!113666 e!113667)))

(declare-fun res!137073 () Bool)

(assert (=> b!164490 (=> (not res!137073) (not e!113667))))

(assert (=> b!164490 (= res!137073 (= (select (arr!4608 (buf!4139 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4608 (array!8235 (store (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) lt!258061) (size!3687 (buf!4139 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!164491 () Bool)

(assert (=> b!164491 (= e!113667 (arrayRangesEq!621 (buf!4139 thiss!1577) (array!8235 (store (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) lt!258061) (size!3687 (buf!4139 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7712 thiss!1577)))))

(assert (= (and d!56767 (not res!137072)) b!164490))

(assert (= (and b!164490 res!137073) b!164491))

(declare-fun m!261605 () Bool)

(assert (=> b!164490 m!261605))

(declare-fun m!261607 () Bool)

(assert (=> b!164490 m!261607))

(declare-fun m!261609 () Bool)

(assert (=> b!164491 m!261609))

(assert (=> b!164436 d!56767))

(declare-fun d!56771 () Bool)

(declare-fun res!137074 () Bool)

(declare-fun e!113668 () Bool)

(assert (=> d!56771 (=> res!137074 e!113668)))

(assert (=> d!56771 (= res!137074 (= #b00000000000000000000000000000000 (currentByte!7712 thiss!1577)))))

(assert (=> d!56771 (= (arrayRangesEq!621 (buf!4139 thiss!1577) lt!258056 #b00000000000000000000000000000000 (currentByte!7712 thiss!1577)) e!113668)))

(declare-fun b!164492 () Bool)

(declare-fun e!113669 () Bool)

(assert (=> b!164492 (= e!113668 e!113669)))

(declare-fun res!137075 () Bool)

(assert (=> b!164492 (=> (not res!137075) (not e!113669))))

(assert (=> b!164492 (= res!137075 (= (select (arr!4608 (buf!4139 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4608 lt!258056) #b00000000000000000000000000000000)))))

(declare-fun b!164493 () Bool)

(assert (=> b!164493 (= e!113669 (arrayRangesEq!621 (buf!4139 thiss!1577) lt!258056 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7712 thiss!1577)))))

(assert (= (and d!56771 (not res!137074)) b!164492))

(assert (= (and b!164492 res!137075) b!164493))

(assert (=> b!164492 m!261605))

(declare-fun m!261611 () Bool)

(assert (=> b!164492 m!261611))

(declare-fun m!261613 () Bool)

(assert (=> b!164493 m!261613))

(assert (=> b!164436 d!56771))

(declare-fun d!56773 () Bool)

(declare-fun e!113670 () Bool)

(assert (=> d!56773 e!113670))

(declare-fun res!137076 () Bool)

(assert (=> d!56773 (=> (not res!137076) (not e!113670))))

(assert (=> d!56773 (= res!137076 (and (bvsge (currentByte!7712 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7712 thiss!1577) (size!3687 (buf!4139 thiss!1577)))))))

(declare-fun lt!258161 () Unit!11451)

(assert (=> d!56773 (= lt!258161 (choose!207 (buf!4139 thiss!1577) (currentByte!7712 thiss!1577) lt!258061))))

(assert (=> d!56773 (and (bvsle #b00000000000000000000000000000000 (currentByte!7712 thiss!1577)) (bvslt (currentByte!7712 thiss!1577) (size!3687 (buf!4139 thiss!1577))))))

(assert (=> d!56773 (= (arrayUpdatedAtPrefixLemma!229 (buf!4139 thiss!1577) (currentByte!7712 thiss!1577) lt!258061) lt!258161)))

(declare-fun b!164494 () Bool)

(assert (=> b!164494 (= e!113670 (arrayRangesEq!621 (buf!4139 thiss!1577) (array!8235 (store (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) lt!258061) (size!3687 (buf!4139 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7712 thiss!1577)))))

(assert (= (and d!56773 res!137076) b!164494))

(declare-fun m!261615 () Bool)

(assert (=> d!56773 m!261615))

(assert (=> b!164494 m!261491))

(assert (=> b!164494 m!261485))

(assert (=> b!164436 d!56773))

(declare-fun d!56775 () Bool)

(assert (=> d!56775 (= (byteRangesEq!0 (select (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577)) lt!258061 #b00000000000000000000000000000000 lt!258055) (or (= #b00000000000000000000000000000000 lt!258055) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4608 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!258055))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!258061) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!258055))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14069 () Bool)

(assert (= bs!14069 d!56775))

(declare-fun m!261623 () Bool)

(assert (=> bs!14069 m!261623))

(declare-fun m!261625 () Bool)

(assert (=> bs!14069 m!261625))

(assert (=> b!164436 d!56775))

(declare-fun d!56783 () Bool)

(declare-fun res!137086 () Bool)

(declare-fun e!113677 () Bool)

(assert (=> d!56783 (=> res!137086 e!113677)))

(assert (=> d!56783 (= res!137086 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577))))))

(assert (=> d!56783 (= (arrayRangesEq!621 lt!258059 lt!258056 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577))) e!113677)))

(declare-fun b!164504 () Bool)

(declare-fun e!113678 () Bool)

(assert (=> b!164504 (= e!113677 e!113678)))

(declare-fun res!137087 () Bool)

(assert (=> b!164504 (=> (not res!137087) (not e!113678))))

(assert (=> b!164504 (= res!137087 (= (select (arr!4608 lt!258059) #b00000000000000000000000000000000) (select (arr!4608 lt!258056) #b00000000000000000000000000000000)))))

(declare-fun b!164505 () Bool)

(assert (=> b!164505 (= e!113678 (arrayRangesEq!621 lt!258059 lt!258056 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7712 thiss!1577))))))

(assert (= (and d!56783 (not res!137086)) b!164504))

(assert (= (and b!164504 res!137087) b!164505))

(declare-fun m!261627 () Bool)

(assert (=> b!164504 m!261627))

(assert (=> b!164504 m!261611))

(declare-fun m!261629 () Bool)

(assert (=> b!164505 m!261629))

(assert (=> b!164436 d!56783))

(declare-fun d!56785 () Bool)

(assert (=> d!56785 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3687 (buf!4139 thiss!1577))) ((_ sign_extend 32) (currentByte!7712 thiss!1577)) ((_ sign_extend 32) (currentBit!7707 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3687 (buf!4139 thiss!1577))) ((_ sign_extend 32) (currentByte!7712 thiss!1577)) ((_ sign_extend 32) (currentBit!7707 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14070 () Bool)

(assert (= bs!14070 d!56785))

(assert (=> bs!14070 m!261561))

(assert (=> b!164431 d!56785))

(declare-fun d!56787 () Bool)

(assert (=> d!56787 (= (array_inv!3428 (buf!4139 thiss!1577)) (bvsge (size!3687 (buf!4139 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164433 d!56787))

(declare-fun d!56789 () Bool)

(assert (=> d!56789 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3687 (buf!4139 (_1!7866 lt!258060)))) ((_ sign_extend 32) (currentByte!7712 (_1!7866 lt!258060))) ((_ sign_extend 32) (currentBit!7707 (_1!7866 lt!258060))) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3687 (buf!4139 (_1!7866 lt!258060)))) ((_ sign_extend 32) (currentByte!7712 (_1!7866 lt!258060))) ((_ sign_extend 32) (currentBit!7707 (_1!7866 lt!258060)))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14071 () Bool)

(assert (= bs!14071 d!56789))

(declare-fun m!261631 () Bool)

(assert (=> bs!14071 m!261631))

(assert (=> b!164432 d!56789))

(declare-fun b!164548 () Bool)

(declare-fun e!113700 () Unit!11451)

(declare-fun lt!258291 () Unit!11451)

(assert (=> b!164548 (= e!113700 lt!258291)))

(declare-fun lt!258297 () (_ BitVec 64))

(assert (=> b!164548 (= lt!258297 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!258304 () (_ BitVec 64))

(assert (=> b!164548 (= lt!258304 (bitIndex!0 (size!3687 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) (currentBit!7707 thiss!1577)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8234 array!8234 (_ BitVec 64) (_ BitVec 64)) Unit!11451)

(assert (=> b!164548 (= lt!258291 (arrayBitRangesEqSymmetric!0 (buf!4139 thiss!1577) (buf!4139 lt!258063) lt!258297 lt!258304))))

(assert (=> b!164548 (arrayBitRangesEq!0 (buf!4139 lt!258063) (buf!4139 thiss!1577) lt!258297 lt!258304)))

(declare-fun b!164549 () Bool)

(declare-fun res!137121 () Bool)

(declare-fun e!113699 () Bool)

(assert (=> b!164549 (=> (not res!137121) (not e!113699))))

(declare-fun lt!258299 () tuple2!14550)

(assert (=> b!164549 (= res!137121 (isPrefixOf!0 (_1!7866 lt!258299) thiss!1577))))

(declare-fun b!164550 () Bool)

(declare-fun Unit!11455 () Unit!11451)

(assert (=> b!164550 (= e!113700 Unit!11455)))

(declare-fun b!164551 () Bool)

(declare-fun res!137122 () Bool)

(assert (=> b!164551 (=> (not res!137122) (not e!113699))))

(assert (=> b!164551 (= res!137122 (isPrefixOf!0 (_2!7866 lt!258299) lt!258063))))

(declare-fun lt!258298 () (_ BitVec 64))

(declare-fun lt!258289 () (_ BitVec 64))

(declare-fun b!164552 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!6530 (_ BitVec 64)) BitStream!6530)

(assert (=> b!164552 (= e!113699 (= (_1!7866 lt!258299) (withMovedBitIndex!0 (_2!7866 lt!258299) (bvsub lt!258298 lt!258289))))))

(assert (=> b!164552 (or (= (bvand lt!258298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!258289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!258298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258298 lt!258289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!164552 (= lt!258289 (bitIndex!0 (size!3687 (buf!4139 lt!258063)) (currentByte!7712 lt!258063) (currentBit!7707 lt!258063)))))

(assert (=> b!164552 (= lt!258298 (bitIndex!0 (size!3687 (buf!4139 thiss!1577)) (currentByte!7712 thiss!1577) (currentBit!7707 thiss!1577)))))

(declare-fun d!56791 () Bool)

(assert (=> d!56791 e!113699))

(declare-fun res!137120 () Bool)

(assert (=> d!56791 (=> (not res!137120) (not e!113699))))

(assert (=> d!56791 (= res!137120 (isPrefixOf!0 (_1!7866 lt!258299) (_2!7866 lt!258299)))))

(declare-fun lt!258293 () BitStream!6530)

(assert (=> d!56791 (= lt!258299 (tuple2!14551 lt!258293 lt!258063))))

(declare-fun lt!258296 () Unit!11451)

(declare-fun lt!258294 () Unit!11451)

(assert (=> d!56791 (= lt!258296 lt!258294)))

(assert (=> d!56791 (isPrefixOf!0 lt!258293 lt!258063)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6530 BitStream!6530 BitStream!6530) Unit!11451)

(assert (=> d!56791 (= lt!258294 (lemmaIsPrefixTransitive!0 lt!258293 lt!258063 lt!258063))))

(declare-fun lt!258303 () Unit!11451)

(declare-fun lt!258295 () Unit!11451)

(assert (=> d!56791 (= lt!258303 lt!258295)))

(assert (=> d!56791 (isPrefixOf!0 lt!258293 lt!258063)))

(assert (=> d!56791 (= lt!258295 (lemmaIsPrefixTransitive!0 lt!258293 thiss!1577 lt!258063))))

(declare-fun lt!258302 () Unit!11451)

(assert (=> d!56791 (= lt!258302 e!113700)))

(declare-fun c!8585 () Bool)

(assert (=> d!56791 (= c!8585 (not (= (size!3687 (buf!4139 thiss!1577)) #b00000000000000000000000000000000)))))

(declare-fun lt!258290 () Unit!11451)

(declare-fun lt!258288 () Unit!11451)

(assert (=> d!56791 (= lt!258290 lt!258288)))

(assert (=> d!56791 (isPrefixOf!0 lt!258063 lt!258063)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6530) Unit!11451)

(assert (=> d!56791 (= lt!258288 (lemmaIsPrefixRefl!0 lt!258063))))

(declare-fun lt!258300 () Unit!11451)

(declare-fun lt!258292 () Unit!11451)

(assert (=> d!56791 (= lt!258300 lt!258292)))

(assert (=> d!56791 (= lt!258292 (lemmaIsPrefixRefl!0 lt!258063))))

(declare-fun lt!258301 () Unit!11451)

(declare-fun lt!258286 () Unit!11451)

(assert (=> d!56791 (= lt!258301 lt!258286)))

(assert (=> d!56791 (isPrefixOf!0 lt!258293 lt!258293)))

(assert (=> d!56791 (= lt!258286 (lemmaIsPrefixRefl!0 lt!258293))))

(declare-fun lt!258305 () Unit!11451)

(declare-fun lt!258287 () Unit!11451)

(assert (=> d!56791 (= lt!258305 lt!258287)))

(assert (=> d!56791 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!56791 (= lt!258287 (lemmaIsPrefixRefl!0 thiss!1577))))

(assert (=> d!56791 (= lt!258293 (BitStream!6531 (buf!4139 lt!258063) (currentByte!7712 thiss!1577) (currentBit!7707 thiss!1577)))))

(assert (=> d!56791 (isPrefixOf!0 thiss!1577 lt!258063)))

(assert (=> d!56791 (= (reader!0 thiss!1577 lt!258063) lt!258299)))

(assert (= (and d!56791 c!8585) b!164548))

(assert (= (and d!56791 (not c!8585)) b!164550))

(assert (= (and d!56791 res!137120) b!164549))

(assert (= (and b!164549 res!137121) b!164551))

(assert (= (and b!164551 res!137122) b!164552))

(declare-fun m!261671 () Bool)

(assert (=> b!164549 m!261671))

(assert (=> b!164548 m!261517))

(declare-fun m!261673 () Bool)

(assert (=> b!164548 m!261673))

(declare-fun m!261675 () Bool)

(assert (=> b!164548 m!261675))

(declare-fun m!261677 () Bool)

(assert (=> d!56791 m!261677))

(declare-fun m!261679 () Bool)

(assert (=> d!56791 m!261679))

(assert (=> d!56791 m!261511))

(declare-fun m!261681 () Bool)

(assert (=> d!56791 m!261681))

(declare-fun m!261683 () Bool)

(assert (=> d!56791 m!261683))

(declare-fun m!261685 () Bool)

(assert (=> d!56791 m!261685))

(declare-fun m!261687 () Bool)

(assert (=> d!56791 m!261687))

(declare-fun m!261689 () Bool)

(assert (=> d!56791 m!261689))

(declare-fun m!261691 () Bool)

(assert (=> d!56791 m!261691))

(declare-fun m!261693 () Bool)

(assert (=> d!56791 m!261693))

(declare-fun m!261695 () Bool)

(assert (=> d!56791 m!261695))

(declare-fun m!261697 () Bool)

(assert (=> b!164552 m!261697))

(assert (=> b!164552 m!261553))

(assert (=> b!164552 m!261517))

(declare-fun m!261699 () Bool)

(assert (=> b!164551 m!261699))

(assert (=> b!164432 d!56791))

(push 1)

(assert (not d!56789))

(assert (not b!164459))

(assert (not b!164505))

(assert (not d!56791))

(assert (not d!56757))

(assert (not b!164548))

(assert (not d!56785))

(assert (not b!164493))

(assert (not d!56773))

(assert (not d!56763))

(assert (not d!56759))

(assert (not b!164551))

(assert (not b!164480))

(assert (not b!164491))

(assert (not d!56765))

(assert (not b!164494))

(assert (not b!164552))

(assert (not b!164549))

(assert (not d!56761))

(assert (not b!164457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

