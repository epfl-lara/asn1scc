; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43592 () Bool)

(assert start!43592)

(declare-fun b!206084 () Bool)

(declare-fun res!172774 () Bool)

(declare-fun e!140941 () Bool)

(assert (=> b!206084 (=> (not res!172774) (not e!140941))))

(declare-datatypes ((array!10375 0))(
  ( (array!10376 (arr!5489 (Array (_ BitVec 32) (_ BitVec 8))) (size!4559 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8226 0))(
  ( (BitStream!8227 (buf!5064 array!10375) (currentByte!9582 (_ BitVec 32)) (currentBit!9577 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8226)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206084 (= res!172774 (invariant!0 (currentBit!9577 thiss!1204) (currentByte!9582 thiss!1204) (size!4559 (buf!5064 thiss!1204))))))

(declare-fun b!206085 () Bool)

(declare-fun e!140946 () Bool)

(assert (=> b!206085 (= e!140941 (not e!140946))))

(declare-fun res!172772 () Bool)

(assert (=> b!206085 (=> res!172772 e!140946)))

(declare-fun lt!322284 () (_ BitVec 64))

(declare-fun lt!322277 () (_ BitVec 64))

(assert (=> b!206085 (= res!172772 (not (= lt!322284 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322277))))))

(declare-datatypes ((Unit!14712 0))(
  ( (Unit!14713) )
))
(declare-datatypes ((tuple2!17600 0))(
  ( (tuple2!17601 (_1!9455 Unit!14712) (_2!9455 BitStream!8226)) )
))
(declare-fun lt!322279 () tuple2!17600)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206085 (= lt!322284 (bitIndex!0 (size!4559 (buf!5064 (_2!9455 lt!322279))) (currentByte!9582 (_2!9455 lt!322279)) (currentBit!9577 (_2!9455 lt!322279))))))

(assert (=> b!206085 (= lt!322277 (bitIndex!0 (size!4559 (buf!5064 thiss!1204)) (currentByte!9582 thiss!1204) (currentBit!9577 thiss!1204)))))

(declare-fun e!140944 () Bool)

(assert (=> b!206085 e!140944))

(declare-fun res!172768 () Bool)

(assert (=> b!206085 (=> (not res!172768) (not e!140944))))

(assert (=> b!206085 (= res!172768 (= (size!4559 (buf!5064 thiss!1204)) (size!4559 (buf!5064 (_2!9455 lt!322279)))))))

(declare-fun lt!322282 () Bool)

(declare-fun appendBit!0 (BitStream!8226 Bool) tuple2!17600)

(assert (=> b!206085 (= lt!322279 (appendBit!0 thiss!1204 lt!322282))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!206085 (= lt!322282 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206086 () Bool)

(declare-fun e!140939 () Bool)

(assert (=> b!206086 (= e!140946 e!140939)))

(declare-fun res!172777 () Bool)

(assert (=> b!206086 (=> res!172777 e!140939)))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!322278 () (_ BitVec 64))

(assert (=> b!206086 (= res!172777 (not (= lt!322278 (bvsub (bvsub (bvadd lt!322284 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!322281 () tuple2!17600)

(assert (=> b!206086 (= lt!322278 (bitIndex!0 (size!4559 (buf!5064 (_2!9455 lt!322281))) (currentByte!9582 (_2!9455 lt!322281)) (currentBit!9577 (_2!9455 lt!322281))))))

(declare-fun isPrefixOf!0 (BitStream!8226 BitStream!8226) Bool)

(assert (=> b!206086 (isPrefixOf!0 thiss!1204 (_2!9455 lt!322281))))

(declare-fun lt!322291 () Unit!14712)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8226 BitStream!8226 BitStream!8226) Unit!14712)

(assert (=> b!206086 (= lt!322291 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9455 lt!322279) (_2!9455 lt!322281)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8226 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17600)

(assert (=> b!206086 (= lt!322281 (appendBitsLSBFirstLoopTR!0 (_2!9455 lt!322279) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206087 () Bool)

(declare-fun e!140945 () Bool)

(declare-datatypes ((tuple2!17602 0))(
  ( (tuple2!17603 (_1!9456 BitStream!8226) (_2!9456 Bool)) )
))
(declare-fun lt!322287 () tuple2!17602)

(declare-fun lt!322288 () tuple2!17602)

(assert (=> b!206087 (= e!140945 (= (_2!9456 lt!322287) (_2!9456 lt!322288)))))

(declare-fun b!206088 () Bool)

(declare-fun res!172776 () Bool)

(declare-fun e!140938 () Bool)

(assert (=> b!206088 (=> (not res!172776) (not e!140938))))

(assert (=> b!206088 (= res!172776 (isPrefixOf!0 thiss!1204 (_2!9455 lt!322279)))))

(declare-fun b!206089 () Bool)

(declare-fun e!140937 () Bool)

(declare-fun array_inv!4300 (array!10375) Bool)

(assert (=> b!206089 (= e!140937 (array_inv!4300 (buf!5064 thiss!1204)))))

(declare-fun b!206090 () Bool)

(assert (=> b!206090 (= e!140944 e!140938)))

(declare-fun res!172770 () Bool)

(assert (=> b!206090 (=> (not res!172770) (not e!140938))))

(declare-fun lt!322286 () (_ BitVec 64))

(declare-fun lt!322289 () (_ BitVec 64))

(assert (=> b!206090 (= res!172770 (= lt!322286 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322289)))))

(assert (=> b!206090 (= lt!322286 (bitIndex!0 (size!4559 (buf!5064 (_2!9455 lt!322279))) (currentByte!9582 (_2!9455 lt!322279)) (currentBit!9577 (_2!9455 lt!322279))))))

(assert (=> b!206090 (= lt!322289 (bitIndex!0 (size!4559 (buf!5064 thiss!1204)) (currentByte!9582 thiss!1204) (currentBit!9577 thiss!1204)))))

(declare-fun res!172769 () Bool)

(assert (=> start!43592 (=> (not res!172769) (not e!140941))))

(assert (=> start!43592 (= res!172769 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43592 e!140941))

(assert (=> start!43592 true))

(declare-fun inv!12 (BitStream!8226) Bool)

(assert (=> start!43592 (and (inv!12 thiss!1204) e!140937)))

(declare-fun b!206091 () Bool)

(declare-fun e!140942 () Bool)

(assert (=> b!206091 (= e!140938 e!140942)))

(declare-fun res!172775 () Bool)

(assert (=> b!206091 (=> (not res!172775) (not e!140942))))

(declare-fun lt!322290 () tuple2!17602)

(assert (=> b!206091 (= res!172775 (and (= (_2!9456 lt!322290) lt!322282) (= (_1!9456 lt!322290) (_2!9455 lt!322279))))))

(declare-fun readBitPure!0 (BitStream!8226) tuple2!17602)

(declare-fun readerFrom!0 (BitStream!8226 (_ BitVec 32) (_ BitVec 32)) BitStream!8226)

(assert (=> b!206091 (= lt!322290 (readBitPure!0 (readerFrom!0 (_2!9455 lt!322279) (currentBit!9577 thiss!1204) (currentByte!9582 thiss!1204))))))

(declare-fun b!206092 () Bool)

(declare-fun res!172763 () Bool)

(assert (=> b!206092 (=> res!172763 e!140939)))

(assert (=> b!206092 (= res!172763 (not (invariant!0 (currentBit!9577 (_2!9455 lt!322281)) (currentByte!9582 (_2!9455 lt!322281)) (size!4559 (buf!5064 (_2!9455 lt!322281))))))))

(declare-fun b!206093 () Bool)

(declare-fun res!172778 () Bool)

(assert (=> b!206093 (=> (not res!172778) (not e!140941))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206093 (= res!172778 (validate_offset_bits!1 ((_ sign_extend 32) (size!4559 (buf!5064 thiss!1204))) ((_ sign_extend 32) (currentByte!9582 thiss!1204)) ((_ sign_extend 32) (currentBit!9577 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!206094 () Bool)

(declare-fun e!140943 () Bool)

(assert (=> b!206094 (= e!140943 (invariant!0 (currentBit!9577 thiss!1204) (currentByte!9582 thiss!1204) (size!4559 (buf!5064 (_2!9455 lt!322281)))))))

(declare-fun b!206095 () Bool)

(declare-fun res!172764 () Bool)

(assert (=> b!206095 (=> res!172764 e!140939)))

(assert (=> b!206095 (= res!172764 (not (isPrefixOf!0 (_2!9455 lt!322279) (_2!9455 lt!322281))))))

(declare-fun b!206096 () Bool)

(declare-fun res!172767 () Bool)

(assert (=> b!206096 (=> (not res!172767) (not e!140941))))

(assert (=> b!206096 (= res!172767 (not (= i!590 nBits!348)))))

(declare-fun b!206097 () Bool)

(declare-fun res!172773 () Bool)

(assert (=> b!206097 (=> res!172773 e!140939)))

(assert (=> b!206097 (= res!172773 (or (not (= (size!4559 (buf!5064 (_2!9455 lt!322281))) (size!4559 (buf!5064 thiss!1204)))) (not (= lt!322278 (bvsub (bvadd lt!322277 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!206098 () Bool)

(assert (=> b!206098 (= e!140942 (= (bitIndex!0 (size!4559 (buf!5064 (_1!9456 lt!322290))) (currentByte!9582 (_1!9456 lt!322290)) (currentBit!9577 (_1!9456 lt!322290))) lt!322286))))

(declare-fun b!206099 () Bool)

(assert (=> b!206099 (= e!140939 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000))))))

(declare-datatypes ((tuple2!17604 0))(
  ( (tuple2!17605 (_1!9457 BitStream!8226) (_2!9457 BitStream!8226)) )
))
(declare-fun lt!322280 () tuple2!17604)

(assert (=> b!206099 (= (_2!9456 (readBitPure!0 (_1!9457 lt!322280))) lt!322282)))

(declare-fun lt!322285 () tuple2!17604)

(declare-fun reader!0 (BitStream!8226 BitStream!8226) tuple2!17604)

(assert (=> b!206099 (= lt!322285 (reader!0 (_2!9455 lt!322279) (_2!9455 lt!322281)))))

(assert (=> b!206099 (= lt!322280 (reader!0 thiss!1204 (_2!9455 lt!322281)))))

(assert (=> b!206099 e!140945))

(declare-fun res!172765 () Bool)

(assert (=> b!206099 (=> (not res!172765) (not e!140945))))

(assert (=> b!206099 (= res!172765 (= (bitIndex!0 (size!4559 (buf!5064 (_1!9456 lt!322287))) (currentByte!9582 (_1!9456 lt!322287)) (currentBit!9577 (_1!9456 lt!322287))) (bitIndex!0 (size!4559 (buf!5064 (_1!9456 lt!322288))) (currentByte!9582 (_1!9456 lt!322288)) (currentBit!9577 (_1!9456 lt!322288)))))))

(declare-fun lt!322283 () Unit!14712)

(declare-fun lt!322292 () BitStream!8226)

(declare-fun readBitPrefixLemma!0 (BitStream!8226 BitStream!8226) Unit!14712)

(assert (=> b!206099 (= lt!322283 (readBitPrefixLemma!0 lt!322292 (_2!9455 lt!322281)))))

(assert (=> b!206099 (= lt!322288 (readBitPure!0 (BitStream!8227 (buf!5064 (_2!9455 lt!322281)) (currentByte!9582 thiss!1204) (currentBit!9577 thiss!1204))))))

(assert (=> b!206099 (= lt!322287 (readBitPure!0 lt!322292))))

(assert (=> b!206099 e!140943))

(declare-fun res!172766 () Bool)

(assert (=> b!206099 (=> (not res!172766) (not e!140943))))

(assert (=> b!206099 (= res!172766 (invariant!0 (currentBit!9577 thiss!1204) (currentByte!9582 thiss!1204) (size!4559 (buf!5064 (_2!9455 lt!322279)))))))

(assert (=> b!206099 (= lt!322292 (BitStream!8227 (buf!5064 (_2!9455 lt!322279)) (currentByte!9582 thiss!1204) (currentBit!9577 thiss!1204)))))

(declare-fun b!206100 () Bool)

(declare-fun res!172771 () Bool)

(assert (=> b!206100 (=> res!172771 e!140939)))

(assert (=> b!206100 (= res!172771 (not (isPrefixOf!0 thiss!1204 (_2!9455 lt!322279))))))

(assert (= (and start!43592 res!172769) b!206093))

(assert (= (and b!206093 res!172778) b!206084))

(assert (= (and b!206084 res!172774) b!206096))

(assert (= (and b!206096 res!172767) b!206085))

(assert (= (and b!206085 res!172768) b!206090))

(assert (= (and b!206090 res!172770) b!206088))

(assert (= (and b!206088 res!172776) b!206091))

(assert (= (and b!206091 res!172775) b!206098))

(assert (= (and b!206085 (not res!172772)) b!206086))

(assert (= (and b!206086 (not res!172777)) b!206092))

(assert (= (and b!206092 (not res!172763)) b!206097))

(assert (= (and b!206097 (not res!172773)) b!206095))

(assert (= (and b!206095 (not res!172764)) b!206100))

(assert (= (and b!206100 (not res!172771)) b!206099))

(assert (= (and b!206099 res!172766) b!206094))

(assert (= (and b!206099 res!172765) b!206087))

(assert (= start!43592 b!206089))

(declare-fun m!317625 () Bool)

(assert (=> b!206088 m!317625))

(declare-fun m!317627 () Bool)

(assert (=> b!206099 m!317627))

(declare-fun m!317629 () Bool)

(assert (=> b!206099 m!317629))

(declare-fun m!317631 () Bool)

(assert (=> b!206099 m!317631))

(declare-fun m!317633 () Bool)

(assert (=> b!206099 m!317633))

(declare-fun m!317635 () Bool)

(assert (=> b!206099 m!317635))

(declare-fun m!317637 () Bool)

(assert (=> b!206099 m!317637))

(declare-fun m!317639 () Bool)

(assert (=> b!206099 m!317639))

(declare-fun m!317641 () Bool)

(assert (=> b!206099 m!317641))

(declare-fun m!317643 () Bool)

(assert (=> b!206099 m!317643))

(declare-fun m!317645 () Bool)

(assert (=> b!206094 m!317645))

(declare-fun m!317647 () Bool)

(assert (=> b!206092 m!317647))

(declare-fun m!317649 () Bool)

(assert (=> b!206091 m!317649))

(assert (=> b!206091 m!317649))

(declare-fun m!317651 () Bool)

(assert (=> b!206091 m!317651))

(declare-fun m!317653 () Bool)

(assert (=> b!206095 m!317653))

(declare-fun m!317655 () Bool)

(assert (=> b!206086 m!317655))

(declare-fun m!317657 () Bool)

(assert (=> b!206086 m!317657))

(declare-fun m!317659 () Bool)

(assert (=> b!206086 m!317659))

(declare-fun m!317661 () Bool)

(assert (=> b!206086 m!317661))

(declare-fun m!317663 () Bool)

(assert (=> b!206084 m!317663))

(declare-fun m!317665 () Bool)

(assert (=> b!206093 m!317665))

(declare-fun m!317667 () Bool)

(assert (=> b!206098 m!317667))

(declare-fun m!317669 () Bool)

(assert (=> b!206089 m!317669))

(assert (=> b!206100 m!317625))

(declare-fun m!317671 () Bool)

(assert (=> b!206085 m!317671))

(declare-fun m!317673 () Bool)

(assert (=> b!206085 m!317673))

(declare-fun m!317675 () Bool)

(assert (=> b!206085 m!317675))

(assert (=> b!206090 m!317671))

(assert (=> b!206090 m!317673))

(declare-fun m!317677 () Bool)

(assert (=> start!43592 m!317677))

(check-sat (not b!206091) (not b!206099) (not b!206095) (not b!206084) (not b!206094) (not b!206085) (not b!206089) (not b!206090) (not b!206086) (not start!43592) (not b!206100) (not b!206093) (not b!206098) (not b!206088) (not b!206092))
(check-sat)
