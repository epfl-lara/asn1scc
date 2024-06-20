; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56304 () Bool)

(assert start!56304)

(declare-fun res!218139 () Bool)

(declare-fun e!181084 () Bool)

(assert (=> start!56304 (=> (not res!218139) (not e!181084))))

(declare-datatypes ((array!14336 0))(
  ( (array!14337 (arr!7256 (Array (_ BitVec 32) (_ BitVec 8))) (size!6269 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11460 0))(
  ( (BitStream!11461 (buf!6791 array!14336) (currentByte!12494 (_ BitVec 32)) (currentBit!12489 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11460)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56304 (= res!218139 (validate_offset_bit!0 ((_ sign_extend 32) (size!6269 (buf!6791 thiss!914))) ((_ sign_extend 32) (currentByte!12494 thiss!914)) ((_ sign_extend 32) (currentBit!12489 thiss!914))))))

(assert (=> start!56304 e!181084))

(declare-fun e!181087 () Bool)

(declare-fun inv!12 (BitStream!11460) Bool)

(assert (=> start!56304 (and (inv!12 thiss!914) e!181087)))

(assert (=> start!56304 true))

(declare-fun b!260591 () Bool)

(declare-fun e!181086 () Bool)

(assert (=> b!260591 (= e!181084 (not e!181086))))

(declare-fun res!218140 () Bool)

(assert (=> b!260591 (=> res!218140 e!181086)))

(declare-datatypes ((Unit!18523 0))(
  ( (Unit!18524) )
))
(declare-datatypes ((tuple2!22336 0))(
  ( (tuple2!22337 (_1!12104 Unit!18523) (_2!12104 BitStream!11460)) )
))
(declare-fun lt!402705 () tuple2!22336)

(assert (=> b!260591 (= res!218140 (not (= (size!6269 (buf!6791 thiss!914)) (size!6269 (buf!6791 (_2!12104 lt!402705))))))))

(declare-fun lt!402707 () tuple2!22336)

(declare-fun increaseBitIndex!0 (BitStream!11460) tuple2!22336)

(assert (=> b!260591 (= lt!402705 (increaseBitIndex!0 (_2!12104 lt!402707)))))

(declare-fun arrayRangesEq!936 (array!14336 array!14336 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260591 (arrayRangesEq!936 (buf!6791 thiss!914) (array!14337 (store (arr!7256 (buf!6791 thiss!914)) (currentByte!12494 (_2!12104 lt!402707)) (select (arr!7256 (buf!6791 (_2!12104 lt!402707))) (currentByte!12494 (_2!12104 lt!402707)))) (size!6269 (buf!6791 thiss!914))) #b00000000000000000000000000000000 (currentByte!12494 (_2!12104 lt!402707)))))

(declare-fun lt!402706 () Unit!18523)

(declare-fun arrayUpdatedAtPrefixLemma!452 (array!14336 (_ BitVec 32) (_ BitVec 8)) Unit!18523)

(assert (=> b!260591 (= lt!402706 (arrayUpdatedAtPrefixLemma!452 (buf!6791 thiss!914) (currentByte!12494 (_2!12104 lt!402707)) (select (arr!7256 (buf!6791 (_2!12104 lt!402707))) (currentByte!12494 (_2!12104 lt!402707)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18525 () Unit!18523)

(declare-fun Unit!18526 () Unit!18523)

(assert (=> b!260591 (= lt!402707 (ite b!187 (tuple2!22337 Unit!18525 (BitStream!11461 (array!14337 (store (arr!7256 (buf!6791 thiss!914)) (currentByte!12494 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7256 (buf!6791 thiss!914)) (currentByte!12494 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12489 thiss!914)))))) (size!6269 (buf!6791 thiss!914))) (currentByte!12494 thiss!914) (currentBit!12489 thiss!914))) (tuple2!22337 Unit!18526 (BitStream!11461 (array!14337 (store (arr!7256 (buf!6791 thiss!914)) (currentByte!12494 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7256 (buf!6791 thiss!914)) (currentByte!12494 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12489 thiss!914))))))) (size!6269 (buf!6791 thiss!914))) (currentByte!12494 thiss!914) (currentBit!12489 thiss!914)))))))

(declare-fun b!260592 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260592 (= e!181086 (invariant!0 (currentBit!12489 (_2!12104 lt!402705)) (currentByte!12494 (_2!12104 lt!402705)) (size!6269 (buf!6791 (_2!12104 lt!402705)))))))

(declare-fun b!260593 () Bool)

(declare-fun array_inv!6010 (array!14336) Bool)

(assert (=> b!260593 (= e!181087 (array_inv!6010 (buf!6791 thiss!914)))))

(assert (= (and start!56304 res!218139) b!260591))

(assert (= (and b!260591 (not res!218140)) b!260592))

(assert (= start!56304 b!260593))

(declare-fun m!389987 () Bool)

(assert (=> start!56304 m!389987))

(declare-fun m!389989 () Bool)

(assert (=> start!56304 m!389989))

(declare-fun m!389991 () Bool)

(assert (=> b!260591 m!389991))

(declare-fun m!389993 () Bool)

(assert (=> b!260591 m!389993))

(declare-fun m!389995 () Bool)

(assert (=> b!260591 m!389995))

(declare-fun m!389997 () Bool)

(assert (=> b!260591 m!389997))

(declare-fun m!389999 () Bool)

(assert (=> b!260591 m!389999))

(declare-fun m!390001 () Bool)

(assert (=> b!260591 m!390001))

(declare-fun m!390003 () Bool)

(assert (=> b!260591 m!390003))

(declare-fun m!390005 () Bool)

(assert (=> b!260591 m!390005))

(assert (=> b!260591 m!390005))

(declare-fun m!390007 () Bool)

(assert (=> b!260591 m!390007))

(declare-fun m!390009 () Bool)

(assert (=> b!260592 m!390009))

(declare-fun m!390011 () Bool)

(assert (=> b!260593 m!390011))

(check-sat (not b!260591) (not b!260593) (not b!260592) (not start!56304))
(check-sat)
(get-model)

(declare-fun d!87526 () Bool)

(declare-fun e!181126 () Bool)

(assert (=> d!87526 e!181126))

(declare-fun res!218181 () Bool)

(assert (=> d!87526 (=> (not res!218181) (not e!181126))))

(declare-fun lt!402765 () (_ BitVec 64))

(declare-fun lt!402764 () tuple2!22336)

(declare-fun lt!402767 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!87526 (= res!218181 (= (bvadd lt!402765 lt!402767) (bitIndex!0 (size!6269 (buf!6791 (_2!12104 lt!402764))) (currentByte!12494 (_2!12104 lt!402764)) (currentBit!12489 (_2!12104 lt!402764)))))))

(assert (=> d!87526 (or (not (= (bvand lt!402765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402767 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402765 lt!402767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87526 (= lt!402767 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87526 (= lt!402765 (bitIndex!0 (size!6269 (buf!6791 (_2!12104 lt!402707))) (currentByte!12494 (_2!12104 lt!402707)) (currentBit!12489 (_2!12104 lt!402707))))))

(declare-fun Unit!18535 () Unit!18523)

(declare-fun Unit!18536 () Unit!18523)

(assert (=> d!87526 (= lt!402764 (ite (bvslt (currentBit!12489 (_2!12104 lt!402707)) #b00000000000000000000000000000111) (tuple2!22337 Unit!18535 (BitStream!11461 (buf!6791 (_2!12104 lt!402707)) (currentByte!12494 (_2!12104 lt!402707)) (bvadd (currentBit!12489 (_2!12104 lt!402707)) #b00000000000000000000000000000001))) (tuple2!22337 Unit!18536 (BitStream!11461 (buf!6791 (_2!12104 lt!402707)) (bvadd (currentByte!12494 (_2!12104 lt!402707)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87526 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6269 (buf!6791 (_2!12104 lt!402707)))) ((_ sign_extend 32) (currentByte!12494 (_2!12104 lt!402707))) ((_ sign_extend 32) (currentBit!12489 (_2!12104 lt!402707)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87526 (= (increaseBitIndex!0 (_2!12104 lt!402707)) lt!402764)))

(declare-fun b!260637 () Bool)

(declare-fun res!218182 () Bool)

(assert (=> b!260637 (=> (not res!218182) (not e!181126))))

(declare-fun lt!402763 () (_ BitVec 64))

(declare-fun lt!402766 () (_ BitVec 64))

(assert (=> b!260637 (= res!218182 (= (bvsub lt!402763 lt!402766) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!260637 (or (= (bvand lt!402763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402766 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402763 lt!402766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260637 (= lt!402766 (remainingBits!0 ((_ sign_extend 32) (size!6269 (buf!6791 (_2!12104 lt!402764)))) ((_ sign_extend 32) (currentByte!12494 (_2!12104 lt!402764))) ((_ sign_extend 32) (currentBit!12489 (_2!12104 lt!402764)))))))

(assert (=> b!260637 (= lt!402763 (remainingBits!0 ((_ sign_extend 32) (size!6269 (buf!6791 (_2!12104 lt!402707)))) ((_ sign_extend 32) (currentByte!12494 (_2!12104 lt!402707))) ((_ sign_extend 32) (currentBit!12489 (_2!12104 lt!402707)))))))

(declare-fun b!260638 () Bool)

(assert (=> b!260638 (= e!181126 (= (size!6269 (buf!6791 (_2!12104 lt!402707))) (size!6269 (buf!6791 (_2!12104 lt!402764)))))))

(assert (= (and d!87526 res!218181) b!260637))

(assert (= (and b!260637 res!218182) b!260638))

(declare-fun m!390075 () Bool)

(assert (=> d!87526 m!390075))

(declare-fun m!390077 () Bool)

(assert (=> d!87526 m!390077))

(declare-fun m!390079 () Bool)

(assert (=> d!87526 m!390079))

(declare-fun m!390081 () Bool)

(assert (=> b!260637 m!390081))

(assert (=> b!260637 m!390079))

(assert (=> b!260591 d!87526))

(declare-fun d!87548 () Bool)

(declare-fun res!218187 () Bool)

(declare-fun e!181131 () Bool)

(assert (=> d!87548 (=> res!218187 e!181131)))

(assert (=> d!87548 (= res!218187 (= #b00000000000000000000000000000000 (currentByte!12494 (_2!12104 lt!402707))))))

(assert (=> d!87548 (= (arrayRangesEq!936 (buf!6791 thiss!914) (array!14337 (store (arr!7256 (buf!6791 thiss!914)) (currentByte!12494 (_2!12104 lt!402707)) (select (arr!7256 (buf!6791 (_2!12104 lt!402707))) (currentByte!12494 (_2!12104 lt!402707)))) (size!6269 (buf!6791 thiss!914))) #b00000000000000000000000000000000 (currentByte!12494 (_2!12104 lt!402707))) e!181131)))

(declare-fun b!260643 () Bool)

(declare-fun e!181132 () Bool)

(assert (=> b!260643 (= e!181131 e!181132)))

(declare-fun res!218188 () Bool)

(assert (=> b!260643 (=> (not res!218188) (not e!181132))))

(assert (=> b!260643 (= res!218188 (= (select (arr!7256 (buf!6791 thiss!914)) #b00000000000000000000000000000000) (select (arr!7256 (array!14337 (store (arr!7256 (buf!6791 thiss!914)) (currentByte!12494 (_2!12104 lt!402707)) (select (arr!7256 (buf!6791 (_2!12104 lt!402707))) (currentByte!12494 (_2!12104 lt!402707)))) (size!6269 (buf!6791 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260644 () Bool)

(assert (=> b!260644 (= e!181132 (arrayRangesEq!936 (buf!6791 thiss!914) (array!14337 (store (arr!7256 (buf!6791 thiss!914)) (currentByte!12494 (_2!12104 lt!402707)) (select (arr!7256 (buf!6791 (_2!12104 lt!402707))) (currentByte!12494 (_2!12104 lt!402707)))) (size!6269 (buf!6791 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12494 (_2!12104 lt!402707))))))

(assert (= (and d!87548 (not res!218187)) b!260643))

(assert (= (and b!260643 res!218188) b!260644))

(declare-fun m!390087 () Bool)

(assert (=> b!260643 m!390087))

(declare-fun m!390089 () Bool)

(assert (=> b!260643 m!390089))

(declare-fun m!390091 () Bool)

(assert (=> b!260644 m!390091))

(assert (=> b!260591 d!87548))

(declare-fun d!87552 () Bool)

(declare-fun e!181135 () Bool)

(assert (=> d!87552 e!181135))

(declare-fun res!218191 () Bool)

(assert (=> d!87552 (=> (not res!218191) (not e!181135))))

(assert (=> d!87552 (= res!218191 (and (bvsge (currentByte!12494 (_2!12104 lt!402707)) #b00000000000000000000000000000000) (bvslt (currentByte!12494 (_2!12104 lt!402707)) (size!6269 (buf!6791 thiss!914)))))))

(declare-fun lt!402770 () Unit!18523)

(declare-fun choose!347 (array!14336 (_ BitVec 32) (_ BitVec 8)) Unit!18523)

(assert (=> d!87552 (= lt!402770 (choose!347 (buf!6791 thiss!914) (currentByte!12494 (_2!12104 lt!402707)) (select (arr!7256 (buf!6791 (_2!12104 lt!402707))) (currentByte!12494 (_2!12104 lt!402707)))))))

(assert (=> d!87552 (and (bvsle #b00000000000000000000000000000000 (currentByte!12494 (_2!12104 lt!402707))) (bvslt (currentByte!12494 (_2!12104 lt!402707)) (size!6269 (buf!6791 thiss!914))))))

(assert (=> d!87552 (= (arrayUpdatedAtPrefixLemma!452 (buf!6791 thiss!914) (currentByte!12494 (_2!12104 lt!402707)) (select (arr!7256 (buf!6791 (_2!12104 lt!402707))) (currentByte!12494 (_2!12104 lt!402707)))) lt!402770)))

(declare-fun b!260647 () Bool)

(assert (=> b!260647 (= e!181135 (arrayRangesEq!936 (buf!6791 thiss!914) (array!14337 (store (arr!7256 (buf!6791 thiss!914)) (currentByte!12494 (_2!12104 lt!402707)) (select (arr!7256 (buf!6791 (_2!12104 lt!402707))) (currentByte!12494 (_2!12104 lt!402707)))) (size!6269 (buf!6791 thiss!914))) #b00000000000000000000000000000000 (currentByte!12494 (_2!12104 lt!402707))))))

(assert (= (and d!87552 res!218191) b!260647))

(assert (=> d!87552 m!390005))

(declare-fun m!390093 () Bool)

(assert (=> d!87552 m!390093))

(assert (=> b!260647 m!389999))

(assert (=> b!260647 m!389995))

(assert (=> b!260591 d!87552))

(declare-fun d!87554 () Bool)

(assert (=> d!87554 (= (array_inv!6010 (buf!6791 thiss!914)) (bvsge (size!6269 (buf!6791 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!260593 d!87554))

(declare-fun d!87556 () Bool)

(assert (=> d!87556 (= (invariant!0 (currentBit!12489 (_2!12104 lt!402705)) (currentByte!12494 (_2!12104 lt!402705)) (size!6269 (buf!6791 (_2!12104 lt!402705)))) (and (bvsge (currentBit!12489 (_2!12104 lt!402705)) #b00000000000000000000000000000000) (bvslt (currentBit!12489 (_2!12104 lt!402705)) #b00000000000000000000000000001000) (bvsge (currentByte!12494 (_2!12104 lt!402705)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12494 (_2!12104 lt!402705)) (size!6269 (buf!6791 (_2!12104 lt!402705)))) (and (= (currentBit!12489 (_2!12104 lt!402705)) #b00000000000000000000000000000000) (= (currentByte!12494 (_2!12104 lt!402705)) (size!6269 (buf!6791 (_2!12104 lt!402705))))))))))

(assert (=> b!260592 d!87556))

(declare-fun d!87558 () Bool)

(assert (=> d!87558 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6269 (buf!6791 thiss!914))) ((_ sign_extend 32) (currentByte!12494 thiss!914)) ((_ sign_extend 32) (currentBit!12489 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6269 (buf!6791 thiss!914))) ((_ sign_extend 32) (currentByte!12494 thiss!914)) ((_ sign_extend 32) (currentBit!12489 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22191 () Bool)

(assert (= bs!22191 d!87558))

(declare-fun m!390095 () Bool)

(assert (=> bs!22191 m!390095))

(assert (=> start!56304 d!87558))

(declare-fun d!87560 () Bool)

(assert (=> d!87560 (= (inv!12 thiss!914) (invariant!0 (currentBit!12489 thiss!914) (currentByte!12494 thiss!914) (size!6269 (buf!6791 thiss!914))))))

(declare-fun bs!22192 () Bool)

(assert (= bs!22192 d!87560))

(declare-fun m!390097 () Bool)

(assert (=> bs!22192 m!390097))

(assert (=> start!56304 d!87560))

(check-sat (not b!260637) (not d!87526) (not d!87558) (not d!87552) (not b!260647) (not b!260644) (not d!87560))
(check-sat)
