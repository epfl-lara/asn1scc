; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56468 () Bool)

(assert start!56468)

(declare-fun b!260919 () Bool)

(declare-fun e!181348 () Bool)

(declare-datatypes ((array!14365 0))(
  ( (array!14366 (arr!7266 (Array (_ BitVec 32) (_ BitVec 8))) (size!6279 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11480 0))(
  ( (BitStream!11481 (buf!6801 array!14365) (currentByte!12527 (_ BitVec 32)) (currentBit!12522 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11480)

(declare-datatypes ((Unit!18581 0))(
  ( (Unit!18582) )
))
(declare-datatypes ((tuple2!22356 0))(
  ( (tuple2!22357 (_1!12114 Unit!18581) (_2!12114 BitStream!11480)) )
))
(declare-fun lt!403045 () tuple2!22356)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260919 (= e!181348 (invariant!0 (currentBit!12522 thiss!914) (currentByte!12527 thiss!914) (size!6279 (buf!6801 (_2!12114 lt!403045)))))))

(declare-fun b!260920 () Bool)

(declare-fun res!218441 () Bool)

(assert (=> b!260920 (=> res!218441 e!181348)))

(assert (=> b!260920 (= res!218441 (not (invariant!0 (currentBit!12522 (_2!12114 lt!403045)) (currentByte!12527 (_2!12114 lt!403045)) (size!6279 (buf!6801 (_2!12114 lt!403045))))))))

(declare-fun b!260921 () Bool)

(declare-fun res!218437 () Bool)

(assert (=> b!260921 (=> res!218437 e!181348)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!260921 (= res!218437 (not (= (bitIndex!0 (size!6279 (buf!6801 (_2!12114 lt!403045))) (currentByte!12527 (_2!12114 lt!403045)) (currentBit!12522 (_2!12114 lt!403045))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6279 (buf!6801 thiss!914)) (currentByte!12527 thiss!914) (currentBit!12522 thiss!914))))))))

(declare-fun b!260922 () Bool)

(declare-fun e!181351 () Bool)

(declare-fun array_inv!6020 (array!14365) Bool)

(assert (=> b!260922 (= e!181351 (array_inv!6020 (buf!6801 thiss!914)))))

(declare-fun res!218438 () Bool)

(declare-fun e!181350 () Bool)

(assert (=> start!56468 (=> (not res!218438) (not e!181350))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56468 (= res!218438 (validate_offset_bit!0 ((_ sign_extend 32) (size!6279 (buf!6801 thiss!914))) ((_ sign_extend 32) (currentByte!12527 thiss!914)) ((_ sign_extend 32) (currentBit!12522 thiss!914))))))

(assert (=> start!56468 e!181350))

(declare-fun inv!12 (BitStream!11480) Bool)

(assert (=> start!56468 (and (inv!12 thiss!914) e!181351)))

(assert (=> start!56468 true))

(declare-fun b!260923 () Bool)

(declare-fun res!218440 () Bool)

(assert (=> b!260923 (=> res!218440 e!181348)))

(declare-fun isPrefixOf!0 (BitStream!11480 BitStream!11480) Bool)

(assert (=> b!260923 (= res!218440 (not (isPrefixOf!0 thiss!914 (_2!12114 lt!403045))))))

(declare-fun b!260924 () Bool)

(assert (=> b!260924 (= e!181350 (not e!181348))))

(declare-fun res!218439 () Bool)

(assert (=> b!260924 (=> res!218439 e!181348)))

(assert (=> b!260924 (= res!218439 (not (= (size!6279 (buf!6801 thiss!914)) (size!6279 (buf!6801 (_2!12114 lt!403045))))))))

(declare-fun lt!403044 () tuple2!22356)

(declare-fun increaseBitIndex!0 (BitStream!11480) tuple2!22356)

(assert (=> b!260924 (= lt!403045 (increaseBitIndex!0 (_2!12114 lt!403044)))))

(declare-fun arrayRangesEq!946 (array!14365 array!14365 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260924 (arrayRangesEq!946 (buf!6801 thiss!914) (array!14366 (store (arr!7266 (buf!6801 thiss!914)) (currentByte!12527 (_2!12114 lt!403044)) (select (arr!7266 (buf!6801 (_2!12114 lt!403044))) (currentByte!12527 (_2!12114 lt!403044)))) (size!6279 (buf!6801 thiss!914))) #b00000000000000000000000000000000 (currentByte!12527 (_2!12114 lt!403044)))))

(declare-fun lt!403046 () Unit!18581)

(declare-fun arrayUpdatedAtPrefixLemma!462 (array!14365 (_ BitVec 32) (_ BitVec 8)) Unit!18581)

(assert (=> b!260924 (= lt!403046 (arrayUpdatedAtPrefixLemma!462 (buf!6801 thiss!914) (currentByte!12527 (_2!12114 lt!403044)) (select (arr!7266 (buf!6801 (_2!12114 lt!403044))) (currentByte!12527 (_2!12114 lt!403044)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18583 () Unit!18581)

(declare-fun Unit!18584 () Unit!18581)

(assert (=> b!260924 (= lt!403044 (ite b!187 (tuple2!22357 Unit!18583 (BitStream!11481 (array!14366 (store (arr!7266 (buf!6801 thiss!914)) (currentByte!12527 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7266 (buf!6801 thiss!914)) (currentByte!12527 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12522 thiss!914)))))) (size!6279 (buf!6801 thiss!914))) (currentByte!12527 thiss!914) (currentBit!12522 thiss!914))) (tuple2!22357 Unit!18584 (BitStream!11481 (array!14366 (store (arr!7266 (buf!6801 thiss!914)) (currentByte!12527 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7266 (buf!6801 thiss!914)) (currentByte!12527 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12522 thiss!914))))))) (size!6279 (buf!6801 thiss!914))) (currentByte!12527 thiss!914) (currentBit!12522 thiss!914)))))))

(assert (= (and start!56468 res!218438) b!260924))

(assert (= (and b!260924 (not res!218439)) b!260921))

(assert (= (and b!260921 (not res!218437)) b!260923))

(assert (= (and b!260923 (not res!218440)) b!260920))

(assert (= (and b!260920 (not res!218441)) b!260919))

(assert (= start!56468 b!260922))

(declare-fun m!390477 () Bool)

(assert (=> b!260919 m!390477))

(declare-fun m!390479 () Bool)

(assert (=> b!260920 m!390479))

(declare-fun m!390481 () Bool)

(assert (=> b!260922 m!390481))

(declare-fun m!390483 () Bool)

(assert (=> b!260923 m!390483))

(declare-fun m!390485 () Bool)

(assert (=> start!56468 m!390485))

(declare-fun m!390487 () Bool)

(assert (=> start!56468 m!390487))

(declare-fun m!390489 () Bool)

(assert (=> b!260924 m!390489))

(declare-fun m!390491 () Bool)

(assert (=> b!260924 m!390491))

(declare-fun m!390493 () Bool)

(assert (=> b!260924 m!390493))

(declare-fun m!390495 () Bool)

(assert (=> b!260924 m!390495))

(declare-fun m!390497 () Bool)

(assert (=> b!260924 m!390497))

(declare-fun m!390499 () Bool)

(assert (=> b!260924 m!390499))

(declare-fun m!390501 () Bool)

(assert (=> b!260924 m!390501))

(assert (=> b!260924 m!390497))

(declare-fun m!390503 () Bool)

(assert (=> b!260924 m!390503))

(declare-fun m!390505 () Bool)

(assert (=> b!260924 m!390505))

(declare-fun m!390507 () Bool)

(assert (=> b!260921 m!390507))

(declare-fun m!390509 () Bool)

(assert (=> b!260921 m!390509))

(push 1)

(assert (not b!260921))

(assert (not b!260920))

(assert (not start!56468))

(assert (not b!260919))

(assert (not b!260922))

(assert (not b!260923))

(assert (not b!260924))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87690 () Bool)

(assert (=> d!87690 (= (invariant!0 (currentBit!12522 thiss!914) (currentByte!12527 thiss!914) (size!6279 (buf!6801 (_2!12114 lt!403045)))) (and (bvsge (currentBit!12522 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12522 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12527 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12527 thiss!914) (size!6279 (buf!6801 (_2!12114 lt!403045)))) (and (= (currentBit!12522 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12527 thiss!914) (size!6279 (buf!6801 (_2!12114 lt!403045))))))))))

(assert (=> b!260919 d!87690))

(declare-fun d!87692 () Bool)

(declare-fun e!181368 () Bool)

(assert (=> d!87692 e!181368))

(declare-fun res!218466 () Bool)

(assert (=> d!87692 (=> (not res!218466) (not e!181368))))

(declare-fun lt!403086 () (_ BitVec 64))

(declare-fun lt!403089 () (_ BitVec 64))

(declare-fun lt!403087 () tuple2!22356)

(assert (=> d!87692 (= res!218466 (= (bvadd lt!403089 lt!403086) (bitIndex!0 (size!6279 (buf!6801 (_2!12114 lt!403087))) (currentByte!12527 (_2!12114 lt!403087)) (currentBit!12522 (_2!12114 lt!403087)))))))

(assert (=> d!87692 (or (not (= (bvand lt!403089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403086 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403089 lt!403086) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87692 (= lt!403086 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87692 (= lt!403089 (bitIndex!0 (size!6279 (buf!6801 (_2!12114 lt!403044))) (currentByte!12527 (_2!12114 lt!403044)) (currentBit!12522 (_2!12114 lt!403044))))))

(declare-fun Unit!18589 () Unit!18581)

(declare-fun Unit!18590 () Unit!18581)

(assert (=> d!87692 (= lt!403087 (ite (bvslt (currentBit!12522 (_2!12114 lt!403044)) #b00000000000000000000000000000111) (tuple2!22357 Unit!18589 (BitStream!11481 (buf!6801 (_2!12114 lt!403044)) (currentByte!12527 (_2!12114 lt!403044)) (bvadd (currentBit!12522 (_2!12114 lt!403044)) #b00000000000000000000000000000001))) (tuple2!22357 Unit!18590 (BitStream!11481 (buf!6801 (_2!12114 lt!403044)) (bvadd (currentByte!12527 (_2!12114 lt!403044)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87692 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6279 (buf!6801 (_2!12114 lt!403044)))) ((_ sign_extend 32) (currentByte!12527 (_2!12114 lt!403044))) ((_ sign_extend 32) (currentBit!12522 (_2!12114 lt!403044)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87692 (= (increaseBitIndex!0 (_2!12114 lt!403044)) lt!403087)))

(declare-fun b!260948 () Bool)

(declare-fun res!218465 () Bool)

(assert (=> b!260948 (=> (not res!218465) (not e!181368))))

(declare-fun lt!403085 () (_ BitVec 64))

(declare-fun lt!403088 () (_ BitVec 64))

(assert (=> b!260948 (= res!218465 (= (bvsub lt!403085 lt!403088) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!260948 (or (= (bvand lt!403085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403088 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403085 lt!403088) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260948 (= lt!403088 (remainingBits!0 ((_ sign_extend 32) (size!6279 (buf!6801 (_2!12114 lt!403087)))) ((_ sign_extend 32) (currentByte!12527 (_2!12114 lt!403087))) ((_ sign_extend 32) (currentBit!12522 (_2!12114 lt!403087)))))))

(assert (=> b!260948 (= lt!403085 (remainingBits!0 ((_ sign_extend 32) (size!6279 (buf!6801 (_2!12114 lt!403044)))) ((_ sign_extend 32) (currentByte!12527 (_2!12114 lt!403044))) ((_ sign_extend 32) (currentBit!12522 (_2!12114 lt!403044)))))))

(declare-fun b!260949 () Bool)

(assert (=> b!260949 (= e!181368 (= (size!6279 (buf!6801 (_2!12114 lt!403044))) (size!6279 (buf!6801 (_2!12114 lt!403087)))))))

(assert (= (and d!87692 res!218466) b!260948))

(assert (= (and b!260948 res!218465) b!260949))

(declare-fun m!390531 () Bool)

(assert (=> d!87692 m!390531))

(declare-fun m!390533 () Bool)

(assert (=> d!87692 m!390533))

(declare-fun m!390537 () Bool)

(assert (=> d!87692 m!390537))

(declare-fun m!390541 () Bool)

(assert (=> b!260948 m!390541))

(assert (=> b!260948 m!390537))

(assert (=> b!260924 d!87692))

(declare-fun d!87706 () Bool)

(declare-fun res!218477 () Bool)

(declare-fun e!181378 () Bool)

(assert (=> d!87706 (=> res!218477 e!181378)))

(assert (=> d!87706 (= res!218477 (= #b00000000000000000000000000000000 (currentByte!12527 (_2!12114 lt!403044))))))

(assert (=> d!87706 (= (arrayRangesEq!946 (buf!6801 thiss!914) (array!14366 (store (arr!7266 (buf!6801 thiss!914)) (currentByte!12527 (_2!12114 lt!403044)) (select (arr!7266 (buf!6801 (_2!12114 lt!403044))) (currentByte!12527 (_2!12114 lt!403044)))) (size!6279 (buf!6801 thiss!914))) #b00000000000000000000000000000000 (currentByte!12527 (_2!12114 lt!403044))) e!181378)))

(declare-fun b!260960 () Bool)

(declare-fun e!181379 () Bool)

(assert (=> b!260960 (= e!181378 e!181379)))

(declare-fun res!218478 () Bool)

(assert (=> b!260960 (=> (not res!218478) (not e!181379))))

(assert (=> b!260960 (= res!218478 (= (select (arr!7266 (buf!6801 thiss!914)) #b00000000000000000000000000000000) (select (arr!7266 (array!14366 (store (arr!7266 (buf!6801 thiss!914)) (currentByte!12527 (_2!12114 lt!403044)) (select (arr!7266 (buf!6801 (_2!12114 lt!403044))) (currentByte!12527 (_2!12114 lt!403044)))) (size!6279 (buf!6801 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260961 () Bool)

(assert (=> b!260961 (= e!181379 (arrayRangesEq!946 (buf!6801 thiss!914) (array!14366 (store (arr!7266 (buf!6801 thiss!914)) (currentByte!12527 (_2!12114 lt!403044)) (select (arr!7266 (buf!6801 (_2!12114 lt!403044))) (currentByte!12527 (_2!12114 lt!403044)))) (size!6279 (buf!6801 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12527 (_2!12114 lt!403044))))))

(assert (= (and d!87706 (not res!218477)) b!260960))

(assert (= (and b!260960 res!218478) b!260961))

(declare-fun m!390547 () Bool)

(assert (=> b!260960 m!390547))

(declare-fun m!390549 () Bool)

(assert (=> b!260960 m!390549))

(declare-fun m!390553 () Bool)

(assert (=> b!260961 m!390553))

(assert (=> b!260924 d!87706))

(declare-fun d!87710 () Bool)

(declare-fun e!181386 () Bool)

(assert (=> d!87710 e!181386))

(declare-fun res!218485 () Bool)

(assert (=> d!87710 (=> (not res!218485) (not e!181386))))

(assert (=> d!87710 (= res!218485 (and (bvsge (currentByte!12527 (_2!12114 lt!403044)) #b00000000000000000000000000000000) (bvslt (currentByte!12527 (_2!12114 lt!403044)) (size!6279 (buf!6801 thiss!914)))))))

(declare-fun lt!403099 () Unit!18581)

(declare-fun choose!356 (array!14365 (_ BitVec 32) (_ BitVec 8)) Unit!18581)

(assert (=> d!87710 (= lt!403099 (choose!356 (buf!6801 thiss!914) (currentByte!12527 (_2!12114 lt!403044)) (select (arr!7266 (buf!6801 (_2!12114 lt!403044))) (currentByte!12527 (_2!12114 lt!403044)))))))

(assert (=> d!87710 (and (bvsle #b00000000000000000000000000000000 (currentByte!12527 (_2!12114 lt!403044))) (bvslt (currentByte!12527 (_2!12114 lt!403044)) (size!6279 (buf!6801 thiss!914))))))

(assert (=> d!87710 (= (arrayUpdatedAtPrefixLemma!462 (buf!6801 thiss!914) (currentByte!12527 (_2!12114 lt!403044)) (select (arr!7266 (buf!6801 (_2!12114 lt!403044))) (currentByte!12527 (_2!12114 lt!403044)))) lt!403099)))

(declare-fun b!260968 () Bool)

(assert (=> b!260968 (= e!181386 (arrayRangesEq!946 (buf!6801 thiss!914) (array!14366 (store (arr!7266 (buf!6801 thiss!914)) (currentByte!12527 (_2!12114 lt!403044)) (select (arr!7266 (buf!6801 (_2!12114 lt!403044))) (currentByte!12527 (_2!12114 lt!403044)))) (size!6279 (buf!6801 thiss!914))) #b00000000000000000000000000000000 (currentByte!12527 (_2!12114 lt!403044))))))

(assert (= (and d!87710 res!218485) b!260968))

(assert (=> d!87710 m!390497))

(declare-fun m!390559 () Bool)

(assert (=> d!87710 m!390559))

(assert (=> b!260968 m!390489))

(assert (=> b!260968 m!390493))

(assert (=> b!260924 d!87710))

(declare-fun d!87714 () Bool)

(declare-fun res!218501 () Bool)

(declare-fun e!181397 () Bool)

(assert (=> d!87714 (=> (not res!218501) (not e!181397))))

(assert (=> d!87714 (= res!218501 (= (size!6279 (buf!6801 thiss!914)) (size!6279 (buf!6801 (_2!12114 lt!403045)))))))

(assert (=> d!87714 (= (isPrefixOf!0 thiss!914 (_2!12114 lt!403045)) e!181397)))

(declare-fun b!260984 () Bool)

(declare-fun res!218503 () Bool)

(assert (=> b!260984 (=> (not res!218503) (not e!181397))))

(assert (=> b!260984 (= res!218503 (bvsle (bitIndex!0 (size!6279 (buf!6801 thiss!914)) (currentByte!12527 thiss!914) (currentBit!12522 thiss!914)) (bitIndex!0 (size!6279 (buf!6801 (_2!12114 lt!403045))) (currentByte!12527 (_2!12114 lt!403045)) (currentBit!12522 (_2!12114 lt!403045)))))))

(declare-fun b!260985 () Bool)

(declare-fun e!181396 () Bool)

(assert (=> b!260985 (= e!181397 e!181396)))

(declare-fun res!218502 () Bool)

(assert (=> b!260985 (=> res!218502 e!181396)))

(assert (=> b!260985 (= res!218502 (= (size!6279 (buf!6801 thiss!914)) #b00000000000000000000000000000000))))

(declare-fun b!260986 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14365 array!14365 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260986 (= e!181396 (arrayBitRangesEq!0 (buf!6801 thiss!914) (buf!6801 (_2!12114 lt!403045)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6279 (buf!6801 thiss!914)) (currentByte!12527 thiss!914) (currentBit!12522 thiss!914))))))

(assert (= (and d!87714 res!218501) b!260984))

(assert (= (and b!260984 res!218503) b!260985))

(assert (= (and b!260985 (not res!218502)) b!260986))

(assert (=> b!260984 m!390509))

(assert (=> b!260984 m!390507))

(assert (=> b!260986 m!390509))

(assert (=> b!260986 m!390509))

(declare-fun m!390565 () Bool)

(assert (=> b!260986 m!390565))

(assert (=> b!260923 d!87714))

(declare-fun d!87726 () Bool)

(assert (=> d!87726 (= (array_inv!6020 (buf!6801 thiss!914)) (bvsge (size!6279 (buf!6801 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260922 d!87726))

(declare-fun d!87728 () Bool)

(assert (=> d!87728 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6279 (buf!6801 thiss!914))) ((_ sign_extend 32) (currentByte!12527 thiss!914)) ((_ sign_extend 32) (currentBit!12522 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6279 (buf!6801 thiss!914))) ((_ sign_extend 32) (currentByte!12527 thiss!914)) ((_ sign_extend 32) (currentBit!12522 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22217 () Bool)

(assert (= bs!22217 d!87728))

(declare-fun m!390567 () Bool)

(assert (=> bs!22217 m!390567))

(assert (=> start!56468 d!87728))

(declare-fun d!87730 () Bool)

(assert (=> d!87730 (= (inv!12 thiss!914) (invariant!0 (currentBit!12522 thiss!914) (currentByte!12527 thiss!914) (size!6279 (buf!6801 thiss!914))))))

(declare-fun bs!22218 () Bool)

(assert (= bs!22218 d!87730))

(declare-fun m!390569 () Bool)

(assert (=> bs!22218 m!390569))

(assert (=> start!56468 d!87730))

(declare-fun d!87732 () Bool)

(declare-fun e!181412 () Bool)

(assert (=> d!87732 e!181412))

(declare-fun res!218530 () Bool)

(assert (=> d!87732 (=> (not res!218530) (not e!181412))))

(declare-fun lt!403165 () (_ BitVec 64))

(declare-fun lt!403161 () (_ BitVec 64))

(declare-fun lt!403162 () (_ BitVec 64))

(assert (=> d!87732 (= res!218530 (= lt!403165 (bvsub lt!403161 lt!403162)))))

(assert (=> d!87732 (or (= (bvand lt!403161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403162 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403161 lt!403162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87732 (= lt!403162 (remainingBits!0 ((_ sign_extend 32) (size!6279 (buf!6801 (_2!12114 lt!403045)))) ((_ sign_extend 32) (currentByte!12527 (_2!12114 lt!403045))) ((_ sign_extend 32) (currentBit!12522 (_2!12114 lt!403045)))))))

(declare-fun lt!403163 () (_ BitVec 64))

(declare-fun lt!403164 () (_ BitVec 64))

(assert (=> d!87732 (= lt!403161 (bvmul lt!403163 lt!403164))))

(assert (=> d!87732 (or (= lt!403163 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403164 (bvsdiv (bvmul lt!403163 lt!403164) lt!403163)))))

(assert (=> d!87732 (= lt!403164 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87732 (= lt!403163 ((_ sign_extend 32) (size!6279 (buf!6801 (_2!12114 lt!403045)))))))

(assert (=> d!87732 (= lt!403165 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12527 (_2!12114 lt!403045))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12522 (_2!12114 lt!403045)))))))

(assert (=> d!87732 (invariant!0 (currentBit!12522 (_2!12114 lt!403045)) (currentByte!12527 (_2!12114 lt!403045)) (size!6279 (buf!6801 (_2!12114 lt!403045))))))

(assert (=> d!87732 (= (bitIndex!0 (size!6279 (buf!6801 (_2!12114 lt!403045))) (currentByte!12527 (_2!12114 lt!403045)) (currentBit!12522 (_2!12114 lt!403045))) lt!403165)))

(declare-fun b!261010 () Bool)

(declare-fun res!218529 () Bool)

(assert (=> b!261010 (=> (not res!218529) (not e!181412))))

(assert (=> b!261010 (= res!218529 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403165))))

(declare-fun b!261011 () Bool)

(declare-fun lt!403166 () (_ BitVec 64))

(assert (=> b!261011 (= e!181412 (bvsle lt!403165 (bvmul lt!403166 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261011 (or (= lt!403166 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403166 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403166)))))

(assert (=> b!261011 (= lt!403166 ((_ sign_extend 32) (size!6279 (buf!6801 (_2!12114 lt!403045)))))))

(assert (= (and d!87732 res!218530) b!261010))

(assert (= (and b!261010 res!218529) b!261011))

(declare-fun m!390579 () Bool)

(assert (=> d!87732 m!390579))

(assert (=> d!87732 m!390479))

(assert (=> b!260921 d!87732))

(declare-fun d!87746 () Bool)

(declare-fun e!181415 () Bool)

(assert (=> d!87746 e!181415))

(declare-fun res!218534 () Bool)

(assert (=> d!87746 (=> (not res!218534) (not e!181415))))

(declare-fun lt!403168 () (_ BitVec 64))

(declare-fun lt!403167 () (_ BitVec 64))

(declare-fun lt!403171 () (_ BitVec 64))

(assert (=> d!87746 (= res!218534 (= lt!403171 (bvsub lt!403167 lt!403168)))))

(assert (=> d!87746 (or (= (bvand lt!403167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403168 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403167 lt!403168) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87746 (= lt!403168 (remainingBits!0 ((_ sign_extend 32) (size!6279 (buf!6801 thiss!914))) ((_ sign_extend 32) (currentByte!12527 thiss!914)) ((_ sign_extend 32) (currentBit!12522 thiss!914))))))

(declare-fun lt!403169 () (_ BitVec 64))

(declare-fun lt!403170 () (_ BitVec 64))

(assert (=> d!87746 (= lt!403167 (bvmul lt!403169 lt!403170))))

(assert (=> d!87746 (or (= lt!403169 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403170 (bvsdiv (bvmul lt!403169 lt!403170) lt!403169)))))

(assert (=> d!87746 (= lt!403170 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87746 (= lt!403169 ((_ sign_extend 32) (size!6279 (buf!6801 thiss!914))))))

(assert (=> d!87746 (= lt!403171 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12527 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12522 thiss!914))))))

(assert (=> d!87746 (invariant!0 (currentBit!12522 thiss!914) (currentByte!12527 thiss!914) (size!6279 (buf!6801 thiss!914)))))

(assert (=> d!87746 (= (bitIndex!0 (size!6279 (buf!6801 thiss!914)) (currentByte!12527 thiss!914) (currentBit!12522 thiss!914)) lt!403171)))

(declare-fun b!261016 () Bool)

(declare-fun res!218533 () Bool)

(assert (=> b!261016 (=> (not res!218533) (not e!181415))))

(assert (=> b!261016 (= res!218533 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403171))))

(declare-fun b!261017 () Bool)

(declare-fun lt!403172 () (_ BitVec 64))

(assert (=> b!261017 (= e!181415 (bvsle lt!403171 (bvmul lt!403172 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261017 (or (= lt!403172 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403172 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403172)))))

(assert (=> b!261017 (= lt!403172 ((_ sign_extend 32) (size!6279 (buf!6801 thiss!914))))))

(assert (= (and d!87746 res!218534) b!261016))

