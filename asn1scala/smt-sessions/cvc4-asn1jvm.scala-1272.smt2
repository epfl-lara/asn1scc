; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36204 () Bool)

(assert start!36204)

(declare-fun b!166978 () Bool)

(declare-fun res!139012 () Bool)

(declare-fun e!115783 () Bool)

(assert (=> b!166978 (=> (not res!139012) (not e!115783))))

(declare-datatypes ((array!8622 0))(
  ( (array!8623 (arr!4752 (Array (_ BitVec 32) (_ BitVec 8))) (size!3831 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6818 0))(
  ( (BitStream!6819 (buf!4283 array!8622) (currentByte!8110 (_ BitVec 32)) (currentBit!8105 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6818)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!166978 (= res!139012 (bvsgt (bvadd (currentBit!8105 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166977 () Bool)

(declare-fun res!139013 () Bool)

(assert (=> b!166977 (=> (not res!139013) (not e!115783))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166977 (= res!139013 (validate_offset_bits!1 ((_ sign_extend 32) (size!3831 (buf!4283 thiss!1577))) ((_ sign_extend 32) (currentByte!8110 thiss!1577)) ((_ sign_extend 32) (currentBit!8105 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166979 () Bool)

(assert (=> b!166979 (= e!115783 (not true))))

(declare-fun lt!259961 () (_ BitVec 32))

(declare-fun lt!259957 () (_ BitVec 8))

(declare-fun lt!259955 () (_ BitVec 32))

(declare-fun lt!259959 () array!8622)

(declare-fun arrayRangesEq!660 (array!8622 array!8622 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166979 (arrayRangesEq!660 lt!259959 (array!8623 (store (store (arr!4752 (buf!4283 thiss!1577)) (currentByte!8110 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4752 (buf!4283 thiss!1577)) (currentByte!8110 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8105 thiss!1577)))))))) (bvlshr (bvand lt!259955 #b00000000000000000000000011111111) lt!259961)))) (bvadd #b00000000000000000000000000000001 (currentByte!8110 thiss!1577)) lt!259957) (size!3831 (buf!4283 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8110 thiss!1577)))))

(declare-datatypes ((Unit!11610 0))(
  ( (Unit!11611) )
))
(declare-fun lt!259956 () Unit!11610)

(declare-fun arrayUpdatedAtPrefixLemma!268 (array!8622 (_ BitVec 32) (_ BitVec 8)) Unit!11610)

(assert (=> b!166979 (= lt!259956 (arrayUpdatedAtPrefixLemma!268 lt!259959 (bvadd #b00000000000000000000000000000001 (currentByte!8110 thiss!1577)) lt!259957))))

(assert (=> b!166979 (arrayRangesEq!660 (buf!4283 thiss!1577) (array!8623 (store (arr!4752 (buf!4283 thiss!1577)) (currentByte!8110 thiss!1577) (select (store (store (arr!4752 (buf!4283 thiss!1577)) (currentByte!8110 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4752 (buf!4283 thiss!1577)) (currentByte!8110 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8105 thiss!1577)))))))) (bvlshr (bvand lt!259955 #b00000000000000000000000011111111) lt!259961)))) (bvadd #b00000000000000000000000000000001 (currentByte!8110 thiss!1577)) lt!259957) (currentByte!8110 thiss!1577))) (size!3831 (buf!4283 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8110 thiss!1577))))

(declare-fun lt!259960 () Unit!11610)

(assert (=> b!166979 (= lt!259960 (arrayUpdatedAtPrefixLemma!268 (buf!4283 thiss!1577) (currentByte!8110 thiss!1577) (select (store (store (arr!4752 (buf!4283 thiss!1577)) (currentByte!8110 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4752 (buf!4283 thiss!1577)) (currentByte!8110 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8105 thiss!1577)))))))) (bvlshr (bvand lt!259955 #b00000000000000000000000011111111) lt!259961)))) (bvadd #b00000000000000000000000000000001 (currentByte!8110 thiss!1577)) lt!259957) (currentByte!8110 thiss!1577))))))

(declare-fun lt!259958 () (_ BitVec 32))

(assert (=> b!166979 (= lt!259957 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4752 (buf!4283 thiss!1577)) (currentByte!8110 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4752 (buf!4283 thiss!1577)) (currentByte!8110 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8105 thiss!1577)))))))) (bvlshr (bvand lt!259955 #b00000000000000000000000011111111) lt!259961)))) (bvadd #b00000000000000000000000000000001 (currentByte!8110 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!259958))) (bvshl lt!259955 lt!259958))))))

(assert (=> b!166979 (= lt!259958 (bvsub #b00000000000000000000000000001000 lt!259961))))

(assert (=> b!166979 (= lt!259959 (array!8623 (store (arr!4752 (buf!4283 thiss!1577)) (currentByte!8110 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4752 (buf!4283 thiss!1577)) (currentByte!8110 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8105 thiss!1577)))))))) (bvlshr (bvand lt!259955 #b00000000000000000000000011111111) lt!259961)))) (size!3831 (buf!4283 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!166979 (= lt!259955 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!166979 (= lt!259961 (bvsub (bvadd (currentBit!8105 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166980 () Bool)

(declare-fun e!115784 () Bool)

(declare-fun array_inv!3572 (array!8622) Bool)

(assert (=> b!166980 (= e!115784 (array_inv!3572 (buf!4283 thiss!1577)))))

(declare-fun res!139011 () Bool)

(assert (=> start!36204 (=> (not res!139011) (not e!115783))))

(assert (=> start!36204 (= res!139011 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36204 e!115783))

(assert (=> start!36204 true))

(declare-fun inv!12 (BitStream!6818) Bool)

(assert (=> start!36204 (and (inv!12 thiss!1577) e!115784)))

(assert (= (and start!36204 res!139011) b!166977))

(assert (= (and b!166977 res!139013) b!166978))

(assert (= (and b!166978 res!139012) b!166979))

(assert (= start!36204 b!166980))

(declare-fun m!265359 () Bool)

(assert (=> b!166977 m!265359))

(declare-fun m!265361 () Bool)

(assert (=> b!166979 m!265361))

(declare-fun m!265363 () Bool)

(assert (=> b!166979 m!265363))

(declare-fun m!265365 () Bool)

(assert (=> b!166979 m!265365))

(declare-fun m!265367 () Bool)

(assert (=> b!166979 m!265367))

(declare-fun m!265369 () Bool)

(assert (=> b!166979 m!265369))

(assert (=> b!166979 m!265367))

(declare-fun m!265371 () Bool)

(assert (=> b!166979 m!265371))

(declare-fun m!265373 () Bool)

(assert (=> b!166979 m!265373))

(declare-fun m!265375 () Bool)

(assert (=> b!166979 m!265375))

(declare-fun m!265377 () Bool)

(assert (=> b!166979 m!265377))

(declare-fun m!265379 () Bool)

(assert (=> b!166979 m!265379))

(declare-fun m!265381 () Bool)

(assert (=> b!166979 m!265381))

(declare-fun m!265383 () Bool)

(assert (=> b!166979 m!265383))

(declare-fun m!265385 () Bool)

(assert (=> b!166979 m!265385))

(declare-fun m!265387 () Bool)

(assert (=> b!166980 m!265387))

(declare-fun m!265389 () Bool)

(assert (=> start!36204 m!265389))

(push 1)

(assert (not b!166979))

(assert (not b!166980))

(assert (not b!166977))

(assert (not start!36204))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

