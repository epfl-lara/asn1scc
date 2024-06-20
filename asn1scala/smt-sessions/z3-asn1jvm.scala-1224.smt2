; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34728 () Bool)

(assert start!34728)

(declare-fun b!164409 () Bool)

(declare-fun e!113612 () Bool)

(declare-datatypes ((array!8232 0))(
  ( (array!8233 (arr!4607 (Array (_ BitVec 32) (_ BitVec 8))) (size!3686 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6528 0))(
  ( (BitStream!6529 (buf!4138 array!8232) (currentByte!7711 (_ BitVec 32)) (currentBit!7706 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!14548 0))(
  ( (tuple2!14549 (_1!7865 BitStream!6528) (_2!7865 BitStream!6528)) )
))
(declare-fun lt!258020 () tuple2!14548)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164409 (= e!113612 (validate_offset_bits!1 ((_ sign_extend 32) (size!3686 (buf!4138 (_1!7865 lt!258020)))) ((_ sign_extend 32) (currentByte!7711 (_1!7865 lt!258020))) ((_ sign_extend 32) (currentBit!7706 (_1!7865 lt!258020))) ((_ sign_extend 32) nBits!511)))))

(declare-fun thiss!1577 () BitStream!6528)

(declare-fun lt!258018 () BitStream!6528)

(declare-fun reader!0 (BitStream!6528 BitStream!6528) tuple2!14548)

(assert (=> b!164409 (= lt!258020 (reader!0 thiss!1577 lt!258018))))

(declare-fun b!164410 () Bool)

(declare-fun res!137002 () Bool)

(declare-fun e!113609 () Bool)

(assert (=> b!164410 (=> (not res!137002) (not e!113609))))

(assert (=> b!164410 (= res!137002 (validate_offset_bits!1 ((_ sign_extend 32) (size!3686 (buf!4138 thiss!1577))) ((_ sign_extend 32) (currentByte!7711 thiss!1577)) ((_ sign_extend 32) (currentBit!7706 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!137001 () Bool)

(assert (=> start!34728 (=> (not res!137001) (not e!113609))))

(assert (=> start!34728 (= res!137001 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34728 e!113609))

(assert (=> start!34728 true))

(declare-fun e!113611 () Bool)

(declare-fun inv!12 (BitStream!6528) Bool)

(assert (=> start!34728 (and (inv!12 thiss!1577) e!113611)))

(declare-fun b!164411 () Bool)

(declare-fun res!137004 () Bool)

(assert (=> b!164411 (=> res!137004 e!113612)))

(declare-fun isPrefixOf!0 (BitStream!6528 BitStream!6528) Bool)

(assert (=> b!164411 (= res!137004 (not (isPrefixOf!0 thiss!1577 lt!258018)))))

(declare-fun b!164412 () Bool)

(declare-fun e!113610 () Bool)

(assert (=> b!164412 (= e!113610 e!113612)))

(declare-fun res!137006 () Bool)

(assert (=> b!164412 (=> res!137006 e!113612)))

(declare-fun lt!258017 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!164412 (= res!137006 (not (= (bitIndex!0 (size!3686 (buf!4138 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)) lt!258017) (bvadd (bitIndex!0 (size!3686 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) (currentBit!7706 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun lt!258016 () array!8232)

(assert (=> b!164412 (= lt!258018 (BitStream!6529 lt!258016 (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)) lt!258017))))

(declare-fun b!164413 () Bool)

(declare-fun array_inv!3427 (array!8232) Bool)

(assert (=> b!164413 (= e!113611 (array_inv!3427 (buf!4138 thiss!1577)))))

(declare-fun b!164414 () Bool)

(declare-fun res!137003 () Bool)

(assert (=> b!164414 (=> (not res!137003) (not e!113609))))

(assert (=> b!164414 (= res!137003 (bvsgt (bvadd (currentBit!7706 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164415 () Bool)

(assert (=> b!164415 (= e!113609 (not e!113610))))

(declare-fun res!137005 () Bool)

(assert (=> b!164415 (=> res!137005 e!113610)))

(declare-fun lt!258024 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164415 (= res!137005 (not (byteRangesEq!0 (select (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577)) lt!258024 #b00000000000000000000000000000000 lt!258017)))))

(declare-fun arrayRangesEq!620 (array!8232 array!8232 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164415 (arrayRangesEq!620 (buf!4138 thiss!1577) lt!258016 #b00000000000000000000000000000000 (currentByte!7711 thiss!1577))))

(declare-datatypes ((Unit!11449 0))(
  ( (Unit!11450) )
))
(declare-fun lt!258027 () Unit!11449)

(declare-fun lt!258022 () array!8232)

(declare-fun arrayRangesEqTransitive!167 (array!8232 array!8232 array!8232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11449)

(assert (=> b!164415 (= lt!258027 (arrayRangesEqTransitive!167 (buf!4138 thiss!1577) lt!258022 lt!258016 #b00000000000000000000000000000000 (currentByte!7711 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577))))))

(assert (=> b!164415 (arrayRangesEq!620 lt!258022 lt!258016 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)))))

(declare-fun lt!258021 () Unit!11449)

(declare-fun lt!258019 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!228 (array!8232 (_ BitVec 32) (_ BitVec 8)) Unit!11449)

(assert (=> b!164415 (= lt!258021 (arrayUpdatedAtPrefixLemma!228 lt!258022 (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)) lt!258019))))

(assert (=> b!164415 (arrayRangesEq!620 (buf!4138 thiss!1577) (array!8233 (store (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) lt!258024) (size!3686 (buf!4138 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7711 thiss!1577))))

(declare-fun lt!258026 () Unit!11449)

(assert (=> b!164415 (= lt!258026 (arrayUpdatedAtPrefixLemma!228 (buf!4138 thiss!1577) (currentByte!7711 thiss!1577) lt!258024))))

(declare-fun lt!258023 () (_ BitVec 32))

(assert (=> b!164415 (= lt!258024 (select (store (store (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7706 thiss!1577)))))))) (bvlshr (bvand lt!258023 #b00000000000000000000000011111111) lt!258017)))) (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)) lt!258019) (currentByte!7711 thiss!1577)))))

(assert (=> b!164415 (= lt!258016 (array!8233 (store (store (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7706 thiss!1577)))))))) (bvlshr (bvand lt!258023 #b00000000000000000000000011111111) lt!258017)))) (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)) lt!258019) (size!3686 (buf!4138 thiss!1577))))))

(declare-fun lt!258025 () (_ BitVec 32))

(assert (=> b!164415 (= lt!258019 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7706 thiss!1577)))))))) (bvlshr (bvand lt!258023 #b00000000000000000000000011111111) lt!258017)))) (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258025))) (bvshl lt!258023 lt!258025))))))

(assert (=> b!164415 (= lt!258025 (bvsub #b00000000000000000000000000001000 lt!258017))))

(assert (=> b!164415 (= lt!258022 (array!8233 (store (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7706 thiss!1577)))))))) (bvlshr (bvand lt!258023 #b00000000000000000000000011111111) lt!258017)))) (size!3686 (buf!4138 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164415 (= lt!258023 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164415 (= lt!258017 (bvsub (bvadd (currentBit!7706 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34728 res!137001) b!164410))

(assert (= (and b!164410 res!137002) b!164414))

(assert (= (and b!164414 res!137003) b!164415))

(assert (= (and b!164415 (not res!137005)) b!164412))

(assert (= (and b!164412 (not res!137006)) b!164411))

(assert (= (and b!164411 (not res!137004)) b!164409))

(assert (= start!34728 b!164413))

(declare-fun m!261425 () Bool)

(assert (=> b!164411 m!261425))

(declare-fun m!261427 () Bool)

(assert (=> b!164409 m!261427))

(declare-fun m!261429 () Bool)

(assert (=> b!164409 m!261429))

(declare-fun m!261431 () Bool)

(assert (=> b!164415 m!261431))

(declare-fun m!261433 () Bool)

(assert (=> b!164415 m!261433))

(declare-fun m!261435 () Bool)

(assert (=> b!164415 m!261435))

(declare-fun m!261437 () Bool)

(assert (=> b!164415 m!261437))

(declare-fun m!261439 () Bool)

(assert (=> b!164415 m!261439))

(declare-fun m!261441 () Bool)

(assert (=> b!164415 m!261441))

(declare-fun m!261443 () Bool)

(assert (=> b!164415 m!261443))

(declare-fun m!261445 () Bool)

(assert (=> b!164415 m!261445))

(declare-fun m!261447 () Bool)

(assert (=> b!164415 m!261447))

(declare-fun m!261449 () Bool)

(assert (=> b!164415 m!261449))

(declare-fun m!261451 () Bool)

(assert (=> b!164415 m!261451))

(declare-fun m!261453 () Bool)

(assert (=> b!164415 m!261453))

(assert (=> b!164415 m!261433))

(declare-fun m!261455 () Bool)

(assert (=> b!164415 m!261455))

(declare-fun m!261457 () Bool)

(assert (=> b!164415 m!261457))

(declare-fun m!261459 () Bool)

(assert (=> b!164415 m!261459))

(declare-fun m!261461 () Bool)

(assert (=> b!164415 m!261461))

(declare-fun m!261463 () Bool)

(assert (=> b!164410 m!261463))

(declare-fun m!261465 () Bool)

(assert (=> b!164413 m!261465))

(declare-fun m!261467 () Bool)

(assert (=> start!34728 m!261467))

(declare-fun m!261469 () Bool)

(assert (=> b!164412 m!261469))

(declare-fun m!261471 () Bool)

(assert (=> b!164412 m!261471))

(check-sat (not b!164412) (not b!164413) (not b!164415) (not b!164411) (not b!164410) (not start!34728) (not b!164409))
(check-sat)
(get-model)

(declare-fun d!56731 () Bool)

(assert (=> d!56731 (= (array_inv!3427 (buf!4138 thiss!1577)) (bvsge (size!3686 (buf!4138 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164413 d!56731))

(declare-fun d!56733 () Bool)

(declare-fun res!137029 () Bool)

(declare-fun e!113633 () Bool)

(assert (=> d!56733 (=> res!137029 e!113633)))

(assert (=> d!56733 (= res!137029 (= #b00000000000000000000000000000000 (currentByte!7711 thiss!1577)))))

(assert (=> d!56733 (= (arrayRangesEq!620 (buf!4138 thiss!1577) (array!8233 (store (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) lt!258024) (size!3686 (buf!4138 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7711 thiss!1577)) e!113633)))

(declare-fun b!164441 () Bool)

(declare-fun e!113634 () Bool)

(assert (=> b!164441 (= e!113633 e!113634)))

(declare-fun res!137030 () Bool)

(assert (=> b!164441 (=> (not res!137030) (not e!113634))))

(assert (=> b!164441 (= res!137030 (= (select (arr!4607 (buf!4138 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4607 (array!8233 (store (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) lt!258024) (size!3686 (buf!4138 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!164442 () Bool)

(assert (=> b!164442 (= e!113634 (arrayRangesEq!620 (buf!4138 thiss!1577) (array!8233 (store (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) lt!258024) (size!3686 (buf!4138 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7711 thiss!1577)))))

(assert (= (and d!56733 (not res!137029)) b!164441))

(assert (= (and b!164441 res!137030) b!164442))

(declare-fun m!261521 () Bool)

(assert (=> b!164441 m!261521))

(declare-fun m!261523 () Bool)

(assert (=> b!164441 m!261523))

(declare-fun m!261525 () Bool)

(assert (=> b!164442 m!261525))

(assert (=> b!164415 d!56733))

(declare-fun d!56735 () Bool)

(declare-fun e!113637 () Bool)

(assert (=> d!56735 e!113637))

(declare-fun res!137033 () Bool)

(assert (=> d!56735 (=> (not res!137033) (not e!113637))))

(assert (=> d!56735 (= res!137033 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)) (size!3686 lt!258022))))))

(declare-fun lt!258066 () Unit!11449)

(declare-fun choose!205 (array!8232 (_ BitVec 32) (_ BitVec 8)) Unit!11449)

(assert (=> d!56735 (= lt!258066 (choose!205 lt!258022 (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)) lt!258019))))

(assert (=> d!56735 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)) (size!3686 lt!258022)))))

(assert (=> d!56735 (= (arrayUpdatedAtPrefixLemma!228 lt!258022 (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)) lt!258019) lt!258066)))

(declare-fun b!164445 () Bool)

(assert (=> b!164445 (= e!113637 (arrayRangesEq!620 lt!258022 (array!8233 (store (arr!4607 lt!258022) (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)) lt!258019) (size!3686 lt!258022)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577))))))

(assert (= (and d!56735 res!137033) b!164445))

(declare-fun m!261527 () Bool)

(assert (=> d!56735 m!261527))

(declare-fun m!261529 () Bool)

(assert (=> b!164445 m!261529))

(declare-fun m!261531 () Bool)

(assert (=> b!164445 m!261531))

(assert (=> b!164415 d!56735))

(declare-fun d!56737 () Bool)

(assert (=> d!56737 (= (byteRangesEq!0 (select (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577)) lt!258024 #b00000000000000000000000000000000 lt!258017) (or (= #b00000000000000000000000000000000 lt!258017) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!258017))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!258024) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!258017))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14061 () Bool)

(assert (= bs!14061 d!56737))

(declare-fun m!261533 () Bool)

(assert (=> bs!14061 m!261533))

(declare-fun m!261535 () Bool)

(assert (=> bs!14061 m!261535))

(assert (=> b!164415 d!56737))

(declare-fun d!56739 () Bool)

(assert (=> d!56739 (arrayRangesEq!620 (buf!4138 thiss!1577) lt!258016 #b00000000000000000000000000000000 (currentByte!7711 thiss!1577))))

(declare-fun lt!258069 () Unit!11449)

(declare-fun choose!206 (array!8232 array!8232 array!8232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11449)

(assert (=> d!56739 (= lt!258069 (choose!206 (buf!4138 thiss!1577) lt!258022 lt!258016 #b00000000000000000000000000000000 (currentByte!7711 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577))))))

(assert (=> d!56739 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!7711 thiss!1577)) (bvsle (currentByte!7711 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577))))))

(assert (=> d!56739 (= (arrayRangesEqTransitive!167 (buf!4138 thiss!1577) lt!258022 lt!258016 #b00000000000000000000000000000000 (currentByte!7711 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577))) lt!258069)))

(declare-fun bs!14062 () Bool)

(assert (= bs!14062 d!56739))

(assert (=> bs!14062 m!261451))

(declare-fun m!261537 () Bool)

(assert (=> bs!14062 m!261537))

(assert (=> b!164415 d!56739))

(declare-fun d!56741 () Bool)

(declare-fun e!113638 () Bool)

(assert (=> d!56741 e!113638))

(declare-fun res!137034 () Bool)

(assert (=> d!56741 (=> (not res!137034) (not e!113638))))

(assert (=> d!56741 (= res!137034 (and (bvsge (currentByte!7711 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7711 thiss!1577) (size!3686 (buf!4138 thiss!1577)))))))

(declare-fun lt!258070 () Unit!11449)

(assert (=> d!56741 (= lt!258070 (choose!205 (buf!4138 thiss!1577) (currentByte!7711 thiss!1577) lt!258024))))

(assert (=> d!56741 (and (bvsle #b00000000000000000000000000000000 (currentByte!7711 thiss!1577)) (bvslt (currentByte!7711 thiss!1577) (size!3686 (buf!4138 thiss!1577))))))

(assert (=> d!56741 (= (arrayUpdatedAtPrefixLemma!228 (buf!4138 thiss!1577) (currentByte!7711 thiss!1577) lt!258024) lt!258070)))

(declare-fun b!164446 () Bool)

(assert (=> b!164446 (= e!113638 (arrayRangesEq!620 (buf!4138 thiss!1577) (array!8233 (store (arr!4607 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) lt!258024) (size!3686 (buf!4138 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7711 thiss!1577)))))

(assert (= (and d!56741 res!137034) b!164446))

(declare-fun m!261539 () Bool)

(assert (=> d!56741 m!261539))

(assert (=> b!164446 m!261431))

(assert (=> b!164446 m!261457))

(assert (=> b!164415 d!56741))

(declare-fun d!56743 () Bool)

(declare-fun res!137035 () Bool)

(declare-fun e!113639 () Bool)

(assert (=> d!56743 (=> res!137035 e!113639)))

(assert (=> d!56743 (= res!137035 (= #b00000000000000000000000000000000 (currentByte!7711 thiss!1577)))))

(assert (=> d!56743 (= (arrayRangesEq!620 (buf!4138 thiss!1577) lt!258016 #b00000000000000000000000000000000 (currentByte!7711 thiss!1577)) e!113639)))

(declare-fun b!164447 () Bool)

(declare-fun e!113640 () Bool)

(assert (=> b!164447 (= e!113639 e!113640)))

(declare-fun res!137036 () Bool)

(assert (=> b!164447 (=> (not res!137036) (not e!113640))))

(assert (=> b!164447 (= res!137036 (= (select (arr!4607 (buf!4138 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4607 lt!258016) #b00000000000000000000000000000000)))))

(declare-fun b!164448 () Bool)

(assert (=> b!164448 (= e!113640 (arrayRangesEq!620 (buf!4138 thiss!1577) lt!258016 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7711 thiss!1577)))))

(assert (= (and d!56743 (not res!137035)) b!164447))

(assert (= (and b!164447 res!137036) b!164448))

(assert (=> b!164447 m!261521))

(declare-fun m!261541 () Bool)

(assert (=> b!164447 m!261541))

(declare-fun m!261543 () Bool)

(assert (=> b!164448 m!261543))

(assert (=> b!164415 d!56743))

(declare-fun d!56745 () Bool)

(declare-fun res!137037 () Bool)

(declare-fun e!113641 () Bool)

(assert (=> d!56745 (=> res!137037 e!113641)))

(assert (=> d!56745 (= res!137037 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577))))))

(assert (=> d!56745 (= (arrayRangesEq!620 lt!258022 lt!258016 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577))) e!113641)))

(declare-fun b!164449 () Bool)

(declare-fun e!113642 () Bool)

(assert (=> b!164449 (= e!113641 e!113642)))

(declare-fun res!137038 () Bool)

(assert (=> b!164449 (=> (not res!137038) (not e!113642))))

(assert (=> b!164449 (= res!137038 (= (select (arr!4607 lt!258022) #b00000000000000000000000000000000) (select (arr!4607 lt!258016) #b00000000000000000000000000000000)))))

(declare-fun b!164450 () Bool)

(assert (=> b!164450 (= e!113642 (arrayRangesEq!620 lt!258022 lt!258016 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577))))))

(assert (= (and d!56745 (not res!137037)) b!164449))

(assert (= (and b!164449 res!137038) b!164450))

(declare-fun m!261545 () Bool)

(assert (=> b!164449 m!261545))

(assert (=> b!164449 m!261541))

(declare-fun m!261547 () Bool)

(assert (=> b!164450 m!261547))

(assert (=> b!164415 d!56745))

(declare-fun d!56747 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56747 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3686 (buf!4138 (_1!7865 lt!258020)))) ((_ sign_extend 32) (currentByte!7711 (_1!7865 lt!258020))) ((_ sign_extend 32) (currentBit!7706 (_1!7865 lt!258020))) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3686 (buf!4138 (_1!7865 lt!258020)))) ((_ sign_extend 32) (currentByte!7711 (_1!7865 lt!258020))) ((_ sign_extend 32) (currentBit!7706 (_1!7865 lt!258020)))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14063 () Bool)

(assert (= bs!14063 d!56747))

(declare-fun m!261549 () Bool)

(assert (=> bs!14063 m!261549))

(assert (=> b!164409 d!56747))

(declare-fun b!164481 () Bool)

(declare-fun e!113660 () Unit!11449)

(declare-fun lt!258158 () Unit!11449)

(assert (=> b!164481 (= e!113660 lt!258158)))

(declare-fun lt!258157 () (_ BitVec 64))

(assert (=> b!164481 (= lt!258157 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!258154 () (_ BitVec 64))

(assert (=> b!164481 (= lt!258154 (bitIndex!0 (size!3686 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) (currentBit!7706 thiss!1577)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8232 array!8232 (_ BitVec 64) (_ BitVec 64)) Unit!11449)

(assert (=> b!164481 (= lt!258158 (arrayBitRangesEqSymmetric!0 (buf!4138 thiss!1577) (buf!4138 lt!258018) lt!258157 lt!258154))))

(declare-fun arrayBitRangesEq!0 (array!8232 array!8232 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164481 (arrayBitRangesEq!0 (buf!4138 lt!258018) (buf!4138 thiss!1577) lt!258157 lt!258154)))

(declare-fun d!56749 () Bool)

(declare-fun e!113661 () Bool)

(assert (=> d!56749 e!113661))

(declare-fun res!137065 () Bool)

(assert (=> d!56749 (=> (not res!137065) (not e!113661))))

(declare-fun lt!258152 () tuple2!14548)

(assert (=> d!56749 (= res!137065 (isPrefixOf!0 (_1!7865 lt!258152) (_2!7865 lt!258152)))))

(declare-fun lt!258141 () BitStream!6528)

(assert (=> d!56749 (= lt!258152 (tuple2!14549 lt!258141 lt!258018))))

(declare-fun lt!258146 () Unit!11449)

(declare-fun lt!258156 () Unit!11449)

(assert (=> d!56749 (= lt!258146 lt!258156)))

(assert (=> d!56749 (isPrefixOf!0 lt!258141 lt!258018)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6528 BitStream!6528 BitStream!6528) Unit!11449)

(assert (=> d!56749 (= lt!258156 (lemmaIsPrefixTransitive!0 lt!258141 lt!258018 lt!258018))))

(declare-fun lt!258145 () Unit!11449)

(declare-fun lt!258153 () Unit!11449)

(assert (=> d!56749 (= lt!258145 lt!258153)))

(assert (=> d!56749 (isPrefixOf!0 lt!258141 lt!258018)))

(assert (=> d!56749 (= lt!258153 (lemmaIsPrefixTransitive!0 lt!258141 thiss!1577 lt!258018))))

(declare-fun lt!258155 () Unit!11449)

(assert (=> d!56749 (= lt!258155 e!113660)))

(declare-fun c!8579 () Bool)

(assert (=> d!56749 (= c!8579 (not (= (size!3686 (buf!4138 thiss!1577)) #b00000000000000000000000000000000)))))

(declare-fun lt!258142 () Unit!11449)

(declare-fun lt!258150 () Unit!11449)

(assert (=> d!56749 (= lt!258142 lt!258150)))

(assert (=> d!56749 (isPrefixOf!0 lt!258018 lt!258018)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6528) Unit!11449)

(assert (=> d!56749 (= lt!258150 (lemmaIsPrefixRefl!0 lt!258018))))

(declare-fun lt!258151 () Unit!11449)

(declare-fun lt!258159 () Unit!11449)

(assert (=> d!56749 (= lt!258151 lt!258159)))

(assert (=> d!56749 (= lt!258159 (lemmaIsPrefixRefl!0 lt!258018))))

(declare-fun lt!258144 () Unit!11449)

(declare-fun lt!258143 () Unit!11449)

(assert (=> d!56749 (= lt!258144 lt!258143)))

(assert (=> d!56749 (isPrefixOf!0 lt!258141 lt!258141)))

(assert (=> d!56749 (= lt!258143 (lemmaIsPrefixRefl!0 lt!258141))))

(declare-fun lt!258147 () Unit!11449)

(declare-fun lt!258148 () Unit!11449)

(assert (=> d!56749 (= lt!258147 lt!258148)))

(assert (=> d!56749 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!56749 (= lt!258148 (lemmaIsPrefixRefl!0 thiss!1577))))

(assert (=> d!56749 (= lt!258141 (BitStream!6529 (buf!4138 lt!258018) (currentByte!7711 thiss!1577) (currentBit!7706 thiss!1577)))))

(assert (=> d!56749 (isPrefixOf!0 thiss!1577 lt!258018)))

(assert (=> d!56749 (= (reader!0 thiss!1577 lt!258018) lt!258152)))

(declare-fun b!164482 () Bool)

(declare-fun res!137067 () Bool)

(assert (=> b!164482 (=> (not res!137067) (not e!113661))))

(assert (=> b!164482 (= res!137067 (isPrefixOf!0 (_2!7865 lt!258152) lt!258018))))

(declare-fun b!164483 () Bool)

(declare-fun Unit!11453 () Unit!11449)

(assert (=> b!164483 (= e!113660 Unit!11453)))

(declare-fun lt!258149 () (_ BitVec 64))

(declare-fun b!164484 () Bool)

(declare-fun lt!258160 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!6528 (_ BitVec 64)) BitStream!6528)

(assert (=> b!164484 (= e!113661 (= (_1!7865 lt!258152) (withMovedBitIndex!0 (_2!7865 lt!258152) (bvsub lt!258160 lt!258149))))))

(assert (=> b!164484 (or (= (bvand lt!258160 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!258149 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!258160 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258160 lt!258149) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!164484 (= lt!258149 (bitIndex!0 (size!3686 (buf!4138 lt!258018)) (currentByte!7711 lt!258018) (currentBit!7706 lt!258018)))))

(assert (=> b!164484 (= lt!258160 (bitIndex!0 (size!3686 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) (currentBit!7706 thiss!1577)))))

(declare-fun b!164485 () Bool)

(declare-fun res!137066 () Bool)

(assert (=> b!164485 (=> (not res!137066) (not e!113661))))

(assert (=> b!164485 (= res!137066 (isPrefixOf!0 (_1!7865 lt!258152) thiss!1577))))

(assert (= (and d!56749 c!8579) b!164481))

(assert (= (and d!56749 (not c!8579)) b!164483))

(assert (= (and d!56749 res!137065) b!164485))

(assert (= (and b!164485 res!137066) b!164482))

(assert (= (and b!164482 res!137067) b!164484))

(declare-fun m!261573 () Bool)

(assert (=> b!164482 m!261573))

(declare-fun m!261575 () Bool)

(assert (=> d!56749 m!261575))

(declare-fun m!261577 () Bool)

(assert (=> d!56749 m!261577))

(declare-fun m!261579 () Bool)

(assert (=> d!56749 m!261579))

(declare-fun m!261581 () Bool)

(assert (=> d!56749 m!261581))

(declare-fun m!261583 () Bool)

(assert (=> d!56749 m!261583))

(declare-fun m!261585 () Bool)

(assert (=> d!56749 m!261585))

(declare-fun m!261587 () Bool)

(assert (=> d!56749 m!261587))

(declare-fun m!261589 () Bool)

(assert (=> d!56749 m!261589))

(assert (=> d!56749 m!261425))

(declare-fun m!261591 () Bool)

(assert (=> d!56749 m!261591))

(declare-fun m!261593 () Bool)

(assert (=> d!56749 m!261593))

(declare-fun m!261595 () Bool)

(assert (=> b!164485 m!261595))

(declare-fun m!261597 () Bool)

(assert (=> b!164484 m!261597))

(declare-fun m!261599 () Bool)

(assert (=> b!164484 m!261599))

(assert (=> b!164484 m!261471))

(assert (=> b!164481 m!261471))

(declare-fun m!261601 () Bool)

(assert (=> b!164481 m!261601))

(declare-fun m!261603 () Bool)

(assert (=> b!164481 m!261603))

(assert (=> b!164409 d!56749))

(declare-fun d!56769 () Bool)

(declare-fun res!137084 () Bool)

(declare-fun e!113675 () Bool)

(assert (=> d!56769 (=> (not res!137084) (not e!113675))))

(assert (=> d!56769 (= res!137084 (= (size!3686 (buf!4138 thiss!1577)) (size!3686 (buf!4138 lt!258018))))))

(assert (=> d!56769 (= (isPrefixOf!0 thiss!1577 lt!258018) e!113675)))

(declare-fun b!164501 () Bool)

(declare-fun res!137085 () Bool)

(assert (=> b!164501 (=> (not res!137085) (not e!113675))))

(assert (=> b!164501 (= res!137085 (bvsle (bitIndex!0 (size!3686 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) (currentBit!7706 thiss!1577)) (bitIndex!0 (size!3686 (buf!4138 lt!258018)) (currentByte!7711 lt!258018) (currentBit!7706 lt!258018))))))

(declare-fun b!164502 () Bool)

(declare-fun e!113676 () Bool)

(assert (=> b!164502 (= e!113675 e!113676)))

(declare-fun res!137083 () Bool)

(assert (=> b!164502 (=> res!137083 e!113676)))

(assert (=> b!164502 (= res!137083 (= (size!3686 (buf!4138 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!164503 () Bool)

(assert (=> b!164503 (= e!113676 (arrayBitRangesEq!0 (buf!4138 thiss!1577) (buf!4138 lt!258018) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3686 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) (currentBit!7706 thiss!1577))))))

(assert (= (and d!56769 res!137084) b!164501))

(assert (= (and b!164501 res!137085) b!164502))

(assert (= (and b!164502 (not res!137083)) b!164503))

(assert (=> b!164501 m!261471))

(assert (=> b!164501 m!261599))

(assert (=> b!164503 m!261471))

(assert (=> b!164503 m!261471))

(declare-fun m!261617 () Bool)

(assert (=> b!164503 m!261617))

(assert (=> b!164411 d!56769))

(declare-fun d!56777 () Bool)

(assert (=> d!56777 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3686 (buf!4138 thiss!1577))) ((_ sign_extend 32) (currentByte!7711 thiss!1577)) ((_ sign_extend 32) (currentBit!7706 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3686 (buf!4138 thiss!1577))) ((_ sign_extend 32) (currentByte!7711 thiss!1577)) ((_ sign_extend 32) (currentBit!7706 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14067 () Bool)

(assert (= bs!14067 d!56777))

(declare-fun m!261619 () Bool)

(assert (=> bs!14067 m!261619))

(assert (=> b!164410 d!56777))

(declare-fun d!56779 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56779 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7706 thiss!1577) (currentByte!7711 thiss!1577) (size!3686 (buf!4138 thiss!1577))))))

(declare-fun bs!14068 () Bool)

(assert (= bs!14068 d!56779))

(declare-fun m!261621 () Bool)

(assert (=> bs!14068 m!261621))

(assert (=> start!34728 d!56779))

(declare-fun d!56781 () Bool)

(declare-fun e!113685 () Bool)

(assert (=> d!56781 e!113685))

(declare-fun res!137098 () Bool)

(assert (=> d!56781 (=> (not res!137098) (not e!113685))))

(declare-fun lt!258215 () (_ BitVec 64))

(declare-fun lt!258214 () (_ BitVec 64))

(declare-fun lt!258219 () (_ BitVec 64))

(assert (=> d!56781 (= res!137098 (= lt!258219 (bvsub lt!258215 lt!258214)))))

(assert (=> d!56781 (or (= (bvand lt!258215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!258214 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!258215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258215 lt!258214) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56781 (= lt!258214 (remainingBits!0 ((_ sign_extend 32) (size!3686 (buf!4138 thiss!1577))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577))) ((_ sign_extend 32) lt!258017)))))

(declare-fun lt!258218 () (_ BitVec 64))

(declare-fun lt!258217 () (_ BitVec 64))

(assert (=> d!56781 (= lt!258215 (bvmul lt!258218 lt!258217))))

(assert (=> d!56781 (or (= lt!258218 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!258217 (bvsdiv (bvmul lt!258218 lt!258217) lt!258218)))))

(assert (=> d!56781 (= lt!258217 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56781 (= lt!258218 ((_ sign_extend 32) (size!3686 (buf!4138 thiss!1577))))))

(assert (=> d!56781 (= lt!258219 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) lt!258017)))))

(assert (=> d!56781 (invariant!0 lt!258017 (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)) (size!3686 (buf!4138 thiss!1577)))))

(assert (=> d!56781 (= (bitIndex!0 (size!3686 (buf!4138 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!7711 thiss!1577)) lt!258017) lt!258219)))

(declare-fun b!164520 () Bool)

(declare-fun res!137099 () Bool)

(assert (=> b!164520 (=> (not res!137099) (not e!113685))))

(assert (=> b!164520 (= res!137099 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!258219))))

(declare-fun b!164521 () Bool)

(declare-fun lt!258216 () (_ BitVec 64))

(assert (=> b!164521 (= e!113685 (bvsle lt!258219 (bvmul lt!258216 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!164521 (or (= lt!258216 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!258216 #b0000000000000000000000000000000000000000000000000000000000001000) lt!258216)))))

(assert (=> b!164521 (= lt!258216 ((_ sign_extend 32) (size!3686 (buf!4138 thiss!1577))))))

(assert (= (and d!56781 res!137098) b!164520))

(assert (= (and b!164520 res!137099) b!164521))

(declare-fun m!261633 () Bool)

(assert (=> d!56781 m!261633))

(declare-fun m!261635 () Bool)

(assert (=> d!56781 m!261635))

(assert (=> b!164412 d!56781))

(declare-fun d!56793 () Bool)

(declare-fun e!113686 () Bool)

(assert (=> d!56793 e!113686))

(declare-fun res!137100 () Bool)

(assert (=> d!56793 (=> (not res!137100) (not e!113686))))

(declare-fun lt!258221 () (_ BitVec 64))

(declare-fun lt!258220 () (_ BitVec 64))

(declare-fun lt!258225 () (_ BitVec 64))

(assert (=> d!56793 (= res!137100 (= lt!258225 (bvsub lt!258221 lt!258220)))))

(assert (=> d!56793 (or (= (bvand lt!258221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!258220 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!258221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258221 lt!258220) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56793 (= lt!258220 (remainingBits!0 ((_ sign_extend 32) (size!3686 (buf!4138 thiss!1577))) ((_ sign_extend 32) (currentByte!7711 thiss!1577)) ((_ sign_extend 32) (currentBit!7706 thiss!1577))))))

(declare-fun lt!258224 () (_ BitVec 64))

(declare-fun lt!258223 () (_ BitVec 64))

(assert (=> d!56793 (= lt!258221 (bvmul lt!258224 lt!258223))))

(assert (=> d!56793 (or (= lt!258224 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!258223 (bvsdiv (bvmul lt!258224 lt!258223) lt!258224)))))

(assert (=> d!56793 (= lt!258223 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56793 (= lt!258224 ((_ sign_extend 32) (size!3686 (buf!4138 thiss!1577))))))

(assert (=> d!56793 (= lt!258225 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7711 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7706 thiss!1577))))))

(assert (=> d!56793 (invariant!0 (currentBit!7706 thiss!1577) (currentByte!7711 thiss!1577) (size!3686 (buf!4138 thiss!1577)))))

(assert (=> d!56793 (= (bitIndex!0 (size!3686 (buf!4138 thiss!1577)) (currentByte!7711 thiss!1577) (currentBit!7706 thiss!1577)) lt!258225)))

(declare-fun b!164522 () Bool)

(declare-fun res!137101 () Bool)

(assert (=> b!164522 (=> (not res!137101) (not e!113686))))

(assert (=> b!164522 (= res!137101 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!258225))))

(declare-fun b!164523 () Bool)

(declare-fun lt!258222 () (_ BitVec 64))

(assert (=> b!164523 (= e!113686 (bvsle lt!258225 (bvmul lt!258222 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!164523 (or (= lt!258222 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!258222 #b0000000000000000000000000000000000000000000000000000000000001000) lt!258222)))))

(assert (=> b!164523 (= lt!258222 ((_ sign_extend 32) (size!3686 (buf!4138 thiss!1577))))))

(assert (= (and d!56793 res!137100) b!164522))

(assert (= (and b!164522 res!137101) b!164523))

(assert (=> d!56793 m!261619))

(assert (=> d!56793 m!261621))

(assert (=> b!164412 d!56793))

(check-sat (not d!56777) (not b!164446) (not d!56793) (not b!164448) (not d!56779) (not b!164485) (not b!164482) (not d!56735) (not b!164442) (not d!56747) (not b!164481) (not d!56749) (not b!164484) (not b!164503) (not d!56741) (not b!164450) (not d!56739) (not d!56781) (not b!164445) (not b!164501))
(check-sat)
