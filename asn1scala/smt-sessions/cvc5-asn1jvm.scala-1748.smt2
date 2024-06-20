; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48014 () Bool)

(assert start!48014)

(declare-fun b!228240 () Bool)

(declare-fun res!191459 () Bool)

(declare-fun e!156374 () Bool)

(assert (=> b!228240 (=> (not res!191459) (not e!156374))))

(declare-datatypes ((array!11510 0))(
  ( (array!11511 (arr!6034 (Array (_ BitVec 32) (_ BitVec 8))) (size!5050 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9196 0))(
  ( (BitStream!9197 (buf!5591 array!11510) (currentByte!10447 (_ BitVec 32)) (currentBit!10442 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9196)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228240 (= res!191459 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5050 (buf!5591 thiss!1870))) ((_ sign_extend 32) (currentByte!10447 thiss!1870)) ((_ sign_extend 32) (currentBit!10442 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228242 () Bool)

(declare-datatypes ((Unit!17140 0))(
  ( (Unit!17141) )
))
(declare-datatypes ((tuple3!1482 0))(
  ( (tuple3!1483 (_1!10712 Unit!17140) (_2!10712 BitStream!9196) (_3!883 array!11510)) )
))
(declare-fun lt!366108 () tuple3!1482)

(declare-datatypes ((tuple2!19658 0))(
  ( (tuple2!19659 (_1!10713 BitStream!9196) (_2!10713 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9196) tuple2!19658)

(assert (=> b!228242 (= e!156374 (not (= (select (arr!6034 (_3!883 lt!366108)) i!761) (_2!10713 (readBytePure!0 thiss!1870)))))))

(declare-datatypes ((tuple2!19660 0))(
  ( (tuple2!19661 (_1!10714 (_ BitVec 8)) (_2!10714 BitStream!9196)) )
))
(declare-fun lt!366111 () tuple2!19660)

(assert (=> b!228242 (and (= (_1!10714 lt!366111) (select (arr!6034 (_3!883 lt!366108)) i!761)) (= (select (arr!6034 (_3!883 lt!366108)) i!761) (_1!10714 lt!366111)))))

(declare-fun lt!366110 () Unit!17140)

(declare-fun lt!366106 () array!11510)

(declare-fun arrayRangesEqImpliesEq!142 (array!11510 array!11510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17140)

(assert (=> b!228242 (= lt!366110 (arrayRangesEqImpliesEq!142 lt!366106 (_3!883 lt!366108) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11510)

(declare-fun arrayRangesEq!886 (array!11510 array!11510 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228242 (arrayRangesEq!886 arr!308 (_3!883 lt!366108) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366104 () Unit!17140)

(declare-fun arrayRangesEqTransitive!309 (array!11510 array!11510 array!11510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17140)

(assert (=> b!228242 (= lt!366104 (arrayRangesEqTransitive!309 arr!308 lt!366106 (_3!883 lt!366108) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!228242 (arrayRangesEq!886 arr!308 lt!366106 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366107 () Unit!17140)

(declare-fun arrayUpdatedAtPrefixLemma!445 (array!11510 (_ BitVec 32) (_ BitVec 8)) Unit!17140)

(assert (=> b!228242 (= lt!366107 (arrayUpdatedAtPrefixLemma!445 arr!308 i!761 (_1!10714 lt!366111)))))

(declare-fun lt!366105 () (_ BitVec 32))

(declare-fun lt!366109 () (_ BitVec 64))

(declare-fun lt!366112 () (_ BitVec 64))

(declare-fun lt!366113 () (_ BitVec 64))

(assert (=> b!228242 (and (= (bvadd lt!366112 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!366105))) lt!366113) (= (bvadd lt!366109 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!366113) (= (buf!5591 thiss!1870) (buf!5591 (_2!10712 lt!366108))) (= (size!5050 arr!308) (size!5050 (_3!883 lt!366108))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228242 (= lt!366113 (bitIndex!0 (size!5050 (buf!5591 (_2!10712 lt!366108))) (currentByte!10447 (_2!10712 lt!366108)) (currentBit!10442 (_2!10712 lt!366108))))))

(assert (=> b!228242 (= lt!366112 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!366109))))

(assert (=> b!228242 (= lt!366112 (bitIndex!0 (size!5050 (buf!5591 (_2!10714 lt!366111))) (currentByte!10447 (_2!10714 lt!366111)) (currentBit!10442 (_2!10714 lt!366111))))))

(assert (=> b!228242 (= lt!366109 (bitIndex!0 (size!5050 (buf!5591 thiss!1870)) (currentByte!10447 thiss!1870) (currentBit!10442 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9196 array!11510 (_ BitVec 32) (_ BitVec 32)) tuple3!1482)

(assert (=> b!228242 (= lt!366108 (readByteArrayLoop!0 (_2!10714 lt!366111) lt!366106 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!228242 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5050 (buf!5591 (_2!10714 lt!366111)))) ((_ sign_extend 32) (currentByte!10447 (_2!10714 lt!366111))) ((_ sign_extend 32) (currentBit!10442 (_2!10714 lt!366111))) lt!366105)))

(assert (=> b!228242 (= lt!366105 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!366114 () Unit!17140)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9196 BitStream!9196 (_ BitVec 64) (_ BitVec 32)) Unit!17140)

(assert (=> b!228242 (= lt!366114 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10714 lt!366111) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!228242 (= lt!366106 (array!11511 (store (arr!6034 arr!308) i!761 (_1!10714 lt!366111)) (size!5050 arr!308)))))

(declare-fun readByte!0 (BitStream!9196) tuple2!19660)

(assert (=> b!228242 (= lt!366111 (readByte!0 thiss!1870))))

(declare-fun b!228241 () Bool)

(declare-fun res!191461 () Bool)

(assert (=> b!228241 (=> (not res!191461) (not e!156374))))

(assert (=> b!228241 (= res!191461 (bvslt i!761 to!496))))

(declare-fun res!191460 () Bool)

(assert (=> start!48014 (=> (not res!191460) (not e!156374))))

(assert (=> start!48014 (= res!191460 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5050 arr!308))))))

(assert (=> start!48014 e!156374))

(assert (=> start!48014 true))

(declare-fun array_inv!4791 (array!11510) Bool)

(assert (=> start!48014 (array_inv!4791 arr!308)))

(declare-fun e!156375 () Bool)

(declare-fun inv!12 (BitStream!9196) Bool)

(assert (=> start!48014 (and (inv!12 thiss!1870) e!156375)))

(declare-fun b!228243 () Bool)

(assert (=> b!228243 (= e!156375 (array_inv!4791 (buf!5591 thiss!1870)))))

(assert (= (and start!48014 res!191460) b!228240))

(assert (= (and b!228240 res!191459) b!228241))

(assert (= (and b!228241 res!191461) b!228242))

(assert (= start!48014 b!228243))

(declare-fun m!351721 () Bool)

(assert (=> b!228240 m!351721))

(declare-fun m!351723 () Bool)

(assert (=> b!228242 m!351723))

(declare-fun m!351725 () Bool)

(assert (=> b!228242 m!351725))

(declare-fun m!351727 () Bool)

(assert (=> b!228242 m!351727))

(declare-fun m!351729 () Bool)

(assert (=> b!228242 m!351729))

(declare-fun m!351731 () Bool)

(assert (=> b!228242 m!351731))

(declare-fun m!351733 () Bool)

(assert (=> b!228242 m!351733))

(declare-fun m!351735 () Bool)

(assert (=> b!228242 m!351735))

(declare-fun m!351737 () Bool)

(assert (=> b!228242 m!351737))

(declare-fun m!351739 () Bool)

(assert (=> b!228242 m!351739))

(declare-fun m!351741 () Bool)

(assert (=> b!228242 m!351741))

(declare-fun m!351743 () Bool)

(assert (=> b!228242 m!351743))

(declare-fun m!351745 () Bool)

(assert (=> b!228242 m!351745))

(declare-fun m!351747 () Bool)

(assert (=> b!228242 m!351747))

(declare-fun m!351749 () Bool)

(assert (=> b!228242 m!351749))

(declare-fun m!351751 () Bool)

(assert (=> b!228242 m!351751))

(declare-fun m!351753 () Bool)

(assert (=> start!48014 m!351753))

(declare-fun m!351755 () Bool)

(assert (=> start!48014 m!351755))

(declare-fun m!351757 () Bool)

(assert (=> b!228243 m!351757))

(push 1)

(assert (not b!228243))

(assert (not b!228240))

(assert (not start!48014))

(assert (not b!228242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77441 () Bool)

(assert (=> d!77441 (= (array_inv!4791 (buf!5591 thiss!1870)) (bvsge (size!5050 (buf!5591 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!228243 d!77441))

(declare-fun d!77443 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77443 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5050 (buf!5591 thiss!1870))) ((_ sign_extend 32) (currentByte!10447 thiss!1870)) ((_ sign_extend 32) (currentBit!10442 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5050 (buf!5591 thiss!1870))) ((_ sign_extend 32) (currentByte!10447 thiss!1870)) ((_ sign_extend 32) (currentBit!10442 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18939 () Bool)

(assert (= bs!18939 d!77443))

(declare-fun m!351835 () Bool)

(assert (=> bs!18939 m!351835))

(assert (=> b!228240 d!77443))

(declare-fun d!77445 () Bool)

(assert (=> d!77445 (= (array_inv!4791 arr!308) (bvsge (size!5050 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!48014 d!77445))

(declare-fun d!77447 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77447 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10442 thiss!1870) (currentByte!10447 thiss!1870) (size!5050 (buf!5591 thiss!1870))))))

(declare-fun bs!18940 () Bool)

(assert (= bs!18940 d!77447))

(declare-fun m!351837 () Bool)

(assert (=> bs!18940 m!351837))

(assert (=> start!48014 d!77447))

(declare-fun d!77449 () Bool)

(declare-fun res!191484 () Bool)

(declare-fun e!156405 () Bool)

(assert (=> d!77449 (=> res!191484 e!156405)))

(assert (=> d!77449 (= res!191484 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77449 (= (arrayRangesEq!886 arr!308 (_3!883 lt!366108) #b00000000000000000000000000000000 i!761) e!156405)))

(declare-fun b!228272 () Bool)

(declare-fun e!156406 () Bool)

(assert (=> b!228272 (= e!156405 e!156406)))

(declare-fun res!191485 () Bool)

(assert (=> b!228272 (=> (not res!191485) (not e!156406))))

(assert (=> b!228272 (= res!191485 (= (select (arr!6034 arr!308) #b00000000000000000000000000000000) (select (arr!6034 (_3!883 lt!366108)) #b00000000000000000000000000000000)))))

(declare-fun b!228273 () Bool)

(assert (=> b!228273 (= e!156406 (arrayRangesEq!886 arr!308 (_3!883 lt!366108) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77449 (not res!191484)) b!228272))

(assert (= (and b!228272 res!191485) b!228273))

(declare-fun m!351839 () Bool)

(assert (=> b!228272 m!351839))

(declare-fun m!351841 () Bool)

(assert (=> b!228272 m!351841))

(declare-fun m!351843 () Bool)

(assert (=> b!228273 m!351843))

(assert (=> b!228242 d!77449))

(declare-fun d!77451 () Bool)

(declare-fun lt!366217 () (_ BitVec 8))

(declare-fun lt!366219 () (_ BitVec 8))

(assert (=> d!77451 (= lt!366217 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6034 (buf!5591 thiss!1870)) (currentByte!10447 thiss!1870))) ((_ sign_extend 24) lt!366219))))))

(assert (=> d!77451 (= lt!366219 ((_ extract 7 0) (currentBit!10442 thiss!1870)))))

(declare-fun e!156415 () Bool)

(assert (=> d!77451 e!156415))

(declare-fun res!191499 () Bool)

(assert (=> d!77451 (=> (not res!191499) (not e!156415))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77451 (= res!191499 (validate_offset_bits!1 ((_ sign_extend 32) (size!5050 (buf!5591 thiss!1870))) ((_ sign_extend 32) (currentByte!10447 thiss!1870)) ((_ sign_extend 32) (currentBit!10442 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19670 0))(
  ( (tuple2!19671 (_1!10721 Unit!17140) (_2!10721 (_ BitVec 8))) )
))
(declare-fun Unit!17146 () Unit!17140)

(declare-fun Unit!17147 () Unit!17140)

(assert (=> d!77451 (= (readByte!0 thiss!1870) (tuple2!19661 (_2!10721 (ite (bvsgt ((_ sign_extend 24) lt!366219) #b00000000000000000000000000000000) (tuple2!19671 Unit!17146 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!366217) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6034 (buf!5591 thiss!1870)) (bvadd (currentByte!10447 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!366219)))))))) (tuple2!19671 Unit!17147 lt!366217))) (BitStream!9197 (buf!5591 thiss!1870) (bvadd (currentByte!10447 thiss!1870) #b00000000000000000000000000000001) (currentBit!10442 thiss!1870))))))

(declare-fun b!228284 () Bool)

(declare-fun e!156414 () Bool)

(assert (=> b!228284 (= e!156415 e!156414)))

(declare-fun res!191498 () Bool)

(assert (=> b!228284 (=> (not res!191498) (not e!156414))))

(declare-fun lt!366218 () tuple2!19660)

(assert (=> b!228284 (= res!191498 (= (buf!5591 (_2!10714 lt!366218)) (buf!5591 thiss!1870)))))

(declare-fun lt!366215 () (_ BitVec 8))

(declare-fun lt!366216 () (_ BitVec 8))

(declare-fun Unit!17149 () Unit!17140)

(declare-fun Unit!17150 () Unit!17140)

(assert (=> b!228284 (= lt!366218 (tuple2!19661 (_2!10721 (ite (bvsgt ((_ sign_extend 24) lt!366215) #b00000000000000000000000000000000) (tuple2!19671 Unit!17149 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!366216) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6034 (buf!5591 thiss!1870)) (bvadd (currentByte!10447 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!366215)))))))) (tuple2!19671 Unit!17150 lt!366216))) (BitStream!9197 (buf!5591 thiss!1870) (bvadd (currentByte!10447 thiss!1870) #b00000000000000000000000000000001) (currentBit!10442 thiss!1870))))))

(assert (=> b!228284 (= lt!366216 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6034 (buf!5591 thiss!1870)) (currentByte!10447 thiss!1870))) ((_ sign_extend 24) lt!366215))))))

(assert (=> b!228284 (= lt!366215 ((_ extract 7 0) (currentBit!10442 thiss!1870)))))

(declare-fun lt!366214 () (_ BitVec 64))

(declare-fun lt!366213 () (_ BitVec 64))

(declare-fun b!228285 () Bool)

(assert (=> b!228285 (= e!156414 (= (bitIndex!0 (size!5050 (buf!5591 (_2!10714 lt!366218))) (currentByte!10447 (_2!10714 lt!366218)) (currentBit!10442 (_2!10714 lt!366218))) (bvadd lt!366213 lt!366214)))))

(assert (=> b!228285 (or (not (= (bvand lt!366213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366214 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!366213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!366213 lt!366214) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!228285 (= lt!366214 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!228285 (= lt!366213 (bitIndex!0 (size!5050 (buf!5591 thiss!1870)) (currentByte!10447 thiss!1870) (currentBit!10442 thiss!1870)))))

(assert (= (and d!77451 res!191499) b!228284))

(assert (= (and b!228284 res!191498) b!228285))

(declare-fun m!351853 () Bool)

(assert (=> d!77451 m!351853))

(declare-fun m!351855 () Bool)

(assert (=> d!77451 m!351855))

(declare-fun m!351857 () Bool)

(assert (=> d!77451 m!351857))

(assert (=> b!228284 m!351857))

(assert (=> b!228284 m!351853))

(declare-fun m!351859 () Bool)

(assert (=> b!228285 m!351859))

(assert (=> b!228285 m!351743))

(assert (=> b!228242 d!77451))

(declare-fun d!77463 () Bool)

(declare-fun e!156418 () Bool)

(assert (=> d!77463 e!156418))

(declare-fun res!191502 () Bool)

(assert (=> d!77463 (=> (not res!191502) (not e!156418))))

(assert (=> d!77463 (= res!191502 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5050 arr!308))))))

(declare-fun lt!366222 () Unit!17140)

(declare-fun choose!333 (array!11510 (_ BitVec 32) (_ BitVec 8)) Unit!17140)

(assert (=> d!77463 (= lt!366222 (choose!333 arr!308 i!761 (_1!10714 lt!366111)))))

(assert (=> d!77463 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!5050 arr!308)))))

(assert (=> d!77463 (= (arrayUpdatedAtPrefixLemma!445 arr!308 i!761 (_1!10714 lt!366111)) lt!366222)))

(declare-fun b!228288 () Bool)

(assert (=> b!228288 (= e!156418 (arrayRangesEq!886 arr!308 (array!11511 (store (arr!6034 arr!308) i!761 (_1!10714 lt!366111)) (size!5050 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!77463 res!191502) b!228288))

(declare-fun m!351861 () Bool)

(assert (=> d!77463 m!351861))

(assert (=> b!228288 m!351733))

(declare-fun m!351863 () Bool)

(assert (=> b!228288 m!351863))

(assert (=> b!228242 d!77463))

(declare-fun d!77465 () Bool)

(assert (=> d!77465 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5050 lt!366106)) (bvslt i!761 (size!5050 (_3!883 lt!366108))) (= (select (arr!6034 lt!366106) i!761) (select (arr!6034 (_3!883 lt!366108)) i!761)))))

(declare-fun lt!366225 () Unit!17140)

(declare-fun choose!334 (array!11510 array!11510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17140)

(assert (=> d!77465 (= lt!366225 (choose!334 lt!366106 (_3!883 lt!366108) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77465 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77465 (= (arrayRangesEqImpliesEq!142 lt!366106 (_3!883 lt!366108) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!366225)))

(declare-fun bs!18943 () Bool)

(assert (= bs!18943 d!77465))

(declare-fun m!351865 () Bool)

(assert (=> bs!18943 m!351865))

(assert (=> bs!18943 m!351731))

(declare-fun m!351867 () Bool)

(assert (=> bs!18943 m!351867))

(assert (=> b!228242 d!77465))

(declare-fun d!77467 () Bool)

(declare-fun e!156425 () Bool)

(assert (=> d!77467 e!156425))

(declare-fun res!191512 () Bool)

(assert (=> d!77467 (=> (not res!191512) (not e!156425))))

(declare-fun lt!366256 () (_ BitVec 64))

(declare-fun lt!366253 () (_ BitVec 64))

(declare-fun lt!366254 () (_ BitVec 64))

(assert (=> d!77467 (= res!191512 (= lt!366253 (bvsub lt!366256 lt!366254)))))

(assert (=> d!77467 (or (= (bvand lt!366256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366254 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!366256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!366256 lt!366254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77467 (= lt!366254 (remainingBits!0 ((_ sign_extend 32) (size!5050 (buf!5591 thiss!1870))) ((_ sign_extend 32) (currentByte!10447 thiss!1870)) ((_ sign_extend 32) (currentBit!10442 thiss!1870))))))

(declare-fun lt!366252 () (_ BitVec 64))

(declare-fun lt!366255 () (_ BitVec 64))

(assert (=> d!77467 (= lt!366256 (bvmul lt!366252 lt!366255))))

(assert (=> d!77467 (or (= lt!366252 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!366255 (bvsdiv (bvmul lt!366252 lt!366255) lt!366252)))))

(assert (=> d!77467 (= lt!366255 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77467 (= lt!366252 ((_ sign_extend 32) (size!5050 (buf!5591 thiss!1870))))))

(assert (=> d!77467 (= lt!366253 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10447 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10442 thiss!1870))))))

(assert (=> d!77467 (invariant!0 (currentBit!10442 thiss!1870) (currentByte!10447 thiss!1870) (size!5050 (buf!5591 thiss!1870)))))

(assert (=> d!77467 (= (bitIndex!0 (size!5050 (buf!5591 thiss!1870)) (currentByte!10447 thiss!1870) (currentBit!10442 thiss!1870)) lt!366253)))

(declare-fun b!228297 () Bool)

(declare-fun res!191511 () Bool)

(assert (=> b!228297 (=> (not res!191511) (not e!156425))))

(assert (=> b!228297 (= res!191511 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!366253))))

(declare-fun b!228298 () Bool)

(declare-fun lt!366257 () (_ BitVec 64))

(assert (=> b!228298 (= e!156425 (bvsle lt!366253 (bvmul lt!366257 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228298 (or (= lt!366257 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!366257 #b0000000000000000000000000000000000000000000000000000000000001000) lt!366257)))))

(assert (=> b!228298 (= lt!366257 ((_ sign_extend 32) (size!5050 (buf!5591 thiss!1870))))))

(assert (= (and d!77467 res!191512) b!228297))

(assert (= (and b!228297 res!191511) b!228298))

(assert (=> d!77467 m!351835))

(assert (=> d!77467 m!351837))

(assert (=> b!228242 d!77467))

(declare-fun d!77469 () Bool)

(assert (=> d!77469 (arrayRangesEq!886 arr!308 (_3!883 lt!366108) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366273 () Unit!17140)

(declare-fun choose!335 (array!11510 array!11510 array!11510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17140)

(assert (=> d!77469 (= lt!366273 (choose!335 arr!308 lt!366106 (_3!883 lt!366108) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77469 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77469 (= (arrayRangesEqTransitive!309 arr!308 lt!366106 (_3!883 lt!366108) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!366273)))

(declare-fun bs!18944 () Bool)

(assert (= bs!18944 d!77469))

(assert (=> bs!18944 m!351739))

(declare-fun m!351881 () Bool)

(assert (=> bs!18944 m!351881))

(assert (=> b!228242 d!77469))

(declare-fun d!77475 () Bool)

(declare-fun e!156438 () Bool)

(assert (=> d!77475 e!156438))

(declare-fun res!191527 () Bool)

(assert (=> d!77475 (=> (not res!191527) (not e!156438))))

(assert (=> d!77475 (= res!191527 (and (or (let ((rhs!4024 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!4024 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!4024) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77478 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77478 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77478 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!4023 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!4023 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!4023) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!366291 () Unit!17140)

(declare-fun choose!57 (BitStream!9196 BitStream!9196 (_ BitVec 64) (_ BitVec 32)) Unit!17140)

(assert (=> d!77475 (= lt!366291 (choose!57 thiss!1870 (_2!10714 lt!366111) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77475 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10714 lt!366111) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!366291)))

(declare-fun b!228313 () Bool)

(declare-fun lt!366290 () (_ BitVec 32))

(assert (=> b!228313 (= e!156438 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5050 (buf!5591 (_2!10714 lt!366111)))) ((_ sign_extend 32) (currentByte!10447 (_2!10714 lt!366111))) ((_ sign_extend 32) (currentBit!10442 (_2!10714 lt!366111))) (bvsub (bvsub to!496 i!761) lt!366290)))))

(assert (=> b!228313 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!366290 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!366290) #b10000000000000000000000000000000)))))

(declare-fun lt!366289 () (_ BitVec 64))

(assert (=> b!228313 (= lt!366290 ((_ extract 31 0) lt!366289))))

(assert (=> b!228313 (and (bvslt lt!366289 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!366289 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!228313 (= lt!366289 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77475 res!191527) b!228313))

(declare-fun m!351889 () Bool)

(assert (=> d!77475 m!351889))

(declare-fun m!351891 () Bool)

(assert (=> b!228313 m!351891))

(assert (=> b!228242 d!77475))

(declare-fun d!77485 () Bool)

(assert (=> d!77485 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5050 (buf!5591 (_2!10714 lt!366111)))) ((_ sign_extend 32) (currentByte!10447 (_2!10714 lt!366111))) ((_ sign_extend 32) (currentBit!10442 (_2!10714 lt!366111))) lt!366105) (bvsle ((_ sign_extend 32) lt!366105) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5050 (buf!5591 (_2!10714 lt!366111)))) ((_ sign_extend 32) (currentByte!10447 (_2!10714 lt!366111))) ((_ sign_extend 32) (currentBit!10442 (_2!10714 lt!366111)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18946 () Bool)

(assert (= bs!18946 d!77485))

(declare-fun m!351893 () Bool)

(assert (=> bs!18946 m!351893))

(assert (=> b!228242 d!77485))

(declare-fun d!77487 () Bool)

(declare-fun e!156439 () Bool)

(assert (=> d!77487 e!156439))

(declare-fun res!191529 () Bool)

(assert (=> d!77487 (=> (not res!191529) (not e!156439))))

(declare-fun lt!366294 () (_ BitVec 64))

(declare-fun lt!366293 () (_ BitVec 64))

(declare-fun lt!366296 () (_ BitVec 64))

(assert (=> d!77487 (= res!191529 (= lt!366293 (bvsub lt!366296 lt!366294)))))

(assert (=> d!77487 (or (= (bvand lt!366296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366294 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!366296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!366296 lt!366294) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77487 (= lt!366294 (remainingBits!0 ((_ sign_extend 32) (size!5050 (buf!5591 (_2!10712 lt!366108)))) ((_ sign_extend 32) (currentByte!10447 (_2!10712 lt!366108))) ((_ sign_extend 32) (currentBit!10442 (_2!10712 lt!366108)))))))

(declare-fun lt!366292 () (_ BitVec 64))

(declare-fun lt!366295 () (_ BitVec 64))

(assert (=> d!77487 (= lt!366296 (bvmul lt!366292 lt!366295))))

(assert (=> d!77487 (or (= lt!366292 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!366295 (bvsdiv (bvmul lt!366292 lt!366295) lt!366292)))))

(assert (=> d!77487 (= lt!366295 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77487 (= lt!366292 ((_ sign_extend 32) (size!5050 (buf!5591 (_2!10712 lt!366108)))))))

(assert (=> d!77487 (= lt!366293 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10447 (_2!10712 lt!366108))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10442 (_2!10712 lt!366108)))))))

(assert (=> d!77487 (invariant!0 (currentBit!10442 (_2!10712 lt!366108)) (currentByte!10447 (_2!10712 lt!366108)) (size!5050 (buf!5591 (_2!10712 lt!366108))))))

(assert (=> d!77487 (= (bitIndex!0 (size!5050 (buf!5591 (_2!10712 lt!366108))) (currentByte!10447 (_2!10712 lt!366108)) (currentBit!10442 (_2!10712 lt!366108))) lt!366293)))

(declare-fun b!228314 () Bool)

(declare-fun res!191528 () Bool)

(assert (=> b!228314 (=> (not res!191528) (not e!156439))))

(assert (=> b!228314 (= res!191528 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!366293))))

(declare-fun b!228315 () Bool)

(declare-fun lt!366297 () (_ BitVec 64))

(assert (=> b!228315 (= e!156439 (bvsle lt!366293 (bvmul lt!366297 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228315 (or (= lt!366297 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!366297 #b0000000000000000000000000000000000000000000000000000000000001000) lt!366297)))))

(assert (=> b!228315 (= lt!366297 ((_ sign_extend 32) (size!5050 (buf!5591 (_2!10712 lt!366108)))))))

(assert (= (and d!77487 res!191529) b!228314))

(assert (= (and b!228314 res!191528) b!228315))

(declare-fun m!351895 () Bool)

(assert (=> d!77487 m!351895))

(declare-fun m!351897 () Bool)

(assert (=> d!77487 m!351897))

(assert (=> b!228242 d!77487))

(declare-fun d!77489 () Bool)

(declare-fun e!156440 () Bool)

(assert (=> d!77489 e!156440))

(declare-fun res!191531 () Bool)

(assert (=> d!77489 (=> (not res!191531) (not e!156440))))

(declare-fun lt!366300 () (_ BitVec 64))

(declare-fun lt!366299 () (_ BitVec 64))

(declare-fun lt!366302 () (_ BitVec 64))

(assert (=> d!77489 (= res!191531 (= lt!366299 (bvsub lt!366302 lt!366300)))))

(assert (=> d!77489 (or (= (bvand lt!366302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366300 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!366302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!366302 lt!366300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77489 (= lt!366300 (remainingBits!0 ((_ sign_extend 32) (size!5050 (buf!5591 (_2!10714 lt!366111)))) ((_ sign_extend 32) (currentByte!10447 (_2!10714 lt!366111))) ((_ sign_extend 32) (currentBit!10442 (_2!10714 lt!366111)))))))

(declare-fun lt!366298 () (_ BitVec 64))

(declare-fun lt!366301 () (_ BitVec 64))

(assert (=> d!77489 (= lt!366302 (bvmul lt!366298 lt!366301))))

(assert (=> d!77489 (or (= lt!366298 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!366301 (bvsdiv (bvmul lt!366298 lt!366301) lt!366298)))))

(assert (=> d!77489 (= lt!366301 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77489 (= lt!366298 ((_ sign_extend 32) (size!5050 (buf!5591 (_2!10714 lt!366111)))))))

(assert (=> d!77489 (= lt!366299 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10447 (_2!10714 lt!366111))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10442 (_2!10714 lt!366111)))))))

(assert (=> d!77489 (invariant!0 (currentBit!10442 (_2!10714 lt!366111)) (currentByte!10447 (_2!10714 lt!366111)) (size!5050 (buf!5591 (_2!10714 lt!366111))))))

(assert (=> d!77489 (= (bitIndex!0 (size!5050 (buf!5591 (_2!10714 lt!366111))) (currentByte!10447 (_2!10714 lt!366111)) (currentBit!10442 (_2!10714 lt!366111))) lt!366299)))

(declare-fun b!228316 () Bool)

(declare-fun res!191530 () Bool)

(assert (=> b!228316 (=> (not res!191530) (not e!156440))))

(assert (=> b!228316 (= res!191530 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!366299))))

(declare-fun b!228317 () Bool)

(declare-fun lt!366303 () (_ BitVec 64))

(assert (=> b!228317 (= e!156440 (bvsle lt!366299 (bvmul lt!366303 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228317 (or (= lt!366303 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!366303 #b0000000000000000000000000000000000000000000000000000000000001000) lt!366303)))))

(assert (=> b!228317 (= lt!366303 ((_ sign_extend 32) (size!5050 (buf!5591 (_2!10714 lt!366111)))))))

(assert (= (and d!77489 res!191531) b!228316))

(assert (= (and b!228316 res!191530) b!228317))

(assert (=> d!77489 m!351893))

(declare-fun m!351899 () Bool)

(assert (=> d!77489 m!351899))

(assert (=> b!228242 d!77489))

(declare-fun d!77491 () Bool)

(declare-fun lt!366312 () tuple2!19660)

(assert (=> d!77491 (= lt!366312 (readByte!0 thiss!1870))))

(assert (=> d!77491 (= (readBytePure!0 thiss!1870) (tuple2!19659 (_2!10714 lt!366312) (_1!10714 lt!366312)))))

(declare-fun bs!18947 () Bool)

(assert (= bs!18947 d!77491))

(assert (=> bs!18947 m!351725))

(assert (=> b!228242 d!77491))

(declare-fun e!156488 () Bool)

(declare-fun b!228379 () Bool)

(declare-fun lt!366640 () tuple3!1482)

(assert (=> b!228379 (= e!156488 (arrayRangesEq!886 lt!366106 (_3!883 lt!366640) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!228380 () Bool)

(declare-fun e!156487 () tuple3!1482)

(declare-fun lt!366661 () Unit!17140)

(assert (=> b!228380 (= e!156487 (tuple3!1483 lt!366661 (_2!10714 lt!366111) lt!366106))))

(declare-fun call!3925 () (_ BitVec 64))

(assert (=> b!228380 (= call!3925 call!3925)))

(declare-fun lt!366645 () Unit!17140)

(declare-fun Unit!17165 () Unit!17140)

(assert (=> b!228380 (= lt!366645 Unit!17165)))

(declare-fun lt!366642 () Unit!17140)

(declare-fun arrayRangesEqReflexiveLemma!143 (array!11510) Unit!17140)

(assert (=> b!228380 (= lt!366642 (arrayRangesEqReflexiveLemma!143 lt!366106))))

(declare-fun call!3927 () Bool)

(assert (=> b!228380 call!3927))

(declare-fun lt!366648 () Unit!17140)

(assert (=> b!228380 (= lt!366648 lt!366642)))

(declare-fun lt!366649 () array!11510)

(assert (=> b!228380 (= lt!366649 lt!366106)))

(declare-fun lt!366656 () array!11510)

(assert (=> b!228380 (= lt!366656 lt!366106)))

(declare-fun lt!366650 () (_ BitVec 32))

(assert (=> b!228380 (= lt!366650 #b00000000000000000000000000000000)))

(declare-fun lt!366635 () (_ BitVec 32))

(assert (=> b!228380 (= lt!366635 (size!5050 lt!366106))))

(declare-fun lt!366662 () (_ BitVec 32))

(assert (=> b!228380 (= lt!366662 #b00000000000000000000000000000000)))

(declare-fun lt!366638 () (_ BitVec 32))

(assert (=> b!228380 (= lt!366638 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!128 (array!11510 array!11510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17140)

(assert (=> b!228380 (= lt!366661 (arrayRangesEqSlicedLemma!128 lt!366649 lt!366656 lt!366650 lt!366635 lt!366662 lt!366638))))

(declare-fun call!3926 () Bool)

(assert (=> b!228380 call!3926))

(declare-fun b!228381 () Bool)

(declare-fun e!156486 () Bool)

(assert (=> b!228381 (= e!156486 (= (select (arr!6034 (_3!883 lt!366640)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10713 (readBytePure!0 (_2!10714 lt!366111)))))))

(assert (=> b!228381 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!5050 (_3!883 lt!366640))))))

(declare-fun d!77493 () Bool)

(assert (=> d!77493 e!156486))

(declare-fun res!191581 () Bool)

(assert (=> d!77493 (=> res!191581 e!156486)))

(assert (=> d!77493 (= res!191581 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!366652 () Bool)

(assert (=> d!77493 (= lt!366652 e!156488)))

(declare-fun res!191582 () Bool)

(assert (=> d!77493 (=> (not res!191582) (not e!156488))))

(declare-fun lt!366668 () (_ BitVec 64))

(declare-fun lt!366670 () (_ BitVec 64))

(assert (=> d!77493 (= res!191582 (= (bvadd lt!366670 lt!366668) (bitIndex!0 (size!5050 (buf!5591 (_2!10712 lt!366640))) (currentByte!10447 (_2!10712 lt!366640)) (currentBit!10442 (_2!10712 lt!366640)))))))

(assert (=> d!77493 (or (not (= (bvand lt!366670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366668 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!366670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!366670 lt!366668) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!366655 () (_ BitVec 64))

(assert (=> d!77493 (= lt!366668 (bvmul lt!366655 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77493 (or (= lt!366655 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!366655 #b0000000000000000000000000000000000000000000000000000000000001000) lt!366655)))))

(assert (=> d!77493 (= lt!366655 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77493 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77493 (= lt!366670 (bitIndex!0 (size!5050 (buf!5591 (_2!10714 lt!366111))) (currentByte!10447 (_2!10714 lt!366111)) (currentBit!10442 (_2!10714 lt!366111))))))

(assert (=> d!77493 (= lt!366640 e!156487)))

(declare-fun c!11238 () Bool)

(assert (=> d!77493 (= c!11238 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77493 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!5050 lt!366106)))))

(assert (=> d!77493 (= (readByteArrayLoop!0 (_2!10714 lt!366111) lt!366106 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!366640)))

(declare-fun b!228382 () Bool)

(declare-fun res!191580 () Bool)

(assert (=> b!228382 (=> (not res!191580) (not e!156488))))

(assert (=> b!228382 (= res!191580 (and (= (buf!5591 (_2!10714 lt!366111)) (buf!5591 (_2!10712 lt!366640))) (= (size!5050 lt!366106) (size!5050 (_3!883 lt!366640)))))))

(declare-fun b!228383 () Bool)

(declare-fun lt!366644 () Unit!17140)

(declare-fun lt!366665 () tuple3!1482)

(assert (=> b!228383 (= e!156487 (tuple3!1483 lt!366644 (_2!10712 lt!366665) (_3!883 lt!366665)))))

(declare-fun lt!366666 () tuple2!19660)

(assert (=> b!228383 (= lt!366666 (readByte!0 (_2!10714 lt!366111)))))

(declare-fun lt!366659 () array!11510)

(assert (=> b!228383 (= lt!366659 (array!11511 (store (arr!6034 lt!366106) (bvadd #b00000000000000000000000000000001 i!761) (_1!10714 lt!366666)) (size!5050 lt!366106)))))

(declare-fun lt!366647 () (_ BitVec 64))

(assert (=> b!228383 (= lt!366647 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!366664 () (_ BitVec 32))

(assert (=> b!228383 (= lt!366664 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!366658 () Unit!17140)

(assert (=> b!228383 (= lt!366658 (validateOffsetBytesFromBitIndexLemma!0 (_2!10714 lt!366111) (_2!10714 lt!366666) lt!366647 lt!366664))))

(assert (=> b!228383 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5050 (buf!5591 (_2!10714 lt!366666)))) ((_ sign_extend 32) (currentByte!10447 (_2!10714 lt!366666))) ((_ sign_extend 32) (currentBit!10442 (_2!10714 lt!366666))) (bvsub lt!366664 ((_ extract 31 0) (bvsdiv (bvadd lt!366647 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!366663 () Unit!17140)

(assert (=> b!228383 (= lt!366663 lt!366658)))

(assert (=> b!228383 (= lt!366665 (readByteArrayLoop!0 (_2!10714 lt!366666) lt!366659 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!228383 (= call!3925 (bvadd (bitIndex!0 (size!5050 (buf!5591 (_2!10714 lt!366111))) (currentByte!10447 (_2!10714 lt!366111)) (currentBit!10442 (_2!10714 lt!366111))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!366669 () Unit!17140)

(declare-fun Unit!17166 () Unit!17140)

(assert (=> b!228383 (= lt!366669 Unit!17166)))

(assert (=> b!228383 (= (bvadd call!3925 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5050 (buf!5591 (_2!10712 lt!366665))) (currentByte!10447 (_2!10712 lt!366665)) (currentBit!10442 (_2!10712 lt!366665))))))

(declare-fun lt!366660 () Unit!17140)

(declare-fun Unit!17167 () Unit!17140)

(assert (=> b!228383 (= lt!366660 Unit!17167)))

(assert (=> b!228383 (= (bvadd (bitIndex!0 (size!5050 (buf!5591 (_2!10714 lt!366111))) (currentByte!10447 (_2!10714 lt!366111)) (currentBit!10442 (_2!10714 lt!366111))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5050 (buf!5591 (_2!10712 lt!366665))) (currentByte!10447 (_2!10712 lt!366665)) (currentBit!10442 (_2!10712 lt!366665))))))

(declare-fun lt!366641 () Unit!17140)

(declare-fun Unit!17168 () Unit!17140)

(assert (=> b!228383 (= lt!366641 Unit!17168)))

(assert (=> b!228383 (and (= (buf!5591 (_2!10714 lt!366111)) (buf!5591 (_2!10712 lt!366665))) (= (size!5050 lt!366106) (size!5050 (_3!883 lt!366665))))))

(declare-fun lt!366651 () Unit!17140)

(declare-fun Unit!17169 () Unit!17140)

(assert (=> b!228383 (= lt!366651 Unit!17169)))

(declare-fun lt!366636 () Unit!17140)

(assert (=> b!228383 (= lt!366636 (arrayUpdatedAtPrefixLemma!445 lt!366106 (bvadd #b00000000000000000000000000000001 i!761) (_1!10714 lt!366666)))))

(assert (=> b!228383 call!3927))

(declare-fun lt!366646 () Unit!17140)

(assert (=> b!228383 (= lt!366646 lt!366636)))

(declare-fun lt!366654 () (_ BitVec 32))

(assert (=> b!228383 (= lt!366654 #b00000000000000000000000000000000)))

(declare-fun lt!366643 () Unit!17140)

(assert (=> b!228383 (= lt!366643 (arrayRangesEqTransitive!309 lt!366106 lt!366659 (_3!883 lt!366665) lt!366654 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!228383 call!3926))

(declare-fun lt!366657 () Unit!17140)

(assert (=> b!228383 (= lt!366657 lt!366643)))

(assert (=> b!228383 (arrayRangesEq!886 lt!366106 (_3!883 lt!366665) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!366637 () Unit!17140)

(declare-fun Unit!17170 () Unit!17140)

(assert (=> b!228383 (= lt!366637 Unit!17170)))

(declare-fun lt!366639 () Unit!17140)

(assert (=> b!228383 (= lt!366639 (arrayRangesEqImpliesEq!142 lt!366659 (_3!883 lt!366665) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!228383 (= (select (store (arr!6034 lt!366106) (bvadd #b00000000000000000000000000000001 i!761) (_1!10714 lt!366666)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!6034 (_3!883 lt!366665)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!366667 () Unit!17140)

(assert (=> b!228383 (= lt!366667 lt!366639)))

(declare-fun lt!366653 () Bool)

(assert (=> b!228383 (= lt!366653 (= (select (arr!6034 (_3!883 lt!366665)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10714 lt!366666)))))

(declare-fun Unit!17171 () Unit!17140)

(assert (=> b!228383 (= lt!366644 Unit!17171)))

(assert (=> b!228383 lt!366653))

(declare-fun bm!3922 () Bool)

(assert (=> bm!3922 (= call!3926 (arrayRangesEq!886 (ite c!11238 lt!366106 lt!366649) (ite c!11238 (_3!883 lt!366665) lt!366656) (ite c!11238 lt!366654 lt!366662) (ite c!11238 (bvadd #b00000000000000000000000000000001 i!761) lt!366638)))))

(declare-fun bm!3923 () Bool)

(assert (=> bm!3923 (= call!3927 (arrayRangesEq!886 lt!366106 (ite c!11238 (array!11511 (store (arr!6034 lt!366106) (bvadd #b00000000000000000000000000000001 i!761) (_1!10714 lt!366666)) (size!5050 lt!366106)) lt!366106) #b00000000000000000000000000000000 (ite c!11238 (bvadd #b00000000000000000000000000000001 i!761) (size!5050 lt!366106))))))

(declare-fun bm!3924 () Bool)

(assert (=> bm!3924 (= call!3925 (bitIndex!0 (ite c!11238 (size!5050 (buf!5591 (_2!10714 lt!366666))) (size!5050 (buf!5591 (_2!10714 lt!366111)))) (ite c!11238 (currentByte!10447 (_2!10714 lt!366666)) (currentByte!10447 (_2!10714 lt!366111))) (ite c!11238 (currentBit!10442 (_2!10714 lt!366666)) (currentBit!10442 (_2!10714 lt!366111)))))))

(assert (= (and d!77493 c!11238) b!228383))

(assert (= (and d!77493 (not c!11238)) b!228380))

(assert (= (or b!228383 b!228380) bm!3922))

(assert (= (or b!228383 b!228380) bm!3923))

(assert (= (or b!228383 b!228380) bm!3924))

(assert (= (and d!77493 res!191582) b!228382))

(assert (= (and b!228382 res!191580) b!228379))

(assert (= (and d!77493 (not res!191581)) b!228381))

(declare-fun m!351997 () Bool)

(assert (=> b!228383 m!351997))

(declare-fun m!352001 () Bool)

(assert (=> b!228383 m!352001))

(declare-fun m!352005 () Bool)

(assert (=> b!228383 m!352005))

(declare-fun m!352007 () Bool)

(assert (=> b!228383 m!352007))

(declare-fun m!352009 () Bool)

(assert (=> b!228383 m!352009))

(declare-fun m!352011 () Bool)

(assert (=> b!228383 m!352011))

(declare-fun m!352013 () Bool)

(assert (=> b!228383 m!352013))

(declare-fun m!352015 () Bool)

(assert (=> b!228383 m!352015))

(declare-fun m!352017 () Bool)

(assert (=> b!228383 m!352017))

(declare-fun m!352019 () Bool)

(assert (=> b!228383 m!352019))

(declare-fun m!352021 () Bool)

(assert (=> b!228383 m!352021))

(declare-fun m!352023 () Bool)

(assert (=> b!228383 m!352023))

(assert (=> b!228383 m!351741))

(declare-fun m!352025 () Bool)

(assert (=> bm!3922 m!352025))

(declare-fun m!352027 () Bool)

(assert (=> b!228379 m!352027))

(declare-fun m!352029 () Bool)

(assert (=> b!228381 m!352029))

(declare-fun m!352031 () Bool)

(assert (=> b!228381 m!352031))

(declare-fun m!352033 () Bool)

(assert (=> bm!3924 m!352033))

(declare-fun m!352035 () Bool)

(assert (=> b!228380 m!352035))

(declare-fun m!352037 () Bool)

(assert (=> b!228380 m!352037))

(assert (=> bm!3923 m!352015))

(declare-fun m!352039 () Bool)

(assert (=> bm!3923 m!352039))

(declare-fun m!352041 () Bool)

(assert (=> d!77493 m!352041))

(assert (=> d!77493 m!351741))

(assert (=> b!228242 d!77493))

(declare-fun d!77538 () Bool)

(declare-fun res!191591 () Bool)

(declare-fun e!156494 () Bool)

(assert (=> d!77538 (=> res!191591 e!156494)))

(assert (=> d!77538 (= res!191591 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77538 (= (arrayRangesEq!886 arr!308 lt!366106 #b00000000000000000000000000000000 i!761) e!156494)))

(declare-fun b!228390 () Bool)

(declare-fun e!156495 () Bool)

(assert (=> b!228390 (= e!156494 e!156495)))

(declare-fun res!191592 () Bool)

(assert (=> b!228390 (=> (not res!191592) (not e!156495))))

(assert (=> b!228390 (= res!191592 (= (select (arr!6034 arr!308) #b00000000000000000000000000000000) (select (arr!6034 lt!366106) #b00000000000000000000000000000000)))))

(declare-fun b!228391 () Bool)

(assert (=> b!228391 (= e!156495 (arrayRangesEq!886 arr!308 lt!366106 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77538 (not res!191591)) b!228390))

(assert (= (and b!228390 res!191592) b!228391))

(assert (=> b!228390 m!351839))

(declare-fun m!352043 () Bool)

(assert (=> b!228390 m!352043))

(declare-fun m!352045 () Bool)

(assert (=> b!228391 m!352045))

(assert (=> b!228242 d!77538))

(push 1)

(assert (not d!77493))

(assert (not b!228379))

(assert (not bm!3923))

(assert (not b!228383))

(assert (not d!77475))

(assert (not d!77489))

(assert (not d!77485))

(assert (not b!228285))

(assert (not d!77447))

(assert (not d!77443))

(assert (not b!228380))

(assert (not b!228273))

(assert (not b!228288))

(assert (not bm!3922))

(assert (not d!77487))

(assert (not d!77465))

(assert (not d!77463))

(assert (not b!228391))

(assert (not d!77451))

(assert (not b!228381))

(assert (not d!77491))

(assert (not bm!3924))

(assert (not d!77469))

(assert (not d!77467))

(assert (not b!228313))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

