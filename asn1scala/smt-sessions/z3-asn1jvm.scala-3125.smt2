; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71830 () Bool)

(assert start!71830)

(declare-fun b!322290 () Bool)

(declare-fun e!232257 () Bool)

(declare-fun lt!444995 () (_ BitVec 64))

(declare-fun lt!444994 () (_ BitVec 64))

(assert (=> b!322290 (= e!232257 (not (= (bvand lt!444995 lt!444994) lt!444995)))))

(declare-fun res!264561 () Bool)

(declare-fun e!232258 () Bool)

(assert (=> start!71830 (=> (not res!264561) (not e!232258))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71830 (= res!264561 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71830 e!232258))

(assert (=> start!71830 true))

(declare-datatypes ((array!20565 0))(
  ( (array!20566 (arr!10043 (Array (_ BitVec 32) (_ BitVec 8))) (size!8951 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14064 0))(
  ( (BitStream!14065 (buf!8093 array!20565) (currentByte!14928 (_ BitVec 32)) (currentBit!14923 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14064)

(declare-fun e!232260 () Bool)

(declare-fun inv!12 (BitStream!14064) Bool)

(assert (=> start!71830 (and (inv!12 thiss!1793) e!232260)))

(declare-fun b!322291 () Bool)

(declare-fun e!232259 () Bool)

(assert (=> b!322291 (= e!232258 e!232259)))

(declare-fun res!264560 () Bool)

(assert (=> b!322291 (=> (not res!264560) (not e!232259))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!322291 (= res!264560 (and (= (bvand acc!161 lt!444994) acc!161) (not (= nBits!548 i!743))))))

(assert (=> b!322291 (= lt!444994 #b1111111111111111111111111111111111111111111111111111111111111111)))

(declare-fun b!322292 () Bool)

(assert (=> b!322292 (= e!232259 e!232257)))

(declare-fun res!264559 () Bool)

(assert (=> b!322292 (=> (not res!264559) (not e!232257))))

(assert (=> b!322292 (= res!264559 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-datatypes ((tuple2!23546 0))(
  ( (tuple2!23547 (_1!13402 Bool) (_2!13402 BitStream!14064)) )
))
(declare-fun lt!444993 () tuple2!23546)

(assert (=> b!322292 (= lt!444995 (bvor acc!161 (ite (_1!13402 lt!444993) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBit!0 (BitStream!14064) tuple2!23546)

(assert (=> b!322292 (= lt!444993 (readBit!0 thiss!1793))))

(declare-fun b!322293 () Bool)

(declare-fun res!264565 () Bool)

(assert (=> b!322293 (=> (not res!264565) (not e!232258))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322293 (= res!264565 (validate_offset_bits!1 ((_ sign_extend 32) (size!8951 (buf!8093 thiss!1793))) ((_ sign_extend 32) (currentByte!14928 thiss!1793)) ((_ sign_extend 32) (currentBit!14923 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322294 () Bool)

(declare-fun res!264562 () Bool)

(assert (=> b!322294 (=> (not res!264562) (not e!232258))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322294 (= res!264562 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322295 () Bool)

(declare-fun array_inv!8503 (array!20565) Bool)

(assert (=> b!322295 (= e!232260 (array_inv!8503 (buf!8093 thiss!1793)))))

(declare-fun b!322296 () Bool)

(declare-fun res!264563 () Bool)

(assert (=> b!322296 (=> (not res!264563) (not e!232257))))

(assert (=> b!322296 (= res!264563 (validate_offset_bits!1 ((_ sign_extend 32) (size!8951 (buf!8093 (_2!13402 lt!444993)))) ((_ sign_extend 32) (currentByte!14928 (_2!13402 lt!444993))) ((_ sign_extend 32) (currentBit!14923 (_2!13402 lt!444993))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun b!322297 () Bool)

(declare-fun res!264564 () Bool)

(assert (=> b!322297 (=> (not res!264564) (not e!232257))))

(assert (=> b!322297 (= res!264564 (= (bvand lt!444995 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!71830 res!264561) b!322293))

(assert (= (and b!322293 res!264565) b!322294))

(assert (= (and b!322294 res!264562) b!322291))

(assert (= (and b!322291 res!264560) b!322292))

(assert (= (and b!322292 res!264559) b!322296))

(assert (= (and b!322296 res!264563) b!322297))

(assert (= (and b!322297 res!264564) b!322290))

(assert (= start!71830 b!322295))

(declare-fun m!460547 () Bool)

(assert (=> b!322297 m!460547))

(declare-fun m!460549 () Bool)

(assert (=> b!322296 m!460549))

(declare-fun m!460551 () Bool)

(assert (=> b!322295 m!460551))

(declare-fun m!460553 () Bool)

(assert (=> b!322293 m!460553))

(declare-fun m!460555 () Bool)

(assert (=> b!322294 m!460555))

(declare-fun m!460557 () Bool)

(assert (=> start!71830 m!460557))

(declare-fun m!460559 () Bool)

(assert (=> b!322292 m!460559))

(check-sat (not b!322292) (not b!322296) (not start!71830) (not b!322297) (not b!322295) (not b!322293) (not b!322294))
