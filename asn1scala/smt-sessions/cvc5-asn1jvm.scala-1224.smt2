; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34726 () Bool)

(assert start!34726)

(declare-fun b!164388 () Bool)

(declare-fun res!136985 () Bool)

(declare-fun e!113594 () Bool)

(assert (=> b!164388 (=> (not res!136985) (not e!113594))))

(declare-datatypes ((array!8230 0))(
  ( (array!8231 (arr!4606 (Array (_ BitVec 32) (_ BitVec 8))) (size!3685 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6526 0))(
  ( (BitStream!6527 (buf!4137 array!8230) (currentByte!7710 (_ BitVec 32)) (currentBit!7705 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6526)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!164388 (= res!136985 (bvsgt (bvadd (currentBit!7705 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164389 () Bool)

(declare-fun e!113595 () Bool)

(assert (=> b!164389 (= e!113594 (not e!113595))))

(declare-fun res!136987 () Bool)

(assert (=> b!164389 (=> res!136987 e!113595)))

(declare-fun lt!257980 () (_ BitVec 8))

(declare-fun lt!257990 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164389 (= res!136987 (not (byteRangesEq!0 (select (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577)) lt!257980 #b00000000000000000000000000000000 lt!257990)))))

(declare-fun lt!257982 () array!8230)

(declare-fun arrayRangesEq!619 (array!8230 array!8230 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164389 (arrayRangesEq!619 (buf!4137 thiss!1577) lt!257982 #b00000000000000000000000000000000 (currentByte!7710 thiss!1577))))

(declare-datatypes ((Unit!11447 0))(
  ( (Unit!11448) )
))
(declare-fun lt!257983 () Unit!11447)

(declare-fun lt!257987 () array!8230)

(declare-fun arrayRangesEqTransitive!166 (array!8230 array!8230 array!8230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11447)

(assert (=> b!164389 (= lt!257983 (arrayRangesEqTransitive!166 (buf!4137 thiss!1577) lt!257987 lt!257982 #b00000000000000000000000000000000 (currentByte!7710 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577))))))

(assert (=> b!164389 (arrayRangesEq!619 lt!257987 lt!257982 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)))))

(declare-fun lt!257981 () (_ BitVec 8))

(declare-fun lt!257988 () Unit!11447)

(declare-fun arrayUpdatedAtPrefixLemma!227 (array!8230 (_ BitVec 32) (_ BitVec 8)) Unit!11447)

(assert (=> b!164389 (= lt!257988 (arrayUpdatedAtPrefixLemma!227 lt!257987 (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)) lt!257981))))

(assert (=> b!164389 (arrayRangesEq!619 (buf!4137 thiss!1577) (array!8231 (store (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) lt!257980) (size!3685 (buf!4137 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7710 thiss!1577))))

(declare-fun lt!257985 () Unit!11447)

(assert (=> b!164389 (= lt!257985 (arrayUpdatedAtPrefixLemma!227 (buf!4137 thiss!1577) (currentByte!7710 thiss!1577) lt!257980))))

(declare-fun lt!257986 () (_ BitVec 32))

(assert (=> b!164389 (= lt!257980 (select (store (store (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7705 thiss!1577)))))))) (bvlshr (bvand lt!257986 #b00000000000000000000000011111111) lt!257990)))) (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)) lt!257981) (currentByte!7710 thiss!1577)))))

(assert (=> b!164389 (= lt!257982 (array!8231 (store (store (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7705 thiss!1577)))))))) (bvlshr (bvand lt!257986 #b00000000000000000000000011111111) lt!257990)))) (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)) lt!257981) (size!3685 (buf!4137 thiss!1577))))))

(declare-fun lt!257984 () (_ BitVec 32))

(assert (=> b!164389 (= lt!257981 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7705 thiss!1577)))))))) (bvlshr (bvand lt!257986 #b00000000000000000000000011111111) lt!257990)))) (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257984))) (bvshl lt!257986 lt!257984))))))

(assert (=> b!164389 (= lt!257984 (bvsub #b00000000000000000000000000001000 lt!257990))))

(assert (=> b!164389 (= lt!257987 (array!8231 (store (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7705 thiss!1577)))))))) (bvlshr (bvand lt!257986 #b00000000000000000000000011111111) lt!257990)))) (size!3685 (buf!4137 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164389 (= lt!257986 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164389 (= lt!257990 (bvsub (bvadd (currentBit!7705 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164390 () Bool)

(declare-fun res!136988 () Bool)

(assert (=> b!164390 (=> (not res!136988) (not e!113594))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164390 (= res!136988 (validate_offset_bits!1 ((_ sign_extend 32) (size!3685 (buf!4137 thiss!1577))) ((_ sign_extend 32) (currentByte!7710 thiss!1577)) ((_ sign_extend 32) (currentBit!7705 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164391 () Bool)

(declare-fun e!113598 () Bool)

(declare-datatypes ((tuple2!14546 0))(
  ( (tuple2!14547 (_1!7864 BitStream!6526) (_2!7864 BitStream!6526)) )
))
(declare-fun lt!257991 () tuple2!14546)

(assert (=> b!164391 (= e!113598 (validate_offset_bits!1 ((_ sign_extend 32) (size!3685 (buf!4137 (_1!7864 lt!257991)))) ((_ sign_extend 32) (currentByte!7710 (_1!7864 lt!257991))) ((_ sign_extend 32) (currentBit!7705 (_1!7864 lt!257991))) ((_ sign_extend 32) nBits!511)))))

(declare-fun lt!257989 () BitStream!6526)

(declare-fun reader!0 (BitStream!6526 BitStream!6526) tuple2!14546)

(assert (=> b!164391 (= lt!257991 (reader!0 thiss!1577 lt!257989))))

(declare-fun b!164392 () Bool)

(assert (=> b!164392 (= e!113595 e!113598)))

(declare-fun res!136983 () Bool)

(assert (=> b!164392 (=> res!136983 e!113598)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!164392 (= res!136983 (not (= (bitIndex!0 (size!3685 (buf!4137 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)) lt!257990) (bvadd (bitIndex!0 (size!3685 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) (currentBit!7705 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(assert (=> b!164392 (= lt!257989 (BitStream!6527 lt!257982 (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)) lt!257990))))

(declare-fun res!136986 () Bool)

(assert (=> start!34726 (=> (not res!136986) (not e!113594))))

(assert (=> start!34726 (= res!136986 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34726 e!113594))

(assert (=> start!34726 true))

(declare-fun e!113597 () Bool)

(declare-fun inv!12 (BitStream!6526) Bool)

(assert (=> start!34726 (and (inv!12 thiss!1577) e!113597)))

(declare-fun b!164393 () Bool)

(declare-fun res!136984 () Bool)

(assert (=> b!164393 (=> res!136984 e!113598)))

(declare-fun isPrefixOf!0 (BitStream!6526 BitStream!6526) Bool)

(assert (=> b!164393 (= res!136984 (not (isPrefixOf!0 thiss!1577 lt!257989)))))

(declare-fun b!164394 () Bool)

(declare-fun array_inv!3426 (array!8230) Bool)

(assert (=> b!164394 (= e!113597 (array_inv!3426 (buf!4137 thiss!1577)))))

(assert (= (and start!34726 res!136986) b!164390))

(assert (= (and b!164390 res!136988) b!164388))

(assert (= (and b!164388 res!136985) b!164389))

(assert (= (and b!164389 (not res!136987)) b!164392))

(assert (= (and b!164392 (not res!136983)) b!164393))

(assert (= (and b!164393 (not res!136984)) b!164391))

(assert (= start!34726 b!164394))

(declare-fun m!261377 () Bool)

(assert (=> b!164389 m!261377))

(declare-fun m!261379 () Bool)

(assert (=> b!164389 m!261379))

(assert (=> b!164389 m!261379))

(declare-fun m!261381 () Bool)

(assert (=> b!164389 m!261381))

(declare-fun m!261383 () Bool)

(assert (=> b!164389 m!261383))

(declare-fun m!261385 () Bool)

(assert (=> b!164389 m!261385))

(declare-fun m!261387 () Bool)

(assert (=> b!164389 m!261387))

(declare-fun m!261389 () Bool)

(assert (=> b!164389 m!261389))

(declare-fun m!261391 () Bool)

(assert (=> b!164389 m!261391))

(declare-fun m!261393 () Bool)

(assert (=> b!164389 m!261393))

(declare-fun m!261395 () Bool)

(assert (=> b!164389 m!261395))

(declare-fun m!261397 () Bool)

(assert (=> b!164389 m!261397))

(declare-fun m!261399 () Bool)

(assert (=> b!164389 m!261399))

(declare-fun m!261401 () Bool)

(assert (=> b!164389 m!261401))

(declare-fun m!261403 () Bool)

(assert (=> b!164389 m!261403))

(declare-fun m!261405 () Bool)

(assert (=> b!164389 m!261405))

(declare-fun m!261407 () Bool)

(assert (=> b!164389 m!261407))

(declare-fun m!261409 () Bool)

(assert (=> b!164394 m!261409))

(declare-fun m!261411 () Bool)

(assert (=> b!164390 m!261411))

(declare-fun m!261413 () Bool)

(assert (=> start!34726 m!261413))

(declare-fun m!261415 () Bool)

(assert (=> b!164391 m!261415))

(declare-fun m!261417 () Bool)

(assert (=> b!164391 m!261417))

(declare-fun m!261419 () Bool)

(assert (=> b!164392 m!261419))

(declare-fun m!261421 () Bool)

(assert (=> b!164392 m!261421))

(declare-fun m!261423 () Bool)

(assert (=> b!164393 m!261423))

(push 1)

(assert (not b!164394))

(assert (not b!164391))

(assert (not b!164392))

(assert (not b!164390))

(assert (not b!164393))

(assert (not start!34726))

(assert (not b!164389))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56753 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56753 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3685 (buf!4137 (_1!7864 lt!257991)))) ((_ sign_extend 32) (currentByte!7710 (_1!7864 lt!257991))) ((_ sign_extend 32) (currentBit!7705 (_1!7864 lt!257991))) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3685 (buf!4137 (_1!7864 lt!257991)))) ((_ sign_extend 32) (currentByte!7710 (_1!7864 lt!257991))) ((_ sign_extend 32) (currentBit!7705 (_1!7864 lt!257991)))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14064 () Bool)

(assert (= bs!14064 d!56753))

(declare-fun m!261551 () Bool)

(assert (=> bs!14064 m!261551))

(assert (=> b!164391 d!56753))

(declare-fun b!164524 () Bool)

(declare-fun res!137104 () Bool)

(declare-fun e!113687 () Bool)

(assert (=> b!164524 (=> (not res!137104) (not e!113687))))

(declare-fun lt!258234 () tuple2!14546)

(assert (=> b!164524 (= res!137104 (isPrefixOf!0 (_1!7864 lt!258234) thiss!1577))))

(declare-fun b!164525 () Bool)

(declare-fun e!113688 () Unit!11447)

(declare-fun Unit!11454 () Unit!11447)

(assert (=> b!164525 (= e!113688 Unit!11454)))

(declare-fun b!164526 () Bool)

(declare-fun lt!258243 () (_ BitVec 64))

(declare-fun lt!258230 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!6526 (_ BitVec 64)) BitStream!6526)

(assert (=> b!164526 (= e!113687 (= (_1!7864 lt!258234) (withMovedBitIndex!0 (_2!7864 lt!258234) (bvsub lt!258230 lt!258243))))))

(assert (=> b!164526 (or (= (bvand lt!258230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!258243 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!258230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258230 lt!258243) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!164526 (= lt!258243 (bitIndex!0 (size!3685 (buf!4137 lt!257989)) (currentByte!7710 lt!257989) (currentBit!7705 lt!257989)))))

(assert (=> b!164526 (= lt!258230 (bitIndex!0 (size!3685 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) (currentBit!7705 thiss!1577)))))

(declare-fun b!164527 () Bool)

(declare-fun res!137103 () Bool)

(assert (=> b!164527 (=> (not res!137103) (not e!113687))))

(assert (=> b!164527 (= res!137103 (isPrefixOf!0 (_2!7864 lt!258234) lt!257989))))

(declare-fun d!56755 () Bool)

(assert (=> d!56755 e!113687))

(declare-fun res!137102 () Bool)

(assert (=> d!56755 (=> (not res!137102) (not e!113687))))

(assert (=> d!56755 (= res!137102 (isPrefixOf!0 (_1!7864 lt!258234) (_2!7864 lt!258234)))))

(declare-fun lt!258239 () BitStream!6526)

(assert (=> d!56755 (= lt!258234 (tuple2!14547 lt!258239 lt!257989))))

(declare-fun lt!258238 () Unit!11447)

(declare-fun lt!258235 () Unit!11447)

(assert (=> d!56755 (= lt!258238 lt!258235)))

(assert (=> d!56755 (isPrefixOf!0 lt!258239 lt!257989)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6526 BitStream!6526 BitStream!6526) Unit!11447)

(assert (=> d!56755 (= lt!258235 (lemmaIsPrefixTransitive!0 lt!258239 lt!257989 lt!257989))))

(declare-fun lt!258244 () Unit!11447)

(declare-fun lt!258233 () Unit!11447)

(assert (=> d!56755 (= lt!258244 lt!258233)))

(assert (=> d!56755 (isPrefixOf!0 lt!258239 lt!257989)))

(assert (=> d!56755 (= lt!258233 (lemmaIsPrefixTransitive!0 lt!258239 thiss!1577 lt!257989))))

(declare-fun lt!258232 () Unit!11447)

(assert (=> d!56755 (= lt!258232 e!113688)))

(declare-fun c!8582 () Bool)

(assert (=> d!56755 (= c!8582 (not (= (size!3685 (buf!4137 thiss!1577)) #b00000000000000000000000000000000)))))

(declare-fun lt!258245 () Unit!11447)

(declare-fun lt!258227 () Unit!11447)

(assert (=> d!56755 (= lt!258245 lt!258227)))

(assert (=> d!56755 (isPrefixOf!0 lt!257989 lt!257989)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6526) Unit!11447)

(assert (=> d!56755 (= lt!258227 (lemmaIsPrefixRefl!0 lt!257989))))

(declare-fun lt!258242 () Unit!11447)

(declare-fun lt!258229 () Unit!11447)

(assert (=> d!56755 (= lt!258242 lt!258229)))

(assert (=> d!56755 (= lt!258229 (lemmaIsPrefixRefl!0 lt!257989))))

(declare-fun lt!258228 () Unit!11447)

(declare-fun lt!258236 () Unit!11447)

(assert (=> d!56755 (= lt!258228 lt!258236)))

(assert (=> d!56755 (isPrefixOf!0 lt!258239 lt!258239)))

(assert (=> d!56755 (= lt!258236 (lemmaIsPrefixRefl!0 lt!258239))))

(declare-fun lt!258240 () Unit!11447)

(declare-fun lt!258231 () Unit!11447)

(assert (=> d!56755 (= lt!258240 lt!258231)))

(assert (=> d!56755 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!56755 (= lt!258231 (lemmaIsPrefixRefl!0 thiss!1577))))

(assert (=> d!56755 (= lt!258239 (BitStream!6527 (buf!4137 lt!257989) (currentByte!7710 thiss!1577) (currentBit!7705 thiss!1577)))))

(assert (=> d!56755 (isPrefixOf!0 thiss!1577 lt!257989)))

(assert (=> d!56755 (= (reader!0 thiss!1577 lt!257989) lt!258234)))

(declare-fun b!164528 () Bool)

(declare-fun lt!258241 () Unit!11447)

(assert (=> b!164528 (= e!113688 lt!258241)))

(declare-fun lt!258237 () (_ BitVec 64))

(assert (=> b!164528 (= lt!258237 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!258226 () (_ BitVec 64))

(assert (=> b!164528 (= lt!258226 (bitIndex!0 (size!3685 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) (currentBit!7705 thiss!1577)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8230 array!8230 (_ BitVec 64) (_ BitVec 64)) Unit!11447)

(assert (=> b!164528 (= lt!258241 (arrayBitRangesEqSymmetric!0 (buf!4137 thiss!1577) (buf!4137 lt!257989) lt!258237 lt!258226))))

(declare-fun arrayBitRangesEq!0 (array!8230 array!8230 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164528 (arrayBitRangesEq!0 (buf!4137 lt!257989) (buf!4137 thiss!1577) lt!258237 lt!258226)))

(assert (= (and d!56755 c!8582) b!164528))

(assert (= (and d!56755 (not c!8582)) b!164525))

(assert (= (and d!56755 res!137102) b!164524))

(assert (= (and b!164524 res!137104) b!164527))

(assert (= (and b!164527 res!137103) b!164526))

(declare-fun m!261637 () Bool)

(assert (=> b!164527 m!261637))

(assert (=> b!164528 m!261421))

(declare-fun m!261639 () Bool)

(assert (=> b!164528 m!261639))

(declare-fun m!261641 () Bool)

(assert (=> b!164528 m!261641))

(declare-fun m!261643 () Bool)

(assert (=> d!56755 m!261643))

(declare-fun m!261645 () Bool)

(assert (=> d!56755 m!261645))

(assert (=> d!56755 m!261423))

(declare-fun m!261647 () Bool)

(assert (=> d!56755 m!261647))

(declare-fun m!261649 () Bool)

(assert (=> d!56755 m!261649))

(declare-fun m!261651 () Bool)

(assert (=> d!56755 m!261651))

(declare-fun m!261653 () Bool)

(assert (=> d!56755 m!261653))

(declare-fun m!261655 () Bool)

(assert (=> d!56755 m!261655))

(declare-fun m!261657 () Bool)

(assert (=> d!56755 m!261657))

(declare-fun m!261659 () Bool)

(assert (=> d!56755 m!261659))

(declare-fun m!261661 () Bool)

(assert (=> d!56755 m!261661))

(declare-fun m!261663 () Bool)

(assert (=> b!164526 m!261663))

(declare-fun m!261665 () Bool)

(assert (=> b!164526 m!261665))

(assert (=> b!164526 m!261421))

(declare-fun m!261667 () Bool)

(assert (=> b!164524 m!261667))

(assert (=> b!164391 d!56755))

(declare-fun d!56795 () Bool)

(declare-fun res!137112 () Bool)

(declare-fun e!113693 () Bool)

(assert (=> d!56795 (=> (not res!137112) (not e!113693))))

(assert (=> d!56795 (= res!137112 (= (size!3685 (buf!4137 thiss!1577)) (size!3685 (buf!4137 lt!257989))))))

(assert (=> d!56795 (= (isPrefixOf!0 thiss!1577 lt!257989) e!113693)))

(declare-fun b!164535 () Bool)

(declare-fun res!137111 () Bool)

(assert (=> b!164535 (=> (not res!137111) (not e!113693))))

(assert (=> b!164535 (= res!137111 (bvsle (bitIndex!0 (size!3685 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) (currentBit!7705 thiss!1577)) (bitIndex!0 (size!3685 (buf!4137 lt!257989)) (currentByte!7710 lt!257989) (currentBit!7705 lt!257989))))))

(declare-fun b!164536 () Bool)

(declare-fun e!113694 () Bool)

(assert (=> b!164536 (= e!113693 e!113694)))

(declare-fun res!137113 () Bool)

(assert (=> b!164536 (=> res!137113 e!113694)))

(assert (=> b!164536 (= res!137113 (= (size!3685 (buf!4137 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!164537 () Bool)

(assert (=> b!164537 (= e!113694 (arrayBitRangesEq!0 (buf!4137 thiss!1577) (buf!4137 lt!257989) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3685 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) (currentBit!7705 thiss!1577))))))

(assert (= (and d!56795 res!137112) b!164535))

(assert (= (and b!164535 res!137111) b!164536))

(assert (= (and b!164536 (not res!137113)) b!164537))

(assert (=> b!164535 m!261421))

(assert (=> b!164535 m!261665))

(assert (=> b!164537 m!261421))

(assert (=> b!164537 m!261421))

(declare-fun m!261669 () Bool)

(assert (=> b!164537 m!261669))

(assert (=> b!164393 d!56795))

(declare-fun d!56797 () Bool)

(declare-fun e!113703 () Bool)

(assert (=> d!56797 e!113703))

(declare-fun res!137128 () Bool)

(assert (=> d!56797 (=> (not res!137128) (not e!113703))))

(declare-fun lt!258323 () (_ BitVec 64))

(declare-fun lt!258322 () (_ BitVec 64))

(declare-fun lt!258318 () (_ BitVec 64))

(assert (=> d!56797 (= res!137128 (= lt!258323 (bvsub lt!258318 lt!258322)))))

(assert (=> d!56797 (or (= (bvand lt!258318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!258322 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!258318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258318 lt!258322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56797 (= lt!258322 (remainingBits!0 ((_ sign_extend 32) (size!3685 (buf!4137 thiss!1577))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577))) ((_ sign_extend 32) lt!257990)))))

(declare-fun lt!258321 () (_ BitVec 64))

(declare-fun lt!258320 () (_ BitVec 64))

(assert (=> d!56797 (= lt!258318 (bvmul lt!258321 lt!258320))))

(assert (=> d!56797 (or (= lt!258321 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!258320 (bvsdiv (bvmul lt!258321 lt!258320) lt!258321)))))

(assert (=> d!56797 (= lt!258320 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56797 (= lt!258321 ((_ sign_extend 32) (size!3685 (buf!4137 thiss!1577))))))

(assert (=> d!56797 (= lt!258323 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) lt!257990)))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56797 (invariant!0 lt!257990 (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)) (size!3685 (buf!4137 thiss!1577)))))

(assert (=> d!56797 (= (bitIndex!0 (size!3685 (buf!4137 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)) lt!257990) lt!258323)))

(declare-fun b!164557 () Bool)

(declare-fun res!137127 () Bool)

(assert (=> b!164557 (=> (not res!137127) (not e!113703))))

(assert (=> b!164557 (= res!137127 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!258323))))

(declare-fun b!164558 () Bool)

(declare-fun lt!258319 () (_ BitVec 64))

(assert (=> b!164558 (= e!113703 (bvsle lt!258323 (bvmul lt!258319 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!164558 (or (= lt!258319 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!258319 #b0000000000000000000000000000000000000000000000000000000000001000) lt!258319)))))

(assert (=> b!164558 (= lt!258319 ((_ sign_extend 32) (size!3685 (buf!4137 thiss!1577))))))

(assert (= (and d!56797 res!137128) b!164557))

(assert (= (and b!164557 res!137127) b!164558))

(declare-fun m!261701 () Bool)

(assert (=> d!56797 m!261701))

(declare-fun m!261703 () Bool)

(assert (=> d!56797 m!261703))

(assert (=> b!164392 d!56797))

(declare-fun d!56799 () Bool)

(declare-fun e!113704 () Bool)

(assert (=> d!56799 e!113704))

(declare-fun res!137130 () Bool)

(assert (=> d!56799 (=> (not res!137130) (not e!113704))))

(declare-fun lt!258328 () (_ BitVec 64))

(declare-fun lt!258329 () (_ BitVec 64))

(declare-fun lt!258324 () (_ BitVec 64))

(assert (=> d!56799 (= res!137130 (= lt!258329 (bvsub lt!258324 lt!258328)))))

(assert (=> d!56799 (or (= (bvand lt!258324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!258328 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!258324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258324 lt!258328) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56799 (= lt!258328 (remainingBits!0 ((_ sign_extend 32) (size!3685 (buf!4137 thiss!1577))) ((_ sign_extend 32) (currentByte!7710 thiss!1577)) ((_ sign_extend 32) (currentBit!7705 thiss!1577))))))

(declare-fun lt!258327 () (_ BitVec 64))

(declare-fun lt!258326 () (_ BitVec 64))

(assert (=> d!56799 (= lt!258324 (bvmul lt!258327 lt!258326))))

(assert (=> d!56799 (or (= lt!258327 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!258326 (bvsdiv (bvmul lt!258327 lt!258326) lt!258327)))))

(assert (=> d!56799 (= lt!258326 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56799 (= lt!258327 ((_ sign_extend 32) (size!3685 (buf!4137 thiss!1577))))))

(assert (=> d!56799 (= lt!258329 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7710 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7705 thiss!1577))))))

(assert (=> d!56799 (invariant!0 (currentBit!7705 thiss!1577) (currentByte!7710 thiss!1577) (size!3685 (buf!4137 thiss!1577)))))

(assert (=> d!56799 (= (bitIndex!0 (size!3685 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) (currentBit!7705 thiss!1577)) lt!258329)))

(declare-fun b!164559 () Bool)

(declare-fun res!137129 () Bool)

(assert (=> b!164559 (=> (not res!137129) (not e!113704))))

(assert (=> b!164559 (= res!137129 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!258329))))

(declare-fun b!164560 () Bool)

(declare-fun lt!258325 () (_ BitVec 64))

(assert (=> b!164560 (= e!113704 (bvsle lt!258329 (bvmul lt!258325 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!164560 (or (= lt!258325 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!258325 #b0000000000000000000000000000000000000000000000000000000000001000) lt!258325)))))

(assert (=> b!164560 (= lt!258325 ((_ sign_extend 32) (size!3685 (buf!4137 thiss!1577))))))

(assert (= (and d!56799 res!137130) b!164559))

(assert (= (and b!164559 res!137129) b!164560))

(declare-fun m!261705 () Bool)

(assert (=> d!56799 m!261705))

(declare-fun m!261707 () Bool)

(assert (=> d!56799 m!261707))

(assert (=> b!164392 d!56799))

(declare-fun d!56801 () Bool)

(declare-fun res!137135 () Bool)

(declare-fun e!113709 () Bool)

(assert (=> d!56801 (=> res!137135 e!113709)))

(assert (=> d!56801 (= res!137135 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577))))))

(assert (=> d!56801 (= (arrayRangesEq!619 lt!257987 lt!257982 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577))) e!113709)))

(declare-fun b!164565 () Bool)

(declare-fun e!113710 () Bool)

(assert (=> b!164565 (= e!113709 e!113710)))

(declare-fun res!137136 () Bool)

(assert (=> b!164565 (=> (not res!137136) (not e!113710))))

(assert (=> b!164565 (= res!137136 (= (select (arr!4606 lt!257987) #b00000000000000000000000000000000) (select (arr!4606 lt!257982) #b00000000000000000000000000000000)))))

(declare-fun b!164566 () Bool)

(assert (=> b!164566 (= e!113710 (arrayRangesEq!619 lt!257987 lt!257982 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577))))))

(assert (= (and d!56801 (not res!137135)) b!164565))

(assert (= (and b!164565 res!137136) b!164566))

(declare-fun m!261709 () Bool)

(assert (=> b!164565 m!261709))

(declare-fun m!261711 () Bool)

(assert (=> b!164565 m!261711))

(declare-fun m!261713 () Bool)

(assert (=> b!164566 m!261713))

(assert (=> b!164389 d!56801))

(declare-fun d!56803 () Bool)

(declare-fun e!113713 () Bool)

(assert (=> d!56803 e!113713))

(declare-fun res!137139 () Bool)

(assert (=> d!56803 (=> (not res!137139) (not e!113713))))

(assert (=> d!56803 (= res!137139 (and (bvsge (currentByte!7710 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7710 thiss!1577) (size!3685 (buf!4137 thiss!1577)))))))

(declare-fun lt!258332 () Unit!11447)

(declare-fun choose!209 (array!8230 (_ BitVec 32) (_ BitVec 8)) Unit!11447)

(assert (=> d!56803 (= lt!258332 (choose!209 (buf!4137 thiss!1577) (currentByte!7710 thiss!1577) lt!257980))))

(assert (=> d!56803 (and (bvsle #b00000000000000000000000000000000 (currentByte!7710 thiss!1577)) (bvslt (currentByte!7710 thiss!1577) (size!3685 (buf!4137 thiss!1577))))))

(assert (=> d!56803 (= (arrayUpdatedAtPrefixLemma!227 (buf!4137 thiss!1577) (currentByte!7710 thiss!1577) lt!257980) lt!258332)))

(declare-fun b!164569 () Bool)

(assert (=> b!164569 (= e!113713 (arrayRangesEq!619 (buf!4137 thiss!1577) (array!8231 (store (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) lt!257980) (size!3685 (buf!4137 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7710 thiss!1577)))))

(assert (= (and d!56803 res!137139) b!164569))

(declare-fun m!261715 () Bool)

(assert (=> d!56803 m!261715))

(assert (=> b!164569 m!261405))

(assert (=> b!164569 m!261397))

(assert (=> b!164389 d!56803))

(declare-fun d!56805 () Bool)

(assert (=> d!56805 (arrayRangesEq!619 (buf!4137 thiss!1577) lt!257982 #b00000000000000000000000000000000 (currentByte!7710 thiss!1577))))

(declare-fun lt!258335 () Unit!11447)

(declare-fun choose!210 (array!8230 array!8230 array!8230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11447)

(assert (=> d!56805 (= lt!258335 (choose!210 (buf!4137 thiss!1577) lt!257987 lt!257982 #b00000000000000000000000000000000 (currentByte!7710 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577))))))

(assert (=> d!56805 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!7710 thiss!1577)) (bvsle (currentByte!7710 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577))))))

(assert (=> d!56805 (= (arrayRangesEqTransitive!166 (buf!4137 thiss!1577) lt!257987 lt!257982 #b00000000000000000000000000000000 (currentByte!7710 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577))) lt!258335)))

(declare-fun bs!14072 () Bool)

(assert (= bs!14072 d!56805))

(assert (=> bs!14072 m!261393))

(declare-fun m!261717 () Bool)

(assert (=> bs!14072 m!261717))

(assert (=> b!164389 d!56805))

(declare-fun d!56807 () Bool)

(declare-fun e!113714 () Bool)

(assert (=> d!56807 e!113714))

(declare-fun res!137140 () Bool)

(assert (=> d!56807 (=> (not res!137140) (not e!113714))))

(assert (=> d!56807 (= res!137140 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)) (size!3685 lt!257987))))))

(declare-fun lt!258336 () Unit!11447)

(assert (=> d!56807 (= lt!258336 (choose!209 lt!257987 (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)) lt!257981))))

(assert (=> d!56807 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)) (size!3685 lt!257987)))))

(assert (=> d!56807 (= (arrayUpdatedAtPrefixLemma!227 lt!257987 (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)) lt!257981) lt!258336)))

(declare-fun b!164570 () Bool)

(assert (=> b!164570 (= e!113714 (arrayRangesEq!619 lt!257987 (array!8231 (store (arr!4606 lt!257987) (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577)) lt!257981) (size!3685 lt!257987)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7710 thiss!1577))))))

(assert (= (and d!56807 res!137140) b!164570))

(declare-fun m!261719 () Bool)

(assert (=> d!56807 m!261719))

(declare-fun m!261721 () Bool)

(assert (=> b!164570 m!261721))

(declare-fun m!261723 () Bool)

(assert (=> b!164570 m!261723))

(assert (=> b!164389 d!56807))

(declare-fun d!56809 () Bool)

(assert (=> d!56809 (= (byteRangesEq!0 (select (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577)) lt!257980 #b00000000000000000000000000000000 lt!257990) (or (= #b00000000000000000000000000000000 lt!257990) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!257990))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!257980) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!257990))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14073 () Bool)

(assert (= bs!14073 d!56809))

(declare-fun m!261725 () Bool)

(assert (=> bs!14073 m!261725))

(declare-fun m!261727 () Bool)

(assert (=> bs!14073 m!261727))

(assert (=> b!164389 d!56809))

(declare-fun d!56811 () Bool)

(declare-fun res!137141 () Bool)

(declare-fun e!113715 () Bool)

(assert (=> d!56811 (=> res!137141 e!113715)))

(assert (=> d!56811 (= res!137141 (= #b00000000000000000000000000000000 (currentByte!7710 thiss!1577)))))

(assert (=> d!56811 (= (arrayRangesEq!619 (buf!4137 thiss!1577) lt!257982 #b00000000000000000000000000000000 (currentByte!7710 thiss!1577)) e!113715)))

(declare-fun b!164571 () Bool)

(declare-fun e!113716 () Bool)

(assert (=> b!164571 (= e!113715 e!113716)))

(declare-fun res!137142 () Bool)

(assert (=> b!164571 (=> (not res!137142) (not e!113716))))

(assert (=> b!164571 (= res!137142 (= (select (arr!4606 (buf!4137 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4606 lt!257982) #b00000000000000000000000000000000)))))

(declare-fun b!164572 () Bool)

(assert (=> b!164572 (= e!113716 (arrayRangesEq!619 (buf!4137 thiss!1577) lt!257982 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7710 thiss!1577)))))

(assert (= (and d!56811 (not res!137141)) b!164571))

(assert (= (and b!164571 res!137142) b!164572))

(declare-fun m!261729 () Bool)

(assert (=> b!164571 m!261729))

(assert (=> b!164571 m!261711))

(declare-fun m!261731 () Bool)

(assert (=> b!164572 m!261731))

(assert (=> b!164389 d!56811))

(declare-fun d!56813 () Bool)

(declare-fun res!137143 () Bool)

(declare-fun e!113717 () Bool)

(assert (=> d!56813 (=> res!137143 e!113717)))

(assert (=> d!56813 (= res!137143 (= #b00000000000000000000000000000000 (currentByte!7710 thiss!1577)))))

(assert (=> d!56813 (= (arrayRangesEq!619 (buf!4137 thiss!1577) (array!8231 (store (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) lt!257980) (size!3685 (buf!4137 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7710 thiss!1577)) e!113717)))

(declare-fun b!164573 () Bool)

(declare-fun e!113718 () Bool)

(assert (=> b!164573 (= e!113717 e!113718)))

(declare-fun res!137144 () Bool)

(assert (=> b!164573 (=> (not res!137144) (not e!113718))))

(assert (=> b!164573 (= res!137144 (= (select (arr!4606 (buf!4137 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4606 (array!8231 (store (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) lt!257980) (size!3685 (buf!4137 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!164574 () Bool)

(assert (=> b!164574 (= e!113718 (arrayRangesEq!619 (buf!4137 thiss!1577) (array!8231 (store (arr!4606 (buf!4137 thiss!1577)) (currentByte!7710 thiss!1577) lt!257980) (size!3685 (buf!4137 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7710 thiss!1577)))))

(assert (= (and d!56813 (not res!137143)) b!164573))

(assert (= (and b!164573 res!137144) b!164574))

(assert (=> b!164573 m!261729))

(declare-fun m!261733 () Bool)

(assert (=> b!164573 m!261733))

(declare-fun m!261735 () Bool)

(assert (=> b!164574 m!261735))

(assert (=> b!164389 d!56813))

(declare-fun d!56815 () Bool)

(assert (=> d!56815 (= (array_inv!3426 (buf!4137 thiss!1577)) (bvsge (size!3685 (buf!4137 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164394 d!56815))

(declare-fun d!56817 () Bool)

(assert (=> d!56817 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3685 (buf!4137 thiss!1577))) ((_ sign_extend 32) (currentByte!7710 thiss!1577)) ((_ sign_extend 32) (currentBit!7705 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3685 (buf!4137 thiss!1577))) ((_ sign_extend 32) (currentByte!7710 thiss!1577)) ((_ sign_extend 32) (currentBit!7705 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14074 () Bool)

(assert (= bs!14074 d!56817))

(assert (=> bs!14074 m!261705))

(assert (=> b!164390 d!56817))

(declare-fun d!56819 () Bool)

(assert (=> d!56819 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7705 thiss!1577) (currentByte!7710 thiss!1577) (size!3685 (buf!4137 thiss!1577))))))

(declare-fun bs!14075 () Bool)

(assert (= bs!14075 d!56819))

(assert (=> bs!14075 m!261707))

(assert (=> start!34726 d!56819))

(push 1)

(assert (not b!164537))

(assert (not d!56819))

(assert (not d!56805))

(assert (not b!164574))

(assert (not d!56807))

(assert (not b!164572))

(assert (not d!56817))

(assert (not d!56753))

(assert (not b!164524))

(assert (not b!164570))

(assert (not b!164528))

(assert (not b!164566))

(assert (not d!56803))

(assert (not b!164569))

(assert (not d!56799))

(assert (not b!164535))

(assert (not d!56797))

(assert (not b!164526))

(assert (not d!56755))

(assert (not b!164527))

(check-sat)

(pop 1)

(push 1)

(check-sat)

