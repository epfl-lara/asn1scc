; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66080 () Bool)

(assert start!66080)

(declare-fun b!296404 () Bool)

(declare-fun e!212106 () Bool)

(declare-fun lt!431718 () Bool)

(declare-datatypes ((array!17748 0))(
  ( (array!17749 (arr!8751 (Array (_ BitVec 32) (_ BitVec 8))) (size!7692 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13388 0))(
  ( (BitStream!13389 (buf!7755 array!17748) (currentByte!14276 (_ BitVec 32)) (currentBit!14271 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23334 0))(
  ( (tuple2!23335 (_1!13067 Bool) (_2!13067 BitStream!13388)) )
))
(declare-fun lt!431721 () tuple2!23334)

(assert (=> b!296404 (= e!212106 (= lt!431718 (_1!13067 lt!431721)))))

(declare-fun b!296405 () Bool)

(declare-fun res!244719 () Bool)

(declare-fun e!212104 () Bool)

(assert (=> b!296405 (=> (not res!244719) (not e!212104))))

(declare-fun thiss!1728 () BitStream!13388)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296405 (= res!244719 (validate_offset_bits!1 ((_ sign_extend 32) (size!7692 (buf!7755 thiss!1728))) ((_ sign_extend 32) (currentByte!14276 thiss!1728)) ((_ sign_extend 32) (currentBit!14271 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296406 () Bool)

(declare-datatypes ((tuple2!23336 0))(
  ( (tuple2!23337 (_1!13068 BitStream!13388) (_2!13068 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13388) tuple2!23336)

(assert (=> b!296406 (= e!212104 (not (= lt!431718 (_2!13068 (readBitPure!0 thiss!1728)))))))

(assert (=> b!296406 e!212106))

(declare-fun res!244721 () Bool)

(assert (=> b!296406 (=> (not res!244721) (not e!212106))))

(declare-fun lt!431725 () array!17748)

(declare-fun bitAt!0 (array!17748 (_ BitVec 64)) Bool)

(assert (=> b!296406 (= res!244721 (= (bitAt!0 lt!431725 from!505) lt!431718))))

(declare-datatypes ((Unit!20669 0))(
  ( (Unit!20670) )
))
(declare-datatypes ((tuple3!1900 0))(
  ( (tuple3!1901 (_1!13069 Unit!20669) (_2!13069 BitStream!13388) (_3!1400 array!17748)) )
))
(declare-fun lt!431719 () tuple3!1900)

(assert (=> b!296406 (= lt!431718 (bitAt!0 (_3!1400 lt!431719) from!505))))

(declare-fun lt!431722 () Unit!20669)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17748 array!17748 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20669)

(assert (=> b!296406 (= lt!431722 (arrayBitRangesEqImpliesEq!0 lt!431725 (_3!1400 lt!431719) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17748)

(declare-fun arrayBitRangesEq!0 (array!17748 array!17748 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296406 (arrayBitRangesEq!0 arr!273 (_3!1400 lt!431719) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431723 () Unit!20669)

(declare-fun arrayBitRangesEqTransitive!0 (array!17748 array!17748 array!17748 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20669)

(assert (=> b!296406 (= lt!431723 (arrayBitRangesEqTransitive!0 arr!273 lt!431725 (_3!1400 lt!431719) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296406 (arrayBitRangesEq!0 arr!273 lt!431725 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431720 () Unit!20669)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17748 (_ BitVec 64) Bool) Unit!20669)

(assert (=> b!296406 (= lt!431720 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13067 lt!431721)))))

(declare-fun e!212105 () Bool)

(assert (=> b!296406 e!212105))

(declare-fun res!244718 () Bool)

(assert (=> b!296406 (=> (not res!244718) (not e!212105))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296406 (= res!244718 (= (bvsub (bvadd (bitIndex!0 (size!7692 (buf!7755 thiss!1728)) (currentByte!14276 thiss!1728) (currentBit!14271 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7692 (buf!7755 (_2!13069 lt!431719))) (currentByte!14276 (_2!13069 lt!431719)) (currentBit!14271 (_2!13069 lt!431719)))))))

(declare-fun readBitsLoop!0 (BitStream!13388 (_ BitVec 64) array!17748 (_ BitVec 64) (_ BitVec 64)) tuple3!1900)

(assert (=> b!296406 (= lt!431719 (readBitsLoop!0 (_2!13067 lt!431721) nBits!523 lt!431725 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!296406 (validate_offset_bits!1 ((_ sign_extend 32) (size!7692 (buf!7755 (_2!13067 lt!431721)))) ((_ sign_extend 32) (currentByte!14276 (_2!13067 lt!431721))) ((_ sign_extend 32) (currentBit!14271 (_2!13067 lt!431721))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431727 () Unit!20669)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13388 BitStream!13388 (_ BitVec 64) (_ BitVec 64)) Unit!20669)

(assert (=> b!296406 (= lt!431727 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13067 lt!431721) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431726 () (_ BitVec 32))

(declare-fun lt!431724 () (_ BitVec 32))

(assert (=> b!296406 (= lt!431725 (array!17749 (store (arr!8751 arr!273) lt!431726 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8751 arr!273) lt!431726)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431724)))) ((_ sign_extend 24) (ite (_1!13067 lt!431721) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431724) #b00000000))))) (size!7692 arr!273)))))

(assert (=> b!296406 (= lt!431724 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296406 (= lt!431726 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13388) tuple2!23334)

(assert (=> b!296406 (= lt!431721 (readBit!0 thiss!1728))))

(declare-fun res!244717 () Bool)

(assert (=> start!66080 (=> (not res!244717) (not e!212104))))

(assert (=> start!66080 (= res!244717 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7692 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66080 e!212104))

(declare-fun e!212102 () Bool)

(declare-fun inv!12 (BitStream!13388) Bool)

(assert (=> start!66080 (and (inv!12 thiss!1728) e!212102)))

(assert (=> start!66080 true))

(declare-fun array_inv!7304 (array!17748) Bool)

(assert (=> start!66080 (array_inv!7304 arr!273)))

(declare-fun b!296407 () Bool)

(assert (=> b!296407 (= e!212102 (array_inv!7304 (buf!7755 thiss!1728)))))

(declare-fun b!296408 () Bool)

(assert (=> b!296408 (= e!212105 (and (= (buf!7755 thiss!1728) (buf!7755 (_2!13069 lt!431719))) (= (size!7692 arr!273) (size!7692 (_3!1400 lt!431719)))))))

(declare-fun b!296409 () Bool)

(declare-fun res!244720 () Bool)

(assert (=> b!296409 (=> (not res!244720) (not e!212104))))

(assert (=> b!296409 (= res!244720 (bvslt from!505 to!474))))

(assert (= (and start!66080 res!244717) b!296405))

(assert (= (and b!296405 res!244719) b!296409))

(assert (= (and b!296409 res!244720) b!296406))

(assert (= (and b!296406 res!244718) b!296408))

(assert (= (and b!296406 res!244721) b!296404))

(assert (= start!66080 b!296407))

(declare-fun m!434569 () Bool)

(assert (=> b!296405 m!434569))

(declare-fun m!434571 () Bool)

(assert (=> b!296406 m!434571))

(declare-fun m!434573 () Bool)

(assert (=> b!296406 m!434573))

(declare-fun m!434575 () Bool)

(assert (=> b!296406 m!434575))

(declare-fun m!434577 () Bool)

(assert (=> b!296406 m!434577))

(declare-fun m!434579 () Bool)

(assert (=> b!296406 m!434579))

(declare-fun m!434581 () Bool)

(assert (=> b!296406 m!434581))

(declare-fun m!434583 () Bool)

(assert (=> b!296406 m!434583))

(declare-fun m!434585 () Bool)

(assert (=> b!296406 m!434585))

(declare-fun m!434587 () Bool)

(assert (=> b!296406 m!434587))

(declare-fun m!434589 () Bool)

(assert (=> b!296406 m!434589))

(declare-fun m!434591 () Bool)

(assert (=> b!296406 m!434591))

(declare-fun m!434593 () Bool)

(assert (=> b!296406 m!434593))

(declare-fun m!434595 () Bool)

(assert (=> b!296406 m!434595))

(declare-fun m!434597 () Bool)

(assert (=> b!296406 m!434597))

(declare-fun m!434599 () Bool)

(assert (=> b!296406 m!434599))

(declare-fun m!434601 () Bool)

(assert (=> b!296406 m!434601))

(declare-fun m!434603 () Bool)

(assert (=> b!296406 m!434603))

(declare-fun m!434605 () Bool)

(assert (=> start!66080 m!434605))

(declare-fun m!434607 () Bool)

(assert (=> start!66080 m!434607))

(declare-fun m!434609 () Bool)

(assert (=> b!296407 m!434609))

(push 1)

(assert (not b!296407))

(assert (not start!66080))

(assert (not b!296405))

(assert (not b!296406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99840 () Bool)

(assert (=> d!99840 (= (array_inv!7304 (buf!7755 thiss!1728)) (bvsge (size!7692 (buf!7755 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!296407 d!99840))

(declare-fun d!99844 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99844 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14271 thiss!1728) (currentByte!14276 thiss!1728) (size!7692 (buf!7755 thiss!1728))))))

(declare-fun bs!25540 () Bool)

(assert (= bs!25540 d!99844))

(declare-fun m!434629 () Bool)

(assert (=> bs!25540 m!434629))

(assert (=> start!66080 d!99844))

(declare-fun d!99846 () Bool)

(assert (=> d!99846 (= (array_inv!7304 arr!273) (bvsge (size!7692 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66080 d!99846))

(declare-fun d!99848 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99848 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7692 (buf!7755 thiss!1728))) ((_ sign_extend 32) (currentByte!14276 thiss!1728)) ((_ sign_extend 32) (currentBit!14271 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7692 (buf!7755 thiss!1728))) ((_ sign_extend 32) (currentByte!14276 thiss!1728)) ((_ sign_extend 32) (currentBit!14271 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25541 () Bool)

(assert (= bs!25541 d!99848))

(declare-fun m!434631 () Bool)

(assert (=> bs!25541 m!434631))

(assert (=> b!296405 d!99848))

(declare-fun b!296525 () Bool)

(declare-fun res!244814 () Bool)

(declare-fun e!212190 () Bool)

(assert (=> b!296525 (=> (not res!244814) (not e!212190))))

(declare-fun lt!432040 () tuple3!1900)

(assert (=> b!296525 (= res!244814 (invariant!0 (currentBit!14271 (_2!13069 lt!432040)) (currentByte!14276 (_2!13069 lt!432040)) (size!7692 (buf!7755 (_2!13069 lt!432040)))))))

(declare-fun e!212192 () Bool)

(declare-fun lt!432013 () tuple3!1900)

(declare-fun b!296526 () Bool)

(assert (=> b!296526 (= e!212192 (and (= (buf!7755 (_2!13067 lt!431721)) (buf!7755 (_2!13069 lt!432013))) (= (size!7692 lt!431725) (size!7692 (_3!1400 lt!432013)))))))

(declare-fun b!296527 () Bool)

(declare-fun e!212189 () tuple3!1900)

(declare-fun lt!432041 () Unit!20669)

(assert (=> b!296527 (= e!212189 (tuple3!1901 lt!432041 (_2!13069 lt!432013) (_3!1400 lt!432013)))))

(declare-fun lt!432021 () tuple2!23334)

(assert (=> b!296527 (= lt!432021 (readBit!0 (_2!13067 lt!431721)))))

(declare-fun lt!432039 () (_ BitVec 32))

(assert (=> b!296527 (= lt!432039 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432010 () (_ BitVec 32))

(assert (=> b!296527 (= lt!432010 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432016 () array!17748)

(assert (=> b!296527 (= lt!432016 (array!17749 (store (arr!8751 lt!431725) lt!432039 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8751 lt!431725) lt!432039)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432010)))) ((_ sign_extend 24) (ite (_1!13067 lt!432021) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432010) #b00000000))))) (size!7692 lt!431725)))))

(declare-fun lt!432023 () (_ BitVec 64))

(assert (=> b!296527 (= lt!432023 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!432017 () (_ BitVec 64))

(assert (=> b!296527 (= lt!432017 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!432036 () Unit!20669)

(assert (=> b!296527 (= lt!432036 (validateOffsetBitsIneqLemma!0 (_2!13067 lt!431721) (_2!13067 lt!432021) lt!432023 lt!432017))))

(assert (=> b!296527 (validate_offset_bits!1 ((_ sign_extend 32) (size!7692 (buf!7755 (_2!13067 lt!432021)))) ((_ sign_extend 32) (currentByte!14276 (_2!13067 lt!432021))) ((_ sign_extend 32) (currentBit!14271 (_2!13067 lt!432021))) (bvsub lt!432023 lt!432017))))

(declare-fun lt!432009 () Unit!20669)

(assert (=> b!296527 (= lt!432009 lt!432036)))

(assert (=> b!296527 (= lt!432013 (readBitsLoop!0 (_2!13067 lt!432021) nBits!523 lt!432016 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!244813 () Bool)

(assert (=> b!296527 (= res!244813 (= (bvsub (bvadd (bitIndex!0 (size!7692 (buf!7755 (_2!13067 lt!431721))) (currentByte!14276 (_2!13067 lt!431721)) (currentBit!14271 (_2!13067 lt!431721))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7692 (buf!7755 (_2!13069 lt!432013))) (currentByte!14276 (_2!13069 lt!432013)) (currentBit!14271 (_2!13069 lt!432013)))))))

(assert (=> b!296527 (=> (not res!244813) (not e!212192))))

(assert (=> b!296527 e!212192))

(declare-fun lt!432015 () Unit!20669)

(declare-fun Unit!20675 () Unit!20669)

(assert (=> b!296527 (= lt!432015 Unit!20675)))

(declare-fun lt!432022 () (_ BitVec 32))

(assert (=> b!296527 (= lt!432022 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432011 () (_ BitVec 32))

(assert (=> b!296527 (= lt!432011 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432028 () Unit!20669)

(assert (=> b!296527 (= lt!432028 (arrayBitRangesUpdatedAtLemma!0 lt!431725 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!13067 lt!432021)))))

(declare-fun call!5172 () Bool)

(assert (=> b!296527 call!5172))

(declare-fun lt!432020 () Unit!20669)

(assert (=> b!296527 (= lt!432020 lt!432028)))

(declare-fun lt!432033 () (_ BitVec 64))

(assert (=> b!296527 (= lt!432033 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!432007 () Unit!20669)

(assert (=> b!296527 (= lt!432007 (arrayBitRangesEqTransitive!0 lt!431725 lt!432016 (_3!1400 lt!432013) lt!432033 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun call!5171 () Bool)

(assert (=> b!296527 call!5171))

(declare-fun lt!432029 () Unit!20669)

(assert (=> b!296527 (= lt!432029 lt!432007)))

(assert (=> b!296527 (arrayBitRangesEq!0 lt!431725 (_3!1400 lt!432013) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!432014 () Unit!20669)

(declare-fun Unit!20676 () Unit!20669)

(assert (=> b!296527 (= lt!432014 Unit!20676)))

(declare-fun lt!432019 () Unit!20669)

(assert (=> b!296527 (= lt!432019 (arrayBitRangesEqImpliesEq!0 lt!432016 (_3!1400 lt!432013) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!296527 (= (bitAt!0 lt!432016 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1400 lt!432013) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!432037 () Unit!20669)

(assert (=> b!296527 (= lt!432037 lt!432019)))

(declare-fun lt!432012 () Unit!20669)

(declare-fun Unit!20677 () Unit!20669)

(assert (=> b!296527 (= lt!432012 Unit!20677)))

(declare-fun lt!432031 () Bool)

(assert (=> b!296527 (= lt!432031 (= (bitAt!0 (_3!1400 lt!432013) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!13067 lt!432021)))))

(declare-fun Unit!20678 () Unit!20669)

(assert (=> b!296527 (= lt!432041 Unit!20678)))

(assert (=> b!296527 lt!432031))

(declare-fun b!296528 () Bool)

(declare-fun res!244818 () Bool)

(assert (=> b!296528 (=> (not res!244818) (not e!212190))))

(assert (=> b!296528 (= res!244818 (and (= (buf!7755 (_2!13067 lt!431721)) (buf!7755 (_2!13069 lt!432040))) (= (size!7692 lt!431725) (size!7692 (_3!1400 lt!432040)))))))

(declare-fun b!296529 () Bool)

(declare-fun lt!432018 () Unit!20669)

(assert (=> b!296529 (= e!212189 (tuple3!1901 lt!432018 (_2!13067 lt!431721) lt!431725))))

(declare-fun lt!432024 () Unit!20669)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17748) Unit!20669)

(assert (=> b!296529 (= lt!432024 (arrayBitRangesEqReflexiveLemma!0 lt!431725))))

(assert (=> b!296529 call!5172))

(declare-fun lt!432025 () Unit!20669)

(assert (=> b!296529 (= lt!432025 lt!432024)))

(declare-fun lt!432034 () array!17748)

(assert (=> b!296529 (= lt!432034 lt!431725)))

(declare-fun lt!432026 () array!17748)

(assert (=> b!296529 (= lt!432026 lt!431725)))

(declare-fun lt!432035 () (_ BitVec 64))

(assert (=> b!296529 (= lt!432035 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!432038 () (_ BitVec 64))

(assert (=> b!296529 (= lt!432038 ((_ sign_extend 32) (size!7692 lt!431725)))))

(declare-fun lt!432042 () (_ BitVec 64))

(assert (=> b!296529 (= lt!432042 (bvmul lt!432038 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!432008 () (_ BitVec 64))

(assert (=> b!296529 (= lt!432008 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!432032 () (_ BitVec 64))

(assert (=> b!296529 (= lt!432032 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17748 array!17748 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20669)

(assert (=> b!296529 (= lt!432018 (arrayBitRangesEqSlicedLemma!0 lt!432034 lt!432026 lt!432035 lt!432042 lt!432008 lt!432032))))

(assert (=> b!296529 call!5171))

(declare-fun c!13528 () Bool)

(declare-fun bm!5168 () Bool)

(assert (=> bm!5168 (= call!5171 (arrayBitRangesEq!0 (ite c!13528 lt!431725 lt!432034) (ite c!13528 (_3!1400 lt!432013) lt!432026) (ite c!13528 lt!432033 lt!432008) (ite c!13528 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!432032)))))

(declare-fun b!296530 () Bool)

(declare-fun res!244812 () Bool)

(assert (=> b!296530 (=> (not res!244812) (not e!212190))))

(assert (=> b!296530 (= res!244812 (arrayBitRangesEq!0 lt!431725 (_3!1400 lt!432040) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun bm!5169 () Bool)

(assert (=> bm!5169 (= call!5172 (arrayBitRangesEq!0 lt!431725 (ite c!13528 (array!17749 (store (arr!8751 lt!431725) lt!432022 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8751 lt!431725) lt!432022)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432011)))) ((_ sign_extend 24) (ite (_1!13067 lt!432021) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432011) #b00000000))))) (size!7692 lt!431725)) lt!431725) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13528 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7692 lt!431725)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!296531 () Bool)

(declare-datatypes ((List!991 0))(
  ( (Nil!988) (Cons!987 (h!1106 Bool) (t!1876 List!991)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13388 array!17748 (_ BitVec 64) (_ BitVec 64)) List!991)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13388 BitStream!13388 (_ BitVec 64)) List!991)

(assert (=> b!296531 (= e!212190 (= (byteArrayBitContentToList!0 (_2!13069 lt!432040) (_3!1400 lt!432040) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!13069 lt!432040) (_2!13067 lt!431721) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!296531 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!296531 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296532 () Bool)

(declare-fun res!244817 () Bool)

(assert (=> b!296532 (=> (not res!244817) (not e!212190))))

(declare-fun e!212191 () Bool)

(assert (=> b!296532 (= res!244817 e!212191)))

(declare-fun res!244815 () Bool)

(assert (=> b!296532 (=> res!244815 e!212191)))

(assert (=> b!296532 (= res!244815 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun d!99850 () Bool)

(assert (=> d!99850 e!212190))

(declare-fun res!244816 () Bool)

(assert (=> d!99850 (=> (not res!244816) (not e!212190))))

(declare-fun lt!432030 () (_ BitVec 64))

(assert (=> d!99850 (= res!244816 (= (bvsub lt!432030 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7692 (buf!7755 (_2!13069 lt!432040))) (currentByte!14276 (_2!13069 lt!432040)) (currentBit!14271 (_2!13069 lt!432040)))))))

(assert (=> d!99850 (or (= (bvand lt!432030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!432030 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!432030 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432027 () (_ BitVec 64))

(assert (=> d!99850 (= lt!432030 (bvadd lt!432027 to!474))))

(assert (=> d!99850 (or (not (= (bvand lt!432027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!432027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!432027 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99850 (= lt!432027 (bitIndex!0 (size!7692 (buf!7755 (_2!13067 lt!431721))) (currentByte!14276 (_2!13067 lt!431721)) (currentBit!14271 (_2!13067 lt!431721))))))

(assert (=> d!99850 (= lt!432040 e!212189)))

(assert (=> d!99850 (= c!13528 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99850 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99850 (= (readBitsLoop!0 (_2!13067 lt!431721) nBits!523 lt!431725 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!432040)))

(declare-fun b!296533 () Bool)

(assert (=> b!296533 (= e!212191 (= (bitAt!0 (_3!1400 lt!432040) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!13068 (readBitPure!0 (_2!13067 lt!431721)))))))

(assert (= (and d!99850 c!13528) b!296527))

(assert (= (and d!99850 (not c!13528)) b!296529))

(assert (= (and b!296527 res!244813) b!296526))

(assert (= (or b!296527 b!296529) bm!5168))

(assert (= (or b!296527 b!296529) bm!5169))

(assert (= (and d!99850 res!244816) b!296528))

(assert (= (and b!296528 res!244818) b!296530))

(assert (= (and b!296530 res!244812) b!296532))

(assert (= (and b!296532 (not res!244815)) b!296533))

(assert (= (and b!296532 res!244817) b!296525))

(assert (= (and b!296525 res!244814) b!296531))

(declare-fun m!434775 () Bool)

(assert (=> b!296531 m!434775))

(declare-fun m!434777 () Bool)

(assert (=> b!296531 m!434777))

(declare-fun m!434779 () Bool)

(assert (=> b!296529 m!434779))

(declare-fun m!434781 () Bool)

(assert (=> b!296529 m!434781))

(declare-fun m!434783 () Bool)

(assert (=> bm!5169 m!434783))

(declare-fun m!434785 () Bool)

(assert (=> bm!5169 m!434785))

(declare-fun m!434787 () Bool)

(assert (=> bm!5169 m!434787))

(declare-fun m!434789 () Bool)

(assert (=> bm!5169 m!434789))

(declare-fun m!434791 () Bool)

(assert (=> b!296527 m!434791))

(declare-fun m!434793 () Bool)

(assert (=> b!296527 m!434793))

(declare-fun m!434795 () Bool)

(assert (=> b!296527 m!434795))

(declare-fun m!434797 () Bool)

(assert (=> b!296527 m!434797))

(declare-fun m!434799 () Bool)

(assert (=> b!296527 m!434799))

(declare-fun m!434801 () Bool)

(assert (=> b!296527 m!434801))

(declare-fun m!434803 () Bool)

(assert (=> b!296527 m!434803))

(declare-fun m!434805 () Bool)

(assert (=> b!296527 m!434805))

(declare-fun m!434807 () Bool)

(assert (=> b!296527 m!434807))

(declare-fun m!434809 () Bool)

(assert (=> b!296527 m!434809))

(declare-fun m!434811 () Bool)

(assert (=> b!296527 m!434811))

(declare-fun m!434813 () Bool)

(assert (=> b!296527 m!434813))

(declare-fun m!434815 () Bool)

(assert (=> b!296527 m!434815))

(declare-fun m!434817 () Bool)

(assert (=> b!296527 m!434817))

(declare-fun m!434819 () Bool)

(assert (=> b!296527 m!434819))

(declare-fun m!434821 () Bool)

(assert (=> d!99850 m!434821))

(assert (=> d!99850 m!434805))

(declare-fun m!434823 () Bool)

(assert (=> bm!5168 m!434823))

(declare-fun m!434825 () Bool)

(assert (=> b!296533 m!434825))

(declare-fun m!434827 () Bool)

(assert (=> b!296533 m!434827))

(declare-fun m!434829 () Bool)

(assert (=> b!296530 m!434829))

(declare-fun m!434831 () Bool)

(assert (=> b!296525 m!434831))

(assert (=> b!296406 d!99850))

(declare-fun d!99892 () Bool)

(assert (=> d!99892 (= (bitAt!0 lt!431725 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8751 lt!431725) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25554 () Bool)

(assert (= bs!25554 d!99892))

(declare-fun m!434833 () Bool)

(assert (=> bs!25554 m!434833))

(declare-fun m!434835 () Bool)

(assert (=> bs!25554 m!434835))

(assert (=> b!296406 d!99892))

(declare-fun d!99894 () Bool)

(assert (=> d!99894 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7692 (buf!7755 (_2!13067 lt!431721)))) ((_ sign_extend 32) (currentByte!14276 (_2!13067 lt!431721))) ((_ sign_extend 32) (currentBit!14271 (_2!13067 lt!431721))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7692 (buf!7755 (_2!13067 lt!431721)))) ((_ sign_extend 32) (currentByte!14276 (_2!13067 lt!431721))) ((_ sign_extend 32) (currentBit!14271 (_2!13067 lt!431721)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25555 () Bool)

(assert (= bs!25555 d!99894))

(declare-fun m!434837 () Bool)

(assert (=> bs!25555 m!434837))

(assert (=> b!296406 d!99894))

(declare-fun d!99896 () Bool)

(assert (=> d!99896 (= (bitAt!0 (_3!1400 lt!431719) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8751 (_3!1400 lt!431719)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25556 () Bool)

(assert (= bs!25556 d!99896))

(declare-fun m!434839 () Bool)

(assert (=> bs!25556 m!434839))

(assert (=> bs!25556 m!434835))

(assert (=> b!296406 d!99896))

(declare-fun d!99898 () Bool)

(declare-fun e!212195 () Bool)

(assert (=> d!99898 e!212195))

(declare-fun res!244823 () Bool)

(assert (=> d!99898 (=> (not res!244823) (not e!212195))))

(declare-fun lt!432058 () (_ BitVec 64))

(declare-fun lt!432056 () (_ BitVec 64))

(declare-fun lt!432060 () (_ BitVec 64))

(assert (=> d!99898 (= res!244823 (= lt!432060 (bvsub lt!432058 lt!432056)))))

(assert (=> d!99898 (or (= (bvand lt!432058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!432056 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!432058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!432058 lt!432056) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99898 (= lt!432056 (remainingBits!0 ((_ sign_extend 32) (size!7692 (buf!7755 thiss!1728))) ((_ sign_extend 32) (currentByte!14276 thiss!1728)) ((_ sign_extend 32) (currentBit!14271 thiss!1728))))))

(declare-fun lt!432059 () (_ BitVec 64))

(declare-fun lt!432055 () (_ BitVec 64))

(assert (=> d!99898 (= lt!432058 (bvmul lt!432059 lt!432055))))

(assert (=> d!99898 (or (= lt!432059 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!432055 (bvsdiv (bvmul lt!432059 lt!432055) lt!432059)))))

(assert (=> d!99898 (= lt!432055 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99898 (= lt!432059 ((_ sign_extend 32) (size!7692 (buf!7755 thiss!1728))))))

(assert (=> d!99898 (= lt!432060 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14276 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14271 thiss!1728))))))

(assert (=> d!99898 (invariant!0 (currentBit!14271 thiss!1728) (currentByte!14276 thiss!1728) (size!7692 (buf!7755 thiss!1728)))))

(assert (=> d!99898 (= (bitIndex!0 (size!7692 (buf!7755 thiss!1728)) (currentByte!14276 thiss!1728) (currentBit!14271 thiss!1728)) lt!432060)))

(declare-fun b!296538 () Bool)

(declare-fun res!244824 () Bool)

(assert (=> b!296538 (=> (not res!244824) (not e!212195))))

(assert (=> b!296538 (= res!244824 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!432060))))

(declare-fun b!296539 () Bool)

(declare-fun lt!432057 () (_ BitVec 64))

(assert (=> b!296539 (= e!212195 (bvsle lt!432060 (bvmul lt!432057 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296539 (or (= lt!432057 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!432057 #b0000000000000000000000000000000000000000000000000000000000001000) lt!432057)))))

(assert (=> b!296539 (= lt!432057 ((_ sign_extend 32) (size!7692 (buf!7755 thiss!1728))))))

(assert (= (and d!99898 res!244823) b!296538))

(assert (= (and b!296538 res!244824) b!296539))

(assert (=> d!99898 m!434631))

(assert (=> d!99898 m!434629))

(assert (=> b!296406 d!99898))

(declare-fun b!296554 () Bool)

(declare-fun e!212208 () Bool)

(declare-fun call!5175 () Bool)

(assert (=> b!296554 (= e!212208 call!5175)))

(declare-fun d!99900 () Bool)

(declare-fun res!244837 () Bool)

(declare-fun e!212212 () Bool)

(assert (=> d!99900 (=> res!244837 e!212212)))

(assert (=> d!99900 (= res!244837 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99900 (= (arrayBitRangesEq!0 arr!273 lt!431725 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!212212)))

(declare-fun b!296555 () Bool)

(declare-fun e!212209 () Bool)

(assert (=> b!296555 (= e!212209 call!5175)))

(declare-fun b!296556 () Bool)

(declare-fun e!212210 () Bool)

(assert (=> b!296556 (= e!212210 e!212208)))

(declare-fun c!13531 () Bool)

(declare-datatypes ((tuple4!904 0))(
  ( (tuple4!905 (_1!13073 (_ BitVec 32)) (_2!13073 (_ BitVec 32)) (_3!1403 (_ BitVec 32)) (_4!452 (_ BitVec 32))) )
))
(declare-fun lt!432069 () tuple4!904)

(assert (=> b!296556 (= c!13531 (= (_3!1403 lt!432069) (_4!452 lt!432069)))))

(declare-fun b!296557 () Bool)

(assert (=> b!296557 (= e!212212 e!212210)))

(declare-fun res!244839 () Bool)

(assert (=> b!296557 (=> (not res!244839) (not e!212210))))

(declare-fun e!212211 () Bool)

(assert (=> b!296557 (= res!244839 e!212211)))

(declare-fun res!244836 () Bool)

(assert (=> b!296557 (=> res!244836 e!212211)))

(assert (=> b!296557 (= res!244836 (bvsge (_1!13073 lt!432069) (_2!13073 lt!432069)))))

(declare-fun lt!432067 () (_ BitVec 32))

(assert (=> b!296557 (= lt!432067 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432068 () (_ BitVec 32))

(assert (=> b!296557 (= lt!432068 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!904)

(assert (=> b!296557 (= lt!432069 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!296558 () Bool)

(declare-fun res!244835 () Bool)

(assert (=> b!296558 (= res!244835 (= lt!432067 #b00000000000000000000000000000000))))

(assert (=> b!296558 (=> res!244835 e!212209)))

(declare-fun e!212213 () Bool)

(assert (=> b!296558 (= e!212213 e!212209)))

(declare-fun b!296559 () Bool)

(declare-fun arrayRangesEq!1510 (array!17748 array!17748 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296559 (= e!212211 (arrayRangesEq!1510 arr!273 lt!431725 (_1!13073 lt!432069) (_2!13073 lt!432069)))))

(declare-fun bm!5172 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5172 (= call!5175 (byteRangesEq!0 (ite c!13531 (select (arr!8751 arr!273) (_3!1403 lt!432069)) (select (arr!8751 arr!273) (_4!452 lt!432069))) (ite c!13531 (select (arr!8751 lt!431725) (_3!1403 lt!432069)) (select (arr!8751 lt!431725) (_4!452 lt!432069))) (ite c!13531 lt!432068 #b00000000000000000000000000000000) lt!432067))))

(declare-fun b!296560 () Bool)

(assert (=> b!296560 (= e!212208 e!212213)))

(declare-fun res!244838 () Bool)

(assert (=> b!296560 (= res!244838 (byteRangesEq!0 (select (arr!8751 arr!273) (_3!1403 lt!432069)) (select (arr!8751 lt!431725) (_3!1403 lt!432069)) lt!432068 #b00000000000000000000000000001000))))

(assert (=> b!296560 (=> (not res!244838) (not e!212213))))

(assert (= (and d!99900 (not res!244837)) b!296557))

(assert (= (and b!296557 (not res!244836)) b!296559))

(assert (= (and b!296557 res!244839) b!296556))

(assert (= (and b!296556 c!13531) b!296554))

(assert (= (and b!296556 (not c!13531)) b!296560))

(assert (= (and b!296560 res!244838) b!296558))

(assert (= (and b!296558 (not res!244835)) b!296555))

(assert (= (or b!296554 b!296555) bm!5172))

(declare-fun m!434841 () Bool)

(assert (=> b!296557 m!434841))

(declare-fun m!434843 () Bool)

(assert (=> b!296559 m!434843))

(declare-fun m!434845 () Bool)

(assert (=> bm!5172 m!434845))

(declare-fun m!434847 () Bool)

(assert (=> bm!5172 m!434847))

(declare-fun m!434849 () Bool)

(assert (=> bm!5172 m!434849))

(declare-fun m!434851 () Bool)

(assert (=> bm!5172 m!434851))

(declare-fun m!434853 () Bool)

(assert (=> bm!5172 m!434853))

(assert (=> b!296560 m!434847))

(assert (=> b!296560 m!434851))

(assert (=> b!296560 m!434847))

(assert (=> b!296560 m!434851))

(declare-fun m!434855 () Bool)

(assert (=> b!296560 m!434855))

(assert (=> b!296406 d!99900))

(declare-fun d!99902 () Bool)

(assert (=> d!99902 (arrayBitRangesEq!0 arr!273 (_3!1400 lt!431719) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!432072 () Unit!20669)

(declare-fun choose!49 (array!17748 array!17748 array!17748 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20669)

(assert (=> d!99902 (= lt!432072 (choose!49 arr!273 lt!431725 (_3!1400 lt!431719) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99902 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99902 (= (arrayBitRangesEqTransitive!0 arr!273 lt!431725 (_3!1400 lt!431719) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!432072)))

(declare-fun bs!25557 () Bool)

(assert (= bs!25557 d!99902))

(assert (=> bs!25557 m!434599))

(declare-fun m!434857 () Bool)

(assert (=> bs!25557 m!434857))

(assert (=> b!296406 d!99902))

(declare-fun d!99904 () Bool)

(declare-fun e!212214 () Bool)

(assert (=> d!99904 e!212214))

(declare-fun res!244840 () Bool)

(assert (=> d!99904 (=> (not res!244840) (not e!212214))))

(declare-fun lt!432076 () (_ BitVec 64))

(declare-fun lt!432074 () (_ BitVec 64))

(declare-fun lt!432078 () (_ BitVec 64))

(assert (=> d!99904 (= res!244840 (= lt!432078 (bvsub lt!432076 lt!432074)))))

(assert (=> d!99904 (or (= (bvand lt!432076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!432074 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!432076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!432076 lt!432074) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99904 (= lt!432074 (remainingBits!0 ((_ sign_extend 32) (size!7692 (buf!7755 (_2!13069 lt!431719)))) ((_ sign_extend 32) (currentByte!14276 (_2!13069 lt!431719))) ((_ sign_extend 32) (currentBit!14271 (_2!13069 lt!431719)))))))

(declare-fun lt!432077 () (_ BitVec 64))

(declare-fun lt!432073 () (_ BitVec 64))

(assert (=> d!99904 (= lt!432076 (bvmul lt!432077 lt!432073))))

(assert (=> d!99904 (or (= lt!432077 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!432073 (bvsdiv (bvmul lt!432077 lt!432073) lt!432077)))))

(assert (=> d!99904 (= lt!432073 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99904 (= lt!432077 ((_ sign_extend 32) (size!7692 (buf!7755 (_2!13069 lt!431719)))))))

(assert (=> d!99904 (= lt!432078 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14276 (_2!13069 lt!431719))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14271 (_2!13069 lt!431719)))))))

(assert (=> d!99904 (invariant!0 (currentBit!14271 (_2!13069 lt!431719)) (currentByte!14276 (_2!13069 lt!431719)) (size!7692 (buf!7755 (_2!13069 lt!431719))))))

(assert (=> d!99904 (= (bitIndex!0 (size!7692 (buf!7755 (_2!13069 lt!431719))) (currentByte!14276 (_2!13069 lt!431719)) (currentBit!14271 (_2!13069 lt!431719))) lt!432078)))

(declare-fun b!296561 () Bool)

(declare-fun res!244841 () Bool)

(assert (=> b!296561 (=> (not res!244841) (not e!212214))))

(assert (=> b!296561 (= res!244841 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!432078))))

(declare-fun b!296562 () Bool)

(declare-fun lt!432075 () (_ BitVec 64))

(assert (=> b!296562 (= e!212214 (bvsle lt!432078 (bvmul lt!432075 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296562 (or (= lt!432075 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!432075 #b0000000000000000000000000000000000000000000000000000000000001000) lt!432075)))))

(assert (=> b!296562 (= lt!432075 ((_ sign_extend 32) (size!7692 (buf!7755 (_2!13069 lt!431719)))))))

(assert (= (and d!99904 res!244840) b!296561))

(assert (= (and b!296561 res!244841) b!296562))

(declare-fun m!434859 () Bool)

(assert (=> d!99904 m!434859))

(declare-fun m!434861 () Bool)

(assert (=> d!99904 m!434861))

(assert (=> b!296406 d!99904))

(declare-fun d!99906 () Bool)

(declare-fun lt!432083 () tuple2!23334)

(assert (=> d!99906 (= lt!432083 (readBit!0 thiss!1728))))

(assert (=> d!99906 (= (readBitPure!0 thiss!1728) (tuple2!23337 (_2!13067 lt!432083) (_1!13067 lt!432083)))))

(declare-fun bs!25558 () Bool)

(assert (= bs!25558 d!99906))

(assert (=> bs!25558 m!434583))

(assert (=> b!296406 d!99906))

(declare-fun d!99908 () Bool)

(declare-fun e!212229 () Bool)

(assert (=> d!99908 e!212229))

(declare-fun res!244858 () Bool)

(assert (=> d!99908 (=> (not res!244858) (not e!212229))))

(declare-datatypes ((tuple2!23340 0))(
  ( (tuple2!23341 (_1!13074 Unit!20669) (_2!13074 BitStream!13388)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13388) tuple2!23340)

(assert (=> d!99908 (= res!244858 (= (buf!7755 (_2!13074 (increaseBitIndex!0 thiss!1728))) (buf!7755 thiss!1728)))))

(declare-fun lt!432170 () Bool)

(assert (=> d!99908 (= lt!432170 (not (= (bvand ((_ sign_extend 24) (select (arr!8751 (buf!7755 thiss!1728)) (currentByte!14276 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14271 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!432174 () tuple2!23334)

(assert (=> d!99908 (= lt!432174 (tuple2!23335 (not (= (bvand ((_ sign_extend 24) (select (arr!8751 (buf!7755 thiss!1728)) (currentByte!14276 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14271 thiss!1728)))) #b00000000000000000000000000000000)) (_2!13074 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99908 (validate_offset_bit!0 ((_ sign_extend 32) (size!7692 (buf!7755 thiss!1728))) ((_ sign_extend 32) (currentByte!14276 thiss!1728)) ((_ sign_extend 32) (currentBit!14271 thiss!1728)))))

(assert (=> d!99908 (= (readBit!0 thiss!1728) lt!432174)))

(declare-fun lt!432168 () (_ BitVec 64))

(declare-fun b!296583 () Bool)

(declare-fun lt!432173 () (_ BitVec 64))

(assert (=> b!296583 (= e!212229 (= (bitIndex!0 (size!7692 (buf!7755 (_2!13074 (increaseBitIndex!0 thiss!1728)))) (currentByte!14276 (_2!13074 (increaseBitIndex!0 thiss!1728))) (currentBit!14271 (_2!13074 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!432173 lt!432168)))))

(assert (=> b!296583 (or (not (= (bvand lt!432173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!432168 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!432173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!432173 lt!432168) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!296583 (= lt!432168 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!296583 (= lt!432173 (bitIndex!0 (size!7692 (buf!7755 thiss!1728)) (currentByte!14276 thiss!1728) (currentBit!14271 thiss!1728)))))

(declare-fun lt!432171 () Bool)

(assert (=> b!296583 (= lt!432171 (not (= (bvand ((_ sign_extend 24) (select (arr!8751 (buf!7755 thiss!1728)) (currentByte!14276 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14271 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!432169 () Bool)

(assert (=> b!296583 (= lt!432169 (not (= (bvand ((_ sign_extend 24) (select (arr!8751 (buf!7755 thiss!1728)) (currentByte!14276 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14271 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!432172 () Bool)

(assert (=> b!296583 (= lt!432172 (not (= (bvand ((_ sign_extend 24) (select (arr!8751 (buf!7755 thiss!1728)) (currentByte!14276 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14271 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99908 res!244858) b!296583))

(declare-fun m!434863 () Bool)

(assert (=> d!99908 m!434863))

(declare-fun m!434865 () Bool)

(assert (=> d!99908 m!434865))

(declare-fun m!434867 () Bool)

(assert (=> d!99908 m!434867))

(declare-fun m!434869 () Bool)

(assert (=> d!99908 m!434869))

(assert (=> b!296583 m!434867))

(assert (=> b!296583 m!434863))

(assert (=> b!296583 m!434597))

(assert (=> b!296583 m!434865))

(declare-fun m!434871 () Bool)

(assert (=> b!296583 m!434871))

(assert (=> b!296406 d!99908))

(declare-fun d!99910 () Bool)

(declare-fun e!212236 () Bool)

(assert (=> d!99910 e!212236))

(declare-fun res!244868 () Bool)

(assert (=> d!99910 (=> (not res!244868) (not e!212236))))

(declare-fun lt!432220 () (_ BitVec 32))

(assert (=> d!99910 (= res!244868 (and (bvsge lt!432220 #b00000000000000000000000000000000) (bvslt lt!432220 (size!7692 arr!273))))))

(declare-fun lt!432221 () (_ BitVec 32))

(declare-fun lt!432222 () Unit!20669)

(declare-fun lt!432219 () (_ BitVec 8))

(declare-fun choose!53 (array!17748 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20669)

(assert (=> d!99910 (= lt!432222 (choose!53 arr!273 from!505 (_1!13067 lt!431721) lt!432220 lt!432221 lt!432219))))

(assert (=> d!99910 (= lt!432219 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8751 arr!273) lt!432220)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432221)))) ((_ sign_extend 24) (ite (_1!13067 lt!431721) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432221) #b00000000)))))))

(assert (=> d!99910 (= lt!432221 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99910 (= lt!432220 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99910 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13067 lt!431721)) lt!432222)))

(declare-fun b!296596 () Bool)

(assert (=> b!296596 (= e!212236 (arrayBitRangesEq!0 arr!273 (array!17749 (store (arr!8751 arr!273) lt!432220 lt!432219) (size!7692 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99910 res!244868) b!296596))

(declare-fun m!434931 () Bool)

(assert (=> d!99910 m!434931))

(declare-fun m!434933 () Bool)

(assert (=> d!99910 m!434933))

(declare-fun m!434935 () Bool)

(assert (=> d!99910 m!434935))

(declare-fun m!434937 () Bool)

(assert (=> b!296596 m!434937))

(declare-fun m!434939 () Bool)

(assert (=> b!296596 m!434939))

(assert (=> b!296406 d!99910))

(declare-fun d!99914 () Bool)

(declare-fun e!212241 () Bool)

(assert (=> d!99914 e!212241))

(declare-fun res!244875 () Bool)

(assert (=> d!99914 (=> (not res!244875) (not e!212241))))

(assert (=> d!99914 (= res!244875 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!432235 () Unit!20669)

(declare-fun choose!27 (BitStream!13388 BitStream!13388 (_ BitVec 64) (_ BitVec 64)) Unit!20669)

(assert (=> d!99914 (= lt!432235 (choose!27 thiss!1728 (_2!13067 lt!431721) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99914 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99914 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13067 lt!431721) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!432235)))

(declare-fun b!296601 () Bool)

(assert (=> b!296601 (= e!212241 (validate_offset_bits!1 ((_ sign_extend 32) (size!7692 (buf!7755 (_2!13067 lt!431721)))) ((_ sign_extend 32) (currentByte!14276 (_2!13067 lt!431721))) ((_ sign_extend 32) (currentBit!14271 (_2!13067 lt!431721))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99914 res!244875) b!296601))

(declare-fun m!434941 () Bool)

(assert (=> d!99914 m!434941))

(assert (=> b!296601 m!434579))

(assert (=> b!296406 d!99914))

(declare-fun d!99916 () Bool)

(assert (=> d!99916 (= (bitAt!0 lt!431725 from!505) (bitAt!0 (_3!1400 lt!431719) from!505))))

(declare-fun lt!432246 () Unit!20669)

(declare-fun choose!31 (array!17748 array!17748 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20669)

(assert (=> d!99916 (= lt!432246 (choose!31 lt!431725 (_3!1400 lt!431719) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99916 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99916 (= (arrayBitRangesEqImpliesEq!0 lt!431725 (_3!1400 lt!431719) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!432246)))

(declare-fun bs!25559 () Bool)

(assert (= bs!25559 d!99916))

(assert (=> bs!25559 m!434595))

(assert (=> bs!25559 m!434575))

(declare-fun m!434947 () Bool)

(assert (=> bs!25559 m!434947))

(assert (=> b!296406 d!99916))

(declare-fun b!296606 () Bool)

(declare-fun e!212243 () Bool)

(declare-fun call!5182 () Bool)

(assert (=> b!296606 (= e!212243 call!5182)))

(declare-fun d!99920 () Bool)

(declare-fun res!244880 () Bool)

(declare-fun e!212247 () Bool)

(assert (=> d!99920 (=> res!244880 e!212247)))

(assert (=> d!99920 (= res!244880 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99920 (= (arrayBitRangesEq!0 arr!273 (_3!1400 lt!431719) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!212247)))

(declare-fun b!296607 () Bool)

(declare-fun e!212244 () Bool)

(assert (=> b!296607 (= e!212244 call!5182)))

(declare-fun b!296608 () Bool)

(declare-fun e!212245 () Bool)

(assert (=> b!296608 (= e!212245 e!212243)))

(declare-fun c!13535 () Bool)

(declare-fun lt!432249 () tuple4!904)

(assert (=> b!296608 (= c!13535 (= (_3!1403 lt!432249) (_4!452 lt!432249)))))

(declare-fun b!296609 () Bool)

(assert (=> b!296609 (= e!212247 e!212245)))

(declare-fun res!244882 () Bool)

(assert (=> b!296609 (=> (not res!244882) (not e!212245))))

(declare-fun e!212246 () Bool)

(assert (=> b!296609 (= res!244882 e!212246)))

(declare-fun res!244879 () Bool)

(assert (=> b!296609 (=> res!244879 e!212246)))

(assert (=> b!296609 (= res!244879 (bvsge (_1!13073 lt!432249) (_2!13073 lt!432249)))))

(declare-fun lt!432247 () (_ BitVec 32))

(assert (=> b!296609 (= lt!432247 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432248 () (_ BitVec 32))

(assert (=> b!296609 (= lt!432248 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296609 (= lt!432249 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!296610 () Bool)

(declare-fun res!244878 () Bool)

(assert (=> b!296610 (= res!244878 (= lt!432247 #b00000000000000000000000000000000))))

(assert (=> b!296610 (=> res!244878 e!212244)))

(declare-fun e!212248 () Bool)

(assert (=> b!296610 (= e!212248 e!212244)))

(declare-fun b!296611 () Bool)

(assert (=> b!296611 (= e!212246 (arrayRangesEq!1510 arr!273 (_3!1400 lt!431719) (_1!13073 lt!432249) (_2!13073 lt!432249)))))

(declare-fun bm!5179 () Bool)

(assert (=> bm!5179 (= call!5182 (byteRangesEq!0 (ite c!13535 (select (arr!8751 arr!273) (_3!1403 lt!432249)) (select (arr!8751 arr!273) (_4!452 lt!432249))) (ite c!13535 (select (arr!8751 (_3!1400 lt!431719)) (_3!1403 lt!432249)) (select (arr!8751 (_3!1400 lt!431719)) (_4!452 lt!432249))) (ite c!13535 lt!432248 #b00000000000000000000000000000000) lt!432247))))

(declare-fun b!296612 () Bool)

(assert (=> b!296612 (= e!212243 e!212248)))

(declare-fun res!244881 () Bool)

(assert (=> b!296612 (= res!244881 (byteRangesEq!0 (select (arr!8751 arr!273) (_3!1403 lt!432249)) (select (arr!8751 (_3!1400 lt!431719)) (_3!1403 lt!432249)) lt!432248 #b00000000000000000000000000001000))))

(assert (=> b!296612 (=> (not res!244881) (not e!212248))))

(assert (= (and d!99920 (not res!244880)) b!296609))

(assert (= (and b!296609 (not res!244879)) b!296611))

(assert (= (and b!296609 res!244882) b!296608))

(assert (= (and b!296608 c!13535) b!296606))

(assert (= (and b!296608 (not c!13535)) b!296612))

(assert (= (and b!296612 res!244881) b!296610))

(assert (= (and b!296610 (not res!244878)) b!296607))

(assert (= (or b!296606 b!296607) bm!5179))

(assert (=> b!296609 m!434841))

(declare-fun m!434949 () Bool)

(assert (=> b!296611 m!434949))

(declare-fun m!434951 () Bool)

(assert (=> bm!5179 m!434951))

(declare-fun m!434953 () Bool)

(assert (=> bm!5179 m!434953))

(declare-fun m!434955 () Bool)

(assert (=> bm!5179 m!434955))

(declare-fun m!434957 () Bool)

(assert (=> bm!5179 m!434957))

(declare-fun m!434959 () Bool)

(assert (=> bm!5179 m!434959))

(assert (=> b!296612 m!434953))

(assert (=> b!296612 m!434957))

(assert (=> b!296612 m!434953))

(assert (=> b!296612 m!434957))

(declare-fun m!434961 () Bool)

(assert (=> b!296612 m!434961))

(assert (=> b!296406 d!99920))

(push 1)

(assert (not b!296530))

(assert (not d!99904))

(assert (not b!296557))

(assert (not bm!5172))

(assert (not b!296559))

(assert (not b!296527))

(assert (not d!99906))

(assert (not b!296611))

(assert (not d!99894))

(assert (not b!296601))

(assert (not b!296531))

(assert (not b!296612))

(assert (not d!99898))

(assert (not d!99850))

(assert (not d!99848))

(assert (not bm!5169))

(assert (not b!296596))

(assert (not bm!5168))

(assert (not b!296529))

(assert (not b!296583))

(assert (not d!99902))

(assert (not d!99914))

(assert (not d!99844))

(assert (not b!296525))

(assert (not bm!5179))

(assert (not b!296609))

(assert (not b!296533))

(assert (not d!99916))

(assert (not d!99908))

(assert (not b!296560))

(assert (not d!99910))

(check-sat)

(pop 1)

(push 1)

(check-sat)

