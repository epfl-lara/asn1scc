; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34720 () Bool)

(assert start!34720)

(declare-fun b!164326 () Bool)

(declare-fun e!113553 () Bool)

(declare-datatypes ((array!8224 0))(
  ( (array!8225 (arr!4603 (Array (_ BitVec 32) (_ BitVec 8))) (size!3682 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6520 0))(
  ( (BitStream!6521 (buf!4134 array!8224) (currentByte!7707 (_ BitVec 32)) (currentBit!7702 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6520)

(declare-fun array_inv!3423 (array!8224) Bool)

(assert (=> b!164326 (= e!113553 (array_inv!3423 (buf!4134 thiss!1577)))))

(declare-fun b!164327 () Bool)

(declare-fun res!136934 () Bool)

(declare-fun e!113552 () Bool)

(assert (=> b!164327 (=> (not res!136934) (not e!113552))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!164327 (= res!136934 (bvsgt (bvadd (currentBit!7702 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164328 () Bool)

(declare-fun res!136929 () Bool)

(declare-fun e!113549 () Bool)

(assert (=> b!164328 (=> res!136929 e!113549)))

(declare-fun lt!257876 () BitStream!6520)

(declare-fun isPrefixOf!0 (BitStream!6520 BitStream!6520) Bool)

(assert (=> b!164328 (= res!136929 (not (isPrefixOf!0 thiss!1577 lt!257876)))))

(declare-fun b!164329 () Bool)

(assert (=> b!164329 (= e!113549 true)))

(declare-datatypes ((tuple2!14540 0))(
  ( (tuple2!14541 (_1!7861 BitStream!6520) (_2!7861 BitStream!6520)) )
))
(declare-fun lt!257880 () tuple2!14540)

(declare-fun reader!0 (BitStream!6520 BitStream!6520) tuple2!14540)

(assert (=> b!164329 (= lt!257880 (reader!0 thiss!1577 lt!257876))))

(declare-fun b!164330 () Bool)

(declare-fun res!136932 () Bool)

(assert (=> b!164330 (=> (not res!136932) (not e!113552))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164330 (= res!136932 (validate_offset_bits!1 ((_ sign_extend 32) (size!3682 (buf!4134 thiss!1577))) ((_ sign_extend 32) (currentByte!7707 thiss!1577)) ((_ sign_extend 32) (currentBit!7702 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164331 () Bool)

(declare-fun e!113550 () Bool)

(assert (=> b!164331 (= e!113550 e!113549)))

(declare-fun res!136930 () Bool)

(assert (=> b!164331 (=> res!136930 e!113549)))

(declare-fun lt!257872 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!164331 (= res!136930 (not (= (bitIndex!0 (size!3682 (buf!4134 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!7707 thiss!1577)) lt!257872) (bvadd (bitIndex!0 (size!3682 (buf!4134 thiss!1577)) (currentByte!7707 thiss!1577) (currentBit!7702 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun lt!257877 () array!8224)

(assert (=> b!164331 (= lt!257876 (BitStream!6521 lt!257877 (bvadd #b00000000000000000000000000000001 (currentByte!7707 thiss!1577)) lt!257872))))

(declare-fun res!136933 () Bool)

(assert (=> start!34720 (=> (not res!136933) (not e!113552))))

(assert (=> start!34720 (= res!136933 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34720 e!113552))

(assert (=> start!34720 true))

(declare-fun inv!12 (BitStream!6520) Bool)

(assert (=> start!34720 (and (inv!12 thiss!1577) e!113553)))

(declare-fun b!164325 () Bool)

(assert (=> b!164325 (= e!113552 (not e!113550))))

(declare-fun res!136931 () Bool)

(assert (=> b!164325 (=> res!136931 e!113550)))

(declare-fun lt!257879 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164325 (= res!136931 (not (byteRangesEq!0 (select (arr!4603 (buf!4134 thiss!1577)) (currentByte!7707 thiss!1577)) lt!257879 #b00000000000000000000000000000000 lt!257872)))))

(declare-fun arrayRangesEq!616 (array!8224 array!8224 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164325 (arrayRangesEq!616 (buf!4134 thiss!1577) lt!257877 #b00000000000000000000000000000000 (currentByte!7707 thiss!1577))))

(declare-datatypes ((Unit!11441 0))(
  ( (Unit!11442) )
))
(declare-fun lt!257874 () Unit!11441)

(declare-fun lt!257873 () array!8224)

(declare-fun arrayRangesEqTransitive!163 (array!8224 array!8224 array!8224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11441)

(assert (=> b!164325 (= lt!257874 (arrayRangesEqTransitive!163 (buf!4134 thiss!1577) lt!257873 lt!257877 #b00000000000000000000000000000000 (currentByte!7707 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7707 thiss!1577))))))

(assert (=> b!164325 (arrayRangesEq!616 lt!257873 lt!257877 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7707 thiss!1577)))))

(declare-fun lt!257875 () (_ BitVec 8))

(declare-fun lt!257881 () Unit!11441)

(declare-fun arrayUpdatedAtPrefixLemma!224 (array!8224 (_ BitVec 32) (_ BitVec 8)) Unit!11441)

(assert (=> b!164325 (= lt!257881 (arrayUpdatedAtPrefixLemma!224 lt!257873 (bvadd #b00000000000000000000000000000001 (currentByte!7707 thiss!1577)) lt!257875))))

(assert (=> b!164325 (arrayRangesEq!616 (buf!4134 thiss!1577) (array!8225 (store (arr!4603 (buf!4134 thiss!1577)) (currentByte!7707 thiss!1577) lt!257879) (size!3682 (buf!4134 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7707 thiss!1577))))

(declare-fun lt!257883 () Unit!11441)

(assert (=> b!164325 (= lt!257883 (arrayUpdatedAtPrefixLemma!224 (buf!4134 thiss!1577) (currentByte!7707 thiss!1577) lt!257879))))

(declare-fun lt!257878 () (_ BitVec 32))

(assert (=> b!164325 (= lt!257879 (select (store (store (arr!4603 (buf!4134 thiss!1577)) (currentByte!7707 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4603 (buf!4134 thiss!1577)) (currentByte!7707 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7702 thiss!1577)))))))) (bvlshr (bvand lt!257878 #b00000000000000000000000011111111) lt!257872)))) (bvadd #b00000000000000000000000000000001 (currentByte!7707 thiss!1577)) lt!257875) (currentByte!7707 thiss!1577)))))

(assert (=> b!164325 (= lt!257877 (array!8225 (store (store (arr!4603 (buf!4134 thiss!1577)) (currentByte!7707 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4603 (buf!4134 thiss!1577)) (currentByte!7707 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7702 thiss!1577)))))))) (bvlshr (bvand lt!257878 #b00000000000000000000000011111111) lt!257872)))) (bvadd #b00000000000000000000000000000001 (currentByte!7707 thiss!1577)) lt!257875) (size!3682 (buf!4134 thiss!1577))))))

(declare-fun lt!257882 () (_ BitVec 32))

(assert (=> b!164325 (= lt!257875 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4603 (buf!4134 thiss!1577)) (currentByte!7707 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4603 (buf!4134 thiss!1577)) (currentByte!7707 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7702 thiss!1577)))))))) (bvlshr (bvand lt!257878 #b00000000000000000000000011111111) lt!257872)))) (bvadd #b00000000000000000000000000000001 (currentByte!7707 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257882))) (bvshl lt!257878 lt!257882))))))

(assert (=> b!164325 (= lt!257882 (bvsub #b00000000000000000000000000001000 lt!257872))))

(assert (=> b!164325 (= lt!257873 (array!8225 (store (arr!4603 (buf!4134 thiss!1577)) (currentByte!7707 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4603 (buf!4134 thiss!1577)) (currentByte!7707 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7702 thiss!1577)))))))) (bvlshr (bvand lt!257878 #b00000000000000000000000011111111) lt!257872)))) (size!3682 (buf!4134 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164325 (= lt!257878 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164325 (= lt!257872 (bvsub (bvadd (currentBit!7702 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34720 res!136933) b!164330))

(assert (= (and b!164330 res!136932) b!164327))

(assert (= (and b!164327 res!136934) b!164325))

(assert (= (and b!164325 (not res!136931)) b!164331))

(assert (= (and b!164331 (not res!136930)) b!164328))

(assert (= (and b!164328 (not res!136929)) b!164329))

(assert (= start!34720 b!164326))

(declare-fun m!261239 () Bool)

(assert (=> b!164329 m!261239))

(declare-fun m!261241 () Bool)

(assert (=> start!34720 m!261241))

(declare-fun m!261243 () Bool)

(assert (=> b!164331 m!261243))

(declare-fun m!261245 () Bool)

(assert (=> b!164331 m!261245))

(declare-fun m!261247 () Bool)

(assert (=> b!164326 m!261247))

(declare-fun m!261249 () Bool)

(assert (=> b!164330 m!261249))

(declare-fun m!261251 () Bool)

(assert (=> b!164328 m!261251))

(declare-fun m!261253 () Bool)

(assert (=> b!164325 m!261253))

(declare-fun m!261255 () Bool)

(assert (=> b!164325 m!261255))

(declare-fun m!261257 () Bool)

(assert (=> b!164325 m!261257))

(declare-fun m!261259 () Bool)

(assert (=> b!164325 m!261259))

(declare-fun m!261261 () Bool)

(assert (=> b!164325 m!261261))

(declare-fun m!261263 () Bool)

(assert (=> b!164325 m!261263))

(declare-fun m!261265 () Bool)

(assert (=> b!164325 m!261265))

(declare-fun m!261267 () Bool)

(assert (=> b!164325 m!261267))

(declare-fun m!261269 () Bool)

(assert (=> b!164325 m!261269))

(declare-fun m!261271 () Bool)

(assert (=> b!164325 m!261271))

(declare-fun m!261273 () Bool)

(assert (=> b!164325 m!261273))

(declare-fun m!261275 () Bool)

(assert (=> b!164325 m!261275))

(declare-fun m!261277 () Bool)

(assert (=> b!164325 m!261277))

(declare-fun m!261279 () Bool)

(assert (=> b!164325 m!261279))

(declare-fun m!261281 () Bool)

(assert (=> b!164325 m!261281))

(assert (=> b!164325 m!261255))

(declare-fun m!261283 () Bool)

(assert (=> b!164325 m!261283))

(push 1)

(assert (not b!164329))

(assert (not b!164331))

(assert (not start!34720))

(assert (not b!164326))

(assert (not b!164325))

(assert (not b!164328))

(assert (not b!164330))

(check-sat)

(pop 1)

